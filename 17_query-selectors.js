/*

QUERY SELECTORS

Al no utilizar SQL puro, sequelize utiliza la siguiente sintaxis para hacer las consultas a la base de datos:   */

const sequelize = require("sequelize");

// SELECT * FROM Model
const instancias = await Model.findAll();

// SELECT foo, bar FROM Model
Model.findAll({
  attributes: ["foo", "bar"],
});

// SELECT foo, bar as baz FROM Model
Model.findAll({
  attributes: ["foo", ["bar", "baz"]],
});

// EXCLUDE baz
Model.findAll({
  attributes: { exclude: ["baz"] },
});

// SELECT * FROM Model WHERE clothe = 'orange' AND status = 'good';
const instances = Model.findAll({
  where: { clothe: "orange", status: "good" },
});

// SELECT * FROM Model WHERE clothe = 'orange' AND status = 'good';
const instances2 = Model.findAll({
  where: {
    [Op.and]: [{ clothe: "orange" }, { status: "good" }],
  },
});

/* --------------------------------------------------------- 

FINDERS         */

// FIND BY PRIMARY KEY (Filtrar por clave primaria)
const $2 = await User.findByPk(2); // Encuentra el elemento en la tabla y lo guarda en una variable.
$2.firstName = "Esteban"; // Modifica un valor del elemento.
console.log($2.toJSON()); // Imprime el elemento en consola.
// null si no encuentra el resultado

// Encontrar el primer elemento que cumpla con cierta condición
const instancia = await User.findOne({
  where: { name: "Santiago" },
}); // null si no encuentra el resultado

// FIND OR CREATE (encontrar si existe, crear si no existe)
const [instance, created] = await User.findOrCreate({
  where: { name: "Carlos" },
  defaults: {
    dni: 87654321,
    genero: "M",
  },
});

// (*) findOrCreate() busca si existe algún registro con las condiciones de búsqueda. Si lo encuentra, lo devuelve haciéndole las modificaciones indicadas dentro del objeto 'default'. Si no lo encuentra, procede a crear uno nuevo con dichas características. Retorna la instancia creada o encontrada y un booleano indicando cuál de los dos caminos tomó (false si lo encontró, true si lo creó).
