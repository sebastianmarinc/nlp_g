# set wd 
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load libraries
library(tidyverse)
library(haven)

# importing 
df = read_csv('../data/df.csv') #import spss data

# cleaning 
liwc = df %>% select(WC1:OtherP3)

#     Pennebaker et al. (2014) computed a single score for each person.
#     CDI = 30 + article + preposition − personal pronoun − impersonal
#     pronoun − auxiliary verb − conjunction − adverb − negation
liwc = liwc %>% 
  mutate(
    cdi1 = 30 + article1 + prep1 - ppron1 - ipron1 - auxverb1 - conj1 - adverb1 - negate1,
    cdi2 = 30 + article2 + prep2 - ppron2 - ipron2 - auxverb2 - conj2 - adverb2 - negate2,
    cdi3 = 30 + article3 + prep3 - ppron3 - ipron3 - auxverb3 - conj3 - adverb3 - negate3
  )

liwc.1 = liwc %>% select(WC1:OtherP1, cdi1) 
names(liwc.1) = sub('1','',names(liwc.1))

liwc.2 = liwc %>% select(WC2:OtherP2, cdi2)
names(liwc.2) = sub('2','',names(liwc.2))

liwc.3 = liwc %>% select(WC3:OtherP3, cdi3)
names(liwc.3) = sub('3','',names(liwc.3))

liwc_comp = (liwc.1 + liwc.2 + liwc.3) / 3

write.csv(liwc, '../data/liwc.csv', row.names = F)
write.csv(liwc_comp, '../data/liwc_comp.csv', row.names = F)
