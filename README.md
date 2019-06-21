# Introducción al tidyverso

1. Introducción a R
    * IDE RStudio
    * Clase data.frame
    * Introducción a RMarkdown

2. Manipular datos con `dplyr` [[slides]](./src/01-dplyr.html)
    * Seleccionar filas con `filter`, `slice`
    * Seleccionar columnas con `select`
    * Crear nuevas columnas con `mutate`
    * Ordenar y realizar cálculos con `arrange` y `summarize`

3. Funciones útiles de R base
    * Agregaciones: `mean`, `sd`, `sum`, etc.
    * Vectorizadas y operadores: `is.na`, `%in%`, "==", "+", etc.
    * Operaciones con conjuntos: `setdiff`, `union`, etc.

4. Visualizar datos con `ggplot2` [[slides]](./src/02-ggplot2.html)
    * Introducción a la gramática de gráficos
    * Gráficos de puntos (`geom_point`)
    * Gráficos de lineas (`geom_line`)
    * Gráficos de barras (`geom_bar`)
    * Transformaciones estadísticas (`geom_hist`)

5. `dplyr` avanzado
    * Sentencia `group_by`
    * Operaciones agrupadas
    * Operaciones en múltiples columnas
    * Joins

6. Transformar data.frames con `tidyr` [[slides]](./src/03-tidyr.html)
    * Transformar entre formatos ancho y largo (`spread` y `gather`)
    * Separar o unir columnas (`separate` y `unite`)

7. Lectura de datos con `readr` y `readxl` [[slides]](./src/04-readr.html)
    * Importar archivos CSV
    * Importar archivos texto plano con delimitadores
    * Importar Excel
    * Opciones más comunes

8. `ggplot2` avanzado
    * Facetas  (`facet_wrap`, `facet_grid`)
    * Ejes
    * Estilos

9. Tipos de datos avanzados
    * Cadenas de texto (`stringr`) [[slides]](./src/05-stringr.html)
    * Factores (`forcats`) [[slides]](./src/06-forcats.html)
    * Fechas (`lubridate`) [[slides]](./src/07-lubridate.html)

10. Programación funcional con `purrr`


Enlaces:
* [Tidyverse](ttps://www.tidyverse.org/)
* [R for Data Science](http://r4ds.had.co.nz/)
* [Data Challenge Lab](https://dcl-2019-04.github.io/curriculum/)
* [Teach hard way](http://varianceexplained.org/r/teach-hard-way/)
* [Teach tidyverse](http://varianceexplained.org/r/teach-tidyverse/)
