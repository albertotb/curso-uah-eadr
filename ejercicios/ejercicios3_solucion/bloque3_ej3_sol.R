library(ggplot2)
library(dplyr)
library(purrr)
library(stringr)
library(tidyr)
library(forcats)
library(readr)
library(lubridate)

# 1
pr <- read_csv("./data/mortality_report.csv")

num <- 1:12
names(num) <- unique(pull(pr, month))
# esto funciona porque los meses están ordenados, hay que tener cuidado con eso

# 2 y 3
pr <- 
  pr %>%
    mutate(month = recode(month, !!!num),
           date = make_date(year, month, day))

# 4
ggplot(pr, aes(x = date, y = deaths)) + 
  geom_line()

# 5
pr <- filter(pr, date < ymd("20180501"))

# 6
ggplot(pr, aes(x = yday(date), y = deaths)) + 
  geom_col()

# 7
pr %>%
  mutate(after_date = date >= ymd("20160920")) %>%
  ggplot(aes(x = date, y = deaths, color = after_date)) +
    geom_line() + 
    theme(legend.position = "none")

# 8
pr %>%
  ggplot(aes(x = round_date(date, unit = "month"), y = deaths)) + 
  geom_col()
