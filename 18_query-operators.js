/*
OPERADORES DE BÚSQUEDA --> https://sequelize.org/docs/v6/core-concepts/model-querying-basics/

los operadores lógicos de SQL como AND & OR no pueden ser utilizados en JavaScript, por lo que es necesario importar 'Op' del módulo sequelize:         */

const { Op } = require("sequelize");

Post.findAll({
  where: {
    //
    // and = &&
    [Op.and]: [{ a: 5 }, { b: 6 }], // (a = 5 ) && (b = 6)

    // or = ||
    [Op.or]: [{ a: 5 }, { b: 6 }], // (a = 5) || (b = 6)
    [Op.or]: [5, 6], // (someAttribute = 5) || (someAttribute = 6)

    // eq = '=' (equal to)
    [Op.eq]: 3, // = 3

    // ne = != (no equal to)
    [Op.ne]: 20, // != 20

    // is = 'is [condition]'
    [Op.is]: null, // IS NULL

    // not = 'is not [condition]'
    [Op.not]: true, // IS NOT TRUE

    // ----------------------------
    // gt = > (greater than)
    [Op.gt]: 6, // > 6

    // gte = >= (greater than or equal to)
    [Op.gte]: 6, // >= 6

    // lt = < (lower than)
    [Op.lt]: 6, // < 6

    // lte = <= (lower than or equal to)
    [Op.lte]: 6, // <= 6

    // between = < x >
    [Op.between]: [6, 10], // x > 6 && x < 10

    // notBetween = > x <
    [Op.notBetween]: [6, 10], // x < 6 && x > 10
  },
});
