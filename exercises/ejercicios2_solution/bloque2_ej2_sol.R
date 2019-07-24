library(tidyr)
library(readr)
library(ggplot2)
library(forcats)

pew <- read_tsv('pew.txt')
pew_tidy <- gather(data, income, frequency, -religion)

# varias opciones para hacer el grafico, por ejemplo...
ggplot(pew_tidy, aes(x = income, y = frequency, fill = religion)) +
  geom_col()

# o tambien...
ggplot(pew_tidy, aes(x = income, y = frequency)) +
  geom_col() +
  facet_wrap(~ religion, ncol = 3)

# Total personas por religion
total <-
  pew_tidy %>%
  group_by(religion) %>%
  summarize(n_per = sum(frequency))

# Ver las 5 con más gente
top5 <-
  total %>%
    arrange(desc(n_per)) %>%
    slice(1:5)

# Repetir el gráfico para las 5 anteriores
pew_tidy %>%
  mutate(religion = fct_other(religion, keep = top5$religion)) %>%
  ggplot(aes(x = income, y = frequency)) +
  geom_col() +
  facet_wrap(~ religion, ncol = 3) + 
  coord_flip()
