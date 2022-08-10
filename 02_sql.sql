/*
SQL --> Structured Query Language

Es el lenguaje de consultas más utilizado para las consultas a bases de datos. Está compuesto por Cláusulas, y tiene expresiones y declaraciones al igual que JavaScript.

-------------------------------------------------------------

DECLARACIONES

    - update
    - set
    - where

--> TODAS las declaraciones SQL terminan en ';' (para terminar una instrucción) o ',' (para terminar una línea).

********************

CREATE TABLE table_name
(
    column_name1 data_type(size),
    column_name2 data_type(size),
    column_name3 data_type(size),
    [...]
);

********************

Las bases de datos pueden iniciarse y accederse desde una interfaz gráfica como pgadmin(PostgreSQL) o desde la consola (psql shell).

https://www.postgresql.org/docs/current/index.html

DESDE CONSOLA - psql shell (terminar todas las instrucciones a psql con ';')

    - \l --> sirve para ver una lista de todas las bases levantadas anteriormente.
    - \c [database_name] --> acceder a una base de datos de la lista anterior.
    - \c [directory_name] --> volver hacia atrás.
    - \dt --> describe table (desplegar las tablasen la DB donde esta posicionada la consola).
    - \! clear --> limpiar la consola.
    - \q --> salir de la consola

    - CREATE DATABASE [database_name]; --> levantar una nueva base de datos (terminar con ';' para indicar a PostgreSQL que se termino de dar una instrucción).
    - DROP DATABASE [database_name]; --> eliminar una base de datos.
    - DROP TABLE [table_name]; --> eliminar una tabla.
    - DELETE --> eliminar fila en tabla

-------------------------------------------------------------

-- CREACIÓN DE UNA BASE DE DATOS CON DOS TABLAS --

********************

CREATE TABLE ciudades
(
    id serial PRIMARY KEY,
    nombre varchar(255) UNIQUE
);

CREATE TABLE personas
(
    id serial PRIMARY KEY,
    apellido varchar(255) NOT NULL,
    nombre varchar(255) UNIQUE,
    ciudad integer references ciudades (id)
);

(*) -- Descripción de líneas

    - 44 --> 'id' es el atributo que contiene a la primary key.
         --> 'serial' es el tipo de dato en SQL que permite la generación automática de números identificadores en incremento, por lo que las claves primarias siempre (o mayormente) van a ser del tipo de dato serial (4 bytes).
         --> 'KEY' es un 'constraint', una regla forzada que se aplica a un atributo - https://www.postgresql.org/docs/14/ddl-constraints.html (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY)

    - 45 --> atributo 'nombre' que va a ser un string de caracteres variables (varchar) con una longitud máxima de 255 caracteres.
         --> constraint UNIQUE, indica que no se puede repetir (no pueden haber dos países con el mismo nombre)
    
    - 53 --> constraint 'NOT NULL' indica que no puede ser un campo vacío.

    - 55 --> atributo 'ciudad' es del tipo integer y...
         --> 'references' [ciudades] (id), indica que el campo va a corresponder con el numero de ID de cada ciudad respectivamente (clave primaria en la tabla 'ciudades', clave foránea en la tabla 'personas').

********************

EN CONSOLA ↓↓↓ (sin UNIQUE)     */

CREATE TABLE ciudades(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL);

-- >>> CREATE TABLE --> mensaje de confirmación de la consola (tabla generada)

CREATE TABLE personas(
    id SERIAL PRIMARY KEY,
    apellido TEXT NOT NULL,
    nombre TEXT NOT NOT NULL,
    ciudad INTEGER,
    FOREIGN KEY(ciudad) REFERENCES ciudades(id));

-- >>> CREATE TABLE --> confirmación

/* ********************

INSERTAR FILAS EN UNA TABLAS

INSERT INTRO [table_name] (column1,column2,...)
VALUES (value1,value2,...)

********************

EN CONSOLA ↓↓↓      */

INSERT INTO ciudades (nombre)
VALUES ('Tucuman');

INSERT INTO ciudades (nombre)
VALUES ('Buenos Aires');

INSERT INTO ciudades (nombre)
VALUES ('New York');

INSERt INTO personas (nombre, apellido, ciudad)
VALUES ('Toni', 'Tralice', 1);

INSERt INTO personas (nombre, apellido, ciudad)
VALUES ('Santi', 'Ostrovsky', 2);

INSERt INTO personas (nombre, apellido, ciudad)
VALUES ('John', 'Wayne', 3);

/*
(*) --> quedaron ingresadas las ciudades Tucuman, Buenos Aires y New York, con los IDs 1, 2 y 3, respectivamente; y las personas Toni Tralice (de 1 - Tucuman), Santi Ostrovsky (de 2 - Buenos Aires) y John Wayne (de 3 - New York).

(*) --> el ID no debe insertarse en la tabla, ya que por el tipo de dato SERIAL se genera de forma automática.

(*) --> los inserts a una misma tabla pueden hacerse en una única instrucción. Ej: ciudades
        INSERT INTO ciudades (nombre) VALUE ('Tucuman'), ('Buenos Aires'), ('New York');

(*) --> Si por algún motivo, alguna de las filas no pudiera ser insertada en alguna de las tablas, SQL de todas maneras le va a asignar un ID a esa fila que no se insertó (por ejemplo, porque a una persona se le asignó la ciudad 99, que no existe), y ese ID va a quedar reservado a ese resultado. Si se insertara otra fila nueva luego de la inserción fallida, la nueva fila va a tener un ID que NO CORRELATIVO a la fila anterior por este motivo.

********************

PARA VER Y SELECCIONAR CAMPOS DE UNA TABLA GENERADA:        */

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

********************

OPERADOR LIKE       */

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

OPERADOR DISTINCT

DISTINCT es un operador para seleccionar por campos de manera distintiva, SQL retorna una única coincidencia, la primera que encuentra.

Si hubieran dos "Santiago" en la lista de personas y utilizaramos el DISTINCT para traer todas las coincidencias, "Santiago" aparecería una única vez (el primer resultado encontrado, ya sea por ID o por el orden que se le de a la búsqueda)     */

SELECT DISTINCT nombre FROM personas;

/*  >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          1  | Tralice   | Tony     |  1
          2  | Ostrovsky | Santiago |  2
          3  | Wayne     | John     |  3

(*) Puede solicitarse un DISTINCT de varios campos separados por coma:      */
    SELECT DISTINCT nombre, apellido FROM personas;

/* --> Devolver lista de la tabla personas con la primera coincidencia de cada nombre y cada apellido. Si alguno de los campos se repite, que no sea seleccionado.

********************

CONTATENAR INFORMACION  */

SELECT (nombre || ' ' || apellido) AS "Nombre y Apellido" FROM personas;

/* >>> ↓
Nombre y Apellido
------------------
Toni Tralice
Santiago Ostrovsky
John Wayne
(3 rows)

(*) 'as' permite dar un alias a la información solicitada.
(*) '||' permite concatenar campos dentro de un parentesis.
(*) Si hubiera una línea en la tabla que no tuviera nombre o apellido, al no poder concatenar ambos valores dejaría un espacio vacío en la lista devuelta y contaría como una línea (habría devuelto '4 rows').

********************

ALIAS --> Es el nombre que se le asigna a una tabla de resultados resueltos por una instrucción SELECT: */

SELECT nombre AS 'N' FROM personas;

/* >>> ↓
       N
------------------
Toni Tralice
Santiago Ostrovsky
John Wayne
(3 rows)

********************


*/