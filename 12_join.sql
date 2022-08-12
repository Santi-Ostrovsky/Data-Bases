/*
JOIN

JOIN permite unir datos de diferentes tablas de acuerdo a una condición impuesta.

CIUDADES
   id  |    nombre
-----------------------
    1  |   Tucuman
    2  |   Buenos Aires
    3  |   Pilar
    4  |   Calafate
    5  |   San Bernardo
(5 rows)

PERSONAS
 id  | apellido  |  nombre  | ciudad
-----|-----------|----------|-------
  1  | Tralice   | Toni     |     1
  2  | Ostrovsky | Santiago |     2
  3  | Gomez     | Marcos   |     5
  4  | Perez     | Esteban  |     4
  5  | Aguirre   | Lucila   |     2
  6  | Garay     | Julian   |     2
  7  | Jonas     | Martina  |     1
  8  | Sosa      | German   |     1
(8 rows)
*/

SELECT * FROM personas JOIN ciudades ON ciudad.id = personas.ciudad;

/*

--> Seleccionar todos los registros de la tabla personas, unirlos con los registros de la tabla ciudades, cuando el ID de ciudad sea igual al id (clave foranea) enla columna personas.ciudad:

la instrucción va a tomar todos los IDs de CIUDADES, y los va a comparar con las ciudades listadas en la tabla PERSONAS, devolviendo una nueva tabla que one ciudades y personas, con las coincidencias de ID (información en común entre ambas tablas):

>>> ↓
 id  | apellido  |  nombre  | ciudad |  id  |  nombre  
-----|-----------|----------|--------|------|----------
  1  | Tralice   | Toni     |     1  |   1  | Tucuman  
  2  | Ostrovsky | Santiago |     2  |   2  | Buenos Aires
  3  | Gomez     | Marcos   |     5  |   5  | San Bernardo
  4  | Perez     | Esteban  |     4  |   4  | Calafate 
  5  | Aguirre   | Lucila   |     2  |   2  | Buenos Aires
  6  | Garay     | Julian   |     2  |   2  | Buenos Aires
  7  | Jonas     | Martina  |     1  |   1  | Tucuman  
  8  | Sosa      | German   |     1  |   1  | Tucuman  
(8 rows)
(*) No hay nadie de la ciudad 3 (Pilar), por lo que quedó afuera de la tabla por no haber coincidencias.
*/

SELECT personas.nombre, apellido, ciudades.nombre FROM personas JOIN ciudades ON ciudades.id = personas.ciudad;

/* >>> ↓
  nombre  | apellido  |  nombre  
----------|-----------|----------
 Toni     | Tralice   | Tucuman  
 Santiago | Ostrovsky | Buenos Aires
 Marcos   | Gomez     | San Bernardo
 Esteban  | Perez     | Calafate 
 Lucila   | Aguirre   | Buenos Aires
 Julian   | Garay     | Buenos Aires
 Martina  | Jonas     | Tucuman  
 German   | Sosa      | Tucuman  
(8 rows)

------------------------------------------------------------- 

- [tabla_1] JOIN [tabla_2] --> Se retorna una nueva tabla que sólo contenga las coincidencias de ambas tablas. (INNER JOIN)

- [tabla_1] LEFT JOIN [tabla_2] --> tabla_1 queda a la izquierda en la nueva tabla, y es la información principal con la cual se van a comparar los datos de la segunda tabla.

- [tabla_1] RIGHT JOIN [tabla_2] --> tabla_1 queda a la derecha en la nueva tabla, siendo la tabla_2 la información principal con la cual se van a comparar  los datos de la segunda tabla para imprimir las coincidencias.

- [tabla_1] FULL OUTER JOIN [tabla_2] --> retorna TODOS los resultados de ambas tablas.

*/