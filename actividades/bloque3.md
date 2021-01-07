# Actividades

## Datos ordenados: librería tidyr

Actividades

1. Dado el siguiente código para generar la tabla_2 de la diapositiva 5

   ```{r}
   library(tidyr)
   table_2 <- pivot_wider(table1, names_from = year, values_from = c(cases, population))
   ```

   Realizar la operación que se propone en la diapositiva 6, es decir, crear dos nuevas columnas ratio_1999 y ratio_2000 con la operación `cases / population * 10000` para cada uno de los dos años. ¿Qué pasaría si en lugar de 2 años fueran 10?

2. ¿Por qué se transforma la variable “year” a tipo “character”? Prueba a repetir la figura quitando esa línea. ¿Qué sucede en este caso?

## pivot_longer

Actividades

1. Cargar la librería tidyr y ver las columnas contenidas en el data.frame `relig_income`, que viene incluído. Consultar la ayuda para ver qué representan los datos.
2. Una vez indentificadas las variables, pivotar el dataframe para que tenga una columna por cada una de sus variables.

## pivot_wider

Actividades

1. Acceder a la ayuda del data.frame `us_rent_income`, incluído en la librería tidyr.
2. Pivotar el data.frame para que tenga las columnas estimate_income, estimate_rent, moe_income y moe_rent.

## separate y unite

Actividades

1. ¿Cuántos valores distintos hay en la columna “hair_color” del conjunto de datos starwars? (función `count`)
2. Separar la columna anterior en dos, color principal y color secundario. Ambos están separado por “,”

## Gestionando NA con tidyr

Actividades

1. Cuenta cuántos valores son NA en la columna “birth_year” de los datos contenidos en el dataframe starwars.
2. Elimina todas las filas que tienen un NA en dicha columna. ¿Cuántas filas tiene el data.frame resultante?

## Importar ficheros de texto con readr

El siguiente código genera un fichero de texto en el directorio de trabajo

```{r}
library(readr)
write_csv(mpg, "mpg.csv", col_names = FALSE)
```

Dado el fichero de texto anterior:

1. ¿Por qué da error el siguiente código?
   `mpg1 <- read_csv("mpg", col_names = FALSE)`

2. ¿Y el siguiente código?
   `mpg1 <- read.csv("mpg.csv", col_names = FALSE)`

## Ejemplos de importar ficheros

Actividades
Descargar el fichero `data > Sales-all-vehicles-2017.csv`

1. Abrir el fichero de texto con un editor y ver sus características
2. Importar el fichero en R
3. Eliminar columnas sin nombre (por defecto se les asigna un nombre que empieza por X) y filas que tengan algún NA

## Importar ficheros de Excel con readxl

Descargar el fichero `data > bicis_usos_acumulado.xls` ([Fuente](https://datos.madrid.es/portal/site/egob/menuitem.c05c1f754a33a9fbe4b2e4b284f1a5a0/?vgnextoid=6d8bdae2be63c410VgnVCM1000000b205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD&vgnextfmt=default)). Contiene información sobre número de usos por día del servicio BiciMad en la ciudad de Madrid:

1. Abrir el fichero en Excel para ver en qué formato está contenida la información y las pestañas que tiene.
2. Leer los datos de la pestaña “Usos mar 2020”. Únicamente nos interesa la tabla principal, por tanto podemos ignorar tanto el título “Uso de bicis marzo 2020” como la tabla con la media mensual inferior.
