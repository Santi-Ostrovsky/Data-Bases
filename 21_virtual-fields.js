/*

VIRTUAL FIELDS (datos virtuales)

Los datos virtuales NO se almacenan en las bases de datos.      */

const User = sequelize.define("user", {
  firstName: DataTypes.TEXT,
  lastName: DataTypes.TEXT,
  fullName: {
    type: DataTypes.VIRTUAL,
    get() {
      return `${this.firstName} ${this.lastName}`;
    },
    set(value) {
      throw new Error("No se puede cambiar el nombre completo");
    },
  },
});

/* 
(*) --> fullName NO se guarda en la base de datos, ya que no es necesario porque el campo puede armarse con los datos ya existentes (firstName & lastName). Los campos virtuales permiten mostrar información que no está explícitamente en la base de datos pero que puede 'armarse' o inferirse de acuerdo a la información existente.

----------------------------------------------------------------------

*/
