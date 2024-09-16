/*Ejercicio 4 
Nivel de dificultad: Experto */
/*1. Crea una tabla llamada "Pedidos" con las columnas: 
"id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */

CREATE TABLE pedidos ( 
	id integer primary key, 
	usuarios_id integer,
	FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
	producto_id integer,
	FOREIGN KEY (producto_id) REFERENCES productos(id);
	producto VARCHAR(255), 
	); 


2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. 

	INSERT INTO pedidos(id,usuarios_id, producto_id)
	values 
		(1,2,1),
		(2,2,2),
		(3,2,3),
		(4,3,2),
		(5,3,1),
		(6,4,3);

	
3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado,
   incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). 

SELECT 
    usuarios.nombre, pedidos.producto_id, COALESCE(productos.nombre,'no ha comprado') AS nombre_producto
FROM 
    usuarios LEFT JOIN pedidos ON usuarios.id = pedidos.usuarios_id
			 LEFT JOIN productos ON productos.id = pedidos.id;

	
4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero
   también los que no han realizado ningún pedido (utiliza LEFT JOIN). 

SELECT usuarios.nombre
FROM usuarios LEFT JOIN pedidos ON usuarios.id = pedidos.usuarios_id
GROUP BY usuarios.nombre;
	
5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)

ALTER TABLE pedidos 
	ADD cantidad integer;


UPDATE pedidos
SET cantidad = 5
WHERE id = 1;

UPDATE pedidos
SET cantidad = 3
WHERE id = 2;

UPDATE pedidos
SET cantidad = 2
WHERE id = 4;
