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
