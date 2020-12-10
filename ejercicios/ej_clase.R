starwars %>% 
  mutate(hair_na = is.na(hair_color)) %>% 
  select(hair_color, hair_na) %>%
  filter(!hair_na)
