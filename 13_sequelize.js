/*
ORM --> Objet-Relational Mapping

- Permite extraer datos de una base y "mapearlo" en objetos:

Relational DataBase --> MappingLogic --> Objects in Memory

Así como los componentes JSX permiten escribir JS y HTML de forma simultánea, el ORM permite interactuar con las bases de datos SQL desde JS, sin escribir en lenguaje SQL puro. Es una "capa intermedia" entre JavaScript y SQL.

----------------------------------------------------------------------

SEQUELIZE

ORM de NodeJs basado en promesas para PostgreSQL, MySQL, MariaDB, SQLite y Microsoft SQL Server.

La mayoría de los métodos en Sequelize son asíncronos, por lo que devuelven promesas.

-----------------------------------

INSTALLING      */

" npm install --save sequelize "; // npm i sequelize
" npm install --save pg pg-hstore "; // npm i pg pg-hstore

/* CONNECTING   */

const { Sequelize } = require("sequelize");

// Opción 1: Connection URI
const sequelize1 = new Sequelize(
  "postgres://user:postgres@localhost:5432/dbname"
);

// Opción 2: Parámetros separados
const sequelize2 = new Sequelize("database", "username", "password", {
  host: "localhost",
  dialect: "mysql || mariadb || postgres || mssql", // la opción que corresponda
});

/* ----------------------------------------------------------------------

DATA TYPES -- https://sequelize.org/docs/v6/core-concepts/model-basics/#data-types

-- TEXTO
DataTypes.STRING ------------------ VARCHAR(255)
DataTypes.STRING(1234) ------------ VARCHAR(1234)
DataTypes.TEXT -------------------- TEXT

-- NUMEROS
DataTypes.INTEGER ----------------- INTEGER (ENTEROS)
DataTypes.FLOAT ------------------- FLOAT (DECIMALES)

-- FECHAS
DataTypes.DATE -------------------- TIMESTAMP W/ TIME ZONE
DataTypes.DATEONLY ---------------- DATE W/OUT TIME

-- OTROS
DataTypes.ENUM('foo', 'bar') ------ ENUM w/ allowed values 'foo' & 'bar'

(*) ENUM --> Posibles opciones a una respuesta:
    semaforo = ENUM('rojo', 'amarillo', 'verde');

---------------------------------------------------------------------- */
