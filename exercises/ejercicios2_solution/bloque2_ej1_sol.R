library(dplyr)
library(ggplot2)
library(readr)

nba.shots <- read_csv("../../data/shot_logs.csv")

colnames(nba.shots)

nba.shots %>% 
  filter(player_name %in% c("kobe bryant", "james harden")) %>%
  group_by(player_name, GAME_ID) %>%
  mutate(total_touch_time = cumsum(TOUCH_TIME)) %>%
  summarize(points_per_tt = sum(PTS)/max(total_touch_time)) %>%
  group_by(player_name) %>%
  summarize(avg_pts_per_tt = mean(points_per_tt))

ggplot(nba.shots, aes(x = SHOT_DIST, fill = factor(PTS_TYPE))) + geom_histogram()
