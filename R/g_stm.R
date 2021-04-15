# set wd 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(tidyverse)
library(tidymodels)
library(stacks)
library(doParallel)

# import data
latent = read_csv('../data/cog_latent_scores.csv')
obs = read_csv('../data/cog_sum_scores_scaled.csv')
ability = read_csv('../data/cog_ability_scores.csv')
liwc = read_csv('../data/liwc_comp.csv')[,-1]
#liwc_scaled = scale(liwc)

# bind_cols(latent, obs, ability, liwc) %>% 
#   select(latent_gstm1:WPS, starts_with('cdi')) %>% 
#   as.matrix %>% 
#   ggstmorr(label=T) 
# # heatmap()

# predictive modeling: verbal comprehension 
gstm1 = bind_cols(gstm1 = latent$latent_gstm1, liwc)
gstm2 = bind_cols(gstm2 = latent$latent_gstm2, liwc)
gstm3 = bind_cols(gstm3 = latent$latent_gstm3, liwc)

gstm  = bind_cols(gstm  = ability$Gstm, liwc)

# split data
set.seed(42)
gstm_split = initial_split(gstm)
gstm_train = training(gstm_split)
gstm_test  = testing(gstm_split)

# pre-process data
gstm_rec = recipe(gstm ~., gstm_train) %>%
  step_zv(all_predictors()) %>% 
  step_scale(all_predictors())

# set parameters
folds = vfold_cv(gstm_train)
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
  size = 50
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
  finalize(mtry(), gstm_train),
  learn_rate(),
  size = 50
)

# set workflows
svm_wflow = workflow() %>% 
  add_model(svm) %>%
  add_recipe(gstm_rec)
rf_wflow = workflow() %>%
  add_model(rf) %>% 
  add_recipe(gstm_rec)
xgb_wflow = workflow() %>%
  add_model(xgb) %>% 
  add_recipe(gstm_rec)

# fit models
set.seed(314)
registerDoParallel(detectCores()-1)
svm_res = tune_grid(
  svm_wflow, 
  resamples = folds, 
  grid = svm_grid,
  metrics = metric,
  control = ctrl_model
)
rf_res = tune_grid(
  rf_wflow,
  resamples = folds,
  grid = rf_grid,
  metrics = metric,
  control = ctrl_model
)
xgb_res = tune_grid(
  xgb_wflow,
  resamples = folds,
  grid = xgb_grid,
  metrics = metric,
  control = ctrl_model
)
registerDoSEQ()

# stack models 
gstm_stack = stacks() %>%
  add_candidates(svm_res) %>%
  add_candidates(rf_res) %>% 
  add_candidates(xgb_res)
gstm_stack

registerDoParallel(detectCores()-1)
gstm_stack_model = gstm_stack %>%
  blend_predictions() %>% 
  fit_members()
registerDoSEQ()
gstm_stack_model

# outcome
test_gstm = gstm_test %>%
  bind_cols(predict(gstm_stack_model, .))

member_preds = test_gstm %>%
  select(gstm) %>%
  bind_cols(predict(gstm_stack_model, gstm_test, members = T))

map_dfr(member_preds, rmse, truth = gstm, data = member_preds) %>%
  mutate(member = colnames(member_preds))
map_dfr(member_preds, rsq, truth = gstm, data = member_preds) %>%
  mutate(member = colnames(member_preds))

# validity
cor(member_preds)

# save
write_rds(gstm_stack_model, '../models/gstm_stack_model.rds')
write_rds(cor(member_preds), '../models/gstm_stack_cor.rds')
