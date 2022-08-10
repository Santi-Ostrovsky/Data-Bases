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

NOT IN



********************
*/