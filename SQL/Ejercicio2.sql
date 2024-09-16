/* Ejercicio 2 

	Nivel de dificultad: Fácil */

/*1. Crea una base de datos llamada "MiBaseDeDatos". */

CREATE DATABASE MiBaseDeDatos; 

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */

CREATE TABLE Usuarios (
id INT PRIMARY KEY,
nombre varchar(255),
edad INT
);

/*3. Inserta dos registros en la tabla "Usuarios". */

insert into usuarios(id,nombre, edad)
values 	(3,'Antonio',25),
		(4,'Juan',35);
	

/*4. Actualiza la edad de un usuario en la tabla "Usuarios". */

UPDATE Usuarios
SET edad = 27
WHERE id = 1;

/*5. Elimina un usuario de la tabla "Usuarios". */

DELETE FROM Usuarios
WHERE id=1;

/*Nivel de dificultad: Moderado 
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE Ciudades (
id INT PRIMARY KEY,
nombre varchar(255),
pais varchar(255)
);

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */

insert into ciudades(id,nombre, pais)
values 	(1,'Barcelona','España'),
		(2,'Madrid','España'),
		(3,'Paris','Francia'),
		(4,'Londres','Reino Unido');

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */

ALTER TABLE Usuarios 
	ADD ciudades_id integer,
	ADD FOREIGN KEY (ciudades_id) REFERENCES ciudades(id);


/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN). */

SELECT usuarios.nombre, ciudades.nombre, ciudades.pais
FROM usuarios
LEFT JOIN ciudades ON usuarios.ciudades_id = ciudades.id;

/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/

SELECT usuarios.nombre, ciudades.nombre, ciudades.pais
FROM usuarios
LEFT JOIN ciudades ON usuarios.ciudades_id = ciudades.id
WHERE usuarios.ciudades_id IS NOT NULL;

