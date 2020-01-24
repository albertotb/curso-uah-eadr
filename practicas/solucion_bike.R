library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(stringr)
library(forcats)
library(lubridate)

# Ejercicio 1
bikes <- read_csv('comptagevelo2017.csv')

# Ejercicios 2-6
bikes1 <-
  bikes %>%
    select(-X2) %>%
    gather(key = District, value = N, -Date) %>%
    separate(Date, into = c("Day", "Month", "Year"), sep = "/", remove = F) %>%
    mutate(Date = dmy(Date),
           #District = str_replace(District, " \\(.*\\)", ""),
           District = str_replace(District, " / ", "/"))

# Ejercicio 7
bikes1 %>%
  group_by(District) %>%
  summarize(missing = mean(is.na(N)))

# Ejercicio 8
total <-
  bikes1 %>%
    group_by(District) %>%
    summarize(Total = sum(N, na.rm = T))  

# Ejercicio 9
top5 <-
  total %>% 
  arrange(desc(Total)) %>% 
  slice(1:5) %>%
  pull(District)

# Ejercicios 10 y 12
total %>% 
  mutate(District = fct_reorder(District, Total)) %>%
  ggplot(aes(x = District, y = Total)) + 
  geom_col() + 
  coord_flip()

# Ejercicios 11 y 13
bikes1 %>%
  group_by(District, Month) %>%
  summarize(Total = sum(N, na.rm = T)) %>%
  group_by(Month) %>% 
  mutate(Average = mean(Total)) %>%
  ggplot(aes(x = Month, y = Total, group = District)) + 
    geom_line() +
    geom_line(aes(x = Month, y = Average), color = "blue", size = 2)

# Ejercicio 14
bikes1 %>%
  filter(District %in% top5) %>%
  group_by(Day_of_week = wday(Date), District) %>%
  summarize(Total = sum(N, na.rm = T)) %>%
  ggplot(aes(x = Day_of_week, y = Total)) + 
  geom_col() +
  facet_wrap(~ District)

# Ejercicio 15
bikes2 <-
  bikes1 %>%
  group_by(District, Month) %>%
  mutate(N = replace_na(N, mean(N, na.rm = T)))
  
# Ejercicio 16
loc <- read_csv("localisationcompteursvelo2015.csv", 
                locale = locale(encoding = "ISO-8859-1"))

# Ejercicio 17
ggplot(loc, aes(x = coord_X, y = coord_Y, color = Type, shape = Etat)) + 
  geom_point(size = 3)

# Ejercicio 18
bikes_loc <- left_join(bikes2, loc, by = c("District" = "nom_comptage"))

# Ejercicio 19
bikes_loc %>% 
  group_by(District) %>% 
  summarize(all_na = all(is.na(nom))) %>% 
  filter(all_na)

# Ejercicio 20
bikes_loc %>%
  group_by(District) %>%
  summarize(Total = sum(N, na.rm = T),
            coord_X = first(coord_X),
            coord_Y = first(coord_Y)) %>%
  drop_na() %>%
  ggplot(aes(x = coord_X, y = coord_Y, size = Total)) + geom_point()
