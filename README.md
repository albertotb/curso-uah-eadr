## Contenidos:

1. **Bloque 1:** Introducción y manipulación de datos

    * Introducción a R [[slides]](./src/00-intro.html)
        * IDE RStudio
        * Clase data.frame
        * Introducción a RMarkdown

    * Manipular datos con `dplyr` [[slides]](./src/01-dplyr.html)
        * Seleccionar filas con `filter`, `slice`
        * Seleccionar columnas con `select`
        * Crear nuevas columnas con `mutate`
        * Ordenar y realizar cálculos con `arrange` y `summarize`

2. **Bloque 2:** Visualizar datos con `ggplot2` [[slides]](./src/02-ggplot2.html)
    
    * Introducción a la gramática de gráficos
    * Gráficos de puntos (`geom_point`)
    * Gráficos de lineas (`geom_line`)
    * Gráficos de barras (`geom_bar`)
    * Transformaciones estadísticas (`geom_hist`)

3. **Bloque 3:** Importar y transformar datos

    * Transformar data.frames con `tidyr` [[slides]](./src/03-tidyr.html)
        * Transformar entre formatos ancho y largo (`spread` y `gather`)
        * Separar o unir columnas (`separate` y `unite`)
    
    * Lectura de datos con `readr` y `readxl` [[slides]](./src/04-readr.html)
        * Importar archivos CSV
        * Importar archivos texto plano con delimitadores
        * Importar Excel
        * Opciones más comunes

4. **Bloque 4:** `dplyr` y `ggplot2` avanzado
    
    * `dplyr` avanzado [[slides]](./src/10-dplyr_cont.html)
        * Sentencia `group_by`
        * Operaciones agrupadas
        * Operaciones en múltiples columnas
        * Joins

    * `ggplot2` avanzado [[slides]](./src/09-ggplot2_cont.html)
        * Facetas  (`facet_wrap`, `facet_grid`)
        * Ejes
        * Estilos

5. **Bloque 5:** Tipos de datos
    
    * Texto (`stringr`) [[slides]](./src/05-stringr.html)
    * Factores (`forcats`) [[slides]](./src/06-forcats.html)
    * Fechas (`lubridate`) [[slides]](./src/07-lubridate.html)

6. **Bloque 6:** Programación en R [[slides]](./src/08-purrr.html)

    * Vectores
    * Listas
    * Funciones
    * Iteración con `purrr`


## Enlaces:
* [Mastering the Tidyverse](https://github.com/rstudio/master-the-tidyverse)
* [Tidyverse](https://www.tidyverse.org/)
* [R for Data Science](http://r4ds.had.co.nz/)
* [Data Challenge Lab](https://dcl-2019-04.github.io/curriculum/)
* [Teach hard way](http://varianceexplained.org/r/teach-hard-way/)
* [Teach tidyverse](http://varianceexplained.org/r/teach-tidyverse/)
* [LearningR workshop](https://nyu-cdsc.github.io/learningr/)
