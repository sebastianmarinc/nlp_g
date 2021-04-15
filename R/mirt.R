# set wd
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(mirt)
library(tidyverse)
library(haven)
library(lavaan)
#library(naniar)
library(psych)
#library(fungible)
library(doParallel)
#library(lavaan)

# data importing and cleaning 
cog_trim = read_csv('../data/cog_trim.csv') 

# get latent scores 
#   -items w/ loadings .4+ 
#   -fitting unidimensional models 
trash = function(data, mirt.model, min.loading) {
  repeat{ 
    model = mirt(data, 1, mirt.model, SE=T) 
    data = data[,c(extract.mirt(model,'F') >= min.loading)]
    
    if (sum(extract.mirt(model,'F') <= min.loading) == 0){
      break
    }
  }
  return(model)
}

gc = cog_trim %>% select(starts_with('Gc'))
gf = cog_trim %>% select(starts_with('Gf'))
gstm = cog_trim %>% select(starts_with('Gsm'))

gc1 = gc %>% select(starts_with('Gc1'))
gc2 = gc %>% select(starts_with('Gc2'))
gc3 = gc %>% select(starts_with('Gc3'))
gf1 = gf %>% select(starts_with('Gf1'))
gf2 = gf %>% select(starts_with('Gf2'))
gf3 = gf %>% select(starts_with('Gf3'))
gstm1 = gstm %>% select(starts_with('Gsm1'))
gstm2 = gstm %>% select(starts_with('Gsm2'))
gstm3 = gstm %>% select(starts_with('Gsm3'))

g_ls = list(gc1,gc2,gc3,  gf1,gf2,gf3,  gstm1,gstm2,gstm3)
g_mirt = list()

# item selection 
for(i in 1:length(g_ls)) {
  g_mirt[[i]] = trash(g_ls[[i]], mirt.model='2PL', min.loading=.4)
}

# # model fit 
# for(i in 1:length(g_mirt)) {
#   print(M2(g_mirt[[i]]))
# } #poor fit: gc2, gf2, gf3

# fa.parallel(gc2)
# fa.parallel(gf2)
# fa.parallel(gf3)
# fa.parallel(gstm3)

# person scores
fct_scores = list()
for(i in 1:length(g_mirt)) {
  fct_scores[[i]] = fscores(g_mirt[[i]])
}
latent = as.data.frame(fct_scores)
names(latent) = dput(c(paste0('latent_gc',1:3), paste0('latent_gf',1:3),paste0('latent_gstm',1:3)))
head(latent)

# get scaled observed sum scores 
obs_scores = list()
for(i in 1:length(g_mirt)) {
  obs_scores[[i]] = rowSums(g_mirt[[i]]@Data[["data"]])
}
obs = as.data.frame(obs_scores)
names(obs) = dput(c(paste0('obs_gc',1:3), paste0('obs_gf',1:3),paste0('obs_gstm',1:3)))
head(obs)
obs = scale(obs)
#write_csv()

# get sum cog score
gc$gc1sum = gc %>% select(starts_with('Gc1')) %>% rowSums()
gc$gc2sum = gc %>% select(starts_with('Gc2')) %>% rowSums()
gc$gc3sum = gc %>% select(starts_with('Gc3')) %>% rowSums()

gf$gf1sum = gf %>% select(starts_with('Gf1')) %>% rowSums()
gf$gf2sum = gf %>% select(starts_with('Gf2')) %>% rowSums()
gf$gf3sum = gf %>% select(starts_with('Gf3')) %>% rowSums()

gstm$gstm1sum = gstm %>% select(starts_with('Gsm1')) %>% rowSums()
gstm$gstm2sum = gstm %>% select(starts_with('Gsm2')) %>% rowSums()
gstm$gstm3sum = gstm %>% select(starts_with('Gsm3')) %>% rowSums()

g = cbind(gc,gf,gstm) %>% select(ends_with('sum'))
# g_scale = scale(g)

# check if same as trimmed sum scores
# cor(obs, g) %>% diag()

# bifactor observed sum scores (scaled)
bfct_model = '
G =~    obs_gc1 + obs_gc2 + obs_gc3 + obs_gf1 + obs_gf2 + obs_gf3 + obs_gstm1 + obs_gstm2 + obs_gstm3
Gc =~   obs_gc1 + obs_gc2 + obs_gc3 
Gf =~   obs_gf1 + obs_gf2 + obs_gf3
Gsm =~ obs_gstm1 + obs_gstm2 + obs_gstm3

G ~~ 0*Gc
G ~~ 0*Gf
G ~~ 0*Gsm

Gc ~~ 0*Gf
Gc ~~ 0*Gsm
Gf ~~ 0*Gsm
'
bfct_fit = cfa(bfct_model, obs, std.lv=T)
summary(bfct_fit)
fitmeasures(bfct_fit, c('cfi','rmsea','srmr'))

semPlot::semPaths(bfct_fit, 'std', layout = 'tree2', bifactor = c("g", "Gc", "Gf", "Gsm"))

ability_fct_score = lavPredict(bfct_fit) %>% as_tibble()
#write_csv(ability_fct_score, '../data/cog_ability_scores.csv')

# correlation 
cor(obs)
cor(latent)
cor(g)
cor(cbind(obs,g,latent))

# write_csv(latent, '../data/cog_latent_scores.csv')
# write_csv(obs, '../data/cog_sum_scores.csv')


# exploring gc2 factor
BiFAD(tetcor(gc2)$r, numFactors = 3)

gc2_model = '
G =~ Gc2_1re + Gc2_2re + 
Gc2_3re + Gc2_4re + 
Gc2_5re + Gc2_6re + 
Gc2_7re + Gc2_8re + 
Gc2_9re + Gc2_10re + 
Gc2_11re + Gc2_12re + 
Gc2_13re + Gc2_14re +
Gc2_15re + Gc2_16re + 
Gc2_17re + Gc2_18re


G1 =~  Gc2_1re + Gc2_2re +  Gc2_3re +  Gc2_4re + Gc2_5re + Gc2_6re + Gc2_7re + Gc2_8re + Gc2_12re + Gc2_18re

G2 =~   Gc2_9re + Gc2_10re + Gc2_11re +  Gc2_13re + Gc2_14re + Gc2_15re + Gc2_16re + Gc2_17re

G ~~ 0*G1
G ~~ 0*G2
G1 ~~ 0*G2
 
'
gc2_fit = cfa(gc2_model, gc2, std.lv = T, estimator = 'WLSMV') 
summary(gc2_fit)
fitmeasures(gc2_fit, c('cfi','rmsea','srmr'))


# bifactor
gc2_model = '
G = 1-18

CONSTRAIN = (1,a1,a2), (2,a1,a2), (3,a1,a2), (4,a1,a2), (5,a1,a2),
(6,a1,a2), (7,a1,a2), (8,a1,a2), (12,a1,a2), (18,a1,a2)

CONSTRAIN = (9,a1,a3), (10,a1,a3),(11,a1,a3), (13,a1,a3),
(14,a1,a3), (15,a1,a3), (16,a1,a3), (17,a1,a3)

COV = S1*S1,S2*S2
'
mirt.model(gc2_model)
specific = c(rep(1,8),2,2,2,1,rep(2,5),1)

registerDoParallel(detectCores()-1)
bfct_gc2 = bfactor(gc2, specific, gc2_model)
registerDoSEQ()

summary(bfct_gc2)
M2(bfct_gc2)

fscores(bfct_gc2)[,1]



gc_model = '
G=1-60

CONSTRAIN = (1,a1,a2), (2,a1,a2), (3,a1,a2), (4,a1,a2), (5,a1,a2), (6,a1,a2), (7,a1,a2), 
            (8,a1,a2), (9,a1,a2), (10,a1,a2), (11,a1,a2), (12,a1,a2), (13,a1,a2), (14,a1,a2), 
            (15,a1,a2), (16,a1,a2), (17,a1,a2), (18,a1,a2), (19,a1,a2), (20,a1,a2), (21,a1,a2), 
            (22,a1,a2), (23,a1,a2), (24,a1,a2)

CONSTRAIN = (25,a1,a3), (26,a1,a3), (27,a1,a3), (28,a1,a3), (29,a1,a3), (30,a1,a3),
            (31,a1,a3), (32,a1,a3), (36,a1,a3),  (42,a1,a3)
            
CONSTRAIN = (33,a1,a4), (34,a1,a4), (35,a1,a4), (37,a1,a4), 
            (38,a1,a4), (39,a1,a4), (40,a1,a4), (41,a1,a4)

CONSTRAIN = (43,a1,a5), (44,a1,a5), (45,a1,a5), (46,a1,a5), (47,a1,a5), (48,a1,a5),
            (49,a1,a5), (50,a1,a5), (51,a1,a5), (52,a1,a5), (53,a1,a5), (54,a1,a5), 
            (55,a1,a5), (56,a1,a5), (57,a1,a5), (58,a1,a5), (59,a1,a5), (60,a1,a5)
            
COV = S1*S1,S2*S2,S3*S3
'
mirt.model(gc_model)
specific = c(rep(1,24), 
             rep(2,8),3,3,3,2,rep(3,5),2,
             rep(4,18))

registerDoParallel(detectCores()-1)
bfct_gc = bfactor(gc[,-c(61:63)], specific, gc_model)
M2(bfct_gc, QMC = T)
registerDoSEQ()


# # exploring gf3 factor
# fa.parallel(gf3)
# BiFAD(tetcor(gf2)$r, numFactors = 2)$BstarFR %>% round(., 2)
# 
# gf3_model = '
# g =~Gf3_A1_1re+Gf3_A1_2re+Gf3_A1_3re+Gf3_A1_4re+Gf3_A1_5re+Gf3_A1_6re+Gf3_A1_7re+Gf3_A1_8re+Gf3_A2_1re+Gf3_A2_2re+
# Gf3_A2_3re+Gf3_A2_4re+Gf3_A2_5re+Gf3_A2_6re+Gf3_A2_7re+Gf3_A2_8re+Gf3_A3_1re+Gf3_A3_2re+Gf3_A3_3re+Gf3_A3_4re+
# Gf3_A3_5re+Gf3_A3_6re+Gf3_A3_7re+Gf3_A3_8re+Gf3_A4_1re+Gf3_A4_2re+Gf3_A4_3re+Gf3_A4_4re+Gf3_A4_5re+Gf3_A4_6re+
# Gf3_A4_7re+Gf3_A4_8re+Gf3_A5_1re+Gf3_A5_2re+Gf3_A5_3re+Gf3_A5_4re+Gf3_A5_5re+Gf3_A5_6re+Gf3_A5_7re+Gf3_A5_8re+
# Gf3_A6_1re+Gf3_A6_2re+Gf3_A6_3re+Gf3_A6_4re+Gf3_A6_5re+Gf3_A6_6re+Gf3_A6_7re+Gf3_A6_8re+Gf3_A7_1re+Gf3_A7_2re+
# Gf3_A7_3re+Gf3_A7_4re+Gf3_A7_5re+Gf3_A7_6re+Gf3_A7_7re+Gf3_A7_8re+Gf3_A8_1re+Gf3_A8_2re+Gf3_A8_3re+Gf3_A8_4re+
# Gf3_A8_5re+Gf3_A8_6re+Gf3_A8_7re+Gf3_A8_8re+Gf3_A9_1re+Gf3_A9_2re+Gf3_A9_3re+Gf3_A9_4re+Gf3_A9_5re+Gf3_A9_6re+
# Gf3_A9_7re+Gf3_A9_8re+Gf3_A10_1re+Gf3_A10_2re+Gf3_A10_3re+Gf3_A10_4re+Gf3_A10_5re+Gf3_A10_6re+Gf3_A10_7re+Gf3_A10_8re+
# Gf3_A11_1re+Gf3_A11_2re+Gf3_A11_3re+Gf3_A11_4re+Gf3_A11_5re+Gf3_A11_6re+Gf3_A11_7re+Gf3_A11_8re+Gf3_A12_1re+Gf3_A12_2re+
# Gf3_A12_3re+Gf3_A12_4re+Gf3_A12_5re+Gf3_A12_6re+Gf3_A12_7re+Gf3_A12_8re+Gf3_A13_1re+Gf3_A13_2re+Gf3_A13_3re+Gf3_A13_4re+
# Gf3_A13_5re+Gf3_A13_6re+Gf3_A13_7re+Gf3_A13_8re+Gf3_A14_1re+Gf3_A14_2re+Gf3_A14_3re+Gf3_A14_4re+Gf3_A14_5re+Gf3_A14_6re+
# Gf3_A14_7re+Gf3_A14_8re
# 
# '
# gf3_fit = cfa(gf3_model, gf3, std.lv = T, estimator = 'WLSMV') 
# fitmeasures(gf3_fit, c('cfi','rmsea','srmr'))
# summary(gf3_fit)
# modificationindices(gf3_fit)
# 
# x = mirt(gf2,1,'2PL')
# M2(x)
# summary(x)
# 
# 
# x = (trash(gf3, '2PL', .4))
# M2(x, QMC=T)
# 
# 
# semPaths(bfct_fit,
#          "estimates", sizeLat = 5,
#          edge.label.cex = 1,
#          layout = "tree2",
#          style='lisrel',
#          rotation=3
#          )
# 
# l <- "http://www.statmodel.com/usersguide/chap5/ex5.11.out"
# download.file(l, modfile <- tempfile(fileext = ".out"))
# mod <- semPlotModel(modfile)
# 
# semPaths(mod, "col", "est", 
#          layout='tree2',
#          rotation = 3,
#          groups = "latents", 
#          pastel = TRUE,
#          edge.label.cex = .75, 
#          intercepts = TRUE
#          #mar = c(1, 1, 1, 1)
#          )
# 
# 
# lay = get_layout("", "", "Gc","","Gf","","Gstm","", "",
#                  "obs_gc1", "obs_gc2", "obs_gc3", "obs_gf1", "obs_gf2", 
#                  "obs_gf3","obs_gstm1", "obs_gstm2", "obs_gstm3",
#                  "", "","", "","G","", "","", "",
#                  rows=3)
# graph_sem(bfct_fit, 
#           layout = lay,
#           text_size = 3,
#           rect_width = .5)
# 
# prepare_graph(bfct_fit) %>%
#   color_pos_edges("green") %>%
#   color_neg_edges("red") %>%
#   color_var("black") %>%
#   alpha_var(.2) %>% 
#   plot() 
# 
# library(DiagrammeR)
# paths = bfct_fit %>%
#   parameterestimates %>%
#   select(lhs, op, rhs, est)
# latent = paths %>%
#   filter(op == "=~") %>%
#   select(nodes = lhs) %>%
#   distinct %>%
#   mutate(shape = "circle")
# `%not_in%` = Negate(`%in%`)
# manifest = paths %>%
#   filter(op != "~1", lhs %not_in% latent$nodes) %>%
#   select(nodes = lhs) %>%
#   distinct %>%
#   mutate(shape = "square")
# node_set = combine_ndfs(latent, manifest)
# all_paths = paths %>%
#   filter(op != "~1") %>%
#   mutate(label = round(est, 2)) %>%
#   select(-est)
# loadings = all_paths %>%
#   filter(op == "=~") %>%
#   mutate(edge_from = lhs, edge_to = rhs, style = "dashed") %>%
#   select(edge_from, edge_to, style, label)
# regressions = all_paths %>%
#   filter(op == "~") %>%
#   rename(edge_to = lhs, edge_from = rhs) %>%
#   mutate(style = "solid") %>%
#   select(edge_from, edge_to, style, label)
# edge_set = combine_edfs(loadings, regressions)
# node_set = node_set %>% 
#   transmute(id = nodes,
#             shape = shape)
# create_graph(
#   nodes_df = node_set,
#   edges_df = edge_set)
# render_graph(bfct_graph)
# 
# ndf <-
#   create_node_df(
#     n = 4,
#     label = TRUE,
#     type = c("type_1", "type_1",
#              "type_5", "type_2"),
#     shape = c("circle", "circle",
#               "rectangle", "rectangle"),
#     values = c(3.5, 2.6, 9.4, 2.7))
