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
