-- OPERADOR LIKE

SELECT * FROM personas WHERE nombre LIKE 'S%';

/* --> Devolver una lista de todas las lineas en la tabla 'personas', cuyos nombres empiecen con 'S' (% significa "cualquier cosa", es decir, cuyos nombres sean igual a S + cualquier cosa)

    >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          2  | Ostrovsky | Santiago |  2
*/

SELECT * FROM personas WHERE apellido LIKE '%ce';

/* --> Devolver una lista de todas las lineas en la tabla 'personas', cuyos apellidos terminen con 'ce' (cualquier cosa + ce)

    >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          1  | Tralice   | Tony     |  1
*/

SELECT * FROM personas WHERE apellido LIKE '%e%';

/* --> Devolver una lista de todas las lineas en la tabla 'personas', cuyos apellidos tengan una 'e' (cualquier cosa + e + cualquier cosa - No es necesario que la letra 'e' esté en el medio, puede ser la primera o la última)

    >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          1  | Tralice   | Tony     |  1
          3  | Wayne     | John     |  3

(*) SQL es sensible a las mayúsculas, por lo que si en lugar de filtrar por 'e' lo hacía por 'E', no se iba a encontrar ningún resultado, a menos que se cambie 'LIKE' por 'ILIKE':   */

SELECT * FROM peronas WHERE apellido ILIKE '%T%';

/* --> Devolver una lista de todas las lineas en la tabla 'personas', cuyos apellidos tengan 't' o 'T':

    >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          1  | Tralice   | Tony     |  1
          2  | Ostrovsky | Santiago |  2

********************
