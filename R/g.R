# set wd 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(tidyverse)
library(tidymodels)
library(stacks)
library(doParallel)

# import data
ability = read_csv('../data/cog_ability_scores.csv')
# obs = read_csv('../data/cog_sum_scores_scaled.csv') %>% 
#   mutate(g = rowSums(.))
liwc = read_csv('../data/liwc_comp.csv')[,-1]

# predictive modeling: verbal comprehension 
g  = bind_cols(g  = ability$G, liwc)
#g  = bind_cols(g  = obs$g, liwc)

# # scaling law split 
# val = 1/sqrt(ncol(g[,-1]))
# tr = 1 - ts                                                                                                      

# split data
set.seed(42)
g_split = initial_split(g)
g_train = training(g_split)
g_test  = testing(g_split)

# pre-process data
g_rec = recipe(g ~., g_train) %>%
  step_zv(all_predictors()) %>% 
  step_scale(all_predictors())

# set parameters
folds = vfold_cv(g_train)
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
  finalize(mtry(), g_train),
  learn_rate(),
  size = 50
)

# set workflows
svm_wflow = workflow() %>% 
  add_model(svm) %>%
  add_recipe(g_rec)
rf_wflow = workflow() %>%
  add_model(rf) %>% 
  add_recipe(g_rec)
xgb_wflow = workflow() %>%
  add_model(xgb) %>% 
  add_recipe(g_rec)

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

# stack models 
g_stack = stacks() %>%
  add_candidates(svm_res) %>%
  add_candidates(rf_res) %>% 
  add_candidates(xgb_res)
g_stack_model = g_stack %>%
  blend_predictions(penalty = seq(0, 1, .001)) %>% 
  fit_members()

registerDoSEQ()

g_stack
g_stack_model

# outcome
test_g = g_test %>%
  bind_cols(predict(g_stack_model, .))

member_preds = test_g %>%
  select(g) %>%
  bind_cols(predict(g_stack_model, g_test, members = T))

map_dfr(member_preds, rmse, truth = g, data = member_preds) %>%
  mutate(member = colnames(member_preds))
map_dfr(member_preds, rsq, truth = g, data = member_preds) %>%
  mutate(member = colnames(member_preds))

# validity
cor(member_preds)

write_rds(cor(member_preds), '../models/g_stack_cor.rds')
write_rds(g_stack_model, '../models/g_stack_model.rds')

# variable importance
finalize_model(
  xgb, select_best(
    xgb_res, 'rmse'
  )
) %>% 
  set_engine('xgboost') %>% 
  fit(g ~., data = g) %>% 
  vip(geom = 'point') + ggtitle('Variable Importance: g') 
  
