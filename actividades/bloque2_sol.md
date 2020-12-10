# ggplot2

## Gramática de gráficos

Soluciones

1. Todo gráfico de ggplot tiene que tener los componentes DATA, MAPPINGS y GEOMS, mientras que los componentes STATS y POSITIONS son opcionales.

## Aesthetics

Soluciones

1. Código

   ```{r}
   ggplot(starwars, aes(x = mass, y = height, color = sex)) +
      geom_point()
   ```

2. Código

   ```{r}
   starwars %>%
      filter(mass < 500) %>%
      ggplot(aes(x = mass, y = height, color = sex)) +
         geom_point()
   ```

## geoms

Soluciones

1. Código

   ```{r}
   ggplot(economics, aes(x = date, y = pop)) +
      geom_line()
   ```

2. Código

   ```{r}
   ggplot(economics, aes(x = date)) +
      geom_line(aes(y = pop)) +
      geom_line(aes(y = unemploy), color = "red")
   ```

## Transformaciones estadísticas

Soluciones

1. `?geom_col`
2. Código

   ```{r}
   ggplot(starwars, aes(x = sex)) +
      geom_bar()
   ```

3. Código

   ```{r}
   ggplot(diamonds, aes(x = carat)) +
      geom_histogram()
   ```

4. El aviso indica que que por defecto se usa `bins = 30`.

## Ajustes de posición

Soluciones

1. Código

   ```{r}
   ggplot(starwars, aes(x = hair_color, fill = sex)) +
      geom_bar(position = "fill")
   ```

2. En este caso todos los personajes son de sexo femenino.
