-- CONTATENAR INFORMACION  */

SELECT (nombre || ' ' || apellido) AS "Nombre y Apellido" FROM personas;

/* >>> ↓
Nombre y Apellido
------------------
Toni Tralice
Santiago Ostrovsky
John Wayne
(3 rows)

(*) 'as' permite dar un alias a la información solicitada.
(*) '||' permite concatenar campos dentro de un parentesis.
(*) Si hubiera una línea en la tabla que no tuviera nombre o apellido, al no poder concatenar ambos valores dejaría un espacio vacío en la lista devuelta y contaría como una línea (habría devuelto '4 rows').

Igual a: ↓    */

SELECT CONCAT(nombre, ' ', apellido) AS "Nombre y Apellido" FROM personas;

/* ********************

ALIAS --> Es el nombre que se le asigna a una tabla de resultados resueltos por una instrucción SELECT: */

SELECT nombre AS 'N' FROM personas;

/* >>> ↓
       N
------------------
Toni Tralice
Santiago Ostrovsky
John Wayne
(3 rows)

********************