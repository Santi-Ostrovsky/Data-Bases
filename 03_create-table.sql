/*
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

*/