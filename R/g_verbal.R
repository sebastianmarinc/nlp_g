# set wd 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(tidyverse)
library(tidymodels)
library(stacks)
library(vip)
library(doParallel)
#library(caret)
library(GGally)
#library(psych)

latent = read_csv('../data/cog_latent_scores.csv')
obs = read_csv('../data/cog_sum_scores_scaled.csv')
ability = read_csv('../data/cog_ability_scores.csv')
liwc = read_csv('../data/liwc_comp.csv')[,-1]
#liwc_scaled = scale(liwc)

bind_cols(latent, obs, ability, liwc) %>% 
  select(latent_gc1:WPS, starts_with('cdi')) %>% 
  as.matrix %>% 
  ggcorr(label=T) 
# heatmap()

# predictive modeling: verbal comprehension 
gc1 = bind_cols(gc1 = latent$latent_gc1, liwc)
gc2 = bind_cols(gc2 = latent$latent_gc2, liwc)
gc3 = bind_cols(gc3 = latent$latent_gc3, liwc)

gc  = bind_cols(gc  = ability$Gc, liwc)

# split data
set.seed(42)
gc_split = initial_split(gc)
gc_train = training(gc_split)
gc_test  = testing(gc_split)

# pre-process data
gc_rec = recipe(gc ~., gc_train) %>%
  step_zv(all_predictors()) %>% 
  step_scale(all_predictors())

# set parameters
folds = vfold_cv(gc_train)
metric = metric_set(rmse)
ctrl_model = control_grid(save_pred = T, save_workflow = T)

#ctrl_grid = control_stack_grid()

# set models
svm = svm_rbf(
  cost = tune("cost"), 
  rbf_sigma = tune("sigma")) %>%
  set_engine("kernlab") %>%
  set_mode("regression")
rf = rand_forest(
  min_n = tune(), trees = tune()) %>% 
  set_mode("regression") %>% 
  set_engine("randomForest")
xgb = boost_tree(
  trees = 2000, 
  tree_depth = tune(), min_n = tune(), 
  loss_reduction = tune(),                     
  sample_size = tune(), mtry = tune(),         
  learn_rate = tune()) %>% 
  set_engine("xgboost") %>% 
  set_mode("regression")

# set grids
svm_grid = grid_latin_hypercube(
  parameters(svm), 
  size = 1000
)
rf_grid = grid_regular(
  parameters(rf), 
  levels = 5, 
  filter = c(trees > 1)
)
xgb_grid = grid_latin_hypercube(
  tree_depth(),
  min_n(),
  loss_reduction(),
  sample_size = sample_prop(),
  finalize(mtry(), gc_train),
  learn_rate(),
  size = 50
)

# set workflows
svm_wflow = workflow() %>% 
  add_model(svm) %>%
  add_recipe(gc_rec)
rf_wflow = workflow() %>%
  add_model(rf) %>% 
  add_recipe(gc_rec)
xgb_wflow = workflow() %>%
  add_model(xgb) %>% 
  add_recipe(gc_rec)

# fit models
set.seed(314)
registerDoParallel(detectCores()-1)
svm_res = tune_grid(
  svm_wflow, 
  resamples = folds, 
  grid = 5,
  metrics = metric,
  control = ctrl_model
)
rf_res = tune_grid(
  rf_wflow,
  resamples = folds,
  grid = 5,
  metrics = metric,
  control = ctrl_model
)
xgb_res = tune_grid(
  xgb_wflow,
  resamples = folds,
  grid = 5,
  metrics = metric,
  control = ctrl_model
)

# stack models 
gc_stack = stacks() %>%
  add_candidates(svm_res) %>%
  add_candidates(rf_res) %>% 
  add_candidates(xgb_res)

gc_stack_model = gc_stack %>%
  blend_predictions(penalty = seq(0, 1, .001)) %>% 
  fit_members()
gc_stack_model 

registerDoSEQ()

# outcome
test_gc = gc_test %>%
  bind_cols(predict(gc_stack_model, .))

member_preds = test_gc %>%
  select(gc) %>%
  bind_cols(predict(gc_stack_model, gc_test, members = T))

map_dfr(member_preds, rmse, truth = gc, data = member_preds) %>%
  mutate(member = colnames(member_preds))
map_dfr(member_preds, rsq, truth = gc, data = member_preds) %>%
  mutate(member = colnames(member_preds))

# validity
cor(member_preds)

# save
write_rds(gc_stack_model, '../models/gc_stack_model.rds')
write_rds(cor(member_preds), '../models/gc_stack_cor.rds')