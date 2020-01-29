library(ggplot2)
library(dplyr)
library(purrr)
library(tidyr)

# 1
map_chr(diamonds, typeof)
# Los factores se muestran como vectores de enteros

# 2
diamonds %>%
  summarize_if(is.numeric, 
               list("mean" = mean, "median" = median, "max" = max, "min" = min)) %>%
  # opcionalmente, podemos convertir en una tabla
  # nota: esto no se puede hacer directamente con gather, haría falta
  # gather + separate + spread
  pivot_longer(cols = everything(), 
               names_to = c("var", ".value"), 
               names_sep = "_")

# 
ggplot(diamonds, aes(x = color, y = price)) + 
  geom_boxplot()

# 4
ggplot(diamonds, aes(x = color, y = price)) + 
  geom_boxplot() + 
  facet_wrap(~cut)

# 5
corr <- 
  diamonds %>%
    summarize_if(is.numeric, ~ cor(., diamonds$price)) %>%
    select(-price)

# 6
ggplot(diamonds, aes(x = carat)) + 
  geom_histogram() + 
  facet_wrap(~color)

# 7
max_min <- names(corr)[c(which.max(abs(corr)), which.min(abs(corr)))]

diamonds %>%
  pivot_longer(cols = max_min) %>%
  ggplot(aes(x = price, y = value)) + 
    geom_point() + 
    facet_wrap(~name, scales = "free")

# 8
is_outlier <- function(x, times = 3) {
  x < (median(x) - times * mad(x)) | x > (median(x) + times * mad(x))
}

no_outlier <-
  diamonds %>%
    transmute_if(is.numeric, is_outlier) %>%
    mutate(no_outlier = !reduce(., `|`)) %>%
    pull(no_outlier)

dia_clean <- filter(diamonds, no_outlier)

# 9
train <- sample_frac(dia_clean, 0.7)
test  <- anti_join(dia_clean, train) 

# 10
# indice de las columnas numericas
mask_num <- map_lgl(diamonds, is.numeric)

# escalar train (solo columnas numericas)
train_scaled <- scale(train[mask_num])
train[mask_num] <- as_tibble(train_scaled)

# obtener media y desviacion de los atributos que devuelve scale() (ver documentacion)
center <- attr(train_scaled, "scaled:center")
scale  <- attr(train_scaled, "scaled:scale")

# escalar test usando media y desviacion calculadas en train
test[mask_num] <- as_tibble(scale(test[mask_num], center = center, scale = scale))
