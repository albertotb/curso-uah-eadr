library(ggplot2)
library(dplyr)
library(purrr)
library(stringr)
library(tidyr)
library(forcats)
library(gapminder)

# 2 
summarize_at(gapminder, c("country", "continent"), n_distinct)

# 3
count(gapminder, country)
count(gapminder, continent)

# 4
country_a <- filter(gapminder, str_detect(country, "^A"))

# 5
ggplot(gapminder, aes(x = fct_infreq(continent))) + geom_bar()

# 6
gapminder %>%
  filter(continent == "Asia", year == 2007) %>%
  ggplot(aes(x = lifeExp, y = fct_reorder(country, lifeExp))) + geom_point()

# 7
gapminder %>%
  filter(country %in% c("Egypt", "Haiti", "Romania", "Thailand", "Venezuela")) %>%
  ggplot(aes(x = year, y = lifeExp, color = fct_reorder2(country, year, lifeExp))) + 
  geom_line() + 
  labs(color = "country")

# 8
gapminder %>%
  group_by(continent) %>%
  summarize(avg_country_len = mean(str_length(country)))

# 9 
countries <- unique(pull(gapminder, country))
vocales <- c(a = "[Aa]", e = "[Ee]", i = "[Ii]", o = "[Oo]", u = "[Uu]")

vocales %>%
  map_df(~ str_count(countries, .)) %>%
  mutate(country = countries)
