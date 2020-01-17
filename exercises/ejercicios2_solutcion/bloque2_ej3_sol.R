library(tidyr)
library(readr)
library(dplyr)
library(stringr)
library(lubridate)

weather <- read_tsv("weather.txt", na=c("-"))

weather_tidy <-
  weather %>% 
    gather(dia, temperatura, d1:d31, na.rm=T) %>%
    spread(element, temperatura) %>%
    separate(id, c("pais", "id"), 2)

# eliminar la d de la columna dia, crear columna fecha y calcular tmp media semanal
weather_tidy %>%
  mutate(dia = str_extract(dia, "\\d+"),
         fecha = make_date(year, month, dia)) %>%
  group_by(week = week(fecha)) %>%
  summarize(tmax_avg = mean(TMAX),
            tmin_avg = mean(TMIN))
  
