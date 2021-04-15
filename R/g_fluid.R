# set wd 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(tidyverse)
library(tidymodels)
library(stacks)
library(doParallel)
# library(GGally)

# import data
latent = read_csv('../data/cog_latent_scores.csv')
obs = read_csv('../data/cog_sum_scores_scaled.csv')
ability = read_csv('../data/cog_ability_scores.csv')
liwc = read_csv('../data/liwc_comp.csv')[,-1]

# # explore data
# bind_cols(latent, obs, ability, liwc) %>% 
#   select(latent_gf1:WPS, starts_with('cdi')) %>% 
#   as.matrix %>% 
#   ggfcorr(label=T) 
# # heatmap()

# predictive modeling: verbal comprehension 
gf1 = bind_cols(gf1 = latent$latent_gf1, liwc)
gf2 = bind_cols(gf2 = latent$latent_gf2, liwc)
gf3 = bind_cols(gf3 = latent$latent_gf3, liwc)

gf  = bind_cols(gf  = ability$Gf, liwc) %>% select(-cdi)

# split data
set.seed(42)
gf_split = initial_split(gf)
gf_train = training(gf_split)
gf_test  = testing(gf_split)

# pre-process data
gf_rec = recipe(gf ~., gf_train) %>%
  step_zv(all_predictors()) %>% 
  step_scale(all_predictors())

# set parameters
folds = vfold_cv(gf_train)
metric = metric_set(rmse)
ctrl_model = control_grid(save_pred = T, save_workflow = T)

#ctrl_grid = control_stack_grid()

# set models
svm = svm_rbf(
  cost = tune("cost"), 
  rbf_sigma = tune("sigma")) %>%
  set_mode("regression")%>%
  set_engine("kernlab")
rf = rand_forest(
  min_n = tune(), trees = tune()) %>% 
  set_mode("regression") %>% 
  set_engine("randomForest")
xgb = boost_tree(
  trees = 1000, 
  tree_depth = tune(), min_n = tune(), 
  loss_reduction = tune(),                     
  sample_size = tune(), mtry = tune(),         
  learn_rate = tune()) %>% 
  set_mode("regression") %>% 
  set_engine("xgboost") %>% 
  translate()

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
  finalize(mtry(), gf_train),
  learn_rate(),
  size = 50
)

# set workflows
svm_wflow = workflow() %>% 
  add_model(svm) %>%
  add_recipe(gf_rec)
rf_wflow = workflow() %>%
  add_model(rf) %>% 
  add_recipe(gf_rec)
xgb_wflow = workflow() %>%
  add_model(xgb) %>% 
  add_recipe(gf_rec)

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
gf_stack = stacks() %>%
  add_candidates(svm_res) %>%
  add_candidates(rf_res) %>% 
  add_candidates(xgb_res)

gf_stack_model = gf_stack %>%
  blend_predictions(penalty = seq(0, 1, .001)) %>% 
  fit_members()

registerDoSEQ()

gf_stack
gf_stack_model

# outcome
test_gf = gf_test %>%
  bind_cols(predict(gf_stack_model, .))

member_preds = test_gf %>%
  select(gf) %>%
  bind_cols(predict(gf_stack_model, gf_test, members = T))

map_dfr(member_preds, rmse, truth = gf, data = member_preds) %>%
  mutate(member = colnames(member_preds))
map_dfr(member_preds, rsq, truth = gf, data = member_preds) %>%
  mutate(member = colnames(member_preds))

# validity
cor(member_preds)

# save
write_rds(gf_stack_model, '../models/gf_stack_model.rds')
write_rds(cor(member_preds), '../models/gf_stack_cor.rds')


select_best(xgb_res, "rsq")
show_best(rf_res, "rmse")
show_best(xgb_res, "rmse")

lm(gf ~ ., data=gf[,-length(gf)]) %>% summary


final = finalize_model(
  svm,
  select_best(svm_res, "rmse")
)

final
final_wf = workflow() %>%
  add_recipe(gf_rec) %>%
  add_model(final)

final_res = final_wf %>%
  last_fit(gf_split)

final_res %>%
  collect_metrics()
