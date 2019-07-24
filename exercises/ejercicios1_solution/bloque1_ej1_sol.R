library(ggplot2)
library(dplyr)

mtcars %>%
  filter(mpg < 15) %>%
  arrange(desc(disp)) %>%
  summarize(avg_gear = mean(gear))

ggplot(mtcars, aes(x = mpg, y = wt)) + 
  geom_point()