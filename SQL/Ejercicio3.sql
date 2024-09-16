/*Ejercicio 3 
Nivel de dificultad: Difícil */


/*1. Crea una tabla llamada "Productos" con las columnas: 
	"id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico). */

CREATE TABLE Productos ( 
	id integer primary key, 
	nombre varchar(255),
	precio numeric 
	); 


/*2. Inserta al menos cinco registros en la tabla "Productos". */

insert into productos(id,nombre, precio)
values 
	(1,'camiseta',2),
	(2,'pantalon',5),
	(3,'sudadera',8),
	(4,'gorra',4),
	(5,'calcetines',3);


/*3. Actualiza el precio de un producto en la tabla "Productos". */

update productos
set precio=9
where id=3


/*4. Elimina un producto de la tabla "Productos". */

delete from productos
where id=5;

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/

CREATE TABLE pedidos ( 
	id integer primary key, 
	usuarios_id integer,
	FOREIGN KEY (usuarios_id) REFERENCES usuarios(id), 
	producto VARCHAR(255), 
	cantidad integer 
	); 

ALTER TABLE pedidos 
	ADD producto_id integer,
	ADD FOREIGN KEY (producto_id) REFERENCES productos(id);

INSERT INTO pedidos(id,usuarios_id, producto_id, cantidad)
values 
	(1,2,1,2),
	(2,2,2,5),
	(3,2,3,1),
	(4,3,2,3),
	(5,3,1,1),
	(6,4,3,1);

SELECT usuarios.nombre, productos.nombre
FROM usuarios LEFT JOIN pedidos ON usuarios.id = pedidos.usuarios_id
               INNER JOIN productos ON productos.id = pedidos.id



