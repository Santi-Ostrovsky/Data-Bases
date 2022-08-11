/*
LIMIT

La cláusula LIMIT sirve para indicarle a SQL la cantidad de registros que queremos que sean retornados. Por ejemplo, si quisiéramos obtener una tabla que únicamente contenga las dos primeras coincidencias dentro de PERSONAS, se puede pedir de la siguiente manera:     */

SELECT * FROM personas LIMIT 2;

/* >>> ↓
 id  | apellido  |  nombre  | ciudad
-----|-----------|----------|-------
  1  | Tralice   | Toni     |     1
  2  | Ostrovsky | Santiago |     2
(2 rows)

------------------------------------------------------------- 

IN

La cláusula IN permite individualizar los resultados esperados de acuerdo al parámetro pasado:      */

SELECT * FROM ciudades WHERE id IN (2);

/* >>> ↓
 id  |    ciudad
-----|-------------
  2  | Buenos Aires
(1 row)
*/

SELECT * FROM ciudades WHERE id NOT IN (2,3);

/* >>> ↓
 id  |   ciudad
-----|-------------
  2  | Buenos Aires
  3  | New York
(2 rows)

------------------------------------------------------------- 

NOT IN

La cláusula NOT IN permite restringir los valores devueltos de acuerdo al parámetro pasado:     */

SELECT * FROM ciudades WHERE id NOT IN (2);

/* >>> ↓
 id  | ciudad
-----|---------
  1  | Tucuman
  3  | New York
(2 rows)
*/

SELECT * FROM ciudades WHERE id NOT IN (1,2);

/* >>> ↓
 id  | ciudad
-----|---------
  3  | New York
(1 row) */

SELECT * FROM personas WHERE apellido NOT IN 'Ostrovsky';

/* >>> ↓
 id  | nombre | apellido
-----|--------|---------
  1  | Toni   | Tralice
  3  | John   | Wayne
(2 rows)

------------------------------------------------------------- 

BETWEEN

La cláusula BETWEEN permite indicar un rango de valores esperados de acuerdo al parámetro pasado:     */

SELECT * FROM ciudades WHERE id BETWEEN 1 AND 2;

/* >>> ↓
 id  |   ciudad
-----|-------------
  1  | Tucuman
  2  | Buenos Aires
(2 rows) */

------------------------------------------------------------- 

