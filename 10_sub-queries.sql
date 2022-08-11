/*
SUB-QUERIES

Los SUB-QUERIES se utilizan para filtrar información dentro de otro filtro (como una especie de 'WHERE' anidado, cuando una query depende de otra query).       */

SELECT * FROM personas WHERE id IN (
    SELECT id FROM ciudades WHERE id > 2
);

/*
- Primero se resuelve el query interno, devolviendo los IDs mayores a 2 en la tabla 'ciudades' (correspondiente sólo a: ID = 3, CIUDAD = New York).

- Después se resuelve el query externo, devoviendo todos los registros en la tabla personas, en los que el ID sean los resultantes de la operación anterior, en este caso, ID = 3 (correspondiente a ID = 3 - John Wayne).

------------------------------------------------------------- */