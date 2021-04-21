setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(tidymodels)
library(vip)

# import data
ability = read_csv('../data/cog_ability_scores.csv')
liwc = read_csv('../data/liwc_comp.csv')[,-1]
#g  = bind_cols(g  = ability$___ , liwc)

# variable importance
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

# set models
svm = svm_rbf(
  cost = tune("cost"), 
  rbf_sigma = tune("sigma")) %>%
  set_engine("kernlab") %>%
  set_mode("regression")
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
xgb_res = tune_grid(
  xgb_wflow,
  resamples = folds,
  grid = xgb_grid,
  metrics = metric,
  control = ctrl_model
)
registerDoSEQ()

# get variable importance 
finalize_model(
  xgb, select_best(
    xgb_res, 'rmse'
  )
) %>% 
  set_engine('xgboost') %>% 
  fit(g ~., data = g) %>% 
  vip(geom = 'point')