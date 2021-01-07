# Soluciones

## stringr

### Expresiones regulares

La nueva expresión regular es `"^[:alnum:]+@[^\\d\\s]+\\.(com|es)$"`

### Funciones stringr

1. Solución

   ```{r}
   library(dplyr)
   library(stringr)
   sales1 <- mutate(sales_clean, region_country = str_to_title(`REGIONS/COUNTRIES`))
   ```

2. Solución

   ```{r}
   library(dplyr)
   library(stringr)
   sales2 <- filter(sales1, str_detect(region_country, "^Z"))
   ```

## forcats

### Factores

1. Son de tipo numeric y factor
2. `summarize(PlantGrowth, niveles = levels(group))`
3. Las etiquetas del eje x tienen el mismo orden que los niveles del factor, que es orden alfabético

### Funciones forcats

Actividades

1. `mutate(PlantGrowth, group = fct_collapse(group, trt = c("trt1", "trt2")))`
2. Solución

   ```{r}
   starwars %>%
       summarize(fct_count(homeworld)) %>%
       arrange(desc(n))
   ```

3. `sw <- mutate(starwars, homeworld = fct_lump(homeworld, n = 5))`

## lubridate

### Fechas

1. `accidentes <- mutate(accidentes, Fecha_hora = dmy_hm(Fecha))`
2. `accidentes <- mutate(accidentes, Fecha = as_date(Fecha_hora))`

### Funciones lubridate

```{r}
bicis_hasta_1503 <-
  bicis_long %>%
    filter(DIA <= ymd("20200315")) %>%  # apartado 1
    mutate(dia_semana = wday(DIA))      # apartado 2

# apartado 3
bicis_hasta_1503 %>%
  group_by(dia_semana, Tipo_uso) %>%
  summarize(total_usos = sum(Usos))
```
