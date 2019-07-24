library(nycflights13)
library(dplyr)
library(ggplot2)

delay.per.time <-
  flights %>%
    mutate(time = hour + round(minute/60, 1)) %>%
    group_by(time) %>%
    summarize(delay = mean(arr_delay, na.rm=T), 
              n_vuelos = n())

ggplot(delay.per.time, aes(x = time, y = delay, size = n_vuelos)) +
  geom_point()

ggsave("delay_time.pdf")
