DROP SCHEMA IF EXISTS `eferickmarquez` ;
CREATE SCHEMA IF NOT EXISTS `eferickmarquez` DEFAULT CHARACTER SET utf8 ;
USE `eferickmarquez` ;
DROP TABLE IF EXISTS cliente CASCADE;
CREATE TABLE cliente(
	idCliente INT auto_increment PRIMARY KEY,
	nombreCliente VARCHAR(255) NOT NULL,
	apellidoCliente VARCHAR(255) NOT NULL,
	nroCelular VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL	
);

DROP TABLE IF EXISTS pizza CASCADE;
CREATE TABLE pizza(
	idPizza INT auto_increment PRIMARY KEY ,
	nombrePizza VARCHAR(180) NOT NULL,	
	descripcion VARCHAR(180) NOT NULL	
);

DROP TABLE IF EXISTS pizeeria CASCADE;
CREATE TABLE pizeeria(
	idPizzeria INT auto_increment PRIMARY KEY,
	direccion VARCHAR(255) NOT NULL,
	sede VARCHAR(255) NOT NULL
	
);

DROP TABLE IF EXISTS pizzeriaPizza CASCADE;
CREATE TABLE bodegaProducto(
	idPizza INT NOT NULL,
	idPizzeria INT NOT NULL,	
	FOREIGN KEY(idPizza) REFERENCES pizza(idPizza) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(idPizzeria) REFERENCES producto(idPizzeria) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(idPizza, idPizzeria)
);

DROP TABLE IF EXISTS clientePizza CASCADE;
CREATE TABLE clientePizza(
	idPizza INT NOT NULL,
	idCliente INT NOT NULL,	
	FOREIGN KEY(idPizza) REFERENCES pizza(idPizza) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(idPizza, idCliente)
);