library(dplyr)

resultado <-
  diamonds %>%
    filter(cut == "Ideal") %>%
    select(carat, cut, color, price, clarity) %>%
    mutate(pq = price/carat) %>%
    group_by(color) %>%
    summarize(avg_pq = mean(pq)) %>%
    arrange(avg_pq) 
