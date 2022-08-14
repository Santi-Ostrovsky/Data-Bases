/*

GETTERS

Determinan cómo viene la información de la base de datos. No siempre que se haga una request a la DB se espera que la información llegue tal cual está en los registros, a veces se espera que mute de alguna manera o que se combinen los campos, por ejemplo.

Para ello se usa el método 'get()':         */

const instance = sequelize.define("model", {
  attribute: {
    type: DataTypes.STRING(40),
    get() {
      const rawValue = this.getDataValue(attribute);
      return rawValue ? rawValue.toUpperCase() : null;
    },
  },
});

/*
(*) --> Se define la instancia 'model' con el atributo 'attribute' del tipo STRING (max 40), y se agrega un getter, en el que se define un rawValue tomando el valor 'crudo' del campo, y en caso de existir, se lo devuelve en mayúsculas. En caso contrario, se retorna 'null'.

De esta forma, el getter se invoca de forma automática cuando se quiera acceder al atributo, pero el valor se va a modificar al ser solicitado desde JS, NO en la base de datos.

----------------------------------------------------------------------

SETTERS

Determinan cómo se guarda la información en la base de datos.       */

const instance2 = sequelize.define("model", {
  name: {
    type: DataTypes.STRING(40),
    set(value) {
      this.setDataValue("lastName", value.toUpperCase());
    },
  },
});

// (*) --> El atributo 'name', sin importar como sea enviado el dato por el cliente, se va a guardar en mayúsculas en la base de datos.
