# Soluciones

## dplyr avanzado

### group_by

1. Al data.frame no le ocurre nada, group_by únicamente modifica las operaciones posteriores
2. La única diferencia apreciable es la línea # Groups: sex [5]
3. 5 grupos

### Operaciones agrupadas

1. Solución

   ```{r}
   starwars %>%
       group_by(sex) %>%
       summarize(n = n())
   ```

2. Solución
   `count(starwars, sex)`

### Operaciones en múltiples columnas

#### Ejercicio 1

1. Devuelve todo NAs ya que las columnas tienen NA
2. Se pueden pasar como argumentos a continuación de la lista de funciones
3. Solución:

   ```{r}
   library(dplyr)

   summarize(starwars,
             across(c(height, mass, birth_year),
                    list(min = min, max = max, mean = mean),
                    na.rm = TRUE))
   ```

#### Ejercicio 2

```{r}
library(dplyr)

starwars %>%
  group_by(sex) %>%
  summarize(across(c(height, mass, birth_year),
                   list(min = min, max = max, mean = mean),
                   na.rm = TRUE),
            n = n())
```

### Joins

1. Solución

   ```{r}
   library(dplyr)
   full_join(band_members, band_instruments2, by = c("name" = "artist"))
   ```

2. Si, porque hay valores de los dos data.frames que no tienen correspondencia en el otro

## ggplot2 avanzado

### Facetas

Hay muchos más usuarios con abono anual que ocasionales, por lo que si no hacemos que las escalas sean independientes no se ve el patrón de los usuarios ocasionales.

```{r}
library(readxl)
library(tidyr)
library(ggplot2)

bicis <- read_excel('./data/bicis_usos_acumulado.xls',
                    sheet = "Usos mar 2020",
                    range = "A3:E34")

# apartado 1
bicis_long <- bicis %>%
  pivot_longer(starts_with("Usos"),
               names_to = "Tipo_uso",
               values_to = "Usos")

# apartado 2
ggplot(bicis_long, aes(x = DIA, y = Usos, fill = `Tipo de día`)) +
  geom_col() +
  facet_wrap(~ Tipo_uso, ncol = 1, scales = "free_y")
```

### Ejes

```{r}
ggplot(bicis_long, aes(x = DIA, y = Usos)) +
  geom_col() +
  geom_vline(xintercept = bicis$DIA[16], linetype = "dashed") +
  annotate("text", x = bicis$DIA[17], y = 10000,
           label = "Cierre BiciMAD\npor estado de alarma",
           hjust = "left") +
  labs(x = "Día", y = "Número total de usos")
```

### Estilos

```{r}
ggplot(bicis_long, aes(x = DIA, y = Usos, fill = `Tipo de día`)) +
  geom_col() +
  facet_wrap(~ Tipo_uso, ncol = 1, scales = "free_y") +
  scale_fill_brewer(palette = "Dark2") +
  theme(legend.position = "top")
```
