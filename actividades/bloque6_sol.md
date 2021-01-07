# Soluciones

## Ejecución condicional y funciones

```{r}
# apartado 1
ambos_na <- function(x, y) {
  sum(is.na(x) & is.na(y))
}

# apartado 2
ambos_na <- function(x, y) {
  if (length(x) != length(y)) {
    return(NA)
  }
  
  sum(is.na(x) & is.na(y))
}
```

## Iteración

```{r}
library(dplyr)

types <- character(ncol(starwars))
for(i in seq_along(starwars)) {
  types[[i]] <- typeof(starwars[[i]])
}
```

## Librería purrr

```{r}
library(dplyr)
library(purrr)

types <- character(ncol(starwars))
for(i in seq_along(starwars)) {
  types[[i]] <- typeof(starwars[[i]])
}

# apartado 1
map_chr(starwars, typeof)

# apartado 2
fn <- ~list(n_distinct = n_distinct(.), class = class(.))

# apartado 3
map_dfr(starwars, fn)

# apartado 4
map_dfr(starwars, fn, .id = "variable")
```
