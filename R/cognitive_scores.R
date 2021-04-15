# set wd
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(mirt)
library(tidyverse)
library(haven)
library(naniar)
library(psych)
library(fungible)
library(doParallel)
library(lavaan)

# data importing and cleaning 
df = read_spss('../data/Fully_Merged_Diss_Data_5-22-18.sav') #import spss data

#   filter bogus 
# sum(df$bogus_1 == 4, na.rm=T)
# sum(df$bogus_2 == 3, na.rm=T)
# sum(df$bogus_3 == 345, na.rm=T)
# sum(df$bogus_4 == 4, na.rm=T)
bogus1 = ifelse(df$bogus_1==4,1,0)
bogus2 = ifelse(df$bogus_2==3,1,0)
bogus3 = ifelse(df$bogus_3==345,1,0)
bogus4 = ifelse(df$bogus_4==4,1,0)
df$bogus_sum = bogus1+bogus2+bogus3+bogus4
sum(df$bogus_sum > 2, na.rm = T)
df_bogus = df %>% 
  filter(!is.na(bogus_sum), 
         bogus_sum > 2)

#write.csv(df_bogus, '../data/df.csv')
#liwc = df %>% select(WC1:OtherP3)
#write.csv(liwc, '../data/liwc.csv')

#   missingness
miss_var_summary(df_bogus) #%>% view
miss_case_summary(df_bogus) #%>% view

#   cognitive battery
cog = df_bogus %>% select(ends_with('re')) 

#   describe
no_var = describe(cog) %>% 
  as_tibble() %>% 
  filter(sd == 0) %>% 
  select(vars) %>% 
  c() %>% 
  unlist %>% 
  as.numeric() %>% 
  dput 
cog_trim = cog[,-no_var]

#write_csv(cog_trim, '../data/cog_trim.csv')

# data analysis 
#   parallel analysis 
registerDoParallel( detectCores() - 1 )
fa.parallel(cog_trim, n.iter = 10)
registerDoSEQ()

#   multiple battery fa 
registerDoParallel( detectCores() - 1 )
mb = faMB(
  X = cog_trim, 
  NB = 4, 
  NVB = c(60, 141, 160, 66),
  numFactors = 4,
  rotate = 'oblimin'
)
registerDoSEQ()
mb

#   confirmatory models
# cog_trim %>% 
#   select(starts_with('Gc')) %>% 
#   names() 
# 
# paste0('Gc3',sep='_',1:18,'re+')
# 
# gc = '
# gc  =~ Gc1_1re+ Gc1_2re+  Gc1_3re+  Gc1_4re+  Gc1_5re+  Gc1_6re+  Gc1_7re+Gc1_8re+  Gc1_9re+  Gc1_10re+ Gc1_11re+ Gc1_12re+ Gc1_13re+ Gc1_14re+Gc1_15re+ Gc1_16re+ Gc1_17re+ Gc1_18re+ Gc1_19re+ Gc1_20re+ Gc1_21re+Gc1_22re+ Gc1_23re+ Gc1_24re + Gc2_1re+  Gc2_2re+  Gc2_3re+  Gc2_4re+  Gc2_5re+  Gc2_6re+  Gc2_7re+ Gc2_8re+  Gc2_9re+  Gc2_10re+ Gc2_11re+ Gc2_12re+ Gc2_13re+ Gc2_14re+Gc2_15re+ Gc2_16re+ Gc2_17re+ Gc2_18re+ Gc3_1re+  Gc3_2re+  Gc3_3re+  Gc3_4re+  Gc3_5re+  Gc3_6re+  Gc3_7re+ Gc3_8re+  Gc3_9re+  Gc3_10re+ Gc3_11re+ Gc3_12re+ Gc3_13re+ Gc3_14re+Gc3_15re+ Gc3_16re+ Gc3_17re+ Gc3_18re
# gc1 =~ Gc1_1re+  Gc1_2re+  Gc1_3re+  Gc1_4re+  Gc1_5re+  Gc1_6re+  Gc1_7re+Gc1_8re+  Gc1_9re+  Gc1_10re+ Gc1_11re+ Gc1_12re+ Gc1_13re+ Gc1_14re+Gc1_15re+ Gc1_16re+ Gc1_17re+ Gc1_18re+ Gc1_19re+ Gc1_20re+ Gc1_21re+Gc1_22re+ Gc1_23re+ Gc1_24re
# gc2 =~ Gc2_1re+  Gc2_2re+  Gc2_3re+  Gc2_4re+  Gc2_5re+  Gc2_6re+  Gc2_7re+ Gc2_8re+  Gc2_9re+  Gc2_10re+ Gc2_11re+ Gc2_12re+ Gc2_13re+ Gc2_14re+Gc2_15re+ Gc2_16re+ Gc2_17re+ Gc2_18re
# gc3 =~ Gc3_1re+  Gc3_2re+  Gc3_3re+  Gc3_4re+  Gc3_5re+  Gc3_6re+  Gc3_7re+ Gc3_8re+  Gc3_9re+  Gc3_10re+ Gc3_11re+ Gc3_12re+ Gc3_13re+ Gc3_14re+ Gc3_15re+ Gc3_16re+ Gc3_17re+ Gc3_18re
# 
# gc1 ~~ 0*gc2
# gc2 ~~ 0*gc3
# gc3 ~~ 0*gc1
# '
# cfa_gc = cfa(gc, cog_trim)
# # did not converge, most likely underidentified 


# Gc scores (comprehension verbal)
gc = cog_trim %>% select(starts_with('Gc')) #%>% select(-Gc3_4re, -Gc1_12re)

fa.parallel(gc)
faMain(gc, numFactors=4)
omega(gc)

gc_iclust = iclust(tetrachoric(gc)$rho, nclusters = 3)
gc_iclust

gc1_model = '
Gc1 =~ Gc1_1re + Gc1_2re + Gc1_3re + Gc1_4re + Gc1_5re + Gc1_6re + Gc1_7re + Gc1_8re + 
Gc1_9re + Gc1_10re + Gc1_11re + Gc1_12re + Gc1_13re + Gc1_14re + Gc1_15re + Gc1_16re 
+ Gc1_17re + Gc1_18re 
'
gc2_model = '
Gc2 =~ Gc2_1re + Gc2_2re + Gc2_3re + Gc2_4re + Gc2_5re + Gc2_6re + Gc2_7re + Gc2_8re + 
Gc2_9re + Gc2_10re + Gc2_11re + Gc2_12re + Gc2_13re + Gc2_14re + Gc2_15re + Gc2_16re 
+ Gc2_17re + Gc2_18re 
'
gc3_model = '
Gc3 =~ Gc3_1re + Gc3_2re + Gc3_3re + Gc3_4re + Gc3_5re + Gc3_6re + Gc3_7re + Gc3_8re + 
Gc3_9re + Gc3_10re + Gc3_11re + Gc3_12re + Gc3_13re + Gc3_14re + Gc3_15re + Gc3_16re 
+ Gc3_17re + Gc3_18re 
'
# gc.1 = gc [,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#             18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#             34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
#             50)]
# gc.2 = gc[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#            18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#            34, 35, 36, 37, 38, 39, 40, 41, 42)]
# 
# m   =mirt(gc, 1, '2PL')
# m.1 =mirt(gc.1, 1, '2PL')
# m.2 =mirt(gc.2, 1, '2PL')
gc = gc %>% select(-c(Gc1_6re 
                      ,Gc1_10re
                      ,Gc1_14re
                      ,Gc1_16re
                      ,Gc1_21re
                      ,Gc1_24re
                      ,Gc2_9re
                      ,Gc2_11re
                      ,Gc2_14re
                      ,Gc2_15re
                      ,Gc2_16re
                      ,Gc2_17re
                      ,Gc3_1re
                      ,Gc3_4re
                      ,Gc3_5re 
                      ,Gc3_9re 
                      ,Gc3_12re
                      ,Gc3_17re
                      ,Gc3_18re))
gc_2pl = mirt(gc, 1, '2PL')
gc_2pl@Fit[['F']]
M2(gc_2pl)
# rerun w loadings >.35; after reruns, the first model fit the best and there were no sig diffs between the models
# gc_2pl@Fit[['F']] %>% as_tibble %>% filter(F1 > .35) %>% rownames_to_column() %>% select(rowname) %>% as.matrix() %>% as.numeric() %>% dput




# get general factor scores
gc_scores_2pl = fscores(gc_2pl, QMC=T)[,1]
#write.csv(gc_scores, '../data/gc_scores.csv')


# Gf scores (fluid)
gf = cog_trim %>% select(starts_with('Gf'))
gf = gf[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
           18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
           34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45)]
gf = gf[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
           18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
           34, 35)]
gf = select(gf, -Gf1_15re)
gf = gf[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
           18, 19, 20, 21, 22, 23, 24, 25, 26, 27)]
gf = gf[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
            18, 19, 20, 21)]
#gf = gf[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17)]


# irt model
gf_2pl = mirt(gf, 1, '2PL')
gf_2pl@Fit[['F']]
M2(gf_2pl)
gf_scores_2pl = fscores(gf_2pl, QMC=T)[,1]
# rerun without item with factor loadings <.35
# gf_2pl@Fit[['F']] %>% as_tibble %>% filter(F1 > .35) %>% rownames_to_column() %>% select(rowname) %>% as.matrix() %>% as.numeric() %>% dput


# Gstm scores (short term memory)
gstm = cog_trim %>% select(starts_with('Gsm')) 
gstm.1 = gstm[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
                 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
                 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
                 50, 51, 52, 53, 54, 55, 56, 57, 58, 59)]
gstm.2 = gstm.1 [,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
                    18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
                    34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
                    50, 51, 52, 53)]
gstm.3 = gstm.2[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
                   18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
                   34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48)]
gstm.4 = gstm.3[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
                   18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
                   34, 35, 36, 37, 38, 39, 40, 41, 42, 43)]
# gstm.5 = gstm.4[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#                  18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#                  34, 35, 36, 37, 38, 39, 40)]
# gstm_2pl.5 = mirt(gstm.5, 1, '2PL')
gstm = gstm.4 %>% select(-c(Gsm3_1re,
                            Gsm1_21re,
                            Gsm1_2re ))
# pca
pca(gstm, 3)

# irt model 
gstm_2pl = mirt(gstm, 1, '2PL')
gstm_2pl@Fit[['F']]
M2(gstm_2pl)
gstm_scores_2pl = fscores(gstm_2pl, QMC=T)[,1]

# rerun without item with factor loadings <.35
# gstm_2pl@Fit[['F']] %>% as_tibble %>% filter(F1 > .35) %>% rownames_to_column() %>% select(rowname) %>% as.matrix() %>% as.numeric() %>% dput


# # Gv scores (visual perceptual)
# gv = cog_trim %>% select(starts_with('Gv'))
# gv = gv[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#            18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#            34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
#            50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 
#            66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 
#            82, 83, 84, 85, 86, 87, 88, 89, 90)]
# gv = gv[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#            18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#            34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
#            50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64)]
# gv = gv[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#            18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#            34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
#            50, 51, 52, 53, 54, 55, 56)]
# gv = gv[,c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 
#              18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 
#              34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
#              50)]
# gv_2pl = mirt(gv, 3, '2PL')
# gv_2pl@Fit[['F']]
# M2(gv_2pl)
# #gv_2pl@Fit[['F']] %>% as_tibble %>% filter(F1 > .35) %>% rownames_to_column() %>% select(rowname) %>% as.matrix() %>% as.numeric() %>% dput
# 

# GMA scores (general ability)
g = cbind(gc, gf, gstm)
g_cor = tetcor(g)$r

faMain(R = g_cor, numFactors = 3, facMethod = 'faregLS')
iclust(g_cor, nclusters = 3)

# g_model = '
# G = 1-102
# 
# CONSTRAIN = (1,a1,a2), (2,a1,a2), (3,a1,a2), (4,a1,a2), (5,a1,a2),(6,a1,a2), (7,a1,a2), (8,a1,a2), 
# (9,a1,a2), (10,a1,a2), (11,a1,a2),(12,a1,a2), (13,a1,a2), (14,a1,a2), (15,a1,a2), (16,a1,a2) (17,a1,a2) 
# (18,a1,a2) (19,a1,a2) (20,a1,a2) (21,a1,a2) (22,a1,a2),(23,a1,a2) (24,a1,a2) (25,a1,a2) (26,a1,a2)
# (27,a1,a2) (28,a1,a2) (29,a1,a2) (30,a1,a2) (31,a1,a2) (32,a1,a2) (33,a1,a2),
# (34,a1,a2) (35,a1,a2) (36,a1,a2) (37,a1,a2) (38,a1,a2) (39,a1,a2) (40,a1,a2) (41,a1,a2) 
# 
# CONSTRAIN = (42,a1,a3), (43,a1,a3), (44,a1,a3), (45,a1,a3), (46,a1,a3), (47,a1,a3), (48,a1,a3), 
# (49,a1,a3), (50,a1,a3), (51,a1,a3), (52,a1,a3), (53,a1,a3), (54,a1,a3), (55,a1,a3), (56,a1,a3), 
# (57,a1,a3), (58,a1,a3), (59,a1,a3), (60,a1,a3), (61,a1,a3), (62,a1,a3)
# 
# CONSTRAIN = (63,a1,a4), (64,a1,a4), (65,a1,a4), 
# (66,a1,a4), (67,a1,a4), (68,a1,a4), (69,a1,a4), (70,a1,a4), 
# (71,a1,a4), (72,a1,a4), (73,a1,a4), (74,a1,a4), (75,a1,a4), 
# (76,a1,a4), (77,a1,a4), (78,a1,a4), (79,a1,a4), (80,a1,a4), 
# (81,a1,a4) (82,a1,a4), (83,a1,a4), (84,a1,a4), (85,a1,a4), (86,a1,a4), 
# (87,a1,a4), (88,a1,a4), (89,a1,a4), (90,a1,a4), (91,a1,a4), 
# (92,a1,a4), (93,a1,a4), (94,a1,a4), (95,a1,a4), (96,a1,a4), 
# (97,a1,a4), (98,a1,a4), (99,a1,a4), (100,a1,a4), (101,a1,a4), 
# (102,a1,a4)
# 
# COV = S1*S1, S2*S2, S3*S3
# 
# '

g_model = '
Gc = 1-41
Gf = 42-62
Gstm = 43-102 

CONSTRAIN = (1,a1), (2,a1), (3,a1), (4,a1), (5,a1),(6,a1), (7,a1), (8,a1), 
(9,a1), (10,a1), (11,a1),(12,a1), (13,a1), (14,a1), (15,a1), (16,a1) (17,a1) 
(18,a1) (19,a1) (20,a1) (21,a1) (22,a1),(23,a1) (24,a1) (25,a1) (26,a1)
(27,a1) (28,a1) (29,a1) (30,a1) (31,a1) (32,a1) (33,a1),
(34,a1) (35,a1) (36,a1) (37,a1) (38,a1) (39,a1) (40,a1) (41,a1) 

CONSTRAIN = (42,a2), (43,a2), (44,a2), (45,a2), (46,a2), (47,a2), (48,a2), 
(49,a2), (50,a2), (51,a2), (52,a2), (53,a2), (54,a2), (55,a2), (56,a2), 
(57,a2), (58,a2), (59,a2), (60,a2), (61,a2), (62,a2)

CONSTRAIN = (63,a3), (64,a3), (65,a3), 
(66,a3), (67,a3), (68,a3), (69,a3), (70,a3), 
(71,a3), (72,a3), (73,a3), (74,a3), (75,a3), 
(76,a3), (77,a3), (78,a3), (79,a3), (80,a3), 
(81,a3) (82,a3), (83,a3), (84,a3), (85,a3), (86,a3), 
(87,a3), (88,a3), (89,a3), (90,a3), (91,a3), 
(92,a3), (93,a3), (94,a3), (95,a3), (96,a3), 
(97,a3), (98,a3), (99,a3), (100,a3), (101,a3), 
(102,a3)

COV = Gc*Gf*Gstm
'
mirt.model(g_model)
#specific = c(rep(1,41),rep(2,21),rep(3,40)) #bifactor specification

registerDoParallel(detectCores()-1)
g_mirt = mirt(g, g_model, '2PL')
registerDoSEQ()
summary(g_mirt)

# latent scores 
gc_scores = fscores(g_mirt, QMC=T)[,1]
gf_scores = fscores(g_mirt, QMC=T)[,2]
gstm_scores = fscores(g_mirt, QMC=T)[,3]

# component g score
r = cor(cbind(gc_scores, gf_scores, gstm_scores))
g_pca = prcomp(cbind(gc_scores, gf_scores, gstm_scores)) 

library(ggbiplot)
ggbiplot(g_pca)


# write.csv(g_scores,'../data/g_scores.csv')
# write.csv(gc_scores, '../data/gc_scores.csv')
# write.csv(gf_scores, '../data/gf_scores.csv')
# write.csv(gstm_scores, '../data/gstm_scores.csv')

# cor(cbind(g_scores[,-1],gc_scores[,-1],gf_scores[,-1],gstm_scores[,-1]))

# observed scores
gc_sum = cog_trim %>% 
  select(starts_with('Gc')) %>% 
  rowSums()
gf_sum = cog_trim %>% 
  select(starts_with('Gf')) %>% 
  rowSums()
gstm_sum = cog_trim %>% 
  select(starts_with('Gsm')) %>% 
  rowSums()
 
g_sum = ((gc_sum*length(gc_sum))+(gf_sum*length(gf_sum))+(gstm_sum*length(gstm_sum))) / (length(gc_sum)+length(gf_sum)+length(gstm_sum)) 

# write.csv(gc_sum, '../data/gc_sum.csv')
# write.csv(gf_sum, '../data/gf_sum.csv')
# write.csv(gstm_sum, '../data/gstm_sum.csv')
# write.csv(g_sum, '../data/g_sum.csv')


cor(
  cbind(
    g,gc,gf,gstm,gc_scores_2pl,gf_scores_2pl,gstm_scores_2pl
  )
)


g = cog_trim %>% select(-starts_with('Gv'))

registerDoParallel(detectCores()-1)
r=tetcor(g)$r
g_omega = omega(r, 3)
registerDoSEQ()

g_omega

# sum scores
gc = cog_trim %>% select(starts_with('Gc'))
gf = cog_trim %>% select(starts_with('Gf'))
gstm = cog_trim %>% select(starts_with('Gsm'))

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
g_scale = scale(g)

# explore
fa.parallel(g, n.iter=50)
prcomp(g) %>% summary 
prcomp(g_scale) %>% summary

omega(gc)
omega(gf)
omega(gstm)

# bifactor observed sum scores 
sum_model = '

G =~ gc1sum + gc2sum + gc3sum + gf1sum + gf2sum + gf3sum + gstm1sum + gstm2sum + gstm3sum
Gc =~ gc1sum + gc2sum + gc3sum 
Gf =~ gf1sum + gf2sum + gf3sum
Gstm =~ gstm1sum + gstm2sum + gstm3sum

G ~~ 0*Gc
G ~~ 0*Gf
G ~~ 0*Gstm

Gc ~~ 0*Gf
Gc ~~ 0*Gstm
Gf ~~ 0*Gstm
'
sum_fit = cfa(sum_model, g_scale, std.lv=T)
summary(sum_fit)
fitmeasures(sum_fit, c('cfi','rmsea','srmr'))

fct_scores_cfa = lavPredict(sum_fit)



# essays 
essay = tibble(
  id = df_bogus$ID,
  essay1 = df_bogus$GRE_1,
  essay2 = df_bogus$GRE_2,
  essay3 = df_bogus$GRE_3
)
essay = essay %>% 
  mutate(across(essay1:essay3, ~ifelse(. == "", NA, .))) 
#missing = which(essay == "", arr.ind = T)
essay = essay[complete.cases(essay), ]
essay_gre = pivot_longer(essay, essay1:essay3)
#write_tsv(essay_gre, '../data/essay_gre.tsv')

# gre & ability scores (rounded)
describe(obs)
gc = rowSums(obs[,1:3])
gf = rowSums(obs[,4:6])
gsm = rowSums(obs[,7:9])

abilities = bind_cols(gc = gc, gf = gf, gsm = gsm)
abilities = abilities[-missing[,1],]
abilities = bind_cols(abilities, ability)
#write_csv(abilities, '../data/abilities.csv')

essay_gre_cog = bind_cols(essay_gre, abilities[rep(seq_len(nrow(abilities)), each = 3), ])
#write_tsv(essay_gre_cog, '../data/essay_gre_cog.tsv')

# run msi scripts, get essay score predictions
pred = read_csv('../data/essay_gre_pred.csv', col_names = c("index","score"), skip = 1) 
essay_gre = bind_cols(essay_gre, score = pred$score)
essay_gre$name_score = (rep(c('score1','score2','score3'), 365))
essay_gre = pivot_wider(essay_gre, id)

scores = bind_cols(name = rep(c('score1','score2','score3'), 365), score = pred$score)
scores = pivot_wider(scores, names_from = name, values_from  = score) %>% unnest()
scores$mean_score = rowMeans(scores)

essay_gre = bind_cols(essay_gre, scores)
#write.csv(essay_gre, 'essay_gre.csv')



# correlations
ability = read.csv('../data/cog_ability_scores.csv')
ability = ability[-missing[,1],]
cor(ability, essay_gre[5:8])
