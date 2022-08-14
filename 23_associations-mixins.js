/*
ASSOCIATIONS

1 - 1
1 - N
N - 1
N - M

Sequelize permite establecer, a traves de JavaScript, relaciones de cardinalidad entre distintas tablas dentro de una misma base de datos.

EJEMPLO SPOTIFY
- Un usuario tiene una sola cuenta, y la cuenta solo puede ser de un unico usuario.
- Un autor puede escribir muchas canciones, pero las canciones solo pueden ser escritas por un unico autor.
- Una canción puede estar en muchas listas de reproducción, y una lista de reproducción puede tener muchas canciones.

------------------------------------------------------------- */

// ONE TO ONE (1 - 1)
Foo.hasOne(Bar);
Bar.belongsTo(Foo);

// ONE TO MANY (1 - N)
Team.hasMany(Player);
Player.belongsTo(Team);

// MANY TO MANY (N - M)
Movie.belongsToMany(Actor, { through: "ActorMovies" });
Actor.belongsToMany(Movie, { through: "ActorMovies" });
// (*) through --> Tabla de relación intermedia (el nombre debe ser el mismo en ambos lados de la relación)

/* -------------------------------------------------------------

FETCHING ASSOCIATIONS

Una vez que son creadas las asociaciones, es necesario guardar el resultado de las mismas en algún lado. Sequelize lo hace de manera sencilla, a través de dos métodos:

    - set() --> Borra y vuelve a crear.
    - add() --> Actualiza sobre la información existente (agrega lo que no está, modifica lo que ya está)

-------------------------------------------------------------

MIXINS

Los Mixins son funciones que nos van a permitir definir el Foreign Key de cada instancia. Cuando creamos este tipo de relaciones, en la tabla de la base de datos se crea un nuevo atributo en el que se dictará el valor pertinente de cada instancia que pertenece a la otra tabla. Por ejemplo, supongamos que tenemos dos tablas, una llamada People, en la que le agregaremos una instancia:
    - ( {id: 1, nombre: 'Alejo', apellido: 'Bengo'} )
y otra llamada City:

>>> const instancia = await People.create({
    id: 1, nombre: 'Alejo', apellido: 'Bengo'
})
>>> City.hasMany(People);
>>> People.belongsTo(City);


De esta manera, ahora en la tabla People habrá un nuevo atributo llamado CityId, en el cual se especificará a qué ciudad pertenece cada uno.

TABLA PEOPLE
id | nombre  | apellido | cityId
---+---------+----------+-------
1  | 'Alejo' | 'Bengo'  | 


Para que podamos establecer a qué ciudad pertenece cada instancia, usaremos la siguiente función:

>>> await instancia.setCity(3)

TABLA PEOPLE
id | nombre  | apellido | cityId
---+---------+----------+-------
1  | 'Alejo' | 'Bengo'  | 3

*/
