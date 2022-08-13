// MODEL

const { Sequelize, Model } = require("sequelize");

const sequelize = new Sequelize(
  "postgres://postgres:postgres@localhost:5432/demo"
);

/*
const User = sequelize.define('User', {
    firstName: { type: DataTypes.STRING },
    lastName: { type: DataTypes.STRING },
})
*/

class User extends Model {}

User.init(
  // SEQUELIZE POR DEFECTO YA AGREGA EL ID, NO ES NECESARIO PONERLO
  {
    firstName: { type: DataTypes.STRING(40) },
    lastName: { type: DataTypes.STRING(40) },
    email: { type: DataTypes.STRING(200) },
    gender: { type: DataTypes.ENUM("male", "female") },
  },
  { sequelize, tableName: "user" }
);

User.sync();

// ---------------------------------------------------------

// PROBAR LA CONEXIÓN
async function start() {
  try {
    await sequelize.authenticate();
    console.log("Connection established successfully");
  } catch (e) {
    console.error("Unable to connect to database:", e);
  }
}

start();

/* ---------------------------------------------------------

SYNC

La definición del modelo arma el esqueleto de la tabla pero no aplica los cambios en la base de datos; para eso deben sincronizarse los modelos.

    - Model.sync(): crea la tabla si no existe.
    - Model.sync({ force: true }): elimina la tabla y la vuelve a crear (sirve para eliminar atributos no deseados, por ejemplo, pero elimina TODO).
    - Model.sync({ alter: true }): aplica los cambios necesarios a la tabla existente para que coincida con el modelo definido (agrega atributos o modifica los existentes).

Puede hacerse de un modelo a la vez, o todos los modelos juntos:

    - UN MODELO
        Model.sync({ force: true });

    - TODOS LOS MODELOS
        sequelize.sync({ force: true });

---------------------------------------------------------

LOGGING

Logging los los mensajes que devuelve la consola luego de cada operación. En caso de ejecutar un 'sync', la terminar va a mostrar qué es lo que se está ejecutando y cuáles son las operaciones que se realizan para llevar a cabo la tarea indicada (SELECT, DROP, CREATE, etc).

Por defecto, logging tiene el siguiente valor:
    - logging: console.log,

Se le puede pedir que muestre información adicional a la Query SQL:
    - logging: (...msg) => console.log(msg),

O se puede deshabilitar completamente:
    - logging: false,

**********

DONDE SE ESTABLECE?? --> El logging es una propiedad que debe pasarse como parámetro de la definición de 'sequelize' (al crear una instancia de Sequelize):

const sequelize = new Sequelize(
  "postgres://[user]:[password]@[host-IP]:[port]/[dm-name]",
  { logging: false }
);

---------------------------------------------------------

TIMESTAMPS

Los TimeStamps son otros parámetros que se añaden de forma automática al Modelo cuando es creado, generando los campos 'createdAt' y 'updatedAt' en la tabla. Indican, con información de tipo DATE, cuándo fue creado y/o actualizado el modelo, respectivamente.

Por defecto, timestamps tiene el siguiente valor:
    {
        timestamps: true,
        createdAt: true,
        updatedAt: true
    }

Pueden cambiarse estos parámetros para que se muestre la información de otra manera o que algún campo no se muestre:
    {
        timestamps: true,
        createdAt: false,
        updatedAt: 'actualizado'
    }

O pueden eliminarse por completo modificando el valor principal:
    {
        timestamps: false
    }

**********

DONDE SE ESTABLECE?? --> timestamps es una propiedad que debe pasarse como parámetro del Modelo en su inicialización, luego de los atributos:

Model.init({
    ...atributos
}, {
    timestamps: true,
    createdAt: "13/08/2022",
    updatedAt: false
})

---------------------------------------------------------

PROPIEDADES DE LOS ATRIBUTOS

const Model = sequelize.define('Model', {
    id: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
    }
})

---------------------------------------------------------

COLUMN OPTIONS (opciones de columnas)   */

class Foo extends Model {}
Foo.init({
  flag: { type: DataTypes.BOOLEAN, allowNull: false, defaultValue: true },
  myDate: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
  someUnique: { type: DataTypes.STRING, unique: true },
  // Composite unique key --> uniqueOne y uniqueTwo van a poder tener valores únicos pero compartidos. Cuando dos atributos tengan esta característica, deben tener como valor de su propiedad 'unique', el mismo string.
  uniqueOne: { type: DataTypes.STRING, unique: "compositeIndex" },
  uniqueTwo: { type: DataTypes.INTEGER, unique: "compositeIndex" },
  //
  identifier: { type: DataTypes.STRING, primaryKey: true },
  incrementMe: { type: DataTypes.INTEGER, autoIncrement: true },
});

Foo.sync();

/* ---------------------------------------------------------

INSTANCE CREATION (creación de las instancias del Modelo)

DOS FORMAS:
    - const user1 = User.build({ firstName: 'x', lastName: 'y'... });
      await user1.save();

    - const user1 = await User.create({ firstName: 'x', lastName: 'y'... })

---------------------------------------------------------

INSTANCE MODIFICATION       */

const santiago = await User.create({
  firstName: "Santiago",
  lastName: "Ostrovsky",
  email: "mail@example.com",
  gender: "male",
});

santiago.firstName = "Ezequiel";
await santiago.save();
// El método save() está optimizado para sólo guardar la información de los campos que hayan sido modificados.

/* ---------------------------------------------------------

INSTANCE DELETE         */

const ejemplo = await User.create({
  firstName: "Ejemplo",
  lastName: "Primero",
  email: "mail@example.com",
  gender: "female",
});

await ejemplo.destroy();

/* ---------------------------------------------------------

PRINT DATA         */

console.log(santiago.toJSON());
console.log(ejemplo.toJSON());
