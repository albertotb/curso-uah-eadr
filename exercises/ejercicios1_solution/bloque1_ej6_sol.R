library(dplyr)
library(ggplot2)
library(nycflights13)

delay.per.dest <-
  flights %>%
    group_by(dest) %>%
    summarize(avg_delay = mean(arr_delay, na.rm=T), 
              n_flights = n())

delay.per.dest %>% 
  left_join(airports, by=c("dest" = "faa")) %>%
  ggplot(aes(x = lon, y = lat, size = n_flights)) + geom_point()
