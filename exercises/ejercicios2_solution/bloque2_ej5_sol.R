library(tidyr)
library(readr)
library(ggplot2)
library(dplyr)
library(stringr)
library(tibble)

ventas <- read_csv("ventas.csv", col_types = cols(Prevision = col_double()))

# calcular error
mae <- summarize(ventas, MAE=mean(abs(Ventas - Prevision), na.rm=T))

# calcular matriz de correlacion
cor_tidy <-
  ventas %>%
    select(-Prevision) %>% 
    spread(Codigo, Ventas) %>% 
    select(-Fecha) %>%
    cor() %>%
    # a partir de aqui convertimos la matriz de correlacion a un data.frame
    # en formato ancho y posteriormente de vuelta a formato largo
    as.data.frame() %>%
    rownames_to_column(var="Prod1") %>%
    gather(Prod2, Cor, -Prod1)

# representacion gráfica de la matriz de correlacion
ggplot(cor_tidy, aes(x = Prod1, y = Prod2)) +
  geom_tile(aes(fill = Cor)) 

# Fecha ya es de tipo date
# Vemos el top 5 de productos
top5 <- 
  ventas %>%
  group_by(Codigo) %>%
  summarize(total = sum(pmax(Ventas, 0))) %>%
  arrange(desc(total)) %>%
  slice(1:5)

# Evolucion mensual por producto
ventas %>%
  filter(Codigo %in% top5$Codigo) %>%
  group_by(Codigo, Mes = factor(month(Fecha))) %>%
  summarize(Ventas = sum(pmax(Ventas, 0))) %>%
  ggplot(aes(x = Mes, y = Ventas)) +
    geom_col() + 
    facet_wrap(~ Codigo, ncol = 2)
