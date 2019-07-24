library(dplyr)
library(ggplot2)

nrow(diamonds)
ncol(diamonds)

ggplot(diamonds) +
  geom_bar(aes(x = cut))

dia <- sample_n(diamonds, 10000)

ggplot(dia) + 
  geom_histogram(aes(x = price))

dia %>%
  summarize(c = cor(price, carat))

ggplot(dia) + 
  geom_point(aes(x = carat, y = price))

ggplot(dia) + 
  geom_point(aes(x = carat, y = price)) + 
  facet_wrap(~cut)
