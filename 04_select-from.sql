-- VER Y SELECCIONAR CAMPOS DE UNA TABLA GENERADA:

    - SELECT * FROM ciudades

/*
    id  |     nombre
    --------------------
     1  |   Tucuman
     2  |   Buenos Aires
     3  |   New York
   (3 rows)

********************

CONSULTAS Y MANIPULACIÓN DE DATOS

SELECT [column] FROM [table]; --> ej:       */

SELECT nombre FROM ciudades;

/*
>>>    nombre
    ------------
    Tucuman
    Buenos Aires
    New York

(*) Al no existir un parámetro de ordenamiento ORDER BY, los resultados aparecen ordenados por número de ID.

//////////

SELECT * FROM [table] ORDER BY [column];
--> Selecciona todos los elementos de una tabla 'x' y los ordena de acuerdo a la columna ingresada. Ej:         */

SELECT * FROM personas ORDER BY apellido;

/*
>>>  id  | apellido  |  nombre  | ciudad
    -----|-----------|----------|--------
      2  | Ostrovsky | Santiago |  2
      1  | Tralice   | Toni     |  1
      3  | Wayne     | John     |  3

(*) Si se quisiera ordenar por orden ascendente en lugar de descendente, se  pone 'desc' al final de la instruccion:        */
    SELECT * FROM personas ORDER BY apellido DESC;
/*
    >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          3  | Wayne     | John     |  3
          1  | Tralice   | Toni     |  1
          2  | Ostrovsky | Santiago |  2

(*) Si hubieran dos o mas filas con el mismo valor en el campo ingresado como parámetro para el ordenamiento, puede ingresarse un segundo parámetro separado por coma, para que, por ejemplo, una vez que las personas estén ordenadas por apellido, si hubiera dos o mas con el mismo apellido, que luego a esas filas se las ordene alfabéticamente por nombre:       */
    SELECT * FROM personas ORDER BY apellido, nombre.
/*
//////////

SELECT * FROM [table] WHERE [column]=[value];
--> Seleccionar todos los elementos de una tabla, cuyo valor en la columna 'x' coincida con el valor 'y'. Ej:       */
    SELECT * FROM personas WHERE nombre='Santiago';

/*
    >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          2  | Ostrovsky | Santiago |  2

(*) En lugar de seleccionar todos los elementos, pueden especificarse qué columnas se quieren seleccionar de la tabla, separadas por coma:      */
    SELECT nombre, ciudad FROM personas WHERE apellido='Ostrovsky';
/*
    >>>   nombre  | ciudad
        ----------|--------
         Santiago |  2

(*) Estos resultados incluso pueder ordenarse con un ORDER BY:  */+
    SELECT nombre, apellido FROM personas WHERE ciudad=2 ORDER BY apellido, nombre;
/*
    --> Devolver una lista con los campos 'nombre' y 'apellido' de todas las personas que viven en la ciudad 2 (Buenos Aires), ordenadas alfabeticamente por el apellido, y en caso de que hayan dos o mas con el mismo apellido, ordenar dichos resultados alfabéticamente por nombre.

(*) Pueden agregarse más filtros (WHERE) a través del keyword AND:      */
    SELECT nombre, apellido FROM personas WHERE ciudad=2 AND nomre="Santiago" ORDER BY apellido;
/*
    --> Devolver una lista con todos los capos 'nombre' y 'apellido' de todas las personas que vivan en la ciudad 2 (Buenos Aires) y su primer nombre sea "Santiago", ordenados alfabéticamente por el apellido.

(*) Así como existe el AND, existe el OR:       */
    SELECT nombre, apellido FROM personas WHERE ciudad=1 OR ciudad=2 ORDER BY apellido, nombre;
/*
    --> Devolver una lista con todos los campos 'nombre' y 'apellido' de todas las personas que vivan en la ciudad 1 (Tucuman) o en la ciudad 2 (Buenos Aires), ordenados alfabéticamente por el apellido, y si dos o mas resultados tienen el mismo apellido, ordenar los mismos alfabéticamente por nombre.

(*) Igual que en JavaScript, las condiciones pueden agruparse y concatenarse:       */
    SELECT nombre, apellido FROM personas,
    WHERE (apellido="Wayne" AND nombre="John") OR ciudad=2 ORDER BY apellido, nombre;
/*
    --> Devolver una lista con todos los campos 'nombre' y 'apellido' de todas las personas que, su apellido sea 'Wayne' y su nombre 'John', o que vivan en la ciudad 2 (Buenos Aires), ordenados alfabéticamente por el apellido, y si dos o mas resultados tienen el mismo apellido, ordenar los mismos alfabéticamente por nombre.

********************        */