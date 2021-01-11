# Actividades

## stringr

### Expresiones regulares

Modificar la siguiente expresión regular que valida direcciones de email: `".+@[^\\d\\s]+\\.(com|es)$"` para que no acepte espacios entre el principio de la cadena y la @

### Funciones stringr

Con el dataframe `sales_clean`:

```{r}
library(readr)
library(dplyr)
library(tidyr)

sales <- read_csv2('./data/Sales-all-vehicles-2017.csv', skip = 4)

sales_clean <-
  sales %>%
    select(-starts_with("X")) %>%
    drop_na()
```

1. Usar la función `str_to_title` para transformar los nombres de los países `REGIONS/COUNTRIES` a minúscula, con la primera letra en mayúscula
2. Crear un dataframe con los países de la columna que se ha creado en el punto anterior cuyo nombre empieza por “Z”

## forcats

### Factores

1. ¿De qué tipo son cada una de las columnas en el data.frame PlantGrowth (incluido en R)
2. ¿Cuántos niveles tiene la columna group y cuáles son?
3. En el siguiente gráfico, ¿por qué el eje x pone las etiquetas en ese orden?

```{r}
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_col()
```

### Funciones forcats

Actividades

1. Juntar los niveles “trt1” y “trt2” del factor “group” del data.frame PlantGrowth en uno solo con nombre “trt”
2. Ver la frecuencia de cada uno de los valores de la columna “homeworld” del data.frame starwars (librería dplyr)
3. Convertir la columna “homeworld” en un factor que tenga 6 niveles: los 5 más frecuentes del apartado anterior y un nivel “Other” que agrupe al resto.

## lubridate

### Fechas

1. Leer el fichero `AccidentesBicicletas_2017.csv` en un dataframe

2. Convertir la columna Fecha, que es de tipo character, a una columna de tipo `datetime`.

3. Como se puede ver la información de la hora no aporta ninguna información, ya que todas las fechas se corresponden con la hora 00:00. Por tanto, convertir la columna anterior del tipo `datetime` a tipo `date`.

### Funciones lubridate

Cargar el dataframe `bicis_long`:

```{r}
library(readxl)
library(tidyr)

bicis <- read_excel('./data/bicis_usos_acumulado.xls',
                    sheet = "Usos mar 2020",
                    range = "A3:E34")

bicis_long <- bicis %>%
  pivot_longer(starts_with("Usos"),
               names_to = "Tipo_uso",
               values_to = "Usos")
```

1. Crear un data.frame con las filas anteriores al 15 de marzo de 2020
2. Crear una nueva columna con el día de la semana para el data.frame anterior
3. Calcular el total de usos de BiciMAD para cada día de la semana, agrupado por tipo de uso (ocasional, anual, total)
