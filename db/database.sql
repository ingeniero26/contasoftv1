/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.22-MariaDB : Database - sistema_pos_v2_desarrollo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sistema_pos_v2_desarrollo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `sistema_pos_v2_desarrollo`;

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
  `idempresa` int(11) DEFAULT NULL COMMENT 'filtro por empresa',
  PRIMARY KEY (`IdARL`),
  KEY `idempersa` (`idempresa`),
  CONSTRAINT `arl_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `arl` */

insert  into `arl`(`IdARL`,`NitARL`,`NomARL`,`CiudadARL`,`DirARL`,`TelARL`,`EmailArl`,`fregistro`,`estatus`,`idempresa`) values (1,223132,'ARL DE PRUEBA','CARTAGENA','CARTGENA','43545','EMAIL@GMAIL.COM','2022-09-17 16:24:02','ACTIVO',1),(2,32434,'ARL POSITIVA EJEMPLO','EL CARMEN DE BOLIVAR','NO SE DONDE QUEDA','4545454','NOSE1@GMAIL.COM','2022-10-17 16:07:29','ACTIVO',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cargos` */

insert  into `cargos`(`IdCargos`,`DescCargos`,`IdDpto`,`fregistro`,`estatus`) values (1,'INGENIERO DE SISTEMAS',1,'2023-05-24 19:56:27','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`categoria_id`,`categoria_nombre`,`categoria_fregistro`,`categoria_estatus`,`idempresa`) values (1,'Tecnologia','2022-07-13','ACTIVO',1),(2,'Libros','2022-07-13','ACTIVO',1),(3,'Papeleria','2022-08-22','ACTIVO',1),(4,'Servicios','2022-08-22','ACTIVO',1),(5,'Soporte','2023-04-13','ACTIVO',1),(6,'Dulces','2023-05-18','ACTIVO',1);

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

/*Table structure for table `centro_costos` */

DROP TABLE IF EXISTS `centro_costos`;

CREATE TABLE `centro_costos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) DEFAULT NULL,
  `codigo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` enum('ACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `centro_costos_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `centro_costos` */

insert  into `centro_costos`(`id`,`idempresa`,`codigo`,`nombre`,`estatus`,`fregistro`) values (1,1,'1','PRINCIPAL','ACTIVO','2023-08-11 12:55:27');

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idDepto` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idDepto` (`idDepto`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`idDepto`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`nombre_ciudad`,`idDepto`,`estatus`,`fregistro`) values (1,'EL CARMEN DE BOLIVAR',1,'ACTIVO','2022-07-13 15:39:37'),(2,'Cartagena',1,'ACTIVO','2022-09-10 11:00:55'),(3,'San Jacinto',1,'ACTIVO','2022-09-10 12:04:26'),(4,'San Juan Nepomuceno',1,'ACTIVO','2022-09-10 12:04:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idcliente`,`cliente_fregistro`,`cliente_estatus`,`persona_id`,`idciudad`,`idempresa`) values (1,'2022-07-13','ACTIVO',3,1,1),(2,'2022-08-22','ACTIVO',4,1,1),(3,'2022-12-03','ACTIVO',7,1,1),(4,'2022-12-03','ACTIVO',8,3,1),(5,'2023-04-24','ACTIVO',10,1,1),(6,'2023-05-02','ACTIVO',11,3,1),(7,'2023-06-14','ACTIVO',17,4,1),(8,'2023-06-14','ACTIVO',18,4,1),(9,'2023-06-14','ACTIVO',19,2,1);

/*Table structure for table `codeudor` */

DROP TABLE IF EXISTS `codeudor`;

CREATE TABLE `codeudor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_paterno` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido_materno` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_doc` enum('CEDULA','TI','PASAPORTE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `documento` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correo` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_ref1` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_ref2` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_ref1` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_ref2` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dir_ref1` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dir_ref2` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `codeudor_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `codeudor` */

insert  into `codeudor`(`id`,`nombres`,`apellido_paterno`,`apellido_materno`,`tipo_doc`,`documento`,`direccion`,`telefono`,`celular`,`correo`,`nombre_ref1`,`nombre_ref2`,`tel_ref1`,`tel_ref2`,`dir_ref1`,`dir_ref2`,`id_cliente`,`fregistro`,`estatus`) values (1,'KAREN','HERNANDEZ','TORRES','CEDULA','465646','KRA 45','56456','56456','nose@gmail.com','RAMI HERNANDEZ','pedro perez','465465','465878','hjh','k78',3,'2022-12-18 21:16:06','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `compra` */

insert  into `compra`(`compra_id`,`proveedor_id`,`id_bodega`,`usuario_id`,`compra_tipo_comprobante`,`compra_serie_comprobante`,`compra_num_comprobante`,`compra_tipo_pago`,`compra_fecha`,`compra_impuesto`,`compra_total`,`compra_estatus`,`compra_porcentaje`,`compra_total_decto`,`fecha_vencimiento`,`idempresa`) values (1,1,1,1,'FACTURA','fc','78978','CONTADO','0000-00-00',6897.00,43197.00,'CANCELADA',0.19,0.00,'0000-00-00',1);

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

/*Table structure for table `cuentas` */

DROP TABLE IF EXISTS `cuentas`;

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concepto_nit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usa_bancos` int(11) DEFAULT NULL,
  `usa_base` int(11) DEFAULT NULL,
  `usa_centros` int(11) DEFAULT NULL,
  `usa_nit` int(11) DEFAULT NULL,
  `usa_anticipo` int(11) DEFAULT NULL,
  `categoria` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clase` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idEmpresa` (`idEmpresa`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cuentas` */

insert  into `cuentas`(`id`,`idEmpresa`,`codigo`,`concepto_nit`,`nombre`,`tipo`,`usa_bancos`,`usa_base`,`usa_centros`,`usa_nit`,`usa_anticipo`,`categoria`,`clase`,`nivel`,`fregistro`,`estatus`) values (1,1,'1',NULL,'ACTIVO','CLASE',0,0,0,0,0,'','',0,'2023-07-27 15:47:45','ACTIVO'),(3,1,'11','','DISPONIBLE','GRUPO',0,0,0,0,0,'','',0,'2023-07-27 16:02:42','ACTIVO'),(4,1,'1105','','CAJA',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-08-01 00:00:00','ACTIVO'),(5,1,'110505','','CAJA GENERAL','CUENTA DE DETALLE',0,1,0,0,0,'','',0,'2023-08-08 08:25:13','ACTIVO'),(6,1,'110510 ','','CAJAS MENORES  ','CUENTA DE DETALLE',0,1,0,0,0,'','',0,'2023-08-08 00:00:00','ACTIVO'),(7,1,'110515','','MONEDA EXTRANJERA','CUENTA DE DETALLE',0,1,0,0,0,'','',0,'2023-08-08 08:25:21','ACTIVO'),(8,1,'1110','','BANCOS',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-08-08 00:00:00','ACTIVO'),(9,1,'111005              ','','MONEDA NACIONAL','CUENTA DE DETALLE',0,1,0,0,0,'','',0,'2023-08-08 00:00:00','ACTIVO'),(10,1,'111010','','MONEDA EXTRANJERA','CUENTA DE DETALLE',0,1,0,0,0,'','',0,'2023-08-13 00:00:00','ACTIVO'),(11,1,'1115 ','','REMESAS EN TRANSITO',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-08-13 00:00:00','ACTIVO'),(12,1,'1120','','CUENTAS DE AHORRO',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-08-13 00:00:00','ACTIVO'),(13,1,'112005','','BANCOS','CUENTA DE DETALLE',0,1,0,0,0,'','',0,'2023-08-13 00:00:00','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id`,`nombre_depto`,`estatus`,`fregistro`,`idempresa`) values (1,'Bolivar','ACTIVO','2022-09-23 19:25:59',1),(2,'Sucre','ACTIVO','2022-09-23 19:26:00',1),(3,'Cordoba','ACTIVO','2022-09-23 19:26:01',1),(4,'Atlantico','ACTIVO','2022-09-23 19:26:02',1),(5,'Cesar','ACTIVO','2022-09-23 19:26:03',1),(6,'Magdalena','ACTIVO','2022-09-23 19:26:04',1),(7,'Antioquia','ACTIVO','2022-09-23 19:26:09',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_compra` */

insert  into `detalle_compra`(`detalle_compra_id`,`id_compra`,`id_producto`,`dc_cantidad`,`dc_precio`,`dc_descto`,`dc_estatus`) values (1,1,12,30,10,0,'INGRESADA'),(2,1,2,30,1200,0,'INGRESADA');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_venta` */

insert  into `detalle_venta`(`detalle_venta_id`,`venta_id`,`producto_id`,`dv_cantidad`,`dv_precio`,`dv_descuento`,`dv_estatus`) values (1,1,2,3.00,4500.00,0.00,'INGRESADA'),(2,2,4,1.00,4000.00,0.00,'INGRESADA');

/*Table structure for table `dpto` */

DROP TABLE IF EXISTS `dpto`;

CREATE TABLE `dpto` (
  `IdDpto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del area al que pertenece',
  `DescDpto` varchar(60) NOT NULL COMMENT 'Descripcion del departamento donde labora',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdDpto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `dpto` */

insert  into `dpto`(`IdDpto`,`DescDpto`,`fregistro`,`estatus`) values (1,'SISTEMA','2022-09-26 20:55:41','ACTIVO');

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
  `id_tipo_contrato` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEmp`),
  UNIQUE KEY `CCEmp` (`CCEmp`),
  UNIQUE KEY `EmailEmp` (`EmailEmp`),
  KEY `IdARL` (`IdARL`),
  KEY `IdEPS` (`IdEPS`),
  KEY `IdPension` (`IdPension`),
  KEY `usuario_id` (`usuario_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`IdARL`) REFERENCES `arl` (`IdARL`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`IdEPS`) REFERENCES `eps` (`IdEPS`),
  CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`IdPension`) REFERENCES `pension` (`IdPension`),
  CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `empleados_ibfk_6` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `empleados` */

insert  into `empleados`(`IdEmp`,`CCEmp`,`NomEmp`,`DirEmp`,`TelEmp`,`CelEmp`,`EmailEmp`,`fecha_nacimiento`,`IdARL`,`IdEPS`,`IdPension`,`id_tipo_contrato`,`fecha_ingreso`,`fregistro`,`estatus`,`idempresa`,`usuario_id`) values (1,1070813753,'JERSON BATISTA','EL CARMEN','132132','1321','INFO@GMAIL.COM','1989-05-26',1,1,1,NULL,NULL,'2022-09-23 18:41:24','ACTIVO',1,1);

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
  `id_tipo_regimen` int(11) DEFAULT NULL,
  `idCiudad` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_tipo_regimen` (`id_tipo_regimen`),
  KEY `idCiudad` (`idCiudad`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_tipo_regimen`) REFERENCES `tipo_regimen` (`id`),
  CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `empresa` */

insert  into `empresa`(`ID`,`Nit`,`nombre`,`Representante`,`Direccion`,`Telefono`,`Correo`,`Logo`,`id_tipo_regimen`,`idCiudad`,`fregistro`,`estatus`) values (1,'1070813753','JKSYSTEMAS','JERSON BATISTA','MONTE CARMELO','3013794981','INGJERSON2014@GMAIL.COM','controlador/empresa/img/IMG22820221557.jpg',2,1,'2023-05-11 11:41:14','ACTIVO');

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
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEPS`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `eps_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `eps` */

insert  into `eps`(`IdEPS`,`NitEPS`,`NomEPS`,`CiudadEPS`,`DirEPS`,`TelEPS`,`EmailEps`,`fregistro`,`estatus`,`idempresa`) values (1,2313232,'EPS PRUEBA','CARMEN DE BOL','CALLE 25','654654','PRUEBA@GMAIL.COM','2022-09-18 17:15:12','ACTIVO',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gastos` */

insert  into `gastos`(`idGasto`,`idtipo_gasto`,`fecha_gasto`,`valor`,`recibo`,`idcaja`,`observaciones`,`fregistro`,`estatus`,`idusuario`,`idempresa`,`estado`) values (1,3,'2023-05-23',119600,'001',1,'','2023-05-23 11:20:03','ACTIVO',1,1,'CANCELADA');

/*Table structure for table `iva` */

DROP TABLE IF EXISTS `iva`;

CREATE TABLE `iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tarifa` double DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `iva` */

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT 'ACTIVO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `marcas` */

insert  into `marcas`(`id`,`descripcion`,`estatus`,`fregistro`,`idempresa`) values (1,'HP','ACTIVO','2023-03-31 19:01:55',1),(2,'MARCA GENERAL','ACTIVO','2023-04-10 09:13:39',1),(3,'ACCER','ACTIVO','2023-04-10 08:33:54',1);

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
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPension`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `pension_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `pension` */

insert  into `pension`(`IdPension`,`NitPension`,`NomPension`,`CiudadPension`,`DirPension`,`TelPension`,`EmailPension`,`fregistro`,`estatus`,`idempresa`) values (1,5465655,'PRUEBA PENSION','CARMEN DE BOLIVAR','KRA 45','4654654','PRUEBA@GMAIL.COM','2022-09-18 17:33:26','ACTIVO',1);

/*Table structure for table `persona` */

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `persona_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_apepat` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_apemat` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_contribuyente` enum('Persona Natural','Persona Juridica') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_nrodocumento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_tipodocumento` enum('CEDULA','NIT','PASAPORTE','TI') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_direccion` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_correo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_fregistro` date DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `id_tipo_tercero` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`persona_id`),
  KEY `idempresa` (`idempresa`),
  KEY `id_tipo_tercero` (`id_tipo_tercero`),
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`id_tipo_tercero`) REFERENCES `tipo_tercero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `persona` */

insert  into `persona`(`persona_id`,`persona_nombre`,`persona_apepat`,`persona_apemat`,`tipo_contribuyente`,`persona_nrodocumento`,`persona_tipodocumento`,`persona_telefono`,`persona_direccion`,`persona_correo`,`persona_fregistro`,`persona_estatus`,`idempresa`,`id_tipo_tercero`,`estatus`,`fregistro`) values (1,'JERSON','BATISTA','VEGA','Persona Natural','1070813753','CEDULA','30045454545','el centro','ingjerson@gmail.com','2022-07-13','ACTIVO',1,1,'ACTIVO','2023-03-10 18:56:43'),(2,'PROVEEDOR','DE MOSTRADOR','MOSTRADOR','Persona Natural','000000001','NIT','011111111','EL CENTRO','info@gmail.com','2022-07-13','ACTIVO',1,1,'ACTIVO','2023-06-14 16:58:42'),(3,'CLIENTE','DE ','MOSTRADOR','Persona Natural','000000000001','CEDULA','56456456','EL CENTRO','DEPRUEBA@GMAIL.COM','2022-07-13','ACTIVO',1,3,'ACTIVO','2023-03-10 18:57:23'),(4,'AGROPECUARIA','CAÑA ','FLECHA','Persona Juridica','900312662','NIT','3013794981','EL CARMEN DE BOLIVAR','info20221@gmail.com','2022-08-22','ACTIVO',1,1,'ACTIVO','2023-06-14 15:40:56'),(6,'PRUEBAS','PRUEBA','PRUEBA','Persona Juridica','55646456','CEDULA','56757','EL CENTRO','jerson564564@gmail.com','2022-11-05','ACTIVO',1,5,'ACTIVO','2023-03-10 18:57:29'),(7,'JUAN','PEDRO','PEDRO','Persona Juridica','465465','CEDULA','3013794981','EL CARMEN DE BOLIVAR','unitec13213@gmail.com','2022-12-03','ACTIVO',1,3,'ACTIVO','2023-04-24 20:03:58'),(8,'PRUEBAS','PRUEBA','PRUEBA','Persona Juridica','4534534','CEDULA','56757','MONTE CARMELO','jerson@gmail.com','2022-12-03','ACTIVO',1,3,NULL,'2023-04-24 20:04:02'),(9,'PRUEBAS','PRUEBA','PRUEBA','Persona Natural','675675','NIT','3013794981','EL CARMEN DE BOLIVAR','jerson2@gmail.com','2023-04-24','ACTIVO',1,1,NULL,'2023-04-24 13:20:31'),(10,'JAMEZ','RODRIGUEZ','UNICARMEN','Persona Natural','56456456','NIT','3226165766','kra 45','unitec12165662@gmail.com','2023-04-24','ACTIVO',1,1,NULL,'2023-06-14 16:51:17'),(11,'UNICARMEN','PRUEBA','PRUEBA','Persona Natural','1','NIT','3226165766','3423423424234','unitec121212@gmail.com','2023-05-02','ACTIVO',1,1,NULL,'2023-06-14 16:51:18'),(12,'JAMEZ','RODRIGUEZ','VEGA','Persona Natural','78678678','NIT','3226165766','EL CARMEN DE BOLIVAR','jamez@hotmail.com','2023-05-24','ACTIVO',1,2,NULL,'2023-06-14 17:15:33'),(13,'SIIGO','PRUEBAS','PRUEBA','Persona Natural','6465465','NIT','3013794981','SIIGO@GMAIL.COM','jersonsiigo@gmail.com','2023-06-14','ACTIVO',1,1,NULL,'2023-06-14 16:59:46'),(16,'JUAN','GUILLERMO','cuadrado','Persona Natural','87896666','NIT','3013794981','MONTE CARMELO','juanguillermo@gmail.com','2023-06-14','ACTIVO',1,2,NULL,'2023-06-14 19:31:47'),(17,'federico','RODRIGUEZ','FLECHA','Persona Natural','6756756756','CEDULA','75675','EL CARMEN','unitec15656456@gmail.com','2023-06-14','ACTIVO',1,NULL,NULL,'2023-06-14 18:47:22'),(18,'PEDRO','BATISTA','VILLEGAS','Persona Natural','6657567567567','CEDULA','75675','kra 45','pedrobatista@gmail.com','2023-06-14','ACTIVO',1,2,NULL,'2023-06-14 19:20:49'),(19,'DENIS','BATISTA','ARROYO','Persona Natural','67567567','CEDULA','675675','MONTE CARMELO','DENISBATISTA@GMAIL.COM','2023-06-14','ACTIVO',1,3,NULL,'2023-06-14 19:29:56'),(20,'DENIS','BATISTA','ARROYO','Persona Natural','789654111','NIT','3013794981','EL CENTRO','denis2023@gmail.com','2023-08-16','ACTIVO',1,2,NULL,'2023-08-16 07:06:19');

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
  `id_marca` int(11) DEFAULT NULL,
  `producto_foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `producto_precioventa` decimal(10,2) DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  UNIQUE KEY `codigo` (`producto_codigo`),
  KEY `id_unidad` (`id_unidad`),
  KEY `producto_ibfk_1` (`id_categoria`),
  KEY `id_bodega` (`id_bodega`),
  KEY `idempresa` (`idempresa`),
  KEY `idTipoProducto` (`idTipoProducto`),
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`unidad_id`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`),
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipo_producto` (`id`),
  CONSTRAINT `producto_ibfk_6` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `producto` */

insert  into `producto`(`producto_id`,`producto_codigo`,`producto_nombre`,`producto_presentacion`,`id_bodega`,`cant_minima`,`producto_stock`,`id_categoria`,`id_unidad`,`idTipoProducto`,`id_marca`,`producto_foto`,`compra`,`producto_precioventa`,`producto_estatus`,`fregistro`,`idempresa`) values (1,'9789588464466','AMALIA JOSE MARMOL(1)','ADITORIAL ATENEA',1,'1','1',2,1,1,1,'controlador/productos/img/default.png',3000.00,4500.00,'ACTIVO','2023-05-21 13:34:35',1),(2,'9789589761694','ALICIA EN EL PAIS DE LAS MARAVILLAS(2)','ATENEA',1,'1','27',2,1,1,1,'controlador/productos/img/default.png',3000.00,4500.00,'ACTIVO','2023-08-07 13:54:12',1),(3,'9789587230321','APOLOGIA DESOCRATES(3)','SKLA EDITORIAL',1,'1','0',2,1,1,1,'controlador/productos/img/default.png',4000.00,5000.00,'ACTIVO','2023-05-21 13:34:53',1),(4,'9789589825785','AZUL RUBEN DARIO(4)','ATENEA',1,'1','5',2,1,1,1,'controlador/productos/img/default.png',3000.00,4000.00,'ACTIVO','2023-08-07 13:55:35',1),(5,'9789585783010','BAJO LA MISMA ESTRELLA(5)','NUBE DE TINTA',1,'1','3',2,1,1,1,'controlador/productos/img/default.png',14000.00,17000.00,'ACTIVO','2023-05-21 13:35:05',1),(6,'9789588464282','BODAS DE SANGRE(6)','ATENEA',1,'1','7',2,1,1,1,'controlador/productos/img/default.png',3000.00,4000.00,'ACTIVO','2023-05-21 13:35:08',1),(7,'7707187092929','CARTA AL PADRE(7)','UNION',1,'1','9',2,1,1,1,'controlador/productos/img/default.png',3000.00,4000.00,'ACTIVO','2023-05-21 13:35:11',1),(8,'00003','COPIAS BLANCO Y NEGRO','COPIAS',1,'10','324',4,1,1,1,'controlador/productos/img/default.png',100.00,300.00,'ACTIVO','2023-06-08 12:04:13',1),(9,'0004','IMPRESIONES BLANCO Y NEGRO','NEGRO',1,'10','303',4,1,1,1,'controlador/productos/img/default.png',400.00,600.00,'ACTIVO','2023-06-08 12:04:13',1),(10,'0006','IMPRESIONES A COLOR','GEN',1,'10','487',4,1,1,NULL,'controlador/productos/img/default.png',300.00,1500.00,'ACTIVO','2023-06-15 09:05:33',1),(11,'7700394','LIBRETA DE 100 HOJAS','FAMA',1,'1','4',3,1,1,NULL,'controlador/productos/img/default.png',2000.00,3000.00,'ACTIVO','2023-05-21 13:35:25',1),(12,'4534','pruebas','general',1,'1','35',1,1,1,1,'controlador/productos/img/default.png',5.00,55.00,'ACTIVO','2023-08-07 13:53:43',1),(13,'10003','CARTULINAS','general',1,'10','4',3,1,1,2,'controlador/productos/img/default.png',1500.00,1800.00,'ACTIVO','2023-05-21 13:35:34',1),(14,'1000004','DULCES  TRULULU','general',1,'1','5',6,1,1,2,'controlador/productos/img/default.png',100.00,200.00,'ACTIVO','2023-05-21 13:35:37',1),(15,'1000002','1/8 CARTULINA BLANCO','general',1,'5','9',3,1,1,2,'controlador/productos/img/default.png',400.00,500.00,'ACTIVO','2023-05-22 13:48:57',1),(16,'7707294371795','CUADERNO COSIDO DE 100 HOJAS RAYADO','FAMA',1,'1','1',3,1,1,2,'controlador/productos/img/default.png',2500.00,3500.00,'ACTIVO','2023-05-31 08:17:32',1),(17,'0123655','CARPETA DE HOJA DE VIDA','general',1,'1','8',3,1,1,2,'controlador/productos/img/default.png',800.00,1000.00,'ACTIVO','2023-05-29 13:50:57',1),(18,'2300001','CARPETA OFICIO','general',1,'1','4',3,1,1,2,'controlador/productos/img/default.png',2500.00,3000.00,'ACTIVO','2023-06-05 20:24:51',1),(19,'2300002','EXACTO','general',1,'1','2',3,1,1,2,'controlador/productos/img/default.png',800.00,1000.00,'ACTIVO','2023-06-05 20:24:50',1),(20,'7800001','LAPICERO NEGRO','NORMA',1,'1','4',3,1,1,2,'controlador/productos/img/default.png',600.00,800.00,'ACTIVO','2023-06-06 15:33:43',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `proveedor` */

insert  into `proveedor`(`proveedor_id`,`proveedor_fregistro`,`proveedor_num_contacto`,`proveedor_estatus`,`persona_id`,`proveedor_razon_social`,`idciudad`,`idempresa`) values (1,'2022-07-13','000001','ACTIVO',2,'MOSTRADOR ',1,1),(2,'2023-04-24','67567567','ACTIVO',9,'probando ando ANDO',1,1),(3,'2023-05-24','45435345','ACTIVO',12,'JAMEZ PROBANDO',2,1),(4,'2023-06-14','67567567','ACTIVO',13,'SIIGO PRUEBAS',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rol` */

insert  into `rol`(`rol_id`,`rol_nombre`,`rol_fregistro`,`rol_estatus`,`idempresa`) values (1,'Administrador','2022-07-13','ACTIVO',1),(2,'Empleado','2022-09-23','ACTIVO',1),(3,'Test','2022-09-23','ACTIVO',1);

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

/*Table structure for table `tipo_contrato` */

DROP TABLE IF EXISTS `tipo_contrato`;

CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_contrato` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_gasto` */

insert  into `tipo_gasto`(`id`,`descripcion`,`fregistro`,`estatus`,`idempresa`) values (2,'PAGO SERVICIOS','2023-05-08 16:52:32','ACTIVO',1),(3,'SERVICIO DE ENERGIA','2023-05-23 11:19:34','ACTIVO',1);

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

/*Table structure for table `tipo_regimen` */

DROP TABLE IF EXISTS `tipo_regimen`;

CREATE TABLE `tipo_regimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_regimen` */

insert  into `tipo_regimen`(`id`,`descripcion`,`estatus`,`fregistro`) values (1,'Simplificado','ACTIVO','2023-05-08 16:49:07'),(2,'Comun','ACTIVO','2023-05-08 16:49:13'),(3,'Otro','ACTIVO','2023-05-08 16:49:21');

/*Table structure for table `tipo_tercero` */

DROP TABLE IF EXISTS `tipo_tercero`;

CREATE TABLE `tipo_tercero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `tipo_tercero_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_tercero` */

insert  into `tipo_tercero`(`id`,`tipo`,`idempresa`) values (1,'PROVEEDOR',1),(2,'CLIENTE',1),(3,'CODEUDOR',1),(4,'EMPRESA',1),(5,'EMPLEADO',1);

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

insert  into `venta`(`venta_id`,`cliente_id`,`bodega_id`,`usuario_id`,`venta_tipocomprobante`,`venta_serie`,`venta_numcomprobante`,`tipo_pago`,`venta_fecha`,`venta_impuesto`,`venta_total`,`venta_estatus`,`venta_porcentaje`,`venta_total_dcto`,`fecha_vencimiento`,`idempresa`,`idcaja`) values (1,1,1,1,'TICKET','FV',NULL,'CONTADO','2023-08-07',0.00,13500.00,'REGISTRADA',0.00,0.00,'2023-08-07',1,1),(2,1,1,1,'TICKET','FV',NULL,'CONTADO','2023-08-07',0.00,4000.00,'REGISTRADA',0.00,0.00,'2023-08-07',1,1);

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

/* Procedure structure for procedure `SP_LISTAR_PENSION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_PENSION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PENSION`(IN IDEMPRESA INT)
SELECT
    `IdPension`
    , `NitPension`
    , `NomPension`
    , `CiudadPension`
    , `DirPension`
    , `TelPension`
    , `EmailPension`
    , `fregistro`
    , `estatus`
    , `idempresa`
FROM
    `pension`
    where pension.`idempresa` = 1 */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_CUENTA_CONTABLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_CUENTA_CONTABLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CUENTA_CONTABLE`(IN `IDCUENTA` INT, IN `CODIGO_ACTUAL` VARCHAR(250), IN `CODIGO_NUEVO` VARCHAR(250), IN `NIT_CUENTA` VARCHAR(100), IN `CUENTA_NOMBRE` VARCHAR(100), IN `TIPO_CUENTA` VARCHAR(100), IN `CUENTA_BANCO` INT, IN `CUENTA_BASE` INT, IN `CUENTA_CENTRO` INT, IN `CUENTA_NIT` INT, IN `ANTICIPO_CUENTA` INT, IN `CATEGORIA_CUENTA` VARCHAR(100), IN `CLASE_CUENTA` VARCHAR(100), IN `NIVEL_CUENTA` INT)
BEGIN
DECLARE CANTIDAD INT;
IF CODIGO_ACTUAL = CODIGO_NUEVO THEN
	UPDATE cuentas SET
	categoria=CATEGORIA_CUENTA,
	clase=CLASE_CUENTA,
	nivel=NIVEL_CUENTA
	WHERE id = IDCUENTA;
SELECT 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM cuentas WHERE nombre=CUENTA_NOMBRE);
IF  @CANTIDAD = 0 THEN
UPDATE cuentas SET
nombre=CUENTA_NOMBRE,
codigo=CODIGO_NUEVO,
`concepto_nit`=NIT_CUENTA,
nombre=CUENTA_NOMBRE,
tipo=TIPO_CUENTA,
usa_bancos=CUENTA_BANCO,
usa_base=CUENTA_BASE,
usa_centros=CUENTA_CENTRO,
usa_nit=CUENTA_NIT,
usa_anticipo=ANTICIPO_CUENTA,
categoria=CATEGORIA_CUENTA,
clase=CLASE_CUENTA,
nivel=NIVEL_CUENTA
WHERE id = IDCUENTA;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;
END */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_CUENTA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_CUENTA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_CUENTA`(IN `CUENTA_ID` INT, IN `ESTATUS_CUENTA` VARCHAR(20))
UPDATE cuentas SET 
estatus = ESTATUS_CUENTA 
WHERE id = CUENTA_ID */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_MARCA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_MARCA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_MARCA`(IN IDMARCA INT,
    IN ESTATUS VARCHAR(20))
UPDATE marcas SET 
estatus = ESTATUS 
WHERE id = IDMARCA */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_MARCA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_MARCA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_MARCA`(IN `IDMARCA` INT, IN `DESC_ACTUAL` VARCHAR(250), IN `DESC_NUEVO` VARCHAR(250), IN `ESTATUS_MARCA` VARCHAR(15))
BEGIN
DECLARE CANTIDAD INT;
IF DESC_ACTUAL = DESC_NUEVO THEN
	UPDATE marcas SET
	estatus=ESTATUS_MARCA
	WHERE id = ID;
SELECT 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM marcas WHERE descripcion=DESC_NUEVO);
IF  @CANTIDAD = 0 THEN
UPDATE marcas SET
estatus=ESTATUS_MARCA,
descripcion=DESC_NUEVO
WHERE id = IDMARCA;
SELECT 1;
ELSE 
SELECT 2;
END IF;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_MODIFICAR_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PERSONA`(IN `IDPERSONA` INT, IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50),
IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO_ACTUAL` VARCHAR(50), IN `NRO_DOCUMENTO_NUEVO` VARCHAR(50),
 IN `TIPO_DOC` VARCHAR(50),  IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50),IN CORREO VARCHAR(100), IN `ESTATUS` VARCHAR(20))
BEGIN
DECLARE CANTIDAD INT;
IF NRO_DOCUMENTO_ACTUAL= NRO_DOCUMENTO_NUEVO THEN
		UPDATE persona SET 
		persona_nombre= NOMBRE,`persona_apepat`=APEPAT,`persona_apemat`=APEMAT,
		`persona_tipodocumento`=TIPO_DOC,`persona_telefono`=TELEFONO,
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
		`persona_tipodocumento`=TIPO_DOC,`persona_telefono`=TELEFONO,
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
IN CORREO_ARL VARCHAR(200), IN IDEMPRESA INT )
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM arl WHERE arl.`NitARL`=NIT_ARL);
IF @CANTIDAD = 0 THEN
INSERT INTO arl (`NitARL`, `NomARL`,`CiudadARL`,`DirARL`,`TelARL`,`EmailArl`,
 `estatus`, `idempresa`)
VALUES (NIT_ARL,NOMBRE_ARL, CIUDAD_ARL,DIRECCION,TELEFONO_ARL ,CORREO_ARL  ,'ACTIVO',IDEMPRESA);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE2`(IN `NOMBRE` VARCHAR(50), 
IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50), 
IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50),IN TIPO_CONTRIBUYENTE VARCHAR(100),
 IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(100),
  IN `IDCIUDAD` INT, IN `IDEMPRESA` INT, IN IDTIPO_TERCERO INT)
BEGIN
DECLARE  cantidad INT;
SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);
IF @cantidad = 0 THEN
INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,
`persona_nrodocumento`,`persona_tipodocumento`,`tipo_contribuyente`, `persona_telefono`,`persona_direccion`,`persona_correo`,  `persona_fregistro`,
`persona_estatus`, idempresa,`id_tipo_tercero`)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,TIPO_CONTRIBUYENTE,TELEFONO,DIRECCION,CORREO,CURDATE(),'ACTIVO',IDEMPRESA,IDTIPO_TERCERO );
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

/* Procedure structure for procedure `SP_REGISTRAR_CUENTA_CONTABLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_CUENTA_CONTABLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CUENTA_CONTABLE`(IN IDEMPRESA INT,IN COD_CUENTA VARCHAR(30),
IN CONCEPTO_NIT VARCHAR(30), IN NOMBRE_CUENTA VARCHAR(100),IN TIPO VARCHAR(30),
IN USA_BANCOS_C  INT, IN USA_BASE_C INT,IN USA_CENTRO_C INT,IN USA_NIT_C INT,
IN USA_ANTICIPO_C INT,IN CATEGORIA VARCHAR(130), IN CLASE VARCHAR(100),
IN NIVEL INT)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM cuentas WHERE `codigo` = COD_CUENTA);
IF @CANTIDAD = 0 THEN
INSERT INTO `cuentas` (`idEmpresa`,`codigo`,concepto_nit,nombre,
tipo,usa_bancos,usa_base,usa_centros,usa_nit,usa_anticipo,categoria,clase,nivel,
 fregistro,estatus)
VALUES (IDEMPRESA,COD_CUENTA,CONCEPTO_NIT,NOMBRE_CUENTA,TIPO, USA_BANCOS_C  , USA_BASE_C , USA_CENTRO_C , USA_NIT_C ,
 USA_ANTICIPO_C , CATEGORIA ,  CLASE , NIVEL ,CURDATE(),'ACTIVO');
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

/* Procedure structure for procedure `SP_REGISTRAR_MARCAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_MARCAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_MARCAS`(IN DESCP VARCHAR(200),IN IDEMPRESA INT)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM marcas WHERE `descripcion` = DESCP);
IF @CANTIDAD = 0 THEN
INSERT INTO marcas (descripcion, fregistro, estatus,`idempresa`)
VALUES (DESCP,CURDATE(),'ACTIVO',IDEMPRESA);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PERSONA`(IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50),
 IN `TIPO_CONT` VARCHAR(50), IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50),
  IN `TELEFONO` VARCHAR(50), IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(250), IN `IDEMPRESA` INT, IN IDTIPO_TERCERO INT)
BEGIN
DECLARE  cantidad INT;
SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);
IF @cantidad = 0 THEN
INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,`tipo_contribuyente`,
`persona_nrodocumento`,`persona_tipodocumento`,`persona_telefono`,`persona_direccion`, `persona_correo`, `persona_fregistro`,
`persona_estatus`,idempresa, `id_tipo_tercero`)VALUES (NOMBRE,APEPAT,APEMAT,TIPO_CONT,NRO_DOCUMENTO,TIPO_DOC,TELEFONO,DIRECCION,CORREO, CURDATE(),'ACTIVO',IDEMPRESA,IDTIPO_TERCERO);
SELECT 1;
ELSE 
SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_PRODUCTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_PRODUCTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN `CODIGO` VARCHAR(100),
 IN `NOMBRE` VARCHAR(100), 
 IN `PRESENTACION` VARCHAR(250),
  IN `IDBODEGA` INT, IN `CANTIDAD_MIN` VARCHAR(100),
   IN `CANTIDAD_INICIAL` VARCHAR(100),
    IN `IDCATEGORIA` VARCHAR(100), 
    IN `IDUNIDAD` INT, IN `IDTIPO` INT, IN IDMARCA INT,
    IN `RUTA` VARCHAR(255), IN `PRECIO_COMPRA` DOUBLE, IN `PRECIO_VENTA` DOUBLE, IN `IDEMPRESA` INT)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_codigo =CODIGO OR producto_nombre =NOMBRE);
IF @CANTIDAD =0 THEN
INSERT INTO `producto` (`producto_codigo`,`producto_nombre`,`producto_presentacion`,`id_bodega`,
                        cant_minima,`producto_stock`,
	
`id_categoria`, `id_unidad`, `idTipoProducto`,`id_marca`, `producto_foto`, `compra`, `producto_precioventa`, 
`producto_estatus`,producto.`idempresa`) VALUES(CODIGO,NOMBRE,PRESENTACION,IDBODEGA, 
CANTIDAD_MIN, CANTIDAD_INICIAL,IDCATEGORIA,IDUNIDAD, IDTIPO,IDMARCA,RUTA,PRECIO_COMPRA,  PRECIO_VENTA,'ACTIVO',IDEMPRESA);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR2`(IN `NOMBRE` VARCHAR(50),
 IN `APEPAT` VARCHAR(50), IN `APEMAT` VARCHAR(50),
  IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50),
  IN TIPO_CONTRIBUYENTE VARCHAR(100),
   IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50),
    IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(100),
     IN `RAZON_SOCIAL` VARCHAR(255), IN `NUM_PROVEEDOR` VARCHAR(255),
      IN `IDCIUDAD` INT, IN `IDEMPRESA` INT, IN IDTIPO_TERCERO INT)
BEGIN
DECLARE  cantidad INT;
SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);
IF @cantidad = 0 THEN
INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,
`persona_nrodocumento`,`persona_tipodocumento`,`tipo_contribuyente`, `persona_sexo`,`persona_telefono`,
`persona_direccion`,`persona_correo`,   `persona_fregistro`,
`persona_estatus`,idempresa, `id_tipo_tercero`)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,
TIPO_CONTRIBUYENTE,SEXO,TELEFONO,DIRECCION, CORREO,  CURDATE(),'ACTIVO',IDEMPRESA,IDTIPO_TERCERO);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN `ID` INT)
SELECT
	u.usuario_id, 	u.usuario_nombre, 
	u.usuario_password, 	u.usuario_email, 
	u.usuario_intento, 	u.usuario_estatus, 
	u.rol_id, 	u.usuario_imagen, 
	r.rol_nombre, 	u.persona_id, 
	p.persona_nombre, 	p.persona_apepat, 
	p.persona_apemat, 	p.persona_nrodocumento, 
	p.persona_tipodocumento,
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
