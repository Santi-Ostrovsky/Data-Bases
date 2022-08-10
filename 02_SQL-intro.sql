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

AGRUPACIONES POR CLAUSULA



*/