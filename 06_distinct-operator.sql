/*
OPERADOR DISTINCT

DISTINCT es un operador para seleccionar por campos de manera distintiva, SQL retorna una única coincidencia, la primera que encuentra.

Si hubieran dos "Santiago" en la lista de personas y utilizaramos el DISTINCT para traer todas las coincidencias, "Santiago" aparecería una única vez (el primer resultado encontrado, ya sea por ID o por el orden que se le de a la búsqueda)     */

SELECT DISTINCT nombre FROM personas;

/*  >>>  id  | apellido  |  nombre  | ciudad
        -----|-----------|----------|--------
          1  | Tralice   | Tony     |  1
          2  | Ostrovsky | Santiago |  2
          3  | Wayne     | John     |  3

(*) Puede solicitarse un DISTINCT de varios campos separados por coma:      */
    SELECT DISTINCT nombre, apellido FROM personas;

/* --> Devolver lista de la tabla personas con la primera coincidencia de cada nombre y cada apellido. Si alguno de los campos se repite, que no sea seleccionado.

********************