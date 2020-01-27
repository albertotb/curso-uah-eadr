library(dplyr)
library(ggplot2)
library(Lahman)

Batting %>%
  group_by(playerID) %>%
  summarize(total_G=sum(G)) %>%  
  arrange(desc(total_G)) %>%
  slice(1:5)
