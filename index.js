const { Sequelize, Model, DataTypes } = require("sequelize");

// const sequelize = new Sequelize("[sql_engine]://[user]:[password]@[host-IP]:[port]/[db_name]");

const sequelize = new Sequelize(
  "postgres://postgres:1234@localhost:5432/demo",
  {
    logging: false,
  }
);

// const User = sequelize.define('User', {
//     firstName: { type: DataTypes.STRING },
//     lastName: { type: DataTypes.STRING },
//     gender: { type: DataTypes.ENUM('male', 'female') },
// })

// class User extends Model {}
// User.init(
//   {
//     firstName: { type: DataTypes.STRING(40) },
//     lastName: { type: DataTypes.STRING(40) },
//     email: { type: DataTypes.STRING(200) },
//     gender: { type: DataTypes.ENUM("male", "female") },
//     dni: { type: DataTypes.INTEGER, unique: true },
//   },
//   { sequelize, tableName: "user" }
// );

async function start() {
  try {
    // ---------------------------
    await sequelize.authenticate();
    console.log("Connection established successfully");
    const User = sequelize.define("User", {
      firstName: { type: DataTypes.STRING(40) },
      lastName: { type: DataTypes.STRING(40) },
      dni: { type: DataTypes.INTEGER, unique: true },
      gender: { type: DataTypes.ENUM("M", "F") },
      email: { type: DataTypes.STRING(200) },
    });
    // ---------------------------
    // const usuario1 = User.build({
    //   firstName: "Santiago",
    //   lastName: "Ostrovsky",
    //   dni: 12345678,
    //   gender: "M",
    //   email: "mailejemplo@gmail.com",
    // });
    // const userData = await usuario1.save();
    // console.log(userData.toJSON());
    //
    const usuario1 = await User.create({
      firstName: "Santiago",
      lastName: "Ostrovsky",
      dni: 12345678,
      gender: "M",
      email: "mail@ejemplo.com",
    });
    console.log(usuario1.toJSON());
    //
    User.sync({ force: true });
  } catch (e) {
    console.error("Unable to connect to database:", e);
  }
}

start();
