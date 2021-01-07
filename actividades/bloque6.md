# Actividades

## Ejecución condicional y funciones

1. Crear una función con nombre `ambos_na` que tenga como entrada 2 vectores y devuelva el número de posiciones que son NA en ambos.
2. Modificar la función anterior para que compruebe si los dos vectores tienen el mismo tamaño

## Iteración

Escribir un bucle for que calcule el tipo de cada columna del dataframe starwars usando la función `typeof` y almacene el resultado en un vector

## Librería purrr

1. Reemplazar al bucle del ejercicio anterior por una llamada a la función `map\_\*` correspondiente
2. Crear una función anónima que dado un vector de entrada devuelva el número de elementos distintos y su clase (función `class`)
3. Usar la función anterior junto con `map_dfr` para crear un dataframe con el número de valores distintos y la clase de cada una de las columnas del dataframe `starwars`.
4. Consultar la ayuda de `map_dfr`. ¿Para que nos sirve el parámetro `.id`? Probarlo con el ejemplo anterior.
