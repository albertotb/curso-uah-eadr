library(tidyr)
library(readr)
library(dplyr)
library(stringr)

tb <- read_csv("tb.csv")

tb_tidy <-
  tb %>%
    select(-new_sp, -new_sp_m04, -new_sp_m514, -new_sp_f04, -new_sp_f514) %>%
    gather(edad_sexo, ncasos, -iso2, -year, na.rm = TRUE) %>%
    mutate(edad_sexo = str_remove(edad_sexo, "new_sp_")) %>%
    separate(edad_sexo, into = c("sex", "age"), 1, remove = TRUE)

# Evolucion anual por pais
tb_tidy %>%
  group_by(iso2, year) %>%
  summarize(total_casos = sum(ncasos)) %>%
  filter(iso2 %in% c("ES", "FR", "GB", "IT")) %>%
  ggplot(aes(x = year, y = total_casos, color = iso2)) +
    geom_line()

# Evolucion anual por pais y grupo de edad
tb_tidy %>%
  group_by(iso2, year, age) %>%
  summarize(total_casos = sum(ncasos)) %>%
  filter(iso2 %in% c("ES", "FR", "GB", "IT")) %>%
  ggplot(aes(x = year, y = total_casos, color = iso2)) +
    geom_line() + 
    facet_wrap(~ age)
