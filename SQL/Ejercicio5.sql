/*Ejercicio 5 
	
1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto). */

CREATE TABLE clientes ( id serial primary key, nombre VARCHAR(255));  


2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".

insert into clientes(id,nombre)
values (1,'John')

	
3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".

update clientes
set nombre='John Doe'
where id=1

4. Elimina el cliente con id=1 de la tabla "Clientes". 

delete from clientes
where id=1
	
5. Lee todos los clientes de la tabla "Clientes". 

select * from clientes
	
6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero). 

	CREATE TABLE pedidos ( 
	id integer primary key, 
	cliente_id integer
	); 


7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos". 

	insert into pedidos(id,cliente_id)
	values (1,1)

8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos". 

	update pedidos
	set id=2
	where id=1
	
9. Elimina el pedido con id=1 de la tabla "Pedidos".

	delete from pedidos
	where id=1
	
10. Lee todos los pedidos de la tabla "Pedidos". 

	select * from pedidos
	
11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto). 

	CREATE TABLE productos ( 
	id integer primary key, 
	nombre varchar(255)
	); 

12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos". 

	insert into productos(id,nombre)
	values (1,'camisa')
	
13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos". 

	update productos
	set nombre='Pantalón'
	where id=1
	
14. Elimina el producto con id=1 de la tabla "Productos". 

	delete from productos
	where id=1
	
15. Lee todos los productos de la tabla "Productos". 

	select * from productos
	
16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).

	CREATE TABLE DetallesPedido ( 
	pedido_id integer, 
	producto_id integer
	);

17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".

	insert into DetallesPedido(pedido_id,producto_id)
	values (1,1)

	
18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido". 

	update DetallesPedido
	set producto_id=2
	where pedido_id=1
	
19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido". 

	delete from DetallesPedido
	where pedido_id=1
	
20. Lee todos los detalles de pedido de la tabla "DetallesPedido". 

	select * from DetallesPedido
	
21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join. 

	SELECT clientes.nombre, pedidos.id
	FROM clientes INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
   

22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join. 

	SELECT clientes.nombre, pedidos.id
	FROM clientes LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
	
23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join. 

	ALTER TABLE pedidos 
	ADD producto_id integer,
	ADD FOREIGN KEY (producto_id) REFERENCES productos(id);
	update pedidos
	set producto_id=1
	where id=1
	update pedidos
	set producto_id=1
	where id=2
		
	
	SELECT productos.nombre, pedidos.id
	FROM productos INNER JOIN pedidos ON productos.id = pedidos.producto_id
	
24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.

	SELECT productos.nombre, pedidos.id
	FROM productos LEFT JOIN pedidos ON productos.id = pedidos.producto_id
		
25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes". 
	
	ALTER TABLE Clientes 
	ADD telefono VARCHAR(255)
		
26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero. 

	ALTER TABLE Clientes
	ALTER COLUMN telefono TYPE INTEGER;

No es posible cambiar el dato de carácteres a 
ERROR:  column "telefono" cannot be cast automatically to type integer
HINT:  You might need to specify "USING telefono::integer". 

SQL state: 42804

		
27. Elimina la columna "telefono" de la tabla "Clientes". 

	ALTER TABLE CLIENTES
	DROP COLUMN telefono
	
28. Cambia el nombre de la tabla "Clientes" a "Usuarios". 

	ALTER TABLE CLIENTES
	RENAME TO Usuarios 
	
29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo". 

	ALTER TABLE Usuarios
	RENAME COLUMN nombre TO nombre_completo; 
	
30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".

ALTER TABLE Usuarios
ADD CONSTRAINT pk_usuarios_id PRIMARY KEY (id);
