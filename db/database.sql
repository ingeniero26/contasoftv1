/*base mas actual05-11-2022*/

/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.22-MariaDB : Database - sistema_pos_v2
*********************************************************************
*/

/*base de datos actualizada*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sistema_pos_v2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `sistema_pos_v2`;

/*Table structure for table `arl` */

DROP TABLE IF EXISTS `arl`;

CREATE TABLE `arl` (
  `IdARL` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la Administradora de riesgos labolares',
  `NitARL` bigint(20) DEFAULT NULL COMMENT 'El nit de la Administradora de riesgos labolares',
  `NomARL` varchar(80) DEFAULT NULL COMMENT 'Nombre de la Administradora de riesgos labolares',
  `CiudadARL` varchar(45) DEFAULT NULL COMMENT 'Ciudad de la Administradora de riesgos laborales',
  `DirARL` varchar(80) DEFAULT NULL COMMENT 'Direccion de la Administradora de riesgos laborales',
  `TelARL` varchar(200) DEFAULT NULL COMMENT 'Telefono de la Administradora de riesgoss laborales',
  `EmailArl` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdARL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `arl` */

/*Table structure for table `bodega` */

DROP TABLE IF EXISTS `bodega`;

CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bodega` */

insert  into `bodega`(`id`,`nombre_bodega`,`fregistro`,`estatus`,`idempresa`) values (1,'PRINCIPAL','2022-07-13 15:44:32','ACTIVO',1);

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caja` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `caja` */

insert  into `caja`(`id`,`caja`,`estatus`,`fregistro`,`idempresa`) values (1,'GENERAL','ACTIVO','2022-07-13 15:20:34',1);

/*Table structure for table `cargos` */

DROP TABLE IF EXISTS `cargos`;

CREATE TABLE `cargos` (
  `IdCargos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de los cargos que existen',
  `DescCargos` varchar(60) NOT NULL COMMENT 'Descripcion de los cargos que existen',
  `IdDpto` int(11) NOT NULL COMMENT 'Id del departamento o area como FK',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdCargos`),
  KEY `FK_IdDpto` (`IdDpto`),
  CONSTRAINT `FK_IdDpto` FOREIGN KEY (`IdDpto`) REFERENCES `dpto` (`IdDpto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargos` */

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoria_fregistro` date DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`categoria_id`,`categoria_nombre`,`categoria_fregistro`,`categoria_estatus`,`idempresa`) values (1,'Tecnologia','2022-07-13','ACTIVO',1),(2,'Libros','2022-07-13','ACTIVO',1),(3,'Papeleria','2022-08-22','ACTIVO',1),(4,'Servicios','2022-08-22','ACTIVO',1);

/*Table structure for table `categoriaarl` */

DROP TABLE IF EXISTS `categoriaarl`;

CREATE TABLE `categoriaarl` (
  `IdCategoriaARL` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la categoria de ARL',
  `DescCategoriaARL` varchar(60) NOT NULL COMMENT 'Descripcion de la categoria de ARL',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje que cubre el ARL por categoria',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaciones o comentarios de la categoria de riesgo',
  PRIMARY KEY (`IdCategoriaARL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `categoriaarl` */

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idDepto` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepto` (`idDepto`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`idDepto`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `ciudades_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`nombre_ciudad`,`idDepto`,`estatus`,`fregistro`,`idempresa`) values (1,'EL CARMEN DE BOLIVAR',1,'ACTIVO','2022-07-13 15:39:37',1);

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  `idciudad` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `id_perdosa` (`persona_id`),
  KEY `idempresa` (`idempresa`),
  KEY `idciudad` (`idciudad`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idcliente`,`cliente_fregistro`,`cliente_estatus`,`persona_id`,`idciudad`,`idempresa`) values (1,'2022-07-13','ACTIVO',3,1,1),(2,'2022-08-22','ACTIVO',4,1,1);

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `compra_tipo_comprobante` enum('COTIZACION','FACTURA','BOLETA','TICKET') COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra_serie_comprobante` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra_num_comprobante` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra_tipo_pago` enum('CONTADO','CREDITO','CREDICONTADO','TARJETA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra_fecha` date DEFAULT NULL,
  `compra_impuesto` decimal(10,2) DEFAULT NULL,
  `compra_total` decimal(10,2) DEFAULT NULL,
  `compra_estatus` enum('CANCELADA','POR_PAGAR','POR_COBRAR','ANULADA','INGRESADA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra_porcentaje` decimal(10,2) DEFAULT NULL,
  `compra_total_decto` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`compra_id`),
  UNIQUE KEY `compra_num_comprobante` (`compra_num_comprobante`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `id_bodega` (`id_bodega`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`),
  CONSTRAINT `compra_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `compra` */

/*Table structure for table `concepto` */

DROP TABLE IF EXISTS `concepto`;

CREATE TABLE `concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `concepto_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `concepto` */

/*Table structure for table `cuentas_x_cobrar` */

DROP TABLE IF EXISTS `cuentas_x_cobrar`;

CREATE TABLE `cuentas_x_cobrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuotas_abono` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  `no_comprobante` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idventa` (`idventa`),
  CONSTRAINT `cuentas_x_cobrar_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cuentas_x_cobrar` */

/*Table structure for table `cuentas_x_proveedor` */

DROP TABLE IF EXISTS `cuentas_x_proveedor`;

CREATE TABLE `cuentas_x_proveedor` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `noCuota` double DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `valorAbono` double DEFAULT NULL,
  `idCompra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCuenta`),
  KEY `idCompra` (`idCompra`),
  CONSTRAINT `cuentas_x_proveedor_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`compra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cuentas_x_proveedor` */

/*Table structure for table `deducciones` */

DROP TABLE IF EXISTS `deducciones`;

CREATE TABLE `deducciones` (
  `IdDeducciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la deduccion',
  `IdTipoDeducciones` int(11) NOT NULL COMMENT 'Id del tipo de deducciones como FK',
  `IdEmp` int(11) NOT NULL COMMENT 'Id del empleado como FK',
  `Fecha` date NOT NULL COMMENT 'Fecha de la deduccion',
  `ValorPagado` double NOT NULL COMMENT 'Valor pagado por la deduccion',
  PRIMARY KEY (`IdDeducciones`),
  KEY `FK_IdTipoDeducciones` (`IdTipoDeducciones`),
  KEY `FK_IdEmp_Deducciones` (`IdEmp`),
  CONSTRAINT `FK_IdEmp_Deducciones` FOREIGN KEY (`IdEmp`) REFERENCES `empleados` (`IdEmp`),
  CONSTRAINT `FK_IdTipoDeducciones` FOREIGN KEY (`IdTipoDeducciones`) REFERENCES `tipodeducciones` (`IdTipoDeducciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deducciones` */

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_depto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id`,`nombre_depto`,`estatus`,`fregistro`) values (1,'Bolivar','ACTIVO','2022-07-13 15:38:45'),(2,'Sucre','ACTIVO','2022-07-13 15:38:48'),(3,'Cordoba','ACTIVO','2022-07-13 15:38:50'),(4,'Atlantico','ACTIVO','2022-07-13 15:38:53'),(5,'Cesar','ACTIVO','2022-07-13 15:38:56'),(6,'Magdalena','ACTIVO','2022-07-13 15:39:00'),(7,'Antioquia','ACTIVO','2022-07-13 15:39:04');

/*Table structure for table `detalle_compra` */

DROP TABLE IF EXISTS `detalle_compra`;

CREATE TABLE `detalle_compra` (
  `detalle_compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `dc_cantidad` double DEFAULT NULL,
  `dc_precio` double DEFAULT NULL,
  `dc_descto` double DEFAULT NULL,
  `dc_estatus` enum('INGRESADA','ANULADA') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`detalle_compra_id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_compra` */

/*Table structure for table `detalle_salida` */

DROP TABLE IF EXISTS `detalle_salida`;

CREATE TABLE `detalle_salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsalida` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idsalida` (`idsalida`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `detalle_salida_ibfk_1` FOREIGN KEY (`idsalida`) REFERENCES `salida` (`id`),
  CONSTRAINT `detalle_salida_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_salida` */

/*Table structure for table `detalle_venta` */

DROP TABLE IF EXISTS `detalle_venta`;

CREATE TABLE `detalle_venta` (
  `detalle_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `dv_cantidad` decimal(10,2) DEFAULT NULL,
  `dv_precio` decimal(10,2) DEFAULT NULL,
  `dv_descuento` decimal(10,2) DEFAULT NULL,
  `dv_estatus` enum('INGRESADA','ANULADA') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`detalle_venta_id`),
  KEY `idventa` (`venta_id`),
  KEY `idproducto` (`producto_id`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_venta` */

insert  into `detalle_venta`(`detalle_venta_id`,`venta_id`,`producto_id`,`dv_cantidad`,`dv_precio`,`dv_descuento`,`dv_estatus`) values (1,1,5,1.00,17000.00,0.00,'INGRESADA'),(2,2,9,4.00,600.00,0.00,'INGRESADA'),(3,2,8,6.00,200.00,0.00,'INGRESADA');

/*Table structure for table `dpto` */

DROP TABLE IF EXISTS `dpto`;

CREATE TABLE `dpto` (
  `IdDpto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del area al que pertenece',
  `DescDpto` varchar(60) NOT NULL COMMENT 'Descripcion del departamento donde labora',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdDpto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dpto` */

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `IdEmp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del empleado auto-incremental',
  `CCEmp` bigint(20) NOT NULL COMMENT 'Cedula de ciudadania del empleado',
  `NomEmp` varchar(100) NOT NULL COMMENT 'Nombre del empleado',
  `DirEmp` varchar(60) DEFAULT NULL COMMENT 'Direccion del empleado',
  `TelEmp` varchar(100) DEFAULT NULL COMMENT 'Telefono del empleado',
  `CelEmp` varchar(45) DEFAULT NULL COMMENT 'Celular del empleado',
  `EmailEmp` varchar(60) DEFAULT NULL COMMENT 'Email del empleado',
  `fecha_nacimiento` date DEFAULT NULL,
  `IdARL` int(11) DEFAULT NULL COMMENT 'Id de la Administradora de Riesgos laborales del empleado como FK',
  `IdEPS` int(11) DEFAULT NULL COMMENT 'id de la EPS del empleado como FK',
  `IdPension` int(11) DEFAULT NULL COMMENT 'id de la Empresa de pension del empleado como FK',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEmp`),
  UNIQUE KEY `CCEmp` (`CCEmp`),
  UNIQUE KEY `EmailEmp` (`EmailEmp`),
  KEY `IdARL` (`IdARL`),
  KEY `IdEPS` (`IdEPS`),
  KEY `IdPension` (`IdPension`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`IdARL`) REFERENCES `arl` (`IdARL`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`IdEPS`) REFERENCES `eps` (`IdEPS`),
  CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`IdPension`) REFERENCES `pension` (`IdPension`),
  CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empleados` */

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Representante` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Correo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `empresa` */

insert  into `empresa`(`ID`,`Nit`,`nombre`,`Representante`,`Direccion`,`Telefono`,`Correo`,`Logo`,`fregistro`,`estatus`) values (1,'1070813753','JKSYSTEMAS','JERSON BATISTA','MONTE CARMELO','3013794981','INGJERSON2014@GMAIL.COM','controlador/empresa/img/IMG22820221557.jpg','2022-08-22 18:55:08','ACTIVO');

/*Table structure for table `eps` */

DROP TABLE IF EXISTS `eps`;

CREATE TABLE `eps` (
  `IdEPS` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la EPS',
  `NitEPS` bigint(20) NOT NULL COMMENT 'El nit de la EPS',
  `NomEPS` varchar(80) NOT NULL COMMENT 'Nombre de la EPS',
  `CiudadEPS` varchar(45) NOT NULL COMMENT 'Ciudad de la EPS',
  `DirEPS` varchar(80) NOT NULL COMMENT 'Direccion de la EPS',
  `TelEPS` varchar(200) NOT NULL COMMENT 'Telefono de la EPS',
  `EmailEps` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdEPS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eps` */

/*Table structure for table `gastos` */

DROP TABLE IF EXISTS `gastos`;

CREATE TABLE `gastos` (
  `idGasto` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_gasto` int(11) NOT NULL,
  `fecha_gasto` date DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `recibo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idcaja` int(11) DEFAULT NULL,
  `observaciones` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT 'ACTIVO',
  `idusuario` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `estado` enum('ENTREGADA','CANCELADA','ANULADA') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idGasto`),
  KEY `idtipo_gasto` (`idtipo_gasto`),
  KEY `idusuario` (`idusuario`),
  KEY `idempresa` (`idempresa`),
  KEY `idcaja` (`idcaja`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`idtipo_gasto`) REFERENCES `tipo_gasto` (`id`),
  CONSTRAINT `gastos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `gastos_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `gastos_ibfk_4` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gastos` */

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `idpago` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `recibo` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idgasto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `idgasto` (`idgasto`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idgasto`) REFERENCES `gastos` (`idGasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pagos` */

/*Table structure for table `pension` */

DROP TABLE IF EXISTS `pension`;

CREATE TABLE `pension` (
  `IdPension` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la Pension',
  `NitPension` bigint(20) NOT NULL COMMENT 'El nit de la Pension',
  `NomPension` varchar(80) NOT NULL COMMENT 'Nombre de la Pension',
  `CiudadPension` varchar(45) NOT NULL COMMENT 'Ciudad de la Pension',
  `DirPension` varchar(80) NOT NULL COMMENT 'Direccion de la Pension',
  `TelPension` varchar(200) NOT NULL COMMENT 'Telefono de la Pension',
  `EmailPension` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdPension`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pension` */

/*Table structure for table `persona` */

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `persona_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_apepat` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_apemat` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_nrodocumento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_tipodocumento` enum('CEDULA','NIT','PASAPORTE','TI') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_sexo` enum('MASCULINO','FEMENINO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_direccion` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_correo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_fregistro` date DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`persona_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `persona` */

insert  into `persona`(`persona_id`,`persona_nombre`,`persona_apepat`,`persona_apemat`,`persona_nrodocumento`,`persona_tipodocumento`,`persona_sexo`,`persona_telefono`,`persona_direccion`,`persona_correo`,`persona_fregistro`,`persona_estatus`,`idempresa`) values (1,'JERSON','BATISTA','VEGA','1070813753','CEDULA','MASCULINO','30045454545','el centro','ingjerson@gmail.com','2022-07-13','ACTIVO',1),(2,'PROVEEDOR','DE MOSTRADOR','MOSTRADOR','000000001','NIT','MASCULINO','011111111','EL CENTRO','info@gmail.com','2022-07-13','ACTIVO',1),(3,'CLIENTE','DE ','MOSTRADOR','000000000001','CEDULA','MASCULINO','56456456','EL CENTRO','DEPRUEBA@GMAIL.COM','2022-07-13','ACTIVO',1),(4,'AGROPECUARIA','CAÑA ','FLECHA','10024428231','NIT','MASCULINO','3013794981','EL CARMEN DE BOLIVAR','info2022@gmail.com','2022-08-22','ACTIVO',1);

/*Table structure for table `prestacionsocial` */

DROP TABLE IF EXISTS `prestacionsocial`;

CREATE TABLE `prestacionsocial` (
  `IdPrestacionSocial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la prestacion social',
  `Fecha` date NOT NULL COMMENT 'Fecha de la prestacion social',
  `IdEmp` int(11) NOT NULL COMMENT 'Id del empleado como FK',
  `ValorPagado` double NOT NULL COMMENT 'Valor pagado por la prestacion social',
  `IdTipoPrestacion` int(11) NOT NULL COMMENT 'Id del tipo de prestacion como FK',
  PRIMARY KEY (`IdPrestacionSocial`),
  KEY `FK_IdEmp_PrestacionSocial` (`IdEmp`),
  KEY `FK_IdTipoPrestacion` (`IdTipoPrestacion`),
  CONSTRAINT `FK_IdEmp_PrestacionSocial` FOREIGN KEY (`IdEmp`) REFERENCES `empleados` (`IdEmp`),
  CONSTRAINT `FK_IdTipoPrestacion` FOREIGN KEY (`IdTipoPrestacion`) REFERENCES `tipoprestaciones` (`IdTipoPrestaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prestacionsocial` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producto_presentacion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `cant_minima` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_stock` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `producto_foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `producto_precioventa` decimal(10,2) DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `id_unidad` (`id_unidad`),
  KEY `producto_ibfk_1` (`id_categoria`),
  KEY `id_bodega` (`id_bodega`),
  KEY `idempresa` (`idempresa`),
  KEY `idTipoProducto` (`idTipoProducto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`unidad_id`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`),
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipo_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `producto` */

insert  into `producto`(`producto_id`,`producto_codigo`,`producto_nombre`,`producto_presentacion`,`id_bodega`,`cant_minima`,`producto_stock`,`id_categoria`,`id_unidad`,`idTipoProducto`,`producto_foto`,`compra`,`producto_precioventa`,`producto_estatus`,`fregistro`,`idempresa`) values (1,'9789588464466','AMALIA JOSE MARMOL(1)','ADITORIAL ATENEA',1,'1','4',2,1,1,'controlador/productos/img/default.png',3000.00,4500.00,'ACTIVO','2022-07-14 08:19:26',1),(2,'9789589761694','ALICIA EN EL PAIS DE LAS MARAVILLAS(2)','ATENEA',1,'1','1',2,1,1,'controlador/productos/img/default.png',3000.00,4500.00,'ACTIVO','2022-07-14 08:26:56',1),(3,'9789587230321','APOLOGIA DESOCRATES(3)','SKLA EDITORIAL',1,'1','4',2,1,1,'controlador/productos/img/default.png',4000.00,5000.00,'ACTIVO','2022-07-14 08:32:21',1),(4,'9789589825785','AZUL RUBEN DARIO(4)','ATENEA',1,'1','12',2,1,1,'controlador/productos/img/default.png',3000.00,4000.00,'ACTIVO','2022-07-14 08:45:17',1),(5,'9789585783010','BAJO LA MISMA ESTRELLA(5)','NUBE DE TINTA',1,'1','3',2,1,1,'controlador/productos/img/default.png',14000.00,17000.00,'ACTIVO','2022-07-31 13:09:24',1),(6,'9789588464282','BODAS DE SANGRE(6)','ATENEA',1,'1','7',2,1,1,'controlador/productos/img/default.png',3000.00,4000.00,'ACTIVO','2022-07-14 09:43:07',1),(7,'7707187092929','CARTA AL PADRE(7)','UNION',1,'1','9',2,1,1,'controlador/productos/img/default.png',3000.00,4000.00,'ACTIVO','2022-07-14 11:03:40',1),(8,'00003','COPIAS BLANCO Y NEGRO','COPIAS',1,'10','494',4,1,1,'controlador/productos/img/default.png',100.00,300.00,'ACTIVO','2022-08-22 14:57:54',1),(9,'0004','IMPRESIONES','NEGRO',1,'10','496',4,1,1,'controlador/productos/img/default.png',400.00,600.00,'ACTIVO','2022-08-22 14:57:53',1);

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_fregistro` date DEFAULT NULL,
  `proveedor_num_contacto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `proveedor_razon_social` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idciudad` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `persona_id` (`persona_id`),
  KEY `idempresa` (`idempresa`),
  KEY `idciudad` (`idciudad`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `proveedor_ibfk_3` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `proveedor` */

insert  into `proveedor`(`proveedor_id`,`proveedor_fregistro`,`proveedor_num_contacto`,`proveedor_estatus`,`persona_id`,`proveedor_razon_social`,`idciudad`,`idempresa`) values (1,'2022-07-13','000001','ACTIVO',2,'MOSTRADOR ',1,1);

/*Table structure for table `registrohe` */

DROP TABLE IF EXISTS `registrohe`;

CREATE TABLE `registrohe` (
  `IdRegistroHE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del registro de horas extra',
  `IdTipoHE` int(11) NOT NULL COMMENT 'Id del tipo de horas extra como FK',
  `Fecha` date NOT NULL COMMENT 'Fecha de las horas extra',
  `CantHoras` int(11) NOT NULL COMMENT 'Cantidad de horas',
  `ValorPagado` double NOT NULL COMMENT 'Valor pagado por la cantidad de horas extra',
  `IdEmp` int(11) NOT NULL COMMENT 'Id del empleado como FK',
  PRIMARY KEY (`IdRegistroHE`),
  KEY `FK_IdTipoHE` (`IdTipoHE`),
  KEY `FK_IdEmp_RegistroHE` (`IdEmp`),
  CONSTRAINT `FK_IdEmp_RegistroHE` FOREIGN KEY (`IdEmp`) REFERENCES `empleados` (`IdEmp`),
  CONSTRAINT `FK_IdTipoHE` FOREIGN KEY (`IdTipoHE`) REFERENCES `tipohe` (`IdTipoHE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registrohe` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_fregistro` date DEFAULT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`rol_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rol` */

insert  into `rol`(`rol_id`,`rol_nombre`,`rol_fregistro`,`rol_estatus`,`idempresa`) values (1,'Administrador','2022-07-13','ACTIVO',1);

/*Table structure for table `salarios` */

DROP TABLE IF EXISTS `salarios`;

CREATE TABLE `salarios` (
  `IdSalarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del salario',
  `IdCargo` int(11) NOT NULL COMMENT 'Id del cargo como FK',
  `IdTipoSalario` int(11) NOT NULL COMMENT 'Id del tipo de Salario',
  `SalarioBase` double NOT NULL COMMENT 'Salario Base',
  `AuxTransp` double NOT NULL COMMENT 'Auxilio de transporte',
  `Fecha` date NOT NULL COMMENT 'Fecha del pago',
  `Estado` varchar(2) DEFAULT NULL COMMENT 'Sin comentarios no se para que es :(',
  `IdEmp` int(11) NOT NULL COMMENT 'Id del Empleado como FK',
  `IdCategoriaARL` int(11) NOT NULL COMMENT 'Id de la categoria de ARL como FK',
  `DiasTrabajados` int(11) NOT NULL COMMENT 'Dias que trabajo',
  PRIMARY KEY (`IdSalarios`),
  KEY `FK_IdCargo` (`IdCargo`),
  KEY `FK_IdTipoSalario` (`IdTipoSalario`),
  KEY `FK_IdEmp_Salarios` (`IdEmp`),
  KEY `FK_IdCategoriaARL` (`IdCategoriaARL`),
  CONSTRAINT `FK_IdCargo` FOREIGN KEY (`IdCargo`) REFERENCES `cargos` (`IdCargos`),
  CONSTRAINT `FK_IdCategoriaARL` FOREIGN KEY (`IdCategoriaARL`) REFERENCES `categoriaarl` (`IdCategoriaARL`),
  CONSTRAINT `FK_IdEmp_Salarios` FOREIGN KEY (`IdEmp`) REFERENCES `empleados` (`IdEmp`),
  CONSTRAINT `FK_IdTipoSalario` FOREIGN KEY (`IdTipoSalario`) REFERENCES `tiposalario` (`IdTipoSalario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salarios` */

/*Table structure for table `salida` */

DROP TABLE IF EXISTS `salida`;

CREATE TABLE `salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idConcepto` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idBodega` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idConcepto` (`idConcepto`),
  KEY `idBodega` (`idBodega`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`idConcepto`) REFERENCES `concepto` (`id`),
  CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`idBodega`) REFERENCES `bodega` (`id`),
  CONSTRAINT `salida_ibfk_3` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `salida` */

/*Table structure for table `tipo_gasto` */

DROP TABLE IF EXISTS `tipo_gasto`;

CREATE TABLE `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `tipo_gasto_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_gasto` */

/*Table structure for table `tipo_producto` */

DROP TABLE IF EXISTS `tipo_producto`;

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_producto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idEmpresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tp_emp` (`idEmpresa`),
  CONSTRAINT `fk_tp_emp` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_producto` */

insert  into `tipo_producto`(`id`,`tipo_producto`,`estatus`,`fregistro`,`idEmpresa`) values (1,'PRODUCTO','ACTIVO','2022-07-13 15:56:42',1),(2,'CONSUMO','ACTIVO','2022-07-13 15:56:49',1),(3,'COMBO','ACTIVO','2022-07-13 15:56:57',1);

/*Table structure for table `tipodeducciones` */

DROP TABLE IF EXISTS `tipodeducciones`;

CREATE TABLE `tipodeducciones` (
  `IdTipoDeducciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de deduccion',
  `DescTipoDeducciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de deduccion',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de deduccion',
  PRIMARY KEY (`IdTipoDeducciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipodeducciones` */

/*Table structure for table `tipohe` */

DROP TABLE IF EXISTS `tipohe`;

CREATE TABLE `tipohe` (
  `IdTipoHE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de hora extra',
  `NomTipoHE` varchar(80) NOT NULL COMMENT 'Nombre del tipo de hora extra',
  `Multiplicador` double NOT NULL COMMENT 'Por cuanto se multiplica el valor de hora extra',
  PRIMARY KEY (`IdTipoHE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipohe` */

/*Table structure for table `tipoprestaciones` */

DROP TABLE IF EXISTS `tipoprestaciones`;

CREATE TABLE `tipoprestaciones` (
  `IdTipoPrestaciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de prestacion',
  `DescTipoPrestaciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de prestacion',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de prestacion',
  PRIMARY KEY (`IdTipoPrestaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipoprestaciones` */

/*Table structure for table `tiposalario` */

DROP TABLE IF EXISTS `tiposalario`;

CREATE TABLE `tiposalario` (
  `IdTipoSalario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo del salario del empleado',
  `DescTipoSalario` varchar(60) NOT NULL COMMENT 'Descripcion del tipo de salario',
  PRIMARY KEY (`IdTipoSalario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tiposalario` */

/*Table structure for table `unidad` */

DROP TABLE IF EXISTS `unidad`;

CREATE TABLE `unidad` (
  `unidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unidad_abreviatura` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unidad_fregistro` date DEFAULT NULL,
  `unidad_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`unidad_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `unidad_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `unidad` */

insert  into `unidad`(`unidad_id`,`unidad_nombre`,`unidad_abreviatura`,`unidad_fregistro`,`unidad_estatus`,`idempresa`) values (1,'UNIDAD','UN','2022-07-13','ACTIVO',1),(2,'KILOGRAMO','KG','2022-07-13','ACTIVO',1),(3,'ONZA','ON','2022-07-13','ACTIVO',1);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_intento` int(11) DEFAULT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `usuario_imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idcaja` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`) USING BTREE,
  UNIQUE KEY `usuario_nombre_2` (`usuario_nombre`),
  UNIQUE KEY `usuario_nombre_3` (`usuario_nombre`),
  KEY `persona_id` (`persona_id`),
  KEY `usuario_ibfk_1` (`rol_id`),
  KEY `idempresa` (`idempresa`),
  KEY `idcaja` (`idcaja`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`usuario_id`,`usuario_nombre`,`usuario_password`,`usuario_email`,`usuario_intento`,`usuario_estatus`,`rol_id`,`usuario_imagen`,`persona_id`,`idempresa`,`idcaja`) values (1,'admin','$2y$10$h9K.V8WbN3pebBNwmqn/zOd2ozDzhgcNgyT317cPmJMMTBmyBVYRu','ingjerson2014@gmail.com',NULL,'ACTIVO',1,'controlador/usuario/img/IMG317202213118.jpg',1,1,1);

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `bodega_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `venta_tipocomprobante` enum('COTIZACION','FACTURA','BOLETA','TICKET') COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_serie` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_numcomprobante` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_pago` enum('CONTADO','CREDITO','CREDICONTADO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_fecha` date DEFAULT NULL,
  `venta_impuesto` decimal(10,2) DEFAULT NULL,
  `venta_total` decimal(10,2) DEFAULT NULL,
  `venta_estatus` enum('REGISTRADA','CANCELADA','POR_COBRAR','ANULADA') COLLATE utf8_unicode_ci DEFAULT NULL,
  `venta_porcentaje` decimal(10,2) DEFAULT NULL,
  `venta_total_dcto` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `idcaja` int(11) DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `bodega_id` (`bodega_id`),
  KEY `idempresa` (`idempresa`),
  KEY `idcaja` (`idcaja`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `venta_ibfk_5` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `venta` */

insert  into `venta`(`venta_id`,`cliente_id`,`bodega_id`,`usuario_id`,`venta_tipocomprobante`,`venta_serie`,`venta_numcomprobante`,`tipo_pago`,`venta_fecha`,`venta_impuesto`,`venta_total`,`venta_estatus`,`venta_porcentaje`,`venta_total_dcto`,`fecha_vencimiento`,`idempresa`,`idcaja`) values (1,1,1,1,'TICKET','FV',NULL,'CONTADO','2022-07-31',0.00,17000.00,'REGISTRADA',0.00,0.00,'2022-07-30',1,1),(2,2,1,1,'FACTURA','FV',NULL,'CONTADO','2022-08-22',0.00,3600.00,'REGISTRADA',0.00,0.00,'2022-08-22',1,1);

/* Trigger structure for table `detalle_compra` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tr_updStockIngreso` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_compra` FOR EACH ROW BEGIN

UPDATE producto SET producto_stock=producto_stock + NEW.dc_cantidad

WHERE `producto`.`producto_id` = NEW.id_producto;

END */$$


DELIMITER ;

/* Trigger structure for table `detalle_venta` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tr_updStockVenta` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN

UPDATE producto SET producto_stock=producto_stock - NEW.dv_cantidad

WHERE `producto`.`producto_id` = NEW.producto_id;

END */$$


DELIMITER ;

/* Procedure structure for procedure `SP_ACTUALIZAR_DATOS_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_ACTUALIZAR_DATOS_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_DATOS_PERSONA`(IN IDUSUARIO INT, IN NOMBRE VARCHAR(50),IN APEPAT VARCHAR(50),IN APEMAT VARCHAR(50),

IN NRO_DOCUMENTO VARCHAR(50), IN TIPO_DOC VARCHAR(50), IN SEXO VARCHAR(15),

IN TELEFONO VARCHAR(50), IN DIRECCION VARCHAR(50))
BEGIN

DECLARE  cantidad INT;

DECLARE IDPERSONA INT;

DECLARE DOCMENTOACTUAL INT;

SET @IDPERSONA:=(SELECT persona_id from usuario where usuario_id =IDUSUARIO);

SET @DOCMENTOACTUAL:=(SELECT persona_nrodocumento from persona where persona_id =@IDPERSONA);

IF @DOCMENTOACTUAL =  NRO_DOCUMENTO then

UPDATE  persona set 

persona_nombre=NOMBRE,

persona_apepat=APEPAT,

persona_apemat=APEMAT,

persona_tipodocumento=TIPO_DOC,

persona_sexo=SEXO,

persona_telefono=TELEFONO,

persona_direccion=DIRECCION

WHERE persona_id =@IDPERSONA;

SELECT 1;

ELSE

SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);

IF @cantidad = 0 THEN

	UPDATE  persona set 

	persona_nombre=NOMBRE,

	persona_apepat=APEPAT,

	persona_apemat=APEMAT,

	persona_nrodocumento=NRO_DOCUMENTO,

	persona_tipodocumento=TIPO_DOC,

	persona_sexo=SEXO,

	persona_telefono=TELEFONO,

	persona_direccion=DIRECCION

	WHERE persona_id =@IDPERSONA;

	SELECT 1;

	ELSE 

	SELECT 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_ANULAR_COMPRA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_ANULAR_COMPRA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_COMPRA`(IN `IDCOMPRA` INT)
BEGIN 

DECLARE CANTIDAD INT;

DECLARE IDPRODUCTO INT;

DECLARE STOCKACTUAL DECIMAL(10,2);

DECLARE DETALLEID INT;

UPDATE compra SET 

`compra_estatus` ='ANULADA'

WHERE `compra_id` =IDCOMPRA;

SET @CANTIDAD:=(SELECT COUNT(*) FROM `detalle_compra` WHERE `detalle_compra`.`dc_estatus`='INGRESADA' AND  `id_compra` =IDCOMPRA);

  WHILE @CANTIDAD > 0 DO

	SET @IDPRODUCTO:=(SELECT `id_producto` FROM `detalle_compra` 

	WHERE `detalle_compra`.`dc_estatus` ='INGRESADA' AND  `id_compra` =IDCOMPRA  LIMIT 1);

	

	SET @DETALLEID:=(SELECT `detalle_compra_id` FROM `detalle_compra` WHERE `detalle_compra`.`dc_estatus`='INGRESADA' 

	AND  `id_compra` =IDCOMPRA  LIMIT 1);

	

	SET @STOCKACTUAL:=(SELECT `producto_stock` FROM producto WHERE `producto_id` = @IDPRODUCTO);

	

	UPDATE producto SET 

	`producto_stock`=@STOCKACTUAL-(SELECT `detalle_compra`.`dc_cantidad` FROM `detalle_compra` 

	WHERE `detalle_compra`.`dc_estatus` ='INGRESADA' AND  `id_compra` =IDCOMPRA  LIMIT 1)

	WHERE `producto_id`=@IDPRODUCTO;

	UPDATE `detalle_compra` SET 

	`detalle_compra`.`dc_estatus` ='ANULADA'

	WHERE `detalle_compra_id` =@DETALLEID;

	

      SET @CANTIDAD:= @CANTIDAD - 1;

    

  END WHILE;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_ANULAR_VENTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_ANULAR_VENTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_VENTA`(IN `IDVENTA` INT)
BEGIN 

DECLARE CANTIDAD INT;

DECLARE IDPRODUCTO INT;

DECLARE STOCKACTUAL DECIMAL(10,2);

DECLARE DETALLEID INT;

UPDATE venta SET 

`venta_estatus` ='ANULADA'

WHERE `venta_id` =IDVENTA;

SET @CANTIDAD:=(SELECT COUNT(*) FROM `detalle_venta` WHERE `detalle_venta`.`dv_estatus`='INGRESADA' AND  `venta_id` =IDVENTA);

  WHILE @CANTIDAD > 0 DO

	SET @IDPRODUCTO:=(SELECT `producto_id` FROM `detalle_venta` 

	WHERE `detalle_venta`.`dv_estatus` ='INGRESADA' AND  `venta_id` =IDVENTA  LIMIT 1);

	

	SET @DETALLEID:=(SELECT `detalle_venta_id` FROM `detalle_venta` WHERE `detalle_venta`.`dv_estatus`='INGRESADA' 

	AND  `venta_id` =IDVENTA  LIMIT 1);

	

	SET @STOCKACTUAL:=(SELECT `producto_stock` FROM producto WHERE `producto_id` = @IDPRODUCTO);

	

	UPDATE producto SET 

	`producto_stock`=@STOCKACTUAL+(SELECT `detalle_venta`.`dv_cantidad` FROM `detalle_venta` 

	WHERE `detalle_venta`.`dv_estatus` ='INGRESADA' AND  `venta_id` =IDVENTA  LIMIT 1)

	WHERE `producto_id`=@IDPRODUCTO;

	UPDATE `detalle_venta` SET 

	`detalle_venta`.`dv_estatus` ='ANULADA'

	WHERE `detalle_venta_id` =@DETALLEID;

	

      SET @CANTIDAD:= @CANTIDAD - 1;

    

  END WHILE;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ABONOS_PROVEEDOR` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ABONOS_PROVEEDOR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ABONOS_PROVEEDOR`()
SELECT

    `cuentas_x_proveedor`.`idCuenta`

    , `proveedor`.`proveedor_razon_social` AS proveedor

    ,`compra`.`compra_tipo_comprobante`

    ,   compra.`compra_num_comprobante` AS nofactura

    , `cuentas_x_proveedor`.`noCuota`

    , `cuentas_x_proveedor`.`fecha_pago`

     , `compra`.`compra_total` AS credito

    ,SUM( `cuentas_x_proveedor`.`valorAbono`) AS totalAbonos

    , `cuentas_x_proveedor`.`idCompra`

   

    ,    `compra`.`compra_total` - SUM(`cuentas_x_proveedor`.`valorAbono`) AS saldo

FROM

    `sistema_pos`.`cuentas_x_proveedor`

    INNER JOIN `sistema_pos`.`compra` 

        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)

    INNER JOIN `sistema_pos`.`proveedor` 

        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)

        GROUP BY idCompra */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ARL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ARL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ARL`()
SELECT

    `IdARL`

    , `NitARL`

    , `NomARL`

    , `DirARL`

    , `CiudadARL`

    , `TelARL`

    , `EmailArl`

    , `fregistro`

    , `estatus`

FROM

    `arl` */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_BODEGAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_BODEGAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_BODEGAS`()
select id,`nombre_bodega`,fregistro,estatus from bodega */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_CATEGORIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_CATEGORIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CATEGORIA`()
select `categoria_id`,`categoria_nombre`,`categoria_fregistro`,`categoria_estatus`

from `categoria` */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_CLIENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_CLIENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CLIENTE`()
SELECT

    `persona`.`persona_id`

    ,   concat_ws(' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) as cliente

    , `persona`.`persona_nrodocumento`

    , `persona`.`persona_tipodocumento`

    , `persona`.`persona_sexo`

    , `persona`.`persona_telefono`

    , `persona`.`persona_direccion`

    , `cliente`.`cliente_fregistro`

    , `cliente`.`cliente_estatus`

    , `cliente`.`idcliente`

FROM

    `sistema_pos`.`cliente`

    INNER JOIN `sistema_pos`.`persona` 

        ON (`cliente`.`persona_id` = `persona`.`persona_id`) */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_CATEGORIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_CATEGORIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_CATEGORIA`()
SELECT

	categoria_id, 

	categoria_nombre

FROM

	categoria

	where categoria_estatus='ACTIVO' */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PERSONA`()
SELECT

    `persona_id`

    , concat_ws(' ', `persona_nombre`, `persona_apepat`, `persona_apemat`) 

FROM

    `persona`

    WHERE persona.persona_estatus ='ACTIVO' */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PRODUCTO`()
SELECT `producto_id`,`producto_nombre`,

`producto_stock`,`producto_precioventa`, producto.producto_foto, producto.producto_codigo

FROM `producto`

WHERE `producto`.`producto_estatus` ='ACTIVO' */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_PROVEEDOR` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_PROVEEDOR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PROVEEDOR`()
SELECT

    `proveedor`.`proveedor_id`

    , `proveedor`.`proveedor_razon_social`

    , `persona`.`persona_nrodocumento`

FROM

    `proveedor`

    INNER JOIN `persona` 

        ON (`proveedor`.`persona_id` = `persona`.`persona_id`)

        WHERE `proveedor_estatus` = 'ACTIVO' */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT

    `rol_id`

    , `rol_nombre`

FROM

    `rol`

    where rol.rol_estatus='ACTIVO' */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMBO_UNIDAD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMBO_UNIDAD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_UNIDAD`()
SELECT

	unidad_id, 

	unidad_nombre

FROM

	unidad

	where unidad_estatus='ACTIVO' */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_COMPRAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_COMPRAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMPRAS`(IN `INICIO` DATE, IN `FIN` DATE)
SELECT

    `compra`.`compra_id`

    , `compra`.`proveedor_id`

    ,`compra`.`id_bodega`

    ,`bodega`.`nombre_bodega`

    , `compra`.`usuario_id`

    , `compra`.`compra_tipo_comprobante`

    , `compra`.`compra_serie_comprobante`

    , `compra`.`compra_num_comprobante`

    , `compra`.`compra_tipo_pago`

    , `compra`.`compra_fecha`

    , `compra`.`compra_impuesto`

    , `compra`.`compra_total`

    , `compra`.`compra_estatus`

    , `usuario`.`usuario_nombre`

    , CONCAT_WS(' ', `persona`.`persona_nombre`  , `persona`.`persona_apepat` , `persona`.`persona_apemat` ) AS proveedor,

    compra.compra_total_decto, compra.fecha_vencimiento

    

FROM

    `sistema_pos`.`compra`

    INNER JOIN `sistema_pos`.`usuario` 

        ON (`compra`.`usuario_id` = `usuario`.`usuario_id`)

    INNER JOIN `sistema_pos`.`proveedor` 

        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)

    INNER JOIN `sistema_pos`.`persona` 

        ON (`proveedor`.`persona_id` = `persona`.`persona_id`)

     INNER JOIN `bodega`  ON  `compra`.`id_bodega`  = `bodega`.`id`  

        where compra.compra_fecha BETWEEN INICIO AND FIN */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PERSONA`()
SELECT

    `persona_id`, concat_ws(' ',`persona_nombre`  , `persona_apepat`  , `persona_apemat`) as persona,

    persona.persona_nombre,persona.persona_apepat,

    persona.persona_apemat

     ,`persona_nrodocumento`

    , `persona_tipodocumento`

    , `persona_sexo`

    , `persona_telefono`

    , `persona_direccion`

    , persona_correo

    , `persona_fregistro`

    , `persona_estatus`

FROM

    `persona` */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_PRODUCTOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_PRODUCTOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTOS`(IN `IDBODEGA` INT)
SELECT

    `p`.`producto_id`    , `p`.`producto_codigo`

    , `p`.`producto_nombre`    , `p`.`producto_presentacion`

    

    , `p`.`id_bodega`

    , `b`.`nombre_bodega`  

    ,`p`.`cant_minima`  

    ,    `p`.`producto_stock`

    , `p`.`id_categoria`    , `c`.`categoria_nombre`

    , `p`.`id_unidad`    , `u`.`unidad_nombre`

    , `p`.`producto_foto`    , `p`.`producto_precioventa`

    , `p`.`producto_estatus`

FROM

    `sistema_pos`.`producto` AS `p`

    INNER JOIN `sistema_pos`.`bodega` AS `b` 

        ON (`p`.`id_bodega` = `b`.`id`)

    INNER JOIN `sistema_pos`.`categoria` AS `c`

        ON (`p`.`id_categoria` = `c`.`categoria_id`)

    INNER JOIN `sistema_pos`.`unidad` AS `u`

        ON (`p`.`id_unidad` = `u`.`unidad_id`)

       where b.`id` = IDBODEGA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_PROVEEDOR` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_PROVEEDOR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROVEEDOR`()
SELECT

    `persona`.`persona_id`

    , concat_ws(' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) as proveedor

    , `persona`.`persona_nrodocumento`

    , `persona`.`persona_tipodocumento`

    , `persona`.`persona_sexo`

    , `persona`.`persona_telefono`

    , `persona`.`persona_direccion`

    , `proveedor`.`proveedor_id`

    ,proveedor.proveedor_num_contacto

    , `proveedor`.`proveedor_fregistro`

    , `proveedor`.`proveedor_estatus`

    ,	proveedor.proveedor_razon_social

 

FROM

    `sistema_pos`.`proveedor`

    INNER JOIN `sistema_pos`.`persona` 

        ON (`proveedor`.`persona_id` = `persona`.`persona_id`) */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ROL`()
SELECT * FROM  rol */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_UNIDAD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_UNIDAD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_UNIDAD`()
SELECT

	u.unidad_id, 

	u.unidad_nombre, 

    u.unidad_abreviatura,

	u.unidad_fregistro, 

	u.unidad_estatus

FROM

	unidad AS u */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_USUARIO2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_USUARIO2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO2`(IN `IDEMPRESA` INT)
SELECT

    `usuario`.`usuario_id`    , `usuario`.`usuario_nombre`

    , `usuario`.`usuario_email`    , `usuario`.`usuario_estatus`

    , `usuario`.`usuario_imagen`    , `usuario`.`rol_id`

    , `usuario`.`persona_id`    , `rol`.`rol_nombre`,

    concat_ws(' ', `persona`.`persona_nombre` , `persona`.`persona_apepat`, `persona`.`persona_apemat`) AS persona

    , `persona`.`persona_nombre`    , `persona`.`persona_apepat`

    , `persona`.`persona_apemat`, `usuario`.`idempresa`

    FROM

    `usuario`

    LEFT JOIN `persona` 

        ON (`usuario`.`persona_id` = `persona`.`persona_id`)

    INNER JOIN `rol` 

        ON (`usuario`.`rol_id` = `rol`.`rol_id`)

        inner join empresa on `usuario`.`idempresa` = empresa.`ID`

        where usuario.`idempresa` = IDEMPRESA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_VENTAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_VENTAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_VENTAS`(IN `FINICIO` DATE, IN `FFIN` DATE)
SELECT

    `venta`.`venta_id`

    , `venta`.`cliente_id`

    , `venta`.`bodega_id`

    , `bodega`.`nombre_bodega`

    , `venta`.`usuario_id`

    , `usuario`.`usuario_nombre`

    , `venta`.`venta_tipocomprobante`

    , `venta`.`venta_serie`

    , `venta`.`venta_numcomprobante`

    , `venta`.`tipo_pago`

    , `venta`.`venta_fecha`

    , `venta`.`venta_impuesto`

    , `venta`.`venta_total`

    , `venta`.`venta_estatus`

    , `venta`.`venta_porcentaje`

    , `venta`.`venta_total_dcto`

    , venta.fecha_vencimiento

    , concat_ws(' ',`persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) as cliente

   

FROM

    `bodega`, 

    `venta`

    INNER JOIN `usuario` 

        ON (`venta`.`usuario_id` = `usuario`.`usuario_id`)

    INNER JOIN `cliente` 

        ON (`venta`.`cliente_id` = `cliente`.`idcliente`)

    INNER JOIN `persona` 

        ON (`cliente`.`persona_id` = `persona`.`persona_id`)

        WHERE `venta`.`venta_fecha` between FINICIO AND FFIN */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ARL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ARL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ARL`(IN ID int, 

    IN NIT_ACTUAL VARCHAR(250), IN NIT_NUEVO VARCHAR(250),

     IN NOMBRE VARCHAR(100), IN CIUDAD VARCHAR(100), IN DIRECCION VARCHAR(200),

     IN TELEFONO VARCHAR(100),IN CORREO VARCHAR(100))
BEGIN

DECLARE CANTIDAD INT;

IF NIT_ACTUAL = NIT_NUEVO THEN

    UPDATE arl set

    NomARL=NOMBRE,

    CiudadARL=CIUDAD,

    DirARL=DIRECCION,

    TelARL=TELEFONO,

    EmailArl=CORREO

    where IdARL = ID;

select 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM arl WHERE NitARL=NIT_NUEVO);

if  @CANTIDAD = 0 THEN

 UPDATE arl set

    NitARL=NIT_NUEVO,

    NomARL=NOMBRE,

    CiudadARL=CIUDAD,

    DirARL=DIRECCION,

    TelARL=TELEFONO,

    EmailArl=CORREO

    where IdARL = ID;

select 1;

ELSE 

select 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_CATEGORIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_CATEGORIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CATEGORIA`(IN ID int, IN NOMBRE_ACTUAL VARCHAR(250), IN NOMBRE_NUEVO VARCHAR(250), IN ESTATUS VARCHAR(15))
BEGIN

DECLARE CANTIDAD INT;

IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN

	UPDATE categoria set

	categoria_estatus=ESTATUS

	where categoria_id = ID;

select 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM categoria WHERE categoria_nombre=NOMBRE_NUEVO);

if  @CANTIDAD = 0 THEN

UPDATE categoria set

categoria_estatus=ESTATUS,

categoria_nombre=NOMBRE_NUEVO

where categoria_id = ID;

select 1;

ELSE 

select 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_CONTRASENA_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_CONTRASENA_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CONTRASENA_USUARIO`(in ID INT,in CONTRA VARCHAR(250))
UPDATE usuario set 

`usuario_password` =CONTRA where 

`usuario_id` = ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_DEPARTAMENTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_DEPARTAMENTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_DEPARTAMENTO`(IN IDDEP int,

 IN NOMBRE_ACTUAL VARCHAR(250), IN NOMBRE_NUEVO VARCHAR(250), IN ESTATUSDEP VARCHAR(15))
BEGIN

DECLARE CANTIDAD INT;

IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN

	UPDATE departamentos set

	estatus=ESTATUSDEP

	where id = IDDEP;

select 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM departamentos WHERE nombre_depto=NOMBRE_NUEVO);

if  @CANTIDAD = 0 THEN

UPDATE departamentos set

estatus=ESTATUSDEP,

nombre_depto=NOMBRE_NUEVO

where  id = IDDEP;

select 1;

ELSE 

select 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_DEPTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_DEPTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_DEPTO`(IN ID INT, 

    IN DESC_ACTUAL VARCHAR(250), IN DESC_NUEVO VARCHAR(250))
BEGIN

DECLARE CANTIDAD INT;

IF DESC_ACTUAL = DESC_NUEVO THEN

    UPDATE dpto SET

    `DescDpto`=DESC_ACTUAL

    WHERE `IdDpto` = ID;

SELECT 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM dpto WHERE `DescDpto`=DESC_NUEVO);

IF  @CANTIDAD = 0 THEN

     UPDATE dpto SET

    `DescDpto`=DESC_NUEVO

    WHERE `IdDpto` = ID;

SELECT 1;

ELSE 

SELECT 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_EPS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_EPS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EPS`(IN `ID` INT, IN `NIT_ACTUAL` VARCHAR(250), IN `NIT_NUEVO` VARCHAR(250), IN `NOMBRE` VARCHAR(100), IN `CIUDAD` VARCHAR(100), IN `DIRECCION` VARCHAR(200), IN `TELEFONO` VARCHAR(100), IN `CORREO` VARCHAR(100))
BEGIN

DECLARE CANTIDAD INT;

IF NIT_ACTUAL = NIT_NUEVO THEN

    UPDATE eps set

    NomEPS=NOMBRE,

    CiudadEPS=CIUDAD,

    DirEPS=DIRECCION,

    TelEPS=TELEFONO,

    EmailEps=CORREO

    where IdEPS = ID;

select 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM eps WHERE NitEPS=NIT_NUEVO);

if  @CANTIDAD = 0 THEN

 UPDATE eps set

    NitEPS=NIT_NUEVO,

    NomEPS=NOMBRE,

    CiudadEPS=CIUDAD,

    DirEPS=DIRECCION,

    TelEPS=TELEFONO,

    EmailEps=CORREO

    where IdEPS = ID;

select 1;

ELSE 

select 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_ARL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_ARL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_ARL`(IN `ID` INT, IN `ESTATUS_ARL` VARCHAR(20))
UPDATE arl SET 

`estatus` = ESTATUS_ARL 

WHERE `IdARL` = ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_BODEGA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_BODEGA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_BODEGA`(IN IDBODEGA INT,

    IN ESTATUS VARCHAR(20))
UPDATE bodega set 

estatus = ESTATUS 

where id = IDBODEGA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_CARGO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_CARGO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_CARGO`(IN IDCARGO INT,

    IN ESTATUS VARCHAR(20))
UPDATE cargos set 

estatus = ESTATUS 

where IdCargos = IDCARGO */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_CATEGORIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_CATEGORIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_CATEGORIA`(IN `IDCATEGORIA` INT, IN `ESTATUS` VARCHAR(20))
UPDATE categoria set 

categoria_estatus = ESTATUS 

where categoria_id = IDCATEGORIA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_CLIENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_CLIENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_CLIENTE`(IN `CLIENTE_ID` INT, IN `ESTATUS` VARCHAR(20))
UPDATE cliente set 

cliente_estatus = ESTATUS 

where idcliente = CLIENTE_ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_DEPTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_DEPTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_DEPTO`(IN IDDEPTO INT,

    IN ESTATUS VARCHAR(20))
UPDATE dpto set 

estatus = ESTATUS 

where IdDpto = IDDEPTO */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_EMPLEADO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_EMPLEADO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_EMPLEADO`(IN IDEMP INT,

    IN ESTATUS VARCHAR(20))
UPDATE empleados set 

estatus = ESTATUS 

where IdEmp = IDEMP */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_EPS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_EPS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_EPS`(IN ID INT,

    IN ESTATUS_EPS VARCHAR(20))
UPDATE eps set 

estatus = ESTATUS_EPS 

where IdEPS = ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_PERSONA`(IN IDPERSONA INT,

    IN ESTATUS VARCHAR(20))
UPDATE persona set 

persona_estatus = ESTATUS 

where persona_id = IDPERSONA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_PRODUCTO`(IN IDPRODUCTO INT, IN ESTATUS VARCHAR(20))
UPDATE producto set producto_estatus = ESTATUS

where producto_id = IDPRODUCTO */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_PROVEEDOR` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_PROVEEDOR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_PROVEEDOR`(IN PROVEEDOR_ID INT, IN ESTATUS VARCHAR(20))
UPDATE proveedor set 

proveedor_estatus = ESTATUS 

where proveedor_id = PROVEEDOR_ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_ROL`(IN IDROL INT,

    IN ESTATUS VARCHAR(20))
UPDATE rol set 

rol_estatus = ESTATUS 

where rol_id = IDROL */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_UNIDAD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_UNIDAD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_UNIDAD`(IN IDUNIDAD INT,

    IN ESTATUS VARCHAR(20))
UPDATE unidad set 

unidad_estatus = ESTATUS 

where unidad_id = IDUNIDAD */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_USUARIO`(IN IDUSUARIO INT, IN ESTATUS VARCHAR(20))
UPDATE usuario set 

usuario_estatus = ESTATUS 

where usuario_id = IDUSUARIO */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_VENTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_VENTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_VENTA`(IN IDVENTA INT,

    IN ESTATUS VARCHAR(20))
UPDATE `venta` SET 

`venta_estatus` = ESTATUS 

WHERE `venta_id` = IDVENTA */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_FOTO_EMPRESA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_FOTO_EMPRESA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FOTO_EMPRESA`(IN idempresa INT, IN foto VARCHAR(250))
BEGIN 

UPDATE empresa SET 

logo =foto

WHERE ID =idempresa;

SELECT 1;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_FOTO_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_FOTO_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FOTO_PRODUCTO`(IN IDPRODUCTO INT, IN foto VARCHAR(250))
BEGIN 

UPDATE `producto` SET 

`producto_foto` =foto

WHERE `producto_id` =IDPRODUCTO;

SELECT 1;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_FOTO_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_FOTO_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FOTO_USUARIO`(in idusuario int, in foto VARCHAR(250))
begin 

update usuario set 

usuario_imagen =foto

where usuario_id =idusuario;

select 1;

end */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PERSONA`(IN `IDPERSONA` INT, IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50),

IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO_ACTUAL` VARCHAR(50), IN `NRO_DOCUMENTO_NUEVO` VARCHAR(50),

 IN `TIPO_DOC` VARCHAR(50), IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50),IN CORREO VARCHAR(100), IN `ESTATUS` VARCHAR(20))
BEGIN

DECLARE CANTIDAD INT;

IF NRO_DOCUMENTO_ACTUAL= NRO_DOCUMENTO_NUEVO THEN

		UPDATE persona SET 

		persona_nombre= NOMBRE,`persona_apepat`=APEPAT,`persona_apemat`=APEMAT,

		`persona_tipodocumento`=TIPO_DOC,`persona_sexo`=SEXO,`persona_telefono`=TELEFONO,

		`persona_direccion`=DIRECCION,

		persona_correo =CORREO,

		 `persona_estatus`=ESTATUS

		WHERE `persona_id`=IDPERSONA;

SELECT 1;

 ELSE

  SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE `persona_nrodocumento` =NRO_DOCUMENTO_NUEVO);

	

	IF @CANTIDAD = 0 THEN 

		 UPDATE persona SET 

			persona_nombre= NOMBRE,`persona_apepat`=APEPAT,`persona_apemat`=APEMAT,

			`persona_nrodocumento`=NRO_DOCUMENTO_NUEVO,

		`persona_tipodocumento`=TIPO_DOC,`persona_sexo`=SEXO,`persona_telefono`=TELEFONO,

		`persona_direccion`=DIRECCION,

		persona_correo = CORREO,

		 `persona_estatus`=ESTATUS

		WHERE `persona_id`=IDPERSONA;

		SELECT 1;

	ELSE

	SELECT 2;

	

	END IF;

 

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO`(IN `IDPRODUCTO` INT,

 IN `CODIGO_ACTUAL` VARCHAR(100), IN `CODIGO_NUEVO` VARCHAR(100), IN `NOMBRE_ACTUAL` VARCHAR(50),

  IN `NOMBRE_NUEVO` VARCHAR(50), IN `PRESENTACION` VARCHAR(50),  IN `CANTIDAD_MIN` VARCHAR(100), 

  IN `IDCATEGORIA` INT, IN `IDUNIDAD` INT, IN `PRECIO_COMPRA` DECIMAL(10,2),IN `PRECIO_VENTA` DECIMAL(10,2))
BEGIN

DECLARE CANTIDAD INT;

IF CODIGO_ACTUAL = CODIGO_NUEVO  THEN

 

   UPDATE producto SET 

   `producto_nombre` =NOMBRE_NUEVO,

   producto_presentacion =PRESENTACION,

   cant_minima=CANTIDAD_MIN,

   id_categoria=IDCATEGORIA,

   id_unidad=IDUNIDAD,

   `precio_costo`=PRECIO_COMPRA,

   producto_precioventa=PRECIO_VENTA

  

   WHERE producto_id=IDPRODUCTO;

   SELECT 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_codigo =CODIGO_NUEVO

   OR producto_nombre =NOMBRE_NUEVO);

   IF @CANTIDAD = 0 THEN 

  

   UPDATE producto SET 

   producto_codigo=CODIGO_NUEVO,

   producto_nombre=NOMBRE_NUEVO,

   producto_presentacion =PRESENTACION,

    cant_minima=CANTIDAD_MIN,

   id_categoria=IDCATEGORIA,

   id_unidad=IDUNIDAD,

    `precio_costo`=PRECIO_COMPRA,

   producto_precioventa=PRECIO_VENTA

  

    WHERE producto_id=IDPRODUCTO;

   SELECT 1;

   ELSE 

   SELECT 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_PRODUCTO2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_PRODUCTO2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PRODUCTO2`(IN `IDPRODUCTO` INT,

 IN `CODIGO_ACTUAL` VARCHAR(100), IN `CODIGO_NUEVO` VARCHAR(100), IN `NOMBRE_ACTUAL` VARCHAR(50),

  IN `NOMBRE_NUEVO` VARCHAR(50), IN `PRESENTACION` VARCHAR(50),  IN `CANTIDAD_MIN` VARCHAR(100), 

  IN `IDCATEGORIA` INT, IN `IDUNIDAD` INT, IN IDTIPO_PRODUCTO INT, IN `PRECIO_COMPRA` DECIMAL(10,2),IN `PRECIO_VENTA` DECIMAL(10,2))
BEGIN

DECLARE CANTIDAD INT;

IF CODIGO_ACTUAL = CODIGO_NUEVO  THEN

 

   UPDATE producto SET 

   `producto_nombre` =NOMBRE_NUEVO,

   producto_presentacion =PRESENTACION,

   cant_minima=CANTIDAD_MIN,

   id_categoria=IDCATEGORIA,

   id_unidad=IDUNIDAD,

   idTipoProducto =IDTIPO_PRODUCTO,

   `compra`=PRECIO_COMPRA,

   producto_precioventa=PRECIO_VENTA

  

   WHERE producto_id=IDPRODUCTO;

   SELECT 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_codigo =CODIGO_NUEVO

   OR producto_nombre =NOMBRE_NUEVO);

   IF @CANTIDAD = 0 THEN 

  

   UPDATE producto SET 

   producto_codigo=CODIGO_NUEVO,

   producto_nombre=NOMBRE_NUEVO,

   producto_presentacion =PRESENTACION,

    cant_minima=CANTIDAD_MIN,

   id_categoria=IDCATEGORIA,

   id_unidad=IDUNIDAD,

   idTipoProducto =IDTIPO_PRODUCTO,

    `compra`=PRECIO_COMPRA,

   producto_precioventa=PRECIO_VENTA

  

    WHERE producto_id=IDPRODUCTO;

   SELECT 1;

   ELSE 

   SELECT 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ROL`(IN `ID` INT, IN `ROL_ACTUAL` VARCHAR(250), IN `ROL_NUEVO` VARCHAR(250), IN `ESTATUS` VARCHAR(15))
BEGIN

DECLARE CANTIDAD INT;

IF ROL_ACTUAL = ROL_NUEVO THEN

	UPDATE rol SET

	rol_estatus=ESTATUS

	WHERE rol_id = ID;

SELECT 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE rol_nombre=ROL_NUEVO);

IF  @CANTIDAD = 0 THEN

UPDATE rol SET

rol_estatus=ESTATUS,

rol_nombre=ROL_NUEVO

WHERE rol_id = ID;

SELECT 1;

ELSE 

SELECT 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_TIPO_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_TIPO_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_TIPO_PRODUCTO`(IN IDTIPO INT, IN NOMBRE_ACTUAL VARCHAR(250), IN NOMBRE_NUEVO VARCHAR(250), IN ESTATUSTIPO VARCHAR(15))
BEGIN



DECLARE CANTIDAD INT;



IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN



	UPDATE `tipo_producto` SET



	estatus=ESTATUSTIPO



	WHERE id = IDTIPO;



SELECT 1;



ELSE 



SET @CANTIDAD:=(SELECT COUNT(*) FROM `tipo_producto` WHERE tipo_producto=NOMBRE_NUEVO);



IF  @CANTIDAD = 0 THEN



UPDATE tipo_producto SET



estatus=ESTATUSTIPO,



`tipo_producto`=NOMBRE_NUEVO



WHERE id = IDTIPO;



SELECT 1;



ELSE 



SELECT 2;



END IF;



END IF;



END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_UNIDAD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_UNIDAD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_UNIDAD`(IN ID int,

 IN NOMBRE_ACTUAL VARCHAR(250), IN NOMBRE_NUEVO VARCHAR(250), IN ABREVIATURA char(20), IN ESTATUS VARCHAR(15))
BEGIN

DECLARE CANTIDAD INT;

IF NOMBRE_ACTUAL = NOMBRE_NUEVO THEN

	UPDATE unidad set

    unidad_abreviatura=ABREVIATURA,

	unidad_estatus=ESTATUS

	where unidad_id = ID;

select 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*) FROM unidad WHERE unidad_nombre=NOMBRE_NUEVO);

if  @CANTIDAD = 0 THEN

UPDATE unidad set

unidad_estatus=ESTATUS,

unidad_nombre=NOMBRE_NUEVO,

 unidad_abreviatura=ABREVIATURA

where unidad_id = ID;

select 1;

ELSE 

select 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO`( IN IDUSUARIO INT, IN CORREONUEVO VARCHAR(100),IN IDROL INT,  in IDPERSONA INT,IN ESTATUS VARCHAR(20))
BEGIN 

DECLARE CANTIDAD INT;

DECLARE CORREOACTUAL VARCHAR(250);

SET @CORREOACTUAL:=(SELECT usuario_email from usuario where usuario_id =IDUSUARIO);

IF  @CORREOACTUAL = CORREONUEVO THEN

UPDATE usuario set 

rol_id =IDROL,

persona_id =IDPERSONA,

usuario_estatus =ESTATUS

where usuario_id =IDUSUARIO;

SELECT 1;

ELSE

SET @CANTIDAD:=(SELECT  COUNT(*) from usuario where usuario_email =CORREONUEVO);

IF @CANTIDAD = 0 THEN 

UPDATE usuario set 

usuario_email=CORREONUEVO,

rol_id =IDROL,

persona_id =IDPERSONA,

usuario_estatus =ESTATUS

where usuario_id =IDUSUARIO;

select 1;

ELSE 

select 2;

END IF;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ABONO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ABONO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ABONO`(IN `IDCOMPRA` INT, IN `CUOTA` INT, 

IN  `FECHA_ABONO` DATE, IN `VALOR_PAGO`  DECIMAL(10,2))
BEGIN

 INSERT INTO `cuentas_x_proveedor`(`idCompra`,`noCuota`,`fecha_pago`,

 `valorAbono`) VALUES 

 (IDCOMPRA,CUOTA,FECHA_ABONO,VALOR_PAGO);

 

 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ABONO_CLIENTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ABONO_CLIENTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ABONO_CLIENTE`(IN `IDVENTA` INT, IN `CUOTA` INT, IN NO_COMPROBANTE VARCHAR(100),

IN  `FECHA_ABONO` DATE, IN `VALOR_PAGO`  DECIMAL(10,2))
BEGIN

 INSERT INTO `cuentas_x_cobrar`(`idventa`,`cuotas_abono`,`no_comprobante`,`fecha`,

 `valor`) VALUES 

 (IDVENTA,CUOTA, NO_COMPROBANTE,FECHA_ABONO,VALOR_PAGO);

 

 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_arl` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_arl` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_arl`(IN NIT_ARL BIGINT(20),IN NOMBRE_ARL VARCHAR(100), IN CIUDAD_ARL  VARCHAR(100),

IN DIRECCION VARCHAR(100), IN TELEFONO_ARL VARCHAR(100),

IN CORREO_ARL VARCHAR(200) )
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM arl WHERE arl.`NitARL`=NIT_ARL);

IF @CANTIDAD = 0 THEN

INSERT INTO arl (`NitARL`, `NomARL`,`CiudadARL`,`DirARL`,`TelARL`,`EmailArl`,

 `estatus`)

VALUES (NIT_ARL,NOMBRE_ARL, CIUDAD_ARL,DIRECCION,TELEFONO_ARL ,CORREO_ARL  ,'ACTIVO');

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_BODEGA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_BODEGA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_BODEGA`(IN `NOMBRE` VARCHAR(50), IN `IDEMPRESA` INT)
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM bodega WHERE `nombre_bodega`=NOMBRE);

IF @CANTIDAD= 0 THEN 

INSERT INTO bodega(`nombre_bodega`,estatus,idempresa)

VALUES (NOMBRE,'ACTIVO',IDEMPRESA);

SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_CARGO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_CARGO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CARGO`(IN `DESCRIPCION` VARCHAR(50), IN IDDEPTO INT)
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM `cargos` WHERE `cargos`.`DescCargos`=DESCRIPCION);

IF @CANTIDAD= 0 THEN 

INSERT INTO cargos(`DescCargos`,`IdDpto`,estatus)

VALUES (DESCRIPCION, IDDEPTO,'ACTIVO');

SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_CATEGORIA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_CATEGORIA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CATEGORIA`(IN NOMBRE VARCHAR(200),IN IDEMPRESA INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM categoria WHERE `categoria_nombre` = NOMBRE);

IF @CANTIDAD = 0 THEN

INSERT INTO categoria (categoria_nombre, categoria_fregistro, categoria_estatus,`idempresa`)

VALUES (NOMBRE,CURDATE(),'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_CIUDADES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_CIUDADES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CIUDADES`(IN NOMBRE VARCHAR(200), IN IDDEPARTAMENTO INT,IN IDEMPRESA INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM ciudades WHERE `nombre_ciudad` = NOMBRE);

IF @CANTIDAD = 0 THEN

INSERT INTO ciudades (nombre_ciudad, idDepto, estatus,`idempresa`)

VALUES (NOMBRE,IDDEPARTAMENTO,'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_CLIENTE2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_CLIENTE2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE2`(IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50), IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(100), IN `IDCIUDAD` INT, IN `IDEMPRESA` INT)
BEGIN

DECLARE  cantidad INT;

SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);

IF @cantidad = 0 THEN

INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,

`persona_nrodocumento`,`persona_tipodocumento`,`persona_sexo`,`persona_telefono`,`persona_direccion`,`persona_correo`,  `persona_fregistro`,

`persona_estatus`, idempresa)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,SEXO,TELEFONO,DIRECCION,CORREO,CURDATE(),'ACTIVO',IDEMPRESA);

INSERT INTO cliente(`cliente_fregistro`,`cliente_estatus`,`persona_id`,idciudad, idempresa) VALUES (CURDATE(),'ACTIVO',LAST_INSERT_ID(),IDCIUDAD,  IDEMPRESA);

SELECT 1;

ELSE 

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_COMPRA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_COMPRA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COMPRA`(IN `IDPROVEEDOR` INT, IN `IDBODEGA` INT, IN `IDUSUARIO` INT, 

IN `TIPO_COMPROBANTE` VARCHAR(50), IN `SERIE_COMPROBANTE` VARCHAR(50), IN `NUM_COMPROBANTE` VARCHAR(50),

 IN `TIPO_PAGO` VARCHAR(50), IN `FECHA_COMPRA` DATE, IN `IMPUESTO` DECIMAL(10,2), IN `TOTAL` DECIMAL(10,2),

  IN `ESTADO` VARCHAR(50), IN `PORCENTAJE` DECIMAL(10,2), IN `DCTO_TOTAL` DECIMAL(10,2), IN FECHA_VENCIMIENTO DATE,IN IDEMPRESA INT)
BEGIN

 INSERT INTO compra(proveedor_id,id_bodega, usuario_id,compra_tipo_comprobante,

 compra_serie_comprobante,compra_num_comprobante,

 compra_tipo_pago,compra_fecha ,

 compra_impuesto,compra_total,compra_estatus,compra_porcentaje,compra_total_decto, `fecha_vencimiento`,`idempresa`) VALUES 

 (IDPROVEEDOR,IDBODEGA,IDUSUARIO,TIPO_COMPROBANTE,SERIE_COMPROBANTE,NUM_COMPROBANTE,

     TIPO_PAGO,FECHA_COMPRA,

   IMPUESTO,TOTAL,ESTADO,PORCENTAJE,DCTO_TOTAL,FECHA_VENCIMIENTO,IDEMPRESA

 );

 SELECT LAST_INSERT_ID();

 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_COMPRA_DETALLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_COMPRA_DETALLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COMPRA_DETALLE`(IN `ID` INT, IN `IDPRODUCTO` INT, IN `CANTIDAD` DECIMAL(10,2), IN `PRECIO` DECIMAL(10,2), IN `DCTO` DECIMAL(10,2))
INSERT INTO `detalle_compra`(`id_compra`,`id_producto`,`dc_cantidad`,`dc_precio`,`dc_descto`,`dc_estatus`)

 VALUES(ID,IDPRODUCTO,CANTIDAD,PRECIO,DCTO,'INGRESADA') */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_CONCEPTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_CONCEPTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CONCEPTO`(IN `NOMBRE` VARCHAR(200), IN `IDEMPRESA` INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM concepto WHERE `descripcion` = NOMBRE);

IF @CANTIDAD = 0 THEN

INSERT INTO concepto (descripcion,  estatus,`idempresa`)

VALUES (NOMBRE,'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_DEPARTAMENTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_DEPARTAMENTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DEPARTAMENTO`(IN `NOMBRE` VARCHAR(200))
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM departamentos WHERE nombre_depto =NOMBRE);

IF @CANTIDAD= 0 THEN 

INSERT INTO departamentos(`nombre_depto`,estatus)

VALUES (NOMBRE,'ACTIVO');

SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_DEPTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_DEPTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DEPTO`(IN `DESCRIPCION` VARCHAR(50))
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM dpto WHERE DescDpto=DESCRIPCION);

IF @CANTIDAD= 0 THEN 

INSERT INTO `dpto`(`DescDpto`,estatus)

VALUES (DESCRIPCION,'ACTIVO');

SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_EMPLEADO2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_EMPLEADO2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_EMPLEADO2`(IN `DOCUMENTO` VARCHAR(50),

 IN `NOMBRE` VARCHAR(150), IN `DIRECCION` VARCHAR(200),

 IN `MOVIL` CHAR(50), IN `CELULAR` CHAR(50), 

 IN `CORREO` VARCHAR(100), IN `FECHANAC` DATE, IN `IDARL` INT, IN `IDEPS` INT, IN `IDPENSION` INT,

    IN `USUARIO` VARCHAR(20), IN `CONTRASENA` VARCHAR(250), IN `ROL` INT)
BEGIN

DECLARE  CANTIDADU INT;

DECLARE CANTIDADME INT;

SET @CANTIDADU :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO);

IF @CANTIDADU = 0 THEN

    SET @CANTIDADME:=(SELECT COUNT(*) FROM `empleados` WHERE `empleados`.`CCEmp` =DOCUMENTO);

    IF @CANTIDADME = 0 THEN

        INSERT INTO usuario(`usuario_nombre`,`usuario_password`, `usuario_intento`,usuario_estatus,

            `rol_id`)

        VALUES(USUARIO,CONTRASENA,0,'INACTIVO',rol);

       INSERT INTO `empleados` (`CCEmp`,`NomEmp`,`DirEmp`,`TelEmp`,

        `CelEmp`, `EmailEmp`, `fecha_nacimiento`,`IdARL`,`IdEPS`,

        `IdPension`,`estatus`,

        usuario_id)

         VALUES(DOCUMENTO,NOMBRE,DIRECCION,MOVIL,CELULAR, CORREO, FECHANAC,IDARL,IDEPS,

        IDPENSION,'ACTIVO',

        (SELECT MAX(usuario_id) FROM usuario));

        SELECT 1;

    ELSE

    SELECT 2;

    END IF;

    ELSE 

    SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_EPS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_EPS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_EPS`(IN `NIT_EPS` BIGINT(20), IN `NOMBRE_EPS` VARCHAR(100), IN `CIUDAD_EPS` VARCHAR(100), IN `DIRECCION` VARCHAR(100), IN `TELEFONO_EPS` VARCHAR(100), IN `CORREO_EPS` VARCHAR(200))
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM eps WHERE `NitEPS`=NIT_EPS);

IF @CANTIDAD = 0 THEN

INSERT INTO eps (`NitEPS`, `NomEPS`,`CiudadEPS`,`DirEPS`,`TelEPS`,`EmailEps`,

 `estatus`)

VALUES (NIT_EPS,NOMBRE_EPS, CIUDAD_EPS,DIRECCION,TELEFONO_EPS ,CORREO_EPS  ,'ACTIVO');

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PENSION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PENSION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PENSION`(IN `NIT_Pension` BIGINT(20), IN `NOMBRE_Pension` VARCHAR(100), IN `CIUDAD_Pension` VARCHAR(100), IN `DIRECCION` VARCHAR(100), IN `TELEFONO_Pension` VARCHAR(100), IN `CORREO_Pension` VARCHAR(200))
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM pension WHERE pension.`NitPension`=NIT_Pension);

IF @CANTIDAD = 0 THEN

INSERT INTO pension (`NitPension`, `NomPension`,`CiudadPension`,`DirPension`,

`TelPension`,`EmailPension`,

 `estatus`)

VALUES (NIT_Pension,NOMBRE_Pension, CIUDAD_Pension,DIRECCION,TELEFONO_Pension ,CORREO_Pension  ,'ACTIVO');

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PERSONA`(IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50), IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50), IN `IDEMPRESA` INT)
BEGIN

DECLARE  cantidad INT;

SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);

IF @cantidad = 0 THEN

INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,

`persona_nrodocumento`,`persona_tipodocumento`,`persona_sexo`,`persona_telefono`,`persona_direccion`,`persona_fregistro`,

`persona_estatus`,idempresa)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,SEXO,TELEFONO,DIRECCION,CURDATE(),'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE 

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN `CODIGO` VARCHAR(100), IN `NOMBRE` VARCHAR(100), IN `PRESENTACION` VARCHAR(250), IN `IDBODEGA` INT, IN `CANTIDAD_MIN` VARCHAR(100), IN `CANTIDAD_INICIAL` VARCHAR(100), IN `IDCATEGORIA` VARCHAR(100), IN `IDUNIDAD` INT, IN `IDTIPO` INT, IN `RUTA` VARCHAR(255), IN `PRECIO_COMPRA` DOUBLE, IN `PRECIO_VENTA` DOUBLE, IN `IDEMPRESA` INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_codigo =CODIGO OR producto_nombre =NOMBRE);

IF @CANTIDAD =0 THEN

INSERT INTO `producto` (`producto_codigo`,`producto_nombre`,`producto_presentacion`,`id_bodega`,

                        cant_minima,`producto_stock`,

	

`id_categoria`, `id_unidad`, `idTipoProducto`, `producto_foto`, `compra`, `producto_precioventa`, 

`producto_estatus`,producto.`idempresa`) VALUES(CODIGO,NOMBRE,PRESENTACION,IDBODEGA, 

CANTIDAD_MIN, CANTIDAD_INICIAL,IDCATEGORIA,IDUNIDAD, IDTIPO,RUTA,PRECIO_COMPRA,  PRECIO_VENTA,'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE 

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PROVEEDOR` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PROVEEDOR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR`(IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50), IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(100), IN `RAZON_SOCIAL` VARCHAR(255), IN `NUM_PROVEEDOR` VARCHAR(255), IN `IDEMPRESA` INT)
BEGIN

DECLARE  cantidad INT;

SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);

IF @cantidad = 0 THEN

INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,

`persona_nrodocumento`,`persona_tipodocumento`,`persona_sexo`,`persona_telefono`,`persona_direccion`,`persona_correo`,   `persona_fregistro`,

`persona_estatus`)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,SEXO,TELEFONO,DIRECCION, CORREO,  CURDATE(),'ACTIVO');

INSERT INTO proveedor(`proveedor_fregistro`,`proveedor_estatus`,`persona_id`,`proveedor_razon_social`,proveedor_num_contacto,`idempresa`) 

VALUES (CURDATE(),'ACTIVO',LAST_INSERT_ID(),RAZON_SOCIAL,NUM_PROVEEDOR,IDEMPRESA);

SELECT 1;

ELSE 

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PROVEEDOR2` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PROVEEDOR2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR2`(IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50), IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(100), IN `RAZON_SOCIAL` VARCHAR(255), IN `NUM_PROVEEDOR` VARCHAR(255), IN `IDCIUDAD` INT, IN `IDEMPRESA` INT)
BEGIN

DECLARE  cantidad INT;

SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);

IF @cantidad = 0 THEN

INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,

`persona_nrodocumento`,`persona_tipodocumento`,`persona_sexo`,`persona_telefono`,`persona_direccion`,`persona_correo`,   `persona_fregistro`,

`persona_estatus`,idempresa)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,SEXO,TELEFONO,DIRECCION, CORREO,  CURDATE(),'ACTIVO',IDEMPRESA);

INSERT INTO  proveedor(`proveedor_fregistro`,`proveedor_estatus`,`persona_id`,`proveedor_razon_social`,proveedor_num_contacto,idciudad, `idempresa`) 

VALUES (CURDATE(),'ACTIVO',LAST_INSERT_ID(),RAZON_SOCIAL,NUM_PROVEEDOR,IDCIUDAD, IDEMPRESA);

SELECT 1;

ELSE 

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ROL`(IN NOMBRE VARCHAR(50),IN IDEMPRESA INT)
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE `rol_nombre`=NOMBRE);

IF @CANTIDAD= 0 THEN 

INSERT INTO rol(`rol_nombre`,rol_fregistro,rol_estatus,`idempresa`)

VALUES (NOMBRE,CURDATE(),'ACTIVO',IDEMPRESA);

SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_TIPO_GASTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_TIPO_GASTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TIPO_GASTO`(IN NOMBRE VARCHAR(200),IN IDEMPRESA INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM tipo_gasto WHERE `descripcion` = NOMBRE);

IF @CANTIDAD = 0 THEN

INSERT INTO tipo_gasto (descripcion,  estatus,`idempresa`)

VALUES (NOMBRE,'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_TIPO_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_TIPO_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TIPO_PRODUCTO`(IN NOMBRE VARCHAR(200),IN IDEMPRESA INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM `tipo_producto` WHERE `tipo_producto` = NOMBRE);

IF @CANTIDAD = 0 THEN

INSERT INTO tipo_producto (tipo_producto,  estatus,`idEmpresa`)

VALUES (NOMBRE,'ACTIVO',IDEMPRESA);

SELECT 1;

ELSE

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_UNIDAD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_UNIDAD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_UNIDAD`(IN `NOMBRE` VARCHAR(50), IN ABREVIATURA CHAR(20),IN IDEMPRESA INT)
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM unidad WHERE unidad_nombre=NOMBRE);

IF @CANTIDAD= 0 THEN 

INSERT INTO unidad(unidad_nombre,unidad_abreviatura,unidad_fregistro,unidad_estatus,`idempresa`)

VALUES (NOMBRE, ABREVIATURA, CURDATE(),'ACTIVO',IDEMPRESA);

SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(100), IN PASS VARCHAR(250), IN CORREO VARCHAR(100),

IN IDROL INT, IN RUTA VARCHAR(255), IN IDPERSONA INT, IN IDEMPRESA INT)
BEGIN 

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre =USUARIO 

OR usuario_email =CORREO);

IF @CANTIDAD =0 THEN

INSERT INTO `usuario` (`usuario_nombre`,`usuario_password`,`usuario_email`, `usuario_intento`, `usuario_estatus`, `rol_id`, 

`usuario_imagen`, `persona_id`,`idempresa`) VALUES(USUARIO,PASS,CORREO,1,'ACTIVO',IDROL,RUTA,IDPERSONA,IDEMPRESA);

SELECT 1;

ELSE 

SELECT 2;

END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_VENTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_VENTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_VENTA`(IN `IDCLIENTE` INT, IN `IDBODEGA` INT, IN `IDUSUARIO` INT, IN `TIPO_COMPROBANTE` VARCHAR(50), IN `SERIE_COMPROBANTE` VARCHAR(50), IN `TIPO_PAGO` VARCHAR(50), IN `IMPUESTO` DECIMAL(10,2), IN `TOTAL` DECIMAL(10,2), IN `ESTADO` VARCHAR(50), IN `PORCENTAJE` DECIMAL(10,2), IN `DCTO_TOTAL` DECIMAL(10,2), IN `FECHA_VENCIMIENTO` DATE, IN `IDEMPRESA` INT, IN `IDCAJA` INT)
BEGIN

 INSERT INTO venta(`cliente_id`,`bodega_id`, usuario_id,`venta_tipocomprobante`,

 `venta_serie`, tipo_pago,`venta_fecha` ,

 `venta_impuesto`,`venta_total`,venta_estatus,venta_porcentaje,venta_total_dcto, `fecha_vencimiento`,`idempresa`,idcaja) VALUES 

 (IDCLIENTE,IDBODEGA,IDUSUARIO,TIPO_COMPROBANTE,SERIE_COMPROBANTE,

     TIPO_PAGO,CURDATE(), IMPUESTO,TOTAL,ESTADO,PORCENTAJE,DCTO_TOTAL,FECHA_VENCIMIENTO,IDEMPRESA,IDCAJA

 );

 SELECT LAST_INSERT_ID();

 END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_VENTA_DETALLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_VENTA_DETALLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_VENTA_DETALLE`(IN `ID` INT, IN `IDPRODUCTO` INT,

IN `CANTIDAD` DECIMAL(10,2), IN `PRECIO` DECIMAL(10,2), IN `DCTO` DECIMAL(10,2))
INSERT INTO `detalle_venta`(`venta_id`,`producto_id`,`dv_cantidad`,`dv_precio`,`dv_descuento`,`dv_estatus`)

 VALUES(ID,IDPRODUCTO,CANTIDAD,PRECIO,DCTO,'INGRESADA') */$$
DELIMITER ;

/* Procedure structure for procedure `SP_TRAER_DATOS_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_TRAER_DATOS_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN ID INT)
SELECT

	u.usuario_id, 	u.usuario_nombre, 

	u.usuario_password, 	u.usuario_email, 

	u.usuario_intento, 	u.usuario_estatus, 

	u.rol_id, 	u.usuario_imagen, 

	r.rol_nombre, 	u.persona_id, 

	p.persona_nombre, 	p.persona_apepat, 

	p.persona_apemat, 	p.persona_nrodocumento, 

	p.persona_tipodocumento, 	p.persona_sexo, 

	p.persona_telefono, 	p.persona_direccion, 

	p.persona_fregistro

FROM

	usuario AS u

	INNER JOIN	rol AS r	ON 		u.rol_id = r.rol_id

	INNER JOIN	persona AS p	ON 		u.persona_id = p.persona_id

	WHERE usuario_id =ID */$$
DELIMITER ;

/* Procedure structure for procedure `SP_VERIFICAR_USUARIO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_VERIFICAR_USUARIO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO varchar(30))
select * from usuario 

where usuario_nombre =USUARIO */$$
DELIMITER ;

/* Procedure structure for procedure `TraerDatosGraficoWidgets` */

/*!50003 DROP PROCEDURE IF EXISTS  `TraerDatosGraficoWidgets` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TraerDatosGraficoWidgets`(IN INICIO DATE,IN FIN DATE)
SELECT `producto`.`producto_nombre`,

    SUM( `detalle_venta`.`dv_cantidad`)

    

FROM

    `detalle_venta`

    INNER JOIN `producto` 

        ON (`detalle_venta`.`producto_id` = `producto`.`producto_id`)

    INNER JOIN `venta` 

        ON (`detalle_venta`.`venta_id` = `venta`.`venta_id`)

        WHERE `venta`.`venta_fecha` BETWEEN INICIO AND FIN

          GROUP BY  `detalle_venta`.`producto_id`

         

          ORDER BY  `dv_cantidad` desc limit 5 */$$
DELIMITER ;

/* Procedure structure for procedure `TraerDatosGrafico_Compras_Widgets` */

/*!50003 DROP PROCEDURE IF EXISTS  `TraerDatosGrafico_Compras_Widgets` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TraerDatosGrafico_Compras_Widgets`(IN `INICIO` DATE, IN `FIN` DATE)
SELECT `producto`.`producto_nombre`,

    SUM( `detalle_compra`.`dc_cantidad`)   as cantidad

FROM

  `detalle_compra`

  INNER JOIN `producto` 

  ON (`detalle_compra`.`id_producto` = `producto`.`producto_id`)

    INNER JOIN `compra` 

   ON (`detalle_compra`.`id_compra` = `compra`.`compra_id`)

    WHERE `compra`.`compra_fecha` BETWEEN INICIO AND FIN

    GROUP BY  `detalle_compra`.`id_producto`

     ORDER BY  `dc_cantidad` DESC LIMIT 5 */$$
DELIMITER ;

/* Procedure structure for procedure `TraerDatosWidgets` */

/*!50003 DROP PROCEDURE IF EXISTS  `TraerDatosWidgets` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TraerDatosWidgets`(IN `INICIO` DATE, IN `FIN` DATE)
SELECT  

IFNULL(SUM(venta.`venta_total`),0),

(SELECT IFNULL(SUM( `compra`.`compra_total`), 0)

 FROM `compra` WHERE `compra_fecha`

BETWEEN INICIO AND FIN),

(SELECT COUNT(*) FROM venta WHERE venta.`venta_fecha` BETWEEN INICIO AND FIN),

(SELECT COUNT(*) FROM compra WHERE compra.`compra_fecha` BETWEEN INICIO AND FIN)

FROM venta

WHERE venta.`venta_fecha` BETWEEN INICIO AND FIN */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
