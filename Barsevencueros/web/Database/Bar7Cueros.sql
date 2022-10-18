CREATE DATABASE BAR7CUEROS;

USE BAR7CUEROS;

CREATE TABLE Usuario(
id_usuario INTEGER AUTO_INCREMENT,
usuario_nombre VARCHAR(30),
usuario_apellido VARCHAR(30),
usuario_password VARCHAR(30),
usuario_estado INT,
id_rolFK INTEGER,
PRIMARY KEY(id_usuario)
);


CREATE TABLE Pedido(
id_pedido INTEGER AUTO_INCREMENT,
id_usuarioFK INTEGER,
id_mesaFK INTEGER,
id_clienteFK INT,
pedido_estado INT,
producto_cantidad INTEGER,
productos_nombre VARCHAR(30),
valor_pedido DOUBLE,
metodo_pago INT,
PRIMARY KEY(id_pedido)
);

CREATE TABLE Des_pedido(
id_desc INTEGER AUTO_INCREMENT,
id_productoFK INTEGER,
pedidoFK INTEGER,
PRIMARY KEY(id_desc)
);

CREATE TABLE Producto(
id_producto INTEGER AUTO_INCREMENT,
producto_nombre VARCHAR(30) UNIQUE,
producto_precio DOUBLE,
producto_estado INT,
producto_cantidad INT,
PRIMARY KEY(id_producto)
);

CREATE TABLE Factura(
id_factura INTEGER AUTO_INCREMENT,
id_pedidoFK INT,
id_clienteFK INT,
valor_total DOUBLE,
PRIMARY KEY(id_factura)
);

CREATE TABLE Cliente(
id_cliente INTEGER AUTO_INCREMENT,
numero_documento INTEGER UNIQUE,
cliente_nombre VARCHAR(30),
cliente_apellido VARCHAR(30),
cliente_estado INT,
cliente_corrreo VARCHAR(30) UNIQUE,
fecha_nacimiento DATE,
tipo_documento INT,
PRIMARY KEY(id_cliente)
);

CREATE TABLE Mesa(
id_mesa INTEGER AUTO_INCREMENT,
mesa_numero INTEGER,
mesa_estado INT,
PRIMARY KEY(id_mesa)
);

CREATE TABLE Rol(
id_rol INTEGER AUTO_INCREMENT,
tipo_rol varchar(20),
PRIMARY KEY(id_rol)
);

ALTER TABLE USUARIO ADD CONSTRAINT id_rolFK FOREIGN KEY(id_rolFK) REFERENCES ROL(id_rol);


ALTER TABLE PEDIDO ADD CONSTRAINT id_usuarioFK FOREIGN KEY(id_usuarioFK) REFERENCES USUARIO(id_usuario);

ALTER TABLE PEDIDO ADD CONSTRAINT id_mesaFK FOREIGN KEY(id_mesaFK ) REFERENCES MESA(id_mesa);

ALTER TABLE FACTURA ADD CONSTRAINT id_pedidoFK FOREIGN KEY(id_pedidoFK) REFERENCES PEDIDO(id_pedido);

ALTER TABLE PEDIDO ADD CONSTRAINT id_clienteFK FOREIGN KEY(id_clienteFK) REFERENCES CLIENTE(id_cliente);

ALTER TABLE DES_PEDIDO ADD CONSTRAINT id_productoFK FOREIGN KEY(id_productoFK) REFERENCES PRODUCTO(id_producto);

ALTER TABLE DES_PEDIDO ADD CONSTRAINT pedidoFK FOREIGN KEY(pedidoFK) REFERENCES PEDIDO(id_pedido);


DESCRIBE USUARIO;
DESCRIBE PEDIDO;
DESCRIBE MESA;
DESCRIBE DES_PEDIDO;
DESCRIBE FACTURA;
DESCRIBE PRODUCTO;
DESCRIBE CLIENTE;
