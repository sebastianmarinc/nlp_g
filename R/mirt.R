# set wd
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries 
library(mirt)
library(tidyverse)
library(haven)
library(lavaan)
library(psych)
library(doParallel)

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
write_csv(ability_fct_score, '../data/cog_ability_scores.csv')

# correlation 
cor(obs)
cor(latent)
cor(g)
cor(cbind(obs,g,latent))

write_csv(latent, '../data/cog_latent_scores.csv')
write_csv(obs, '../data/cog_sum_scores.csv')