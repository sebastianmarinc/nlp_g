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
bogus1 = ifelse(df$bogus_1==4,1,0)
bogus2 = ifelse(df$bogus_2==3,1,0)
bogus3 = ifelse(df$bogus_3==345,1,0)
bogus4 = ifelse(df$bogus_4==4,1,0)
df$bogus_sum = bogus1+bogus2+bogus3+bogus4
sum(df$bogus_sum > 2, na.rm = T)
df_bogus = df %>% 
  filter(!is.na(bogus_sum), 
         bogus_sum > 2)

write.csv(df_bogus, '../data/df.csv')

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

write_csv(cog_trim, '../data/cog_trim.csv')

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
