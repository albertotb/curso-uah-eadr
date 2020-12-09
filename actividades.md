# Actividades

## Introducción

Actividades

1. Instala R y RStudio si no los tienes instalados ya. Abre RStudio y comprueba la versión de R qué tienes instalada. ¿Dónde aparece esta información?

Soluciones

1. La versión de R aparece en la primera línea de la consola.

## Librerias

Actividades

    1. Instalar la librería tidyverse.
    2. La librería tidyverse es en realidad una colección de muchas otras. La lista completa se puede ver aquí: https://www.tidyverse.org/packages/. Comprobar en la pestaña Packages la versión de tidyverse
    3. Cargar la librería tidyverse. ¿Qué librerías se están cargando en realidad?

Soluciones

    1. install.packages(“tidyverse”) o en la pestaña Packages
    2. Se puede comprobar en Packages buscando “tidyverse”
    3. Se cargan ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr y forcats

## Funciones y ayuda

Actividades
Sabiendo que la función que calcula la media en R es `mean`:

    1. Acceder a la ayuda de la función
    2. ¿Cuántos parámetros obligatorios tiene? ¿Cuántos opcionales?
    3. Copiar el código de la sección de ayuda en un nuevo fichero de texto con nombre media.R
    4. Ejecuta el fichero de texto. ¿Cómo puedes saber que se ha ejecutado correctamente? Mira en la pestaña Environment
    5. Ejecutar la última línea del fichero. ¿Cuál es el resultado?

Soluciones

    1. ?mean
    2. 1 parámetro obligatorio, 2 opcionales
    3. Fichero media.R
    4. Aparecen los objetos x y xm
    5. [1] 8.75 5.50

## RMarkdown

Actividades

    1. Crear un fichero R Markdown que tenga una celda con el código contenido en el fichero media.R
    2. Genera un fichero HTML y PDF a partir del R Markdown

Soluciones

    1. File > New File > R Markdown
    2. Knit to HTML y Knit to PDF

## Scripts y entorno

Actividades

    1. Ejecuta el script media.R. ¿Cuántos objetos se crean en el entorno?
    2. ¿De qué tipo son los objetos que se crean?
    3. Eliminar del entorno el objeto “x”
    4. ¿Qué sucede con el resto de los objetos si reiniciamos la sesión de R (Session > Restart R)?

Soluciones

    1. x y xm
    2. numeric
    3. Se puede hacer con rm() o en la pestaña Environment > List (cambiar a Grid) > Seleccionar objeto > (Imágen escoba)
    4. Desaparecen del entorno

## Dataframes

Actividades
Con el data.frame “airquality” que viene incluido en R:

    1. Calcular el número de filas y columnas
    2. Ver el nombre de cada una de las columnas
    3. Calcular el mínimo, máximo, media, mediana, y el primer y tercer cuartil de cada columna (usar la función summary)

Soluciones

    1. nrow(airquality) y ncol(airquality)
    2. str(airquality)
    3. summary(airquality)

## Tibbles

Actividades

    1. Cargar la librería tibble
    2. Convertir el data.frame mtcars, que viene cargado en R, a tibble (usa la función `as_tibble()`)
    3. ¿Cuáles son las diferencias visuales entre mtcars y su versión tibble?

Soluciones

    1. library(tibble)
    2. cars_tibble <- as_tibble(mtcars)
    3. Solo se muestran las 10 primeras filas cuando se imprime la variable, indica el número de filas, columnas y el tipo de cada columna

## dplyr

Actividades
Con el data.frame “airquality” que viene incluido en R:

    1. Obtén el vector correspondiente a la columna de temperatura.
    2. Obtén el dataframe resultado de eliminar las columnas con información de fecha. Utiliza el indexado por índices negativos.
    3. Obtén un dataframe con la información únicamente de agosto.
    4. Obtén un dataframe con los valores de viento y temperatura para el mes de agosto.

## filter y slice

Actividades
Con el data.frame starwars (viene incluido en la librería dplyr)

    1. Seleccionar las filas 5 y de las 10 a la 20.
    2. Seleccionar las filas de personajes que tienen más de 100 años (columna birth_year) o color de piel verde.
    3. Seleccionar las filas que tienen un valor de la columna “sex” distinto de “male” y “female”. Además, tampoco pueden tener NA en esa columna.

Soluciones

    1. library(dplyr)
    slice(starwars, c(5, 10:20))
    2. filter(starwars, birth_year > 100 | skin_color == "green")
    3. filter(starwars, !sex %in% c("male", "female") & !is.na(sex))

## select

Actividades
Con el data.frame starwars (viene incluido en la librería dplyr)

    1. Seleccionar las columnas name, height y mass
    2. Seleccionar todas las columnas menos films, vehicles y starships
    3. Seleccionar todas las columnas que terminan en “\_color”

Soluciones

    1. library(dplyr)
    select(starwars, name, height, mass)
    2. select(starwars, -c(films, vehicles, starships)) o también (depende del orden)
    select(starwars, name:species)
    3. select(starwars, ends_with(“\_color”))

## Variantes slice y select

Actividades
El conjunto de datos starwars (incluido en dplyr) contiene información sobre los personajes de la saga de Star Wars. Utilizando ese conjunto de datos:

    1. Seleccionar las columnas `name` y aquellas que contienen la palabra `color`
    2. ¿Cuáles son los 5 personajes más bajos? ¿Qué le ocurre a las funciones slice_min y slice_max cuándo hay empates?

Solución

    1. select(starwars, name | contains("color"))
    2. slice_min(starwars, height, n=5)
    Si hay empates se devuelven ambos a no ser que se indique with_ties=FALSE

## arrange

Actividades

    1. Ordenar las filas del data.frame starwars por los valores de la columna height de menor a mayor. ¿Hay valores repetidos en esa columna?
    2. Deshacer los empates ordenando por los valores de la columna mass de mayor a menor.

Soluciones

    1. arrange(starwars, height)
    2. arrange(starwars, height, desc(mass))

## mutate

Actividades

    1. Las columnas mass y height del data.frame starwars representan el peso en kg y la estatura en cm. Crear una nueva columna imc que contenga el índice de masa corporal, que se calcula como peso(kg)/altura(m)^2
    2. Modificar el código anterior para crear también otra columna, log_by, que tenga el logaritmo de la columna birth_year

Soluciones

    1. library(dplyr)
    mutate(starwars, imc = mass / (height/100)^2))
    2. mutate(starwars, imc = mass / (height/100)^2, log_by = log(birth_year))

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

Soluciones

    ```{r}
    library(dplyr)
    df <- starwars %>%
    filter(birth_year > 100 | skin_color == "green") %>%
    select(name, height, mass) %>%
    mutate(imc = mass / (height/100)^2) %>%
    arrange(height, desc(mass))
    ```

## summarize

Actividades

    1. Cargar las librerías ggplot2 y dplyr
    2. Consultar la ayuda de la función `cor`, que calcula la correlación
    3. Calcular la correlación de las columnas hwy y cty usando summarize

Solución

    1. library(ggplot2)
    library(dplyr)
    2. ?cor
    3. summarize(mpg, cor(hwy, cty))
