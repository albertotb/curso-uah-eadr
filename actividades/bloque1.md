# Actividades

## Introducción

Actividades

1. Instala R y RStudio si no los tienes instalados ya. Abre RStudio y comprueba la versión de R qué tienes instalada. ¿Dónde aparece esta información?

## Librerias

Actividades

1. Instalar la librería tidyverse.
2. La librería tidyverse es en realidad una colección de muchas otras. La lista completa se puede ver aquí: https://www.tidyverse.org/packages/. Comprobar en la pestaña Packages la versión de tidyverse
3. Cargar la librería tidyverse. ¿Qué librerías se están cargando en realidad?

## Funciones y ayuda

Actividades
Sabiendo que la función que calcula la media en R es `mean`:

1. Acceder a la ayuda de la función
2. ¿Cuántos parámetros obligatorios tiene? ¿Cuántos opcionales?
3. Copiar el código de la sección de ayuda en un nuevo fichero de texto con nombre media.R
4. Ejecuta el fichero de texto. ¿Cómo puedes saber que se ha ejecutado correctamente? Mira en la pestaña Environment
5. Ejecutar la última línea del fichero. ¿Cuál es el resultado?

## RMarkdown

Actividades

1. Crear un fichero R Markdown que tenga una celda con el código contenido en el fichero media.R
2. Genera un fichero HTML y PDF a partir del R Markdown

## Scripts y entorno

Actividades

1. Ejecuta el script media.R. ¿Cuántos objetos se crean en el entorno?
2. ¿De qué tipo son los objetos que se crean?
3. Eliminar del entorno el objeto “x”
4. ¿Qué sucede con el resto de los objetos si reiniciamos la sesión de R (Session > Restart R)?

## Dataframes

Actividades

Con el data.frame “airquality” que viene incluido en R:

1. Calcular el número de filas y columnas
2. Ver el nombre de cada una de las columnas
3. Calcular el mínimo, máximo, media, mediana, y el primer y tercer cuartil de cada columna (usar la función summary)

## Tibbles

Actividades

1. Cargar la librería tibble
2. Convertir el data.frame mtcars, que viene cargado en R, a tibble (usa la función `as_tibble()`)
3. ¿Cuáles son las diferencias visuales entre mtcars y su versión tibble?

## filter y slice

Actividades

Con el data.frame starwars (viene incluido en la librería dplyr)

1. Seleccionar las filas 5 y de las 10 a la 20.
2. Seleccionar las filas de personajes que tienen más de 100 años (columna birth_year) o color de piel verde.
3. Seleccionar las filas que tienen un valor de la columna “sex” distinto de “male” y “female”. Además, tampoco pueden tener NA en esa columna.

## select

Actividades

Con el data.frame starwars (viene incluido en la librería dplyr)

1. Seleccionar las columnas name, height y mass
2. Seleccionar todas las columnas menos films, vehicles y starships
3. Seleccionar todas las columnas que terminan en "\_color"

## Variantes slice y select

Actividades

El conjunto de datos starwars (incluido en dplyr) contiene información sobre los personajes de la saga de Star Wars. Utilizando ese conjunto de datos:

1. Seleccionar las columnas `name` y aquellas que contienen la palabra `color`
2. ¿Cuáles son los 5 personajes más bajos? ¿Qué le ocurre a las funciones `slice_min` y `slice_max` cuándo hay empates?

## arrange

Actividades

1. Ordenar las filas del data.frame starwars por los valores de la columna height de menor a mayor. ¿Hay valores repetidos en esa columna?
2. Deshacer los empates ordenando por los valores de la columna mass de mayor a menor.

## mutate

Actividades

1. Las columnas mass y height del data.frame starwars representan el peso en kg y la estatura en cm. Crear una nueva columna imc que contenga el índice de masa corporal, que se calcula como peso(kg)/altura(m)^2
2. Modificar el código anterior para crear también otra columna, log_by, que tenga el logaritmo de la columna birth_year

## pipe

Actividades

Reescribir la secuencia de operaciones siguiente usando el operación tuberia (%>%)

```{r}
library(dplyr)

df1 <- filter(starwars, birth_year > 100 | skin_color == "green")
df2 <- select(df1, name, height, mass)
df3 <- mutate(df2, imc = mass / (height/100)^2)
df4 <- arrange(df3, height, desc(mass))
```

## summarize

Actividades

1. Cargar las librerías ggplot2 y dplyr
2. Consultar la ayuda de la función `cor`, que calcula la correlación
3. Calcular la correlación de las columnas hwy y cty usando summarize

## dplyr

Actividades

Con el data.frame "airquality" que viene incluido en R:

1. Obtén la columna de temperatura.
2. Obtén el dataframe resultado de eliminar las columnas con información de fecha.
3. Obtén un dataframe con la información únicamente de agosto.
4. Obtén un dataframe con los valores de viento y temperatura para el mes de agosto.
