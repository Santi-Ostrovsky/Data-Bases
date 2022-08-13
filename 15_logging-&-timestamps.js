/*
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

Pueden cambiarse estos parámetros para que se muestre la información de otra manera o que algún campo no se muestre (lo que cambia es el nombre del campo, no el contenido):
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
*/
