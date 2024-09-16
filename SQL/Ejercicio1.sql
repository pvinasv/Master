/*  

1. Crear una tabla llamada "Clientes" con las columnas: 

id (entero, clave primaria), nombre (texto) y email (texto).
*/

CREATE TABLE clientes ( id serial primary key, nombre VARCHAR(255), email VARCHAR(255) ); 
	
/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email=" juan@example.com". */

insert into clientes(id,nombre, email)
values (1,'Juan','juan@example.com')

/* 3. Actualizar el email del cliente con id=1 a " juan@gmail.com" */

update clientes
set email='juan@gmail.com'
where id=1

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes". */

delete from clientes
where id=1

/* 5. Crear una tabla llamada "Pedidos" con las columnas: 
id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero). *
*/
	
CREATE TABLE pedidos ( 
	id integer primary key, 
	cliente_id integer,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id), 
	producto VARCHAR(255), 
	cantidad integer 
	); 

/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2 */


insert into pedidos(id,cliente_id, producto, cantidad)
values (1,1,'camiseta',2)
	
/* 7. Actualizar la cantidad del pedido con id=1 a 3 */

update pedidos
set cantidad=3
where id=1

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos" */

delete from pedidos
where id=1

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal). */

CREATE TABLE productos ( 
	id integer primary key, 
	nombre varchar(255),
	precio numeric 
	); 
/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */

insert into productos(id,nombre, precio)
values 
	(1,'camiseta',2),
	(2,'pantalon',5),
	(3,'sudadera',8),
	(4,'gorra',4);


/* 11. Consultar todos los clientes de la tabla "Clientes". */

SELECT * FROM public.clientes


/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes */

SELECT * FROM public.pedidos INNER JOIN clientes ON clientes.id = pedidos.cliente_id

SELECT clientes.nombre, pedidos.id, pedidos.producto, pedidos.cantidad from clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id


/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */

SELECT * from productos where precio > 50

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */

SELECT * from pedidos where cantidad >= 5


/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */

SELECT * from clientes where nombre like 'A%'

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */

SELECT clientes.nombre, COUNT(pedidos.id) AS Total_pedidos
FROM clientes INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id

/* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */

SELECT productos.nombre, COUNT(pedidos.id) AS Total_pedidos
FROM productos INNER JOIN pedidos ON productos.id = pedidos.id
GROUP BY productos.id

/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */

ALTER TABLE pedidos ADD fecha date;

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */

ALTER TABLE pedidos 
	ADD producto_id integer,
	ADD FOREIGN KEY (producto_id) REFERENCES productos(id);
	
/*ADD	FOREIGN KEY (producto) REFERENCES productos(nombre)*/

/*20. Realizar una consulta que muestre los nombres de los clientes, 
los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */

SELECT clientes.nombre, productos.nombre, pedidos.cantidad
FROM clientes INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
               INNER JOIN productos ON productos.id = pedidos.id

