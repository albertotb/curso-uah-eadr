# Soluciones

## Datos ordenados: librería tidyr

Solución

1. Código

   ```{r}
   table_2 %>%
     mutate(ratio_1999 = cases_1999 / population_1999 * 10000,
     ratio_2000 = cases_2000 / population_2000 * 10000)
   ```

2. “year” tiene tipo integer originalmente, por lo que si no se convierte ggplot2 crea una escala continua en lugar de discreta

## pivot_longer

Soluciones

1. `?relig_income`
2. `pivot_longer(relig_income, -religion, names_to = “income”, values_to = “n”))`

## pivot_wider

Soluciones

1. `?us_rent_income`
2. `pivot_wider(us_rent_income, names_from = variable, values_from = c(estimate, moe))`

## separate y unite

Soluciones

1. `count(starwars, hair_color)`
2. `separate(starwars, hair_color, into = c("primary", "secondary"), sep = ", ")`

## Gestionando NA con tidyr

Soluciones

1. `summarize(starwars, no_birth = sum(is.na(birth_year)))`
2. `sw_birth <- drop_na(starwars, birth_year)`, se eliminan 43 filas

## Importar ficheros de texto con readr

Soluciones

1. El nombre del fichero es incorrecto, falta “.csv”
2. La función `read.csv` de R base no tiene un parámetro `col_names`, hay que usar `read_csv` o buscar el nombre del parámetro equivalente de la función de R base en la ayuda.

## Ejemplos de importar ficheros

Soluciones

1. El separador de las columnas es ;. Además la cabecera está en la fila número 5, por lo que tenemos que saltarnos las 4 primeras. También hay muchas filas vacias (solo tienen separadores ;)
2. Código

   ```{r}
   library(readr)
   library(dplyr)
   library(tidyr)

   # aparatado 2
   sales <- read_csv2('./data/Sales-all-vehicles-2017.csv', skip = 4)

   # apartado 3
   sales_clean <-
       sales %>%
       select(-starts_with("X")) %>%
       drop_na()
   ```

## Importar ficheros de Excel con readxl

Soluciones

1. El fichero contiene una pestaña con los datos desde 2014, otra pestaña con los datos del mes actual (marzo 2020) y más pestañas con distintos gráficos.
2. Código

   ```{r}
   library(readxl)

   # aparatado 2
   bicis <- read_excel('./data/bicis_usos_acumulado.xls',
                       sheet = "Usos mar 2020",
                       range = "A3:E34")
   ```
