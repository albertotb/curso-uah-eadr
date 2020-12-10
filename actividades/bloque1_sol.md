# Soluciones

## Introducción

Soluciones

1. La versión de R aparece en la primera línea de la consola.

## Librerias

Soluciones

1. `install.packages(“tidyverse”)` o en la pestaña Packages
2. Se puede comprobar en Packages buscando “tidyverse”
3. Se cargan ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr y forcats

## Funciones y ayuda

Soluciones

1. `?mean`
2. 1 parámetro obligatorio, 2 opcionales
3. Fichero `media.R`
4. Aparecen los objetos `x` y `xm`
5. `[1] 8.75 5.50`

## RMarkdown

Soluciones

1. File > New File > R Markdown
2. Knit to HTML y Knit to PDF

## Scripts y entorno

Soluciones

1. x y xm
2. numeric
3. Se puede hacer con `rm()` o en la pestaña Environment > List (cambiar a Grid) > Seleccionar objeto > (Imágen escoba)
4. Desaparecen del entorno

## Dataframes

Soluciones

1. `nrow(airquality)` y `ncol(airquality)`
2. `str(airquality)`
3. `summary(airquality)`

## Tibbles

Soluciones

1. `library(tibble)`
2. `cars_tibble <- as_tibble(mtcars)`
3. Solo se muestran las 10 primeras filas cuando se imprime la variable, indica el número de filas, columnas y el tipo de cada columna

## filter y slice

Soluciones

1. `slice(starwars, c(5, 10:20))`
2. `filter(starwars, birth_year > 100 | skin_color == "green")`
3. `filter(starwars, !sex %in% c("male", "female") & !is.na(sex))`

## select

Soluciones

1. `select(starwars, name, height, mass)`
2. `select(starwars, -c(films, vehicles, starships))` o también (depende del orden) `select(starwars, name:species)`
3. `select(starwars, ends_with("_color"))`

## Variantes slice y select

Soluciones

1. `select(starwars, name | contains("color"))`
2. `slice_min(starwars, height, n=5)`
   Si hay empates se devuelven ambos a no ser que se indique `with_ties=FALSE`

## arrange

Soluciones

1. `arrange(starwars, height)`
2. `arrange(starwars, height, desc(mass))`

## mutate

Soluciones

1. `mutate(starwars, imc = mass / (height/100)^2))`
2. `mutate(starwars, imc = mass / (height/100)^2, log_by = log(birth_year))`

## pipe

Soluciones

```{r}
library(dplyr)
df <-
starwars %>%
   filter(birth_year > 100 | skin_color == "green") %>%
   select(name, height, mass) %>%
   mutate(imc = mass / (height/100)^2) %>%
   arrange(height, desc(mass))
```

## summarize

Soluciones

1. `library(ggplot2)`
   `library(dplyr)`
2. `?cor`
3. `summarize(mpg, cor(hwy, cty))`

## dplyr

Soluciones

1. `select(airquality, Temp)`
2. `select(airquality, -Month, -Day)`
3. `filter(airquality, Month == 8)`
4. Código

   ```{r}
   airquality %>%
      filter(Month == 8) %>%
      select(Wind, Temp)
   ```
