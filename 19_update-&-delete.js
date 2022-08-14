// UPDATE --> actualizar registros

server.put("/user/:id", async (req, res) => {
  try {
    const response = User.update(
      { lastName: "Garcia" },
      {
        where: {
          firstName: "Santiago",
        },
      }
    );
    res.send(`${response} usuarios modificados`); // 'response' devuelve la cantidad de registros modificados
  } catch (e) {
    res.send(e);
  }
});

/*
(*) Si no se agrega la cláusula 'where' se actualizan TODOS los registros.

----------------------------------------------------------------------

DELETE --> eliminar registros       */

// DELETE FROM table WHERE firstName = 'John'

await User.destroy({
  where: {
    firstName: "John",
  },
});

// **********

server.delete("/user/:id", async (req, res) => {
  try {
    let { id } = req.params;
    res.json(await User.destroy({ where: { id } }));
  } catch (e) {
    res.send(e);
  }
});

/*
(*) DELETE revisa registro a registro eliminando los que cumplan con la condición indicada.
(*) DESTROY retorna la cantidad de registros eliminados.

----------------------------------------------------------------------

TRUNCATE --> eliminar TODOS los registros       */

await User.destroy({
  truncate: true,
});

// (*) TRUNCATE no acepta condiciones y elimina todos los registros.
