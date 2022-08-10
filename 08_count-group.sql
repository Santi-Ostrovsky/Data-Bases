--AGRUPACIONES POR CLAUSULA

SELECT COUNT(*) AS 'Filas' FROM personas;

/* >>> ↓
 Filas
-------
     3
(1 row)

(*) --> COUNT cuenta la cantidad de registros en una tabla (no es necesario agregar un alias. En caso de no hacelro, el titulo de la tabla devuelta va a ser COUNT).    */

SELECT COUNT(ciudad) FROM personas;

/* >>> ↓
 ciudad | count
--------|-------
      1 |     1
      2 |     1
      3 |     1

(*) --> En este caso, COUNT cuenta la cantidad de ciudades en la columna CIUDAD. La ciudad con ID 1, aparece una vez, la ciudad con ID 2 aparece una vez, y la ciudad con ID 3 aparece una vez. Si hubiera, por ejemplo, 2 personas de Tucuman (1), 5 personas de Buenos Aires (2) y 3 personas de New York (3), el resultado devuelto habría sido el siguiente:

 ciudad | count
--------|-------
      1 |     2
      2 |     5
      3 |     3

(*) --> A esto se le puede aplicar  el filtro ORDER BY, para ordenar la tabla de mayor a menor cantidad de ciudades, o de menor a mayor:        */

SELECT COUNT(ciudad) FROM personas ORDER BY COUNT(ciudad) DESC;

/* >>> ↓
 ciudad | count
--------|-------
      2 |     5
      3 |     3
      1 |     2

En orden decreciente (DESCENDING ORDER), primero esta Buenos Aires con 5 resultados, luego New York con 3 y finalmente Tucuman con 2 resultados.

******************** */

SELECT ciudad, nombre, COUNT(ciudad) FROM personas GROUP BY nombre, ciudad;

/*
-GROUP BY permite agrupar los resultados en un único registro cuando determinada cualidad se repite. En este caso, se le esta dando a SQL la instrucción de tomar, de la tabla 'personas', todos los campos 'ciudad' y 'nombre', cuantificar las ciudades, y agrupar los resultados por ciudad y nombre al mismo tiempo.

Esto significa que, en una tabla como la siguiente...
 id  | apellido  |  nombre  | ciudad
-----|-----------|----------|-------
  1  | Tralice   | Toni     |     1
  2  | Ostrovsky | Santiago |     2
  3  | Wayne     | John     |     3
  4  | Fara      | Mike     |     3
  5  | Lambert   | John     |     3
  6  | Amstrong  | Toni     |     1
  7  | Vinseca   | Santiago |     2
  8  | Zarra     | Laura    |     2
  9  | Luduena   | Steban   |     2
(9 rows)

...el resultado sería el siguiente:
ciudad |  nombre  |  COUNT  
-------|----------|--------
    1  | Toni     |      2
    2  | Santiago |      2
    3  | John     |      2
    3  | Mike     |      1
    2  | Laura    |      1
    2  | Steban   |      1
(6 rows)

(*) En la ciudad 1 (Tucuman) hay un resultado de nombre 'Toni', que se presentó 2 veces.
(*) En la ciudad 2 (Buenos Aires) hay un resultado de nombre 'Santiago', que se presentó 2 veces.
(*) En la ciudad 3 (New York) hay un resultado de nombre 'John', que se presentó 2 veces.
(*) En la ciudad 3 (New York) hay un resultado de nombre 'Mike', que se presentó 1 vez.
(*) En la ciudad 2 (Buenos Aires) hay un resultado de nombre 'Laura', que se presentó 1 vez.
(*) En la ciudad 2 (Buenos Aires) hay un resultado de nombre 'Steban', que se presentó 1 vez.

(*) --> Notar que en la tabla original, hay 9 registros, siendo que 3 de ellos se repiten en nombre y ciudad simultáneamente. En la tabla agrupada, esos 3 registros son acumulados con sus coincidencias y no se muestran como registro aparte, por lo que la tabla agrupada tiene 6 registros (3 menos).

------------------------------------------------------------- 

*/