/*
UPDATE

La cláusula UPDATE permite hacer modificaciones a las tablas creadas anteriormente.

SINTAXIS --> UPDATE [table_name] SET [column] = [new_value] WHERE id = [id_number]       */

UPDATE ciudades SET nombre = 'Kansas' WHERE id = 3;

/* >>> ↓
CIUDADES
 id |   nombre
----|-------------
  1 | Tucuman
  2 | Buenos Aires
  3 | Kansas
(3 rows)

(*) --> Fue actualizado el valor de 'New York' por 'Kansas'.
(*) --> De haber sido modificado uno de los valores intermedios, el nuevo campo va a desplegarse al final de la tabla, habiendo sido removido el valor anterior de su posición previa:      */

UPDATE ciudades SET nombre = 'Carlos Paz' WHERE id = 1;

/* >>> ↓
CIUDADES
 id |   nombre
----|-------------
  2 | Buenos Aires
  3 | Kansas
  1 | Carlos Paz
(3 rows)

------------------------------------------------------------- 

DELETE

El comando DELETE permite eliminar contenido de una tabla (NO LA TABLA EN SÍ, PARA ESO DEBE USARSE EL COMANDO 'DROP').

Lo que se elimina no se recupera, por lo que lo recomendable es hacer 'soft-deletes', lo que implica mover la información a una nueva columna que no se use, por las dudas.     */

DELETE FROM ciudades WHERE id = 3; -- Elimina el registro en ID 3

/* >>> ↓
CIUDADES
 id |   nombre
----|-------------
  2 | Buenos Aires
  1 | Carlos Paz
(2 rows)
*/

DELETE FROM ciudades; -- Elimina todo el contenido de la tabla.

/* >>> ↓
CIUDADES
 id |   nombre
----|-------------
(0 rows)

------------------------------------------------------------- 

*/