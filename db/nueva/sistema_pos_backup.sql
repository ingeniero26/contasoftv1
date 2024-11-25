/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - sistema_pos_v2_desarrollo
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `arl` */

insert  into `arl`(`IdARL`,`NitARL`,`NomARL`,`CiudadARL`,`DirARL`,`TelARL`,`EmailArl`,`fregistro`,`estatus`,`idempresa`) values (1,223132,'ARL DE PRUEBA','CARTAGENA','CARTGENA','43545','EMAIL@GMAIL.COM','2022-09-17 09:24:02','ACTIVO',1),(2,32434,'ARL POSITIVA EJEMPLO','EL CARMEN DE BOLIVAR','NO SE DONDE QUEDA','4545454','NOSE1@GMAIL.COM','2022-10-17 09:07:29','ACTIVO',1);

/*Table structure for table `arqueo_caja` */

DROP TABLE IF EXISTS `arqueo_caja`;

CREATE TABLE `arqueo_caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `monto_apertura` float DEFAULT NULL,
  `ingresos` float DEFAULT NULL,
  `devoluciones` float DEFAULT NULL,
  `gastos` float DEFAULT NULL,
  `monto_final` float DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `arqueo_caja_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `arqueo_caja` */

/*Table structure for table `bodega` */

DROP TABLE IF EXISTS `bodega`;

CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `bodega` */

insert  into `bodega`(`id`,`nombre_bodega`,`fregistro`,`estatus`,`idempresa`) values (1,'PRINCIPAL','2022-07-13 08:44:32','ACTIVO',1);

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caja` varchar(100) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `caja` */

insert  into `caja`(`id`,`caja`,`estatus`,`fregistro`,`idempresa`) values (1,'GENERAL','ACTIVO','2022-07-13 08:20:34',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `cargos` */

insert  into `cargos`(`IdCargos`,`DescCargos`,`IdDpto`,`fregistro`,`estatus`) values (1,'INGENIERO DE SISTEMAS',1,'2023-05-24 12:56:27','ACTIVO');

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(150) DEFAULT NULL,
  `categoria_fregistro` date DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `categoriaarl` */

/*Table structure for table `centro_costos` */

DROP TABLE IF EXISTS `centro_costos`;

CREATE TABLE `centro_costos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idempresa` int(11) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus` enum('ACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `centro_costos_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `centro_costos` */

insert  into `centro_costos`(`id`,`idempresa`,`codigo`,`nombre`,`estatus`,`fregistro`) values (1,1,'1','PRINCIPAL','ACTIVO','2023-08-11 05:55:27');

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(50) DEFAULT NULL,
  `idDepto` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idDepto` (`idDepto`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`idDepto`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`nombre_ciudad`,`idDepto`,`idempresa`,`estatus`,`fregistro`) values (1,'EL CARMEN DE BOLIVAR',1,1,'ACTIVO','2024-07-26 08:25:51'),(2,'Cartagena',1,1,'ACTIVO','2024-07-26 08:25:51'),(3,'San Jacinto',1,1,'ACTIVO','2024-07-26 08:25:52'),(4,'San Juan Nepomuceno',1,1,'ACTIVO','2024-07-26 08:25:53'),(5,'MAGANGUE',1,1,'ACTIVO','2024-07-26 08:29:45'),(6,'Plato',6,1,'ACTIVO','2024-11-12 15:53:49');

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idcliente`,`cliente_fregistro`,`cliente_estatus`,`persona_id`,`idciudad`,`idempresa`) values (1,'2022-07-13','ACTIVO',3,1,1),(14,'2024-11-12','ACTIVO',30,1,1);

/*Table structure for table `codeudor` */

DROP TABLE IF EXISTS `codeudor`;

CREATE TABLE `codeudor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(100) DEFAULT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `tipo_doc` enum('CEDULA','TI','PASAPORTE') DEFAULT NULL,
  `documento` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `nombre_ref1` varchar(512) DEFAULT NULL,
  `nombre_ref2` varchar(512) DEFAULT NULL,
  `tel_ref1` varchar(512) DEFAULT NULL,
  `tel_ref2` varchar(512) DEFAULT NULL,
  `dir_ref1` varchar(512) DEFAULT NULL,
  `dir_ref2` varchar(512) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `codeudor_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `codeudor` */

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `compra_tipo_comprobante` enum('COTIZACION','FACTURA','BOLETA','TICKET') DEFAULT NULL,
  `compra_serie_comprobante` varchar(50) DEFAULT NULL,
  `compra_num_comprobante` varchar(50) DEFAULT NULL,
  `compra_tipo_pago` enum('CONTADO','CREDITO','CREDICONTADO','TARJETA') DEFAULT NULL,
  `compra_fecha` date DEFAULT NULL,
  `compra_impuesto` decimal(10,2) DEFAULT NULL,
  `compra_total` decimal(10,2) DEFAULT NULL,
  `compra_estatus` enum('CANCELADA','POR_PAGAR','POR_COBRAR','ANULADA','INGRESADA') DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `compra` */

insert  into `compra`(`compra_id`,`proveedor_id`,`id_bodega`,`usuario_id`,`compra_tipo_comprobante`,`compra_serie_comprobante`,`compra_num_comprobante`,`compra_tipo_pago`,`compra_fecha`,`compra_impuesto`,`compra_total`,`compra_estatus`,`compra_porcentaje`,`compra_total_decto`,`fecha_vencimiento`,`idempresa`) values (7,1,1,1,'FACTURA','1222','11111','CONTADO','2024-07-11',0.00,1200000.00,'CANCELADA',0.00,0.00,'2024-07-11',1),(8,1,1,1,'TICKET','FC','1000023','CONTADO','2024-08-26',0.00,800.00,'CANCELADA',0.00,0.00,'2024-08-26',1),(10,1,1,1,'FACTURA','dc','022772','CONTADO','2024-08-26',2498.88,15650.88,'CANCELADA',0.19,0.00,'2024-08-26',1),(11,1,1,1,'TICKET','fc','6564564','CONTADO','2024-08-26',0.00,100.00,'CANCELADA',0.00,0.00,'2024-08-26',1),(12,1,1,1,'TICKET','','','CONTADO','2024-09-03',0.00,4800.00,'CANCELADA',0.00,0.00,'2024-09-03',1),(16,1,1,1,'TICKET','FC','78888888','CONTADO','2024-11-13',0.00,480.00,'CANCELADA',0.00,0.00,'2024-11-12',1),(20,1,1,1,'FACTURA','FC','90989889','CREDITO','2024-11-15',0.00,9000.00,'POR_PAGAR',0.00,0.00,'2024-11-16',1);

/*Table structure for table `concepto` */

DROP TABLE IF EXISTS `concepto`;

CREATE TABLE `concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `concepto_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `concepto` */

insert  into `concepto`(`id`,`descripcion`,`fregistro`,`estatus`,`idempresa`) values (1,'AUTO CONSUMO','2024-07-19 13:13:53','ACTIVO',1),(2,'Producto Defectuoso ','2024-11-12 16:21:22','ACTIVO',1);

/*Table structure for table `cuentas` */

DROP TABLE IF EXISTS `cuentas`;

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `concepto_nit` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `usa_bancos` int(11) DEFAULT NULL,
  `usa_base` int(11) DEFAULT NULL,
  `usa_centros` int(11) DEFAULT NULL,
  `usa_nit` int(11) DEFAULT NULL,
  `usa_anticipo` int(11) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  `clase` varchar(100) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  KEY `idEmpresa` (`idEmpresa`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cuentas` */

insert  into `cuentas`(`id`,`idEmpresa`,`codigo`,`concepto_nit`,`nombre`,`tipo`,`usa_bancos`,`usa_base`,`usa_centros`,`usa_nit`,`usa_anticipo`,`categoria`,`clase`,`nivel`,`fregistro`,`estatus`) values (1,1,'1',NULL,'ACTIVO','CLASE',0,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 07:49:56','ACTIVO'),(2,1,'11',NULL,'DISPONLE','GRUPO',0,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 07:53:44','ACTIVO'),(3,1,'1105',NULL,'CAJA','CUENTA GENERAL',0,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 07:55:24','ACTIVO'),(4,1,'110505',NULL,'CAJA GENERAL','CUENTA DE DETALLE',1,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 07:56:23','ACTIVO'),(5,1,'110510',NULL,'CAJA MENORES','CUENTA DE DETALLE',1,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 08:00:15','ACTIVO'),(6,1,'110515',NULL,'MONEDA EXTRANGERA','CUENTA DE DETALLE',1,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 12:53:40','ACTIVO'),(7,1,'1110',NULL,'BANCOS','CUENTA GENERAL',0,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 12:56:12','ACTIVO'),(8,1,'111005',NULL,'MONEDA NACIONAL','CUENTA DE DETALLE',1,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 13:02:17','ACTIVO'),(9,1,'111010',NULL,'MONEDA EXTRANGERA','CUENTA DE DETALLE',1,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 13:02:34','ACTIVO'),(10,1,'1115','','RESEMESAS EN TRANSITO','CUENTA GENERAL',0,0,0,0,NULL,NULL,NULL,NULL,'2023-09-15 13:04:03','ACTIVO'),(12,1,'1120',NULL,'CUENTAS DE AHORRO','CUENTA GENERAL',0,0,0,0,NULL,NULL,NULL,NULL,'2023-09-21 07:43:59','ACTIVO'),(13,1,'112005','','BANCOS','CUENTA DE DETALLE',1,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(14,1,'112010','','CORPORACIONES DE AHORRO Y VIVIENDA ','CUENTA DE DETALLE',1,0,0,0,0,'','',0,'2023-09-21 07:47:39','ACTIVO'),(15,1,'112015','','ORGANISMOS COOPERATIVOS FINANCIEROS ','CUENTA DE DETALLE',1,0,0,0,0,'','',0,'2023-09-21 07:48:56','ACTIVO'),(16,1,'1125','','FONDOS',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(17,1,'12','','INVERSIONES','GRUPO',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(18,1,'1205','','ACCIONES',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(19,1,'120599','','AJUSTES POR INFLACION ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(20,1,'1210','','CUOTAS O PARTES DE INTERES SOCIAL ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(21,1,'121099','','AJUSTES POR INFLACION ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-21 08:13:02','ACTIVO'),(22,1,'1215','','BONOS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-21 08:14:49','ACTIVO'),(23,1,'1225','','CERTIFICADOS ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(24,1,'122505','OBLIGACIONES','CERTIFICADOS DE DEPOSITO A TERMINO (C.D.T.) ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(25,1,'122510','OBLIGACIONES','CERTIFICADOS DE DEPOSITO DE AHORRO ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(26,1,'122515','OBLIGACIONES','CERTIFICADOS DE AHORRO DE VALOR CONSTANTE (C.A.V.C.) ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(27,1,'122595','OBLIGACIONES','OTROS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(28,1,'1230','','PAPELES COMERCIALES',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(29,1,'123005','OBLIGACIONES','EMPRESAS COMERCIALES','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(30,1,'123010','OBLIGACIONES','EMPRESAS INDUSTRIALES','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(31,1,'123015','OBLIGACIONES','EMPRESAS DE SERVICIOS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(32,1,'1235','','TITULOS',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(33,1,'123515','OBLIGACIONES','TITULOS DE TESORERIA (T.E.S.) ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(34,1,'123555','OBLIGACIONES','TITULOS FINANCIEROS INDUSTRIALES Y COMERCIALES ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(35,1,'123560','OBLIGACIONES','TESOROS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(36,1,'123565','OBLIGACIONES','TITULOS DE DEVOLUCION DE IMPUESTOS NACIONALES (TIDIS) ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(37,1,'123570','OBLIGACIONES','TITULOS INMOBILIARIOS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(38,1,'123595','OBLIGACIONES','OTROS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(39,1,'1240','','ACEPTACIONES BANCARIAS O FINANCIERAS ','CUENTA GENERAL',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(40,1,'124005','OBLIGACIONES','BANCOS COMERCIALES ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(41,1,'124010','OBLIGACIONES','COMPAÃƒâ€˜IAS DE FINANCIMENTO COMERCIAL','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(42,1,'124015','OBLIGACIONES','CORPORACIONES FINANCIERAS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(43,1,'124095','OBLIGACIONES','OTRAS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(44,1,'1245','','DERECHOS FIDUCIARIOS ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(45,1,'124505','OBLIGACIONES','FIDEICOMISOS DE INVERSION MONEDA NACIONAL ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(46,1,'124510','OBLIGACIONES','FIDEICOMISOS DE INVERSION MONEDA EXTRANJERA ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(47,1,'1250','','DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIADAS (REPOS) ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(48,1,'125005','OBLIGACIONES','ACCIONES ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(49,1,'125010','OBLIGACIONES','CUOTAS O PARTES DE INTERES SOCIAL ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(50,1,'125015','OBLIGACIONES','BONOS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(51,1,'125020','OBLIGACIONES','CEDULAS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(52,1,'125025','OBLIGACIONES','CERTIFICADOS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(53,1,'125030','OBLIGACIONES','PAPELES COMERCIALES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(54,1,'125035','OBLIGACIONES','TITULOS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(55,1,'125040','OBLIGACIONES','ACEPTACIONES BANCARIAS O FINANCIERAS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(56,1,'125099','OBLIGACIONES','AJUSTES POR INFLACION ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(57,1,'1155','','OBLIGATORIAS',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(58,1,'125505','OBLIGACIONES','BONOS DE FINANCIAMIENTO ESPECIAL ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(59,1,'125510','OBLIGACIONES','BONOS DE FINANCIAMIENTO PRESUPUESTAL ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(60,1,'125515','OBLIGACIONES','BONOS PARA DESARROLLO SOCIAL Y SEGURIDAD INTERNA (B.D.S.I.) ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(61,1,'125595','OBLIGACIONES','OTRAS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(62,1,'1260','','CUENTAS EN PARTICIPACION ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(63,1,'126099','OBLIGACIONES','AJUSTES POR INFLACION ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(64,1,'1295','','OTRAS INVERSIONES ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(65,1,'129599','OBLIGACIONES','AJUSTES POR INFLACION ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(66,1,'1299','','PROVISIONES',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(67,1,'129905','OBLIGACIONES','ACCIONES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(68,1,'129910','OBLIGACIONES','CUOTAS O PARTES DE INTERES SOCIAL ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(69,1,'129915','OBLIGACIONES','BONOS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(70,1,'129920','OBLIGACIONES','CEDULAS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(71,1,'129925','OBLIGACIONES','CERTIFICADOS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(72,1,'129930','OBLIGACIONES','PAPELES COMERCIALES','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(73,1,'129935','OBLIGACIONES','TITULOS','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(74,1,'129940','OBLIGACIONES','ACEPTACIONES BANCARIAS O FINANCIERAS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(75,1,'129945','OBLIGACIONES','DERECHOS FIDUCIARIOS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(76,1,'129950','OBLIGACIONES','DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIADAS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(77,1,'129955','OBLIGACIONES','OBLIGATORIAS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(78,1,'129960','OBLIGACIONES','CUENTAS EN PARTICIPACION ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(79,1,'129995','OBLIGACIONES','OTRAS INVERSIONES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(80,1,'13','','DEUDORES','GRUPO',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(81,1,'1305','','CLIENTES',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-09-20 17:00:00','ACTIVO'),(82,1,'130505','OBLIGACIONES','NACIONALES','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-22 01:17:07','ACTIVO'),(83,1,'130510','OBLIGACIONES','DEL EXTERIOR','',0,0,0,1,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(84,1,'130515','OBLIGACIONES','DEUDORES DEL SISTEMA','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(85,1,'1310','','CUENTAS CORRIENTES COMERCIALES','',0,0,0,0,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(86,1,'131005','OBLIGACIONES','CASA MATRIZ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(87,1,'131010','OBLIGACIONES','COMPAÃƒâ€˜IAS VINCULADAS','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-22 01:20:51','ACTIVO'),(88,1,'131015','OBLIGACIONES','ACCIONISTAS O SOCIOS','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-22 01:21:44','ACTIVO'),(89,1,'131020','OBLIGACIONES','PARTICULARES','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(90,1,'131095','OBLIGACIONES','OTRAS','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-22 01:23:45','ACTIVO'),(91,1,'1315','','CUENTAS POR  COBRAR A CASA MATRIZ','',0,0,0,0,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(92,1,'131505','OBLIGACIONES','VENTAS','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(93,1,'131510','OBLIGACIONES','PAGOS A NOMBRE DE CASA MATRIZ ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-21 17:00:00','ACTIVO'),(94,1,'131515','OBLIGACIONES','VALORES RECIBIDOS POR CASA MATRIZ ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-09-22 02:05:19','ACTIVO'),(95,1,'131520','BALANCE O SALDO','PRESTAMOS ','CUENTA DE DETALLE',0,0,0,0,0,'CORRIENTE','',0,'2023-10-18 12:03:24','ACTIVO'),(96,1,'1320','','CUENTAS POR COBRAR A VINCULADOS ECONOMICOS ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(97,1,'132005','OBLIGACIONES','FILIALES ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(98,1,'132010','OBLIGACIONES','SUBSIDIARIAS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(99,1,'132015','OBLIGACIONES','SUCURSALES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(100,1,'1325','','CUENTA S POR COBRAR A SOCIOS Y ACCIONISTAS ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(101,1,'132505','OBLIGACIONES','A SOCIOS ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(102,1,'132510','OBLIGACIONES','A ACCIONISTAS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(103,1,'1328','','APORTES POR COBRAR ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(104,1,'1330','','ANTICIPOS Y AVANCES ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2023-10-17 17:00:00','ACTIVO'),(105,1,'133005','OBLIGACIONES','A PROVEEDORES','',0,0,0,1,0,'','',0,'2024-02-18 11:02:15','ACTIVO'),(106,1,'133010','OBLIGACIONES','A CONTRATISTAS','',0,0,0,1,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(107,1,'133015','OBLIGACIONES','A TRABAJADORES','',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(108,1,'133095','OBLIGACIONES','OTROS','',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(109,1,'1332','','CUENTAS DE OPERACION CONJUNTA ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(110,1,'1335','','DEPOSITOS ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(111,1,'133505','OBLIGACIONES','PARA IMPORTACIONES ','CUENTA DE DETALLE',0,0,0,1,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(112,1,'133510','OBLIGACIONES','PARA SERVICIOS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(113,1,'133515','OBLIGACIONES','PARA CONTRATOS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(114,1,'133520','OBLIGACIONES','PARA RESPONSABILIDADES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(115,1,'133525','OBLIGACIONES','PARA JUICIOS EJECUTIVOS ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(116,1,'133530','OBLIGACIONES','PARA ADQUISICION DE ACCIONES, CUOTAS O DERECHOS SOCIALES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(117,1,'133535','OBLIGACIONES','EN GARANTIA ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(118,1,'133595','OBLIGACIONES','OTROS','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(119,1,'1340','','PROMESAS DE COMPRA VENTA ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(120,1,'134005','BALANCE O SALDO','DE BIENES RAICES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(121,1,'134010','BALANCE O SALDO','DE MAQUINARIA Y EQUIPO ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(122,1,'134095','BALANCE O SALDO','DE OTROS BIENES ','CUENTA DE DETALLE',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO'),(123,1,'1345','','INGRESOS POR COBRAR ',' CUENTA GENERAL ',0,0,0,0,0,'','',0,'2024-02-17 18:00:00','ACTIVO');

/*Table structure for table `cuentas_x_cobrar` */

DROP TABLE IF EXISTS `cuentas_x_cobrar`;

CREATE TABLE `cuentas_x_cobrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuotas_abono` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  `no_comprobante` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idventa` (`idventa`),
  CONSTRAINT `cuentas_x_cobrar_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cuentas_x_cobrar` */

insert  into `cuentas_x_cobrar`(`id`,`cuotas_abono`,`valor`,`fecha`,`idventa`,`no_comprobante`) values (7,1,50000,'2024-07-26',18,'7777');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cuentas_x_proveedor` */

insert  into `cuentas_x_proveedor`(`idCuenta`,`noCuota`,`fecha_pago`,`valorAbono`,`idCompra`) values (1,1,'2024-11-15',1000,20);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `deducciones` */

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_depto` varchar(255) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id`,`nombre_depto`,`estatus`,`fregistro`,`idempresa`) values (1,'Bolivar','ACTIVO','2022-09-23 12:25:59',1),(2,'Sucre','ACTIVO','2022-09-23 12:26:00',1),(3,'Cordoba','ACTIVO','2022-09-23 12:26:01',1),(4,'Atlantico','ACTIVO','2022-09-23 12:26:02',1),(5,'Cesar','ACTIVO','2022-09-23 12:26:03',1),(6,'Magdalena','ACTIVO','2022-09-23 12:26:04',1),(7,'Antioquia','ACTIVO','2022-09-23 12:26:09',1),(8,'Cundinamarca','ACTIVO','2023-12-09 14:17:45',1),(9,'Casanare','ACTIVO','2023-12-09 14:18:12',1),(10,'Boyaca','ACTIVO','2023-12-09 14:18:35',1),(11,'Arauca','ACTIVO','2023-12-09 14:19:21',1),(12,'Caldas','ACTIVO','2023-12-09 14:19:46',1),(13,'Caqueta','ACTIVO','2023-12-09 14:20:01',1),(14,'Amazonas','ACTIVO','2023-12-09 14:20:20',1);

/*Table structure for table `detalle_compra` */

DROP TABLE IF EXISTS `detalle_compra`;

CREATE TABLE `detalle_compra` (
  `detalle_compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `dc_cantidad` double DEFAULT NULL,
  `dc_precio` double DEFAULT NULL,
  `dc_descto` double DEFAULT NULL,
  `dc_estatus` enum('INGRESADA','ANULADA') DEFAULT NULL,
  PRIMARY KEY (`detalle_compra_id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`compra_id`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_compra` */

insert  into `detalle_compra`(`detalle_compra_id`,`id_compra`,`id_producto`,`dc_cantidad`,`dc_precio`,`dc_descto`,`dc_estatus`) values (6,7,27,1000,1200,0,'INGRESADA'),(7,8,43,2,400,0,'INGRESADA'),(8,10,38,6,650,0,'INGRESADA'),(9,10,37,6,900,0,'INGRESADA'),(10,10,39,6,642,0,'INGRESADA'),(11,11,44,1,100,0,'INGRESADA'),(12,12,41,6,800,0,'INGRESADA'),(13,16,49,8,60,0,'INGRESADA'),(14,20,49,3,3000,0,'INGRESADA');

/*Table structure for table `detalle_salida` */

DROP TABLE IF EXISTS `detalle_salida`;

CREATE TABLE `detalle_salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_salida` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_salida` (`id_salida`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_salida_ibfk_1` FOREIGN KEY (`id_salida`) REFERENCES `salida` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_salida_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_salida` */

insert  into `detalle_salida`(`id`,`id_salida`,`id_producto`,`cantidad`,`precio_unitario`,`created_at`,`updated_at`) values (1,1,31,2,1000.00,'2024-11-15 15:41:58','2024-11-15 16:30:38');

/*Table structure for table `detalle_venta` */

DROP TABLE IF EXISTS `detalle_venta`;

CREATE TABLE `detalle_venta` (
  `detalle_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `dv_cantidad` decimal(10,2) DEFAULT NULL,
  `dv_precio` decimal(10,2) DEFAULT NULL,
  `dv_descuento` decimal(10,2) DEFAULT NULL,
  `dv_estatus` enum('INGRESADA','ANULADA') DEFAULT NULL,
  PRIMARY KEY (`detalle_venta_id`),
  KEY `idventa` (`venta_id`),
  KEY `idproducto` (`producto_id`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalle_venta` */

insert  into `detalle_venta`(`detalle_venta_id`,`venta_id`,`producto_id`,`dv_cantidad`,`dv_precio`,`dv_descuento`,`dv_estatus`) values (16,16,27,6.00,5.00,0.00,'INGRESADA'),(17,17,27,3.00,5.00,0.00,'INGRESADA'),(18,18,27,10.00,5000.00,0.00,'INGRESADA'),(19,19,42,1.00,300.00,0.00,'INGRESADA'),(20,20,42,2.00,300.00,0.00,'INGRESADA'),(21,21,42,3.00,300.00,0.00,'INGRESADA'),(22,22,42,2.00,300.00,0.00,'INGRESADA'),(23,23,42,1.00,300.00,0.00,'INGRESADA'),(24,24,39,1.00,1000.00,0.00,'INGRESADA'),(25,25,42,1.00,300.00,0.00,'INGRESADA'),(26,25,39,2.00,1000.00,0.00,'INGRESADA'),(27,25,29,1.00,700.00,0.00,'INGRESADA'),(28,25,35,1.00,200.00,0.00,'INGRESADA'),(29,25,40,1.00,100.00,0.00,'INGRESADA'),(30,26,29,1.00,700.00,0.00,'INGRESADA'),(31,26,42,2.00,1000.00,0.00,'INGRESADA'),(32,27,42,1.00,1000.00,0.00,'INGRESADA'),(33,28,42,1.00,1000.00,0.00,'INGRESADA'),(34,29,36,2.00,200.00,0.00,'INGRESADA'),(35,30,29,1.00,700.00,0.00,'INGRESADA'),(36,31,38,1.00,800.00,0.00,'INGRESADA'),(37,32,43,6.00,600.00,0.00,'INGRESADA'),(38,33,38,1.00,800.00,0.00,'INGRESADA'),(39,34,37,1.00,1000.00,0.00,'INGRESADA'),(40,35,43,2.00,600.00,0.00,'INGRESADA'),(41,36,31,6.00,200.00,0.00,'INGRESADA'),(42,37,35,1.00,200.00,0.00,'INGRESADA'),(43,38,29,1.00,700.00,0.00,'INGRESADA'),(44,39,43,1.00,1000.00,0.00,'INGRESADA'),(45,40,43,1.00,1000.00,0.00,'INGRESADA'),(46,41,43,5.00,1000.00,0.00,'INGRESADA'),(47,42,43,2.00,1000.00,0.00,'INGRESADA'),(48,43,43,2.00,1000.00,0.00,'INGRESADA'),(49,44,29,1.00,700.00,0.00,'INGRESADA'),(50,45,43,5.00,600.00,0.00,'INGRESADA'),(51,47,42,11.00,300.00,0.00,'INGRESADA'),(52,48,29,1.00,700.00,0.00,'INGRESADA'),(53,49,34,1.00,1000.00,0.00,'INGRESADA'),(54,49,36,5.00,200.00,0.00,'INGRESADA'),(55,50,43,3.00,600.00,0.00,'INGRESADA'),(56,51,43,5.00,600.00,0.00,'INGRESADA'),(57,52,43,2.00,1000.00,0.00,'INGRESADA'),(58,53,42,4.00,200.00,0.00,'INGRESADA'),(59,54,43,2.00,600.00,0.00,'INGRESADA'),(60,55,30,1.00,300.00,0.00,'INGRESADA'),(61,55,31,1.00,200.00,0.00,'INGRESADA'),(62,55,40,1.00,100.00,0.00,'INGRESADA'),(63,56,43,8.00,600.00,0.00,'INGRESADA'),(64,57,42,5.00,300.00,0.00,'INGRESADA'),(65,58,43,1.00,1000.00,0.00,'INGRESADA'),(66,59,31,1.00,200.00,0.00,'INGRESADA'),(67,59,35,1.00,200.00,0.00,'INGRESADA'),(68,60,42,2.00,300.00,0.00,'INGRESADA'),(69,61,43,2.00,600.00,0.00,'INGRESADA'),(70,62,30,2.00,300.00,0.00,'INGRESADA'),(71,63,43,2.00,600.00,0.00,'INGRESADA'),(72,64,43,3.00,600.00,0.00,'INGRESADA'),(73,65,39,1.00,1000.00,0.00,'INGRESADA'),(74,66,43,9.00,600.00,0.00,'INGRESADA'),(75,67,43,2.00,600.00,0.00,'INGRESADA'),(76,67,38,3.00,800.00,0.00,'INGRESADA'),(77,68,36,5.00,200.00,0.00,'INGRESADA'),(78,68,37,2.00,1300.00,0.00,'INGRESADA'),(79,68,29,1.00,700.00,0.00,'INGRESADA'),(80,68,43,2.00,1000.00,0.00,'INGRESADA'),(81,69,43,2.00,600.00,0.00,'INGRESADA'),(82,70,43,2.00,1500.00,0.00,'INGRESADA'),(83,71,42,3.00,300.00,0.00,'INGRESADA'),(84,71,38,1.00,800.00,0.00,'INGRESADA'),(85,71,30,1.00,300.00,0.00,'INGRESADA'),(86,72,43,7.00,600.00,0.00,'INGRESADA'),(87,72,42,1.00,300.00,0.00,'INGRESADA'),(88,73,29,1.00,700.00,0.00,'INGRESADA'),(89,74,42,1.00,300.00,0.00,'INGRESADA'),(90,75,43,1.00,1000.00,0.00,'INGRESADA'),(91,76,43,8.00,600.00,0.00,'INGRESADA'),(92,76,40,2.00,100.00,0.00,'INGRESADA'),(93,77,43,1.00,1000.00,0.00,'INGRESADA'),(94,78,29,1.00,700.00,0.00,'INGRESADA'),(95,78,43,2.00,600.00,0.00,'INGRESADA'),(96,79,43,4.00,600.00,0.00,'INGRESADA'),(97,80,43,2.00,600.00,0.00,'INGRESADA'),(98,80,42,2.00,300.00,0.00,'INGRESADA'),(99,81,43,3.00,600.00,0.00,'INGRESADA'),(100,82,43,1.00,800.00,0.00,'INGRESADA'),(101,82,39,1.00,1000.00,0.00,'INGRESADA'),(102,82,37,1.00,1300.00,0.00,'INGRESADA'),(103,83,42,2.00,300.00,0.00,'INGRESADA'),(104,84,43,3.00,1000.00,0.00,'INGRESADA'),(105,85,43,2.00,1000.00,0.00,'INGRESADA'),(106,86,43,1.00,600.00,0.00,'INGRESADA'),(107,86,42,2.00,300.00,0.00,'INGRESADA'),(108,87,44,1.00,400.00,0.00,'INGRESADA'),(109,87,42,2.00,300.00,0.00,'INGRESADA'),(110,88,45,2.00,1000.00,0.00,'INGRESADA'),(111,88,43,2.00,600.00,0.00,'INGRESADA'),(112,89,43,3.00,600.00,0.00,'INGRESADA'),(113,90,45,2.00,1000.00,0.00,'INGRESADA'),(114,91,42,1.00,300.00,0.00,'INGRESADA'),(115,92,45,1.00,1000.00,0.00,'INGRESADA'),(116,92,43,4.00,600.00,0.00,'INGRESADA'),(117,93,43,12.00,600.00,0.00,'INGRESADA'),(118,94,45,1.00,1000.00,0.00,'INGRESADA'),(119,95,43,1.00,600.00,0.00,'INGRESADA'),(120,95,40,2.00,100.00,0.00,'INGRESADA'),(121,95,44,2.00,400.00,0.00,'INGRESADA'),(122,96,43,10.00,600.00,0.00,'INGRESADA'),(123,96,42,5.00,300.00,0.00,'INGRESADA'),(124,96,33,1.00,500.00,0.00,'INGRESADA'),(125,96,45,1.00,1500.00,0.00,'INGRESADA'),(126,97,44,3.00,400.00,0.00,'INGRESADA'),(127,98,44,3.00,400.00,0.00,'INGRESADA'),(128,99,45,1.00,1000.00,0.00,'INGRESADA'),(129,100,44,1.00,400.00,0.00,'INGRESADA'),(130,100,35,1.00,200.00,0.00,'INGRESADA'),(131,101,45,1.00,1000.00,0.00,'INGRESADA'),(132,102,45,2.00,1000.00,0.00,'INGRESADA'),(133,102,42,2.00,300.00,0.00,'INGRESADA'),(134,103,43,5.00,600.00,0.00,'INGRESADA'),(135,104,46,1.00,800.00,0.00,'INGRESADA'),(136,105,41,2.00,1000.00,0.00,'INGRESADA'),(137,106,45,10.00,1000.00,0.00,'INGRESADA'),(138,107,42,10.00,300.00,0.00,'INGRESADA'),(139,107,43,1.00,500.00,0.00,'INGRESADA'),(140,108,45,1.00,1500.00,0.00,'INGRESADA'),(141,109,39,1.00,1000.00,0.00,'INGRESADA'),(142,109,34,1.00,1000.00,0.00,'INGRESADA'),(143,109,45,1.00,1000.00,0.00,'INGRESADA'),(144,109,42,1.00,300.00,0.00,'INGRESADA'),(145,110,44,2.00,400.00,0.00,'INGRESADA'),(146,110,45,1.00,800.00,0.00,'INGRESADA'),(147,111,45,2.00,1000.00,0.00,'INGRESADA'),(148,112,43,1.00,600.00,0.00,'INGRESADA'),(149,112,42,1.00,300.00,0.00,'INGRESADA'),(150,113,47,1.00,800.00,0.00,'INGRESADA'),(151,113,42,4.00,300.00,0.00,'INGRESADA'),(152,114,41,1.00,1000.00,0.00,'INGRESADA'),(153,115,45,8.00,1000.00,0.00,'INGRESADA'),(154,115,47,1.00,800.00,0.00,'INGRESADA'),(155,116,45,3.00,1000.00,0.00,'INGRESADA'),(156,117,45,2.00,1000.00,0.00,'INGRESADA'),(157,118,41,1.00,1000.00,0.00,'INGRESADA'),(158,119,44,1.00,400.00,0.00,'INGRESADA'),(159,119,45,1.00,1000.00,0.00,'INGRESADA'),(160,120,41,1.00,1000.00,0.00,'INGRESADA'),(161,121,45,8.00,1000.00,0.00,'INGRESADA'),(162,122,45,1.00,700.00,0.00,'INGRESADA'),(163,123,43,1.00,1000.00,0.00,'INGRESADA'),(164,124,43,5.00,600.00,0.00,'INGRESADA'),(165,124,45,4.00,1000.00,0.00,'INGRESADA'),(166,125,43,2.00,800.00,0.00,'INGRESADA'),(167,126,42,5.00,300.00,0.00,'INGRESADA'),(168,126,43,2.00,600.00,0.00,'INGRESADA'),(169,127,43,7.00,600.00,0.00,'INGRESADA'),(170,128,45,10.00,1000.00,0.00,'INGRESADA'),(171,128,43,7.00,600.00,0.00,'INGRESADA'),(172,129,45,2.00,1000.00,0.00,'INGRESADA'),(173,130,45,2.00,1000.00,0.00,'INGRESADA'),(174,131,45,5.00,1000.00,0.00,'INGRESADA'),(175,131,42,2.00,600.00,0.00,'INGRESADA'),(176,132,45,2.00,1000.00,0.00,'INGRESADA'),(177,133,38,1.00,800.00,0.00,'INGRESADA');

/*Table structure for table `document_type` */

DROP TABLE IF EXISTS `document_type`;

CREATE TABLE `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tipo de documentos';

/*Data for the table `document_type` */

insert  into `document_type`(`id`,`company_id`,`name`,`abbreviation`,`status`,`created_by`,`created_at`) values (1,1,'Cedula de Ciudadania ','CD',1,1,'2024-08-12 10:21:29'),(2,1,'test','t',1,1,'2024-08-14 16:32:06'),(3,1,'NIT','Numero de identifica',1,1,'2024-08-14 16:32:07'),(4,1,'PASAPORTE','PS',1,1,'2024-11-12 14:50:31');

/*Table structure for table `dpto` */

DROP TABLE IF EXISTS `dpto`;

CREATE TABLE `dpto` (
  `IdDpto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del area al que pertenece',
  `DescDpto` varchar(60) NOT NULL COMMENT 'Descripcion del departamento donde labora',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdDpto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `dpto` */

insert  into `dpto`(`IdDpto`,`DescDpto`,`fregistro`,`estatus`) values (1,'SISTEMA','2022-09-26 13:55:41','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `empleados` */

insert  into `empleados`(`IdEmp`,`CCEmp`,`NomEmp`,`DirEmp`,`TelEmp`,`CelEmp`,`EmailEmp`,`fecha_nacimiento`,`IdARL`,`IdEPS`,`IdPension`,`id_tipo_contrato`,`fecha_ingreso`,`fregistro`,`estatus`,`idempresa`,`usuario_id`) values (1,1070813753,'JERSON BATISTA','EL CARMEN','132132','1321','INFO@GMAIL.COM','1989-05-26',1,1,1,NULL,NULL,'2022-09-23 11:41:24','ACTIVO',1,1);

/*Table structure for table `empresa` */

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nit` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `Representante` varchar(255) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `Industria` enum('Servicios','Ventas','Deportes','Agricultura','Otros') DEFAULT NULL,
  `id_tipo_regimen` int(11) DEFAULT NULL,
  `idCiudad` int(11) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_tipo_regimen` (`id_tipo_regimen`),
  KEY `idCiudad` (`idCiudad`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_tipo_regimen`) REFERENCES `tipo_regimen` (`id`),
  CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `empresa` */

insert  into `empresa`(`ID`,`Nit`,`nombre`,`Representante`,`Direccion`,`Telefono`,`Correo`,`Logo`,`Industria`,`id_tipo_regimen`,`idCiudad`,`fregistro`,`estatus`) values (1,'1070813753','JERSON-D','JERSON-D','EL CARMEN','3013230867','ingjerson2014@gmail.com','controlador/empresa/img/IMG61120239202.png','Ventas',2,1,'2024-08-02 09:57:12','ACTIVO');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `eps` */

insert  into `eps`(`IdEPS`,`NitEPS`,`NomEPS`,`CiudadEPS`,`DirEPS`,`TelEPS`,`EmailEps`,`fregistro`,`estatus`,`idempresa`) values (1,2313232,'EPS PRUEBA','CARMEN DE BOL','CALLE 25','654654','PRUEBA@GMAIL.COM','2022-09-18 10:15:12','ACTIVO',1);

/*Table structure for table `gastos` */

DROP TABLE IF EXISTS `gastos`;

CREATE TABLE `gastos` (
  `idGasto` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_gasto` int(11) NOT NULL,
  `fecha_gasto` date DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `recibo` varchar(100) DEFAULT NULL,
  `idcaja` int(11) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  `idusuario` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `estado` enum('ENTREGADA','CANCELADA','ANULADA') DEFAULT NULL,
  PRIMARY KEY (`idGasto`),
  KEY `idtipo_gasto` (`idtipo_gasto`),
  KEY `idusuario` (`idusuario`),
  KEY `idempresa` (`idempresa`),
  KEY `idcaja` (`idcaja`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`idtipo_gasto`) REFERENCES `tipo_gasto` (`id`),
  CONSTRAINT `gastos_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `gastos_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `gastos_ibfk_4` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `gastos` */

insert  into `gastos`(`idGasto`,`idtipo_gasto`,`fecha_gasto`,`valor`,`recibo`,`idcaja`,`observaciones`,`fregistro`,`estatus`,`idusuario`,`idempresa`,`estado`) values (1,3,'2023-05-23',119600,'001',1,'','2023-05-23 04:20:03','ACTIVO',1,1,'CANCELADA'),(2,2,'2023-11-07',121212,'5456',1,'','2023-11-06 03:06:06','ACTIVO',1,1,'ENTREGADA');

/*Table structure for table `iva` */

DROP TABLE IF EXISTS `iva`;

CREATE TABLE `iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `tarifa` double DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idEmpresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iva_empresa` (`idEmpresa`),
  CONSTRAINT `FK_iva_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `iva` */

insert  into `iva`(`id`,`codigo`,`tarifa`,`nombre`,`estado`,`fregistro`,`idEmpresa`) values (1,'01',19,'IVA GENERAL DE PRODUCTOS','ACTIVO','2023-11-17 04:43:42',1),(3,'02',0,'NO APLICA TARIFA','ACTIVO','2023-11-26 18:00:00',1),(4,'03',5,'TARIFA 5%','ACTIVO','2023-11-26 18:00:00',1),(8,'1000',0,'EXCENTO','ACTIVO','2024-11-12 15:42:54',1);

/*Table structure for table `kardex` */

DROP TABLE IF EXISTS `kardex`;

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `bodega_id` int(11) DEFAULT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `tipo_movimiento` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `kardex` */

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `marcas` */

insert  into `marcas`(`id`,`descripcion`,`estatus`,`fregistro`,`idempresa`) values (1,'HP','ACTIVO','2023-03-31 12:01:55',1),(2,'MARCA GENERAL','ACTIVO','2023-04-10 02:13:39',1),(3,'ACCER','ACTIVO','2023-04-10 01:33:54',1),(4,'Arroz Diana','ACTIVO','2024-11-12 00:00:00',1);

/*Table structure for table `movimientos_kardex` */

DROP TABLE IF EXISTS `movimientos_kardex`;

CREATE TABLE `movimientos_kardex` (
  `movimiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `tipo_movimiento` enum('ENTRADA','SALIDA') NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `stock_antes` decimal(10,2) NOT NULL,
  `stock_despues` decimal(10,2) NOT NULL,
  PRIMARY KEY (`movimiento_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `movimientos_kardex_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `movimientos_kardex` */

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `idpago` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `recibo` char(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pension` */

insert  into `pension`(`IdPension`,`NitPension`,`NomPension`,`CiudadPension`,`DirPension`,`TelPension`,`EmailPension`,`fregistro`,`estatus`,`idempresa`) values (1,5465655,'PRUEBA PENSION','CARMEN DE BOLIVAR','KRA 45','4654654','PRUEBA@GMAIL.COM','2022-09-18 10:33:26','ACTIVO',1);

/*Table structure for table `persona` */

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `persona_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(45) DEFAULT NULL,
  `persona_apepat` varchar(45) DEFAULT NULL,
  `persona_apemat` varchar(45) DEFAULT NULL,
  `tipo_contribuyente` enum('Persona Natural','Persona Juridica') DEFAULT NULL,
  `persona_nrodocumento` varchar(50) DEFAULT NULL,
  `persona_tipodocumento` enum('CEDULA','NIT','PASAPORTE','TI') DEFAULT NULL,
  `persona_telefono` varchar(45) DEFAULT NULL,
  `persona_direccion` varchar(250) DEFAULT NULL,
  `persona_correo` varchar(100) DEFAULT NULL,
  `persona_fregistro` date DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  `id_tipo_tercero` int(11) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`persona_id`),
  KEY `idempresa` (`idempresa`),
  KEY `id_tipo_tercero` (`id_tipo_tercero`),
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`id_tipo_tercero`) REFERENCES `tipo_tercero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `persona` */

insert  into `persona`(`persona_id`,`persona_nombre`,`persona_apepat`,`persona_apemat`,`tipo_contribuyente`,`persona_nrodocumento`,`persona_tipodocumento`,`persona_telefono`,`persona_direccion`,`persona_correo`,`persona_fregistro`,`persona_estatus`,`idempresa`,`id_tipo_tercero`,`estatus`,`fregistro`) values (1,'JERSON','BATISTA','VEGA','Persona Natural','1070813753','CEDULA','30045454545','el centro','ingjerson@gmail.com','2022-07-13','ACTIVO',1,1,'ACTIVO','2023-03-10 12:56:43'),(2,'PROVEEDOR','DE MOSTRADOR','MOSTRADOR','Persona Natural','000000001','NIT','011111111','EL CENTRO','info@gmail.com','2022-07-13','ACTIVO',1,1,'ACTIVO','2023-06-14 09:58:42'),(3,'CLIENTE','CONSUMIDOR','FINAL','Persona Natural','000000000001','CEDULA','56456456','EL CENTRO','DEPRUEBA@GMAIL.COM','2022-07-13','ACTIVO',1,2,'ACTIVO','2024-08-12 10:04:32'),(30,'KAREN','HERNANDEZ','VEGA','Persona Natural','756756','CEDULA','6567676','KR 45','karen@gmail.com','2024-11-12','ACTIVO',1,2,NULL,'2024-11-12 16:01:38'),(31,'JOSE','HERNANDEZ','VEGA','Persona Natural','8678678','CEDULA','6567676','KR 45','danielgmail.com','2024-11-12','ACTIVO',1,1,NULL,'2024-11-12 16:02:13');

/*Table structure for table `plans` */

DROP TABLE IF EXISTS `plans`;

CREATE TABLE `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type_plans` enum('Básico','Estándar','Avanzado') DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `duration_days` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `plans` */

insert  into `plans`(`id`,`company_id`,`name`,`type_plans`,`description`,`price`,`duration_days`,`created_at`,`updated_at`) values (1,1,'PLAN ANUAL','Básico','Plan pago una cuota',600000.000000,365,'2024-11-15 15:02:23','2024-11-15 15:02:23');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `prestacionsocial` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(100) DEFAULT NULL,
  `producto_nombre` varchar(255) NOT NULL,
  `producto_descripcion` text DEFAULT NULL,
  `producto_cod_barra` text DEFAULT NULL,
  `producto_presentacion` varchar(100) DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `cant_minima` varchar(100) DEFAULT NULL,
  `producto_stock` varchar(100) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `IdIva` int(11) DEFAULT NULL,
  `producto_foto` varchar(255) DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `producto_precioventa` decimal(10,2) DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
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
  KEY `FK_producto_iva` (`IdIva`),
  CONSTRAINT `FK_producto_iva` FOREIGN KEY (`IdIva`) REFERENCES `iva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`unidad_id`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`),
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipo_producto` (`id`),
  CONSTRAINT `producto_ibfk_6` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `producto` */

insert  into `producto`(`producto_id`,`producto_codigo`,`producto_nombre`,`producto_descripcion`,`producto_cod_barra`,`producto_presentacion`,`id_bodega`,`cant_minima`,`producto_stock`,`id_categoria`,`id_unidad`,`idTipoProducto`,`id_marca`,`IdIva`,`producto_foto`,`compra`,`producto_precioventa`,`producto_estatus`,`fregistro`,`idempresa`) values (27,'123','test','test','54354354353','test',1,'5','986',1,1,1,2,1,'controlador/productos/img/default.png',5.00,5.00,'ACTIVO','2024-07-22 15:08:57',1),(28,'0123','MAMUT * 42','GALLETAS','','GENERAL',1,'2','10',6,1,1,2,1,'controlador/productos/img/default.png',450.00,600.00,'ACTIVO','2024-07-26 18:12:16',1),(29,'03214','NUCITA *18','NUCITAS','1','GENERAL',1,'2','1',6,1,1,2,1,'controlador/productos/img/default.png',528.00,700.00,'ACTIVO','2024-08-26 16:52:15',1),(30,'2','WAFER CAPRI','NUCITAS','2','GENERAL',1,'2','6',6,1,1,2,1,'controlador/productos/img/default.png',245.00,300.00,'ACTIVO','2024-08-25 16:37:25',1),(31,'0019','TRULULU ARO','TRULULU','4','GENERAL',1,'2','2',6,1,1,2,1,'controlador/productos/img/default.png',158.00,200.00,'ACTIVO','2024-08-22 11:08:29',1),(32,'0144','BIANCHI','DULCES','5','GENERAL',1,'2','10',6,1,1,2,1,'controlador/productos/img/default.png',500.00,200.00,'ACTIVO','2024-07-26 18:12:24',1),(33,'014','MUU MANTEQUILLA','DULCES','6','GENERAL',1,'2','9',6,1,1,2,1,'controlador/productos/img/default.png',416.00,500.00,'ACTIVO','2024-09-02 11:58:22',1),(34,'037','GALLETAS TOS','DULCES','7','GENERAL',1,'2','8',6,1,1,2,1,'controlador/productos/img/default.png',755.00,1000.00,'ACTIVO','2024-09-04 15:47:50',1),(35,'0469','MASMELO','DULCES','8','GENERAL',1,'2','6',6,1,1,2,1,'controlador/productos/img/default.png',80.00,200.00,'ACTIVO','2024-09-02 17:01:41',1),(36,'0413','MINIBUM','DULCES','9','GN',1,'2','15',6,1,1,2,1,'controlador/productos/img/default.png',54.00,198.00,'ACTIVO','2024-08-24 20:44:57',1),(37,'002','FESTIVAL GRANDE','DULCES','10','GN',1,'2','12',6,1,1,2,1,'controlador/productos/img/default.png',1083.00,1300.00,'ACTIVO','2024-08-28 08:28:13',1),(38,'0249','PAPA RULA 800 FRITOMIX','DULCES','11','GN',1,'2','9',6,1,1,2,1,'controlador/productos/img/default.png',650.00,800.00,'ACTIVO','2024-11-15 17:37:28',1),(39,'0257','CROCAN NACHO','DULCES','12','GN',1,'1','6',6,1,1,2,1,'controlador/productos/img/default.png',660.00,1000.00,'ACTIVO','2024-09-04 15:47:49',1),(40,'0282','LOQUIÑO MASTICABLE','DULCES','13','GN',1,'2','4',6,1,1,2,1,'controlador/productos/img/default.png',50.00,100.00,'ACTIVO','2024-08-30 13:49:41',1),(41,'0626','TICO 900','DULCES','14','GN',1,'2','11',6,1,1,2,1,'controlador/productos/img/default.png',800.00,1000.00,'ACTIVO','2024-09-08 16:18:00',1),(42,'1000','COPIAS BLANCO Y NEGRO','SERVICIOS','10000','general',1,'2','20',4,1,4,2,3,'controlador/productos/img/default.png',0.00,300.00,'ACTIVO','2024-09-16 15:42:23',1),(43,'1000023','impresiones blanco y negro','impresiones','1000023','general',1,'2','335',4,1,4,2,3,'controlador/productos/img/default.png',0.00,600.00,'ACTIVO','2024-09-16 10:19:02',1),(44,'12365478','Helados','Helados','12365478','gn',1,'1','8',4,1,1,2,3,'controller/productos/img/default.png',0.00,400.00,'ACTIVO','2024-09-06 17:50:58',1),(45,'102365555','IMPRESIONES A COLOR','IMPRESIONES A COLOR','102365555','GN',1,'2','526',4,1,4,2,3,'controller/productos/img/default.png',0.00,998.00,'ACTIVO','2024-09-17 15:35:36',1),(46,'3086123275317','lapiz hbNo2','lapiz hbNo2','3086123275317','gn',1,'1','3',3,1,1,2,3,'controller/productos/img/default.png',0.00,800.00,'ACTIVO','2024-09-03 12:33:28',1),(47,'10236588','SOBRE DE MANILA OFICIO','SOBRE DE MANILA OFICIO','10236588','GN',1,'2','3',3,1,1,2,3,'controller/productos/img/default.png',0.00,800.00,'ACTIVO','2024-09-06 07:51:53',1),(48,'765675666','test de pruebas','test de pruebas','765675666','general',1,'2','100',2,1,1,1,1,'controller/productos/img/default.png',1000.00,12000.00,'ACTIVO','2024-11-11 12:08:34',1),(49,'10000238888','test de pruebas producto','test de pruebas producto','10000237676','general',1,'2','13',1,1,1,2,1,'controller/productos/img/default.png',12.00,15.00,'ACTIVO','2024-11-15 17:49:31',1),(50,'76567561','test de pruebas test','test de pruebas test','3554345','general',1,'2','100',1,1,1,2,1,'controller/productos/img/default.png',10.00,20.00,'ACTIVO','2024-11-12 16:53:24',1);

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_fregistro` date DEFAULT NULL,
  `proveedor_num_contacto` varchar(100) DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `proveedor_razon_social` varchar(255) DEFAULT NULL,
  `idciudad` int(11) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `persona_id` (`persona_id`),
  KEY `idempresa` (`idempresa`),
  KEY `idciudad` (`idciudad`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`),
  CONSTRAINT `proveedor_ibfk_3` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `proveedor` */

insert  into `proveedor`(`proveedor_id`,`proveedor_fregistro`,`proveedor_num_contacto`,`proveedor_estatus`,`persona_id`,`proveedor_razon_social`,`idciudad`,`idempresa`) values (1,'2022-07-13','000001','ACTIVO',2,'MOSTRADOR ',1,1),(8,'2024-11-12','75675','ACTIVO',31,'JOSE HERNANDEZ',4,1);

/*Table structure for table `quotation_detail` */

DROP TABLE IF EXISTS `quotation_detail`;

CREATE TABLE `quotation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `estatus` enum('INGRESADA','ANULADA') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quotation_detail_quotes` (`quote_id`),
  CONSTRAINT `FK_quotation_detail_quotes` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='detalle cotizacion';

/*Data for the table `quotation_detail` */

insert  into `quotation_detail`(`id`,`quote_id`,`producto_id`,`cantidad`,`precio`,`descuento`,`estatus`) values (4,7,27,9.00,5.00,0.00,'INGRESADA'),(5,8,27,7.00,500.00,0.00,'INGRESADA'),(6,9,27,7.00,5.00,0.70,'INGRESADA'),(7,10,27,6.00,5.00,0.60,'INGRESADA'),(8,11,27,18.00,5000.00,1800.00,'INGRESADA'),(9,12,27,8.00,5.00,0.80,'INGRESADA'),(10,13,27,1.00,5.00,0.00,'INGRESADA'),(11,14,27,4.00,5.00,0.00,'INGRESADA');

/*Table structure for table `quotes` */

DROP TABLE IF EXISTS `quotes`;

CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `bodega_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `tipo_comprobante_id` int(11) DEFAULT NULL,
  `quote_no` int(11) DEFAULT NULL,
  `fecha_quote` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `impuesto` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estatus` enum('BORRADOR','ANULADA','APROBADA','ENVIADO','VENCIDA') DEFAULT 'BORRADOR',
  `porcentaje` decimal(10,2) DEFAULT NULL,
  `total_dcto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='cotizaciones';

/*Data for the table `quotes` */

insert  into `quotes`(`id`,`empresa_id`,`cliente_id`,`bodega_id`,`usuario_id`,`tipo_comprobante_id`,`quote_no`,`fecha_quote`,`fecha_vencimiento`,`impuesto`,`total`,`estatus`,`porcentaje`,`total_dcto`) values (7,1,1,1,1,1,455,'2024-07-12','2024-07-12',0.00,45.00,'BORRADOR',0.00,0.00),(8,1,1,1,1,8,456456,'2024-07-12','0000-00-00',0.00,4165.00,'BORRADOR',0.00,0.00),(9,1,1,1,1,8,1222,'2024-07-12','2024-07-12',0.00,34.30,'BORRADOR',0.00,0.00),(10,1,1,1,1,8,423423,'2024-07-12','2024-07-12',0.00,34.99,'BORRADOR',0.00,0.00),(11,1,1,1,1,8,56767,'2024-07-12','2024-07-12',0.00,104958.00,'BORRADOR',0.19,0.00),(12,1,1,1,1,8,565456546,'2024-07-12','2024-07-12',7.45,46.65,'BORRADOR',0.19,0.80),(13,1,1,1,1,8,455,'2024-11-12','2024-11-12',0.00,5.00,'BORRADOR',0.00,0.00),(14,1,1,1,1,8,423423,'2024-11-15','2024-11-15',3.80,23.80,'BORRADOR',0.19,0.00);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `registrohe` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) DEFAULT NULL,
  `rol_fregistro` date DEFAULT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `salarios` */

/*Table structure for table `salida` */

DROP TABLE IF EXISTS `salida`;

CREATE TABLE `salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `tipo_salida` enum('devolucion','transferencia','donacion','otro') DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_bodega` (`id_bodega`),
  CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `salida` */

insert  into `salida`(`id`,`fecha`,`id_usuario`,`id_bodega`,`tipo_salida`,`motivo`,`created_at`,`updated_at`) values (1,'2024-11-15',1,1,'donacion','test','2024-11-15 15:41:41','2024-11-15 15:41:41');

/*Table structure for table `tipo_comprobante` */

DROP TABLE IF EXISTS `tipo_comprobante`;

CREATE TABLE `tipo_comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idEmpresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tipo_comprobante_empresa` (`idEmpresa`),
  CONSTRAINT `FK_tipo_comprobante_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_comprobante` */

insert  into `tipo_comprobante`(`id`,`abreviatura`,`descripcion`,`estatus`,`fregistro`,`idEmpresa`) values (1,'FV','FACTURA DE VENTA','ACTIVO','2023-08-23 02:00:05',1),(2,'FC','FACTURA DE COMPRA','ACTIVO','2023-08-23 02:08:41',1),(3,'RC','Recibo de caja','ACTIVO','2023-09-06 07:17:58',1),(4,'CE','Comprobante de egreso','ACTIVO','2023-08-23 03:13:07',1),(5,'CN','Consignacion Bancaria','ACTIVO','2023-09-15 06:22:20',1),(6,'NC','Nota Credito','ACTIVO','2023-09-15 06:22:53',1),(7,'ND','Nota Debito','ACTIVO','2023-09-15 06:23:03',1),(8,'CT','Cotizacion','ACTIVO','2024-07-11 10:16:55',1);

/*Table structure for table `tipo_contrato` */

DROP TABLE IF EXISTS `tipo_contrato`;

CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_contrato` */

/*Table structure for table `tipo_gasto` */

DROP TABLE IF EXISTS `tipo_gasto`;

CREATE TABLE `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `tipo_gasto_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_gasto` */

insert  into `tipo_gasto`(`id`,`descripcion`,`fregistro`,`estatus`,`idempresa`) values (2,'PAGO SERVICIOS','2023-05-08 09:52:32','ACTIVO',1),(3,'SERVICIO DE ENERGIA','2023-05-23 04:19:34','ACTIVO',1);

/*Table structure for table `tipo_impuestos` */

DROP TABLE IF EXISTS `tipo_impuestos`;

CREATE TABLE `tipo_impuestos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_impuesto` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NULL DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tipo_impuestos_empresa` (`idEmpresa`),
  CONSTRAINT `FK_tipo_impuestos_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_impuestos` */

insert  into `tipo_impuestos`(`id`,`tipo_impuesto`,`descripcion`,`estado`,`fregistro`,`idEmpresa`) values (1,'GRAVADO','PRODUCTO CON IVA','ACTIVO','2023-11-26 08:21:37',1),(2,'EXONERADO','NO APLICA IVA','ACTIVO','2023-11-26 08:23:36',1);

/*Table structure for table `tipo_producto` */

DROP TABLE IF EXISTS `tipo_producto`;

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_producto` varchar(255) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idEmpresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tp_emp` (`idEmpresa`),
  CONSTRAINT `fk_tp_emp` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_producto` */

insert  into `tipo_producto`(`id`,`tipo_producto`,`estatus`,`fregistro`,`idEmpresa`) values (1,'PRODUCTO','ACTIVO','2022-07-13 08:56:42',1),(2,'CONSUMO','ACTIVO','2022-07-13 08:56:49',1),(3,'COMBO','ACTIVO','2022-07-13 08:56:57',1),(4,'SERVICIO','ACTIVO','2023-12-27 12:59:45',1);

/*Table structure for table `tipo_regimen` */

DROP TABLE IF EXISTS `tipo_regimen`;

CREATE TABLE `tipo_regimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_regimen` */

insert  into `tipo_regimen`(`id`,`descripcion`,`estatus`,`fregistro`) values (1,'Simplificado','ACTIVO','2023-05-08 09:49:07'),(2,'Comun','ACTIVO','2023-05-08 09:49:13'),(3,'Otro','ACTIVO','2023-05-08 09:49:21');

/*Table structure for table `tipo_tercero` */

DROP TABLE IF EXISTS `tipo_tercero`;

CREATE TABLE `tipo_tercero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `tipo_tercero_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tipo_tercero` */

insert  into `tipo_tercero`(`id`,`tipo`,`idempresa`) values (1,'PROVEEDOR',1),(2,'CLIENTE',1);

/*Table structure for table `tipodeducciones` */

DROP TABLE IF EXISTS `tipodeducciones`;

CREATE TABLE `tipodeducciones` (
  `IdTipoDeducciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de deduccion',
  `DescTipoDeducciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de deduccion',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de deduccion',
  PRIMARY KEY (`IdTipoDeducciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tipodeducciones` */

/*Table structure for table `tipohe` */

DROP TABLE IF EXISTS `tipohe`;

CREATE TABLE `tipohe` (
  `IdTipoHE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de hora extra',
  `NomTipoHE` varchar(80) NOT NULL COMMENT 'Nombre del tipo de hora extra',
  `Multiplicador` double NOT NULL COMMENT 'Por cuanto se multiplica el valor de hora extra',
  PRIMARY KEY (`IdTipoHE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tipohe` */

/*Table structure for table `tipoprestaciones` */

DROP TABLE IF EXISTS `tipoprestaciones`;

CREATE TABLE `tipoprestaciones` (
  `IdTipoPrestaciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de prestacion',
  `DescTipoPrestaciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de prestacion',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de prestacion',
  PRIMARY KEY (`IdTipoPrestaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tipoprestaciones` */

/*Table structure for table `tiposalario` */

DROP TABLE IF EXISTS `tiposalario`;

CREATE TABLE `tiposalario` (
  `IdTipoSalario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo del salario del empleado',
  `DescTipoSalario` varchar(60) NOT NULL COMMENT 'Descripcion del tipo de salario',
  PRIMARY KEY (`IdTipoSalario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tiposalario` */

/*Table structure for table `unidad` */

DROP TABLE IF EXISTS `unidad`;

CREATE TABLE `unidad` (
  `unidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(255) DEFAULT NULL,
  `unidad_abreviatura` char(20) DEFAULT NULL,
  `unidad_fregistro` date DEFAULT NULL,
  `unidad_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
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
  `usuario_nombre` varchar(30) DEFAULT NULL,
  `usuario_password` varchar(255) DEFAULT NULL,
  `usuario_email` varchar(250) DEFAULT NULL,
  `usuario_intento` int(11) DEFAULT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `usuario_imagen` varchar(255) DEFAULT NULL,
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
  `venta_tipocomprobante` enum('COTIZACION','FACTURA','BOLETA','TICKET') DEFAULT NULL,
  `venta_serie` varchar(50) DEFAULT NULL,
  `venta_numcomprobante` varchar(255) DEFAULT NULL,
  `tipo_pago` enum('CONTADO','CREDITO','CREDICONTADO') DEFAULT NULL,
  `venta_fecha` date DEFAULT NULL,
  `venta_impuesto` decimal(10,2) DEFAULT NULL,
  `venta_total` decimal(10,2) DEFAULT NULL,
  `venta_estatus` enum('REGISTRADA','CANCELADA','POR_COBRAR','ANULADA') DEFAULT NULL,
  `venta_porcentaje` decimal(10,2) DEFAULT NULL,
  `venta_total_dcto` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `dias_pago` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `venta` */

insert  into `venta`(`venta_id`,`cliente_id`,`bodega_id`,`usuario_id`,`venta_tipocomprobante`,`venta_serie`,`venta_numcomprobante`,`tipo_pago`,`venta_fecha`,`venta_impuesto`,`venta_total`,`venta_estatus`,`venta_porcentaje`,`venta_total_dcto`,`fecha_vencimiento`,`dias_pago`,`idempresa`,`idcaja`) values (16,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-11',0.00,30.00,'REGISTRADA',0.00,0.00,'2024-07-11',0,1,1),(17,1,1,1,'FACTURA','FV',NULL,'CONTADO','2024-07-11',2.85,17.85,'REGISTRADA',0.19,0.00,'2024-07-11',0,1,1),(18,1,1,1,'TICKET','FV',NULL,'CREDITO','2024-07-22',0.00,50000.00,'CANCELADA',0.00,0.00,'2024-07-21',0,1,1),(19,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-23',0.00,300.00,'REGISTRADA',0.00,0.00,'2024-07-23',0,1,1),(20,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-23',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-07-23',0,1,1),(21,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-24',0.00,900.00,'REGISTRADA',0.00,0.00,'2024-07-24',0,1,1),(22,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-25',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-07-25',0,1,1),(23,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-26',0.00,300.00,'REGISTRADA',0.00,0.00,'2024-07-26',0,1,1),(24,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-26',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-07-26',0,1,1),(25,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-27',0.00,3300.00,'REGISTRADA',0.00,0.00,'2024-07-27',0,1,1),(26,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-28',0.00,2700.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(27,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-28',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-07-28',0,1,1),(28,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-28',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-07-28',0,1,1),(29,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-29',0.00,400.00,'REGISTRADA',0.00,0.00,'2024-07-29',0,1,1),(30,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-29',0.00,700.00,'REGISTRADA',0.00,0.00,'2024-07-29',0,1,1),(31,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-29',0.00,800.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(32,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-29',0.00,3600.00,'REGISTRADA',0.00,0.00,'2024-07-29',0,1,1),(33,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-29',0.00,800.00,'REGISTRADA',0.00,0.00,'2024-07-29',0,1,1),(34,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-07-30',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-07-30',0,1,1),(35,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-01',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-08-01',0,1,1),(36,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-01',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-08-01',0,1,1),(37,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-01',0.00,200.00,'REGISTRADA',0.00,0.00,'2024-08-01',0,1,1),(38,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-01',0.00,700.00,'REGISTRADA',0.00,0.00,'2024-08-01',0,1,1),(39,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-02',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-08-02',0,1,1),(40,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-08',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-08-08',0,1,1),(41,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-08',0.00,5000.00,'REGISTRADA',0.00,0.00,'2024-08-08',0,1,1),(42,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-08',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-08-08',0,1,1),(43,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-08',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-08-08',0,1,1),(44,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-09',0.00,700.00,'REGISTRADA',0.00,0.00,'2024-08-09',0,1,1),(45,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-09',0.00,3000.00,'REGISTRADA',0.00,0.00,'2024-08-09',0,1,1),(47,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-13',0.00,3300.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(48,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-13',0.00,700.00,'REGISTRADA',0.00,0.00,'2024-08-13',0,1,1),(49,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-14',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-08-14',0,1,1),(50,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-15',0.00,1800.00,'REGISTRADA',0.00,0.00,'2024-08-15',0,1,1),(51,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-20',0.00,3000.00,'REGISTRADA',0.00,0.00,'2024-08-20',0,1,1),(52,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-20',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-08-20',0,1,1),(53,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-21',0.00,800.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(54,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-21',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-08-21',0,1,1),(55,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-21',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-08-21',0,1,1),(56,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-21',0.00,4800.00,'REGISTRADA',0.00,0.00,'2024-08-21',0,1,1),(57,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-21',0.00,1500.00,'REGISTRADA',0.00,0.00,'2024-08-21',0,1,1),(58,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-22',0.00,1000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(59,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-22',0.00,400.00,'REGISTRADA',0.00,0.00,'2024-08-22',0,1,1),(60,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-22',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-08-22',0,1,1),(61,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-22',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-08-22',0,1,1),(62,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-22',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-08-22',0,1,1),(63,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-23',0.00,1200.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(64,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-23',0.00,1800.00,'REGISTRADA',0.00,0.00,'2024-08-23',0,1,1),(65,1,1,1,'FACTURA','FV',NULL,'CONTADO','2024-08-23',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-08-23',0,1,1),(66,1,1,1,'TICKET','FV',NULL,'CREDITO','2024-08-23',0.00,5400.00,'POR_COBRAR',0.00,0.00,'2024-09-23',0,1,1),(67,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-23',0.00,3600.00,'REGISTRADA',0.00,0.00,'2024-08-23',0,1,1),(68,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-24',0.00,6300.00,'REGISTRADA',0.00,0.00,'2024-08-24',0,1,1),(69,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-25',0.00,1200.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(70,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-25',0.00,3000.00,'REGISTRADA',0.00,0.00,'2024-08-25',0,1,1),(71,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-25',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-08-25',0,1,1),(72,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-25',0.00,4500.00,'REGISTRADA',0.00,0.00,'2024-08-25',0,1,1),(73,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-25',0.00,700.00,'REGISTRADA',0.00,0.00,'2024-08-25',0,1,1),(74,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-25',0.00,300.00,'REGISTRADA',0.00,0.00,'2024-08-25',0,1,1),(75,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-26',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-08-26',0,1,1),(76,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-26',0.00,5000.00,'REGISTRADA',0.00,0.00,'2024-08-26',0,1,1),(77,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-26',0.00,1000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(78,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-26',0.00,1900.00,'REGISTRADA',0.00,0.00,'2024-08-26',0,1,1),(79,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-26',0.00,2400.00,'REGISTRADA',0.00,0.00,'2024-08-26',0,1,1),(80,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-27',0.00,1800.00,'REGISTRADA',0.00,0.00,'2024-08-27',0,1,1),(81,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-27',0.00,1800.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(82,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,3100.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(83,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(84,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,3000.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(85,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,2000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(86,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(87,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,1000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(88,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,3200.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(89,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,1800.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(90,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(91,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-28',0.00,300.00,'REGISTRADA',0.00,0.00,'2024-08-28',0,1,1),(92,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-29',0.00,3400.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(93,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-29',0.00,7200.00,'REGISTRADA',0.00,0.00,'2024-08-29',0,1,1),(94,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-29',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-08-29',0,1,1),(95,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-08-30',0.00,1600.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(96,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-02',0.00,9500.00,'REGISTRADA',0.00,0.00,'2024-09-02',0,1,1),(97,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-02',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-09-02',0,1,1),(98,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-02',0.00,1200.00,'REGISTRADA',0.00,0.00,'2024-09-02',0,1,1),(99,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-02',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-09-02',0,1,1),(100,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-02',0.00,600.00,'REGISTRADA',0.00,0.00,'2024-09-02',0,1,1),(101,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-02',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-09-02',0,1,1),(102,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-03',0.00,2600.00,'REGISTRADA',0.00,0.00,'2024-09-03',0,1,1),(103,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-03',0.00,3000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(104,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-03',0.00,800.00,'REGISTRADA',0.00,0.00,'2024-09-03',0,1,1),(105,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-03',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-09-03',0,1,1),(106,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-03',0.00,10000.00,'REGISTRADA',0.00,0.00,'2024-09-03',0,1,1),(107,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-04',0.00,3500.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(108,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-04',0.00,1500.00,'REGISTRADA',0.00,0.00,'2024-09-04',0,1,1),(109,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-04',0.00,3300.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(110,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-04',0.00,1600.00,'REGISTRADA',0.00,0.00,'2024-09-04',0,1,1),(111,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-04',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-09-04',0,1,1),(112,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-05',0.00,900.00,'REGISTRADA',0.00,0.00,'2024-09-05',0,1,1),(113,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-05',0.00,2000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(114,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-05',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-09-05',0,1,1),(115,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-06',0.00,8800.00,'REGISTRADA',0.00,0.00,'2024-09-06',0,1,1),(116,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-06',0.00,3000.00,'REGISTRADA',0.00,0.00,'2024-09-06',0,1,1),(117,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-06',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-09-06',0,1,1),(118,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-06',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-09-06',0,1,1),(119,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-06',0.00,1400.00,'REGISTRADA',0.00,0.00,'2024-09-06',0,1,1),(120,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-08',0.00,1000.00,'REGISTRADA',0.00,0.00,'0000-00-00',0,1,1),(121,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-09',0.00,8000.00,'REGISTRADA',0.00,0.00,'2024-09-09',0,1,1),(122,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-09',0.00,700.00,'REGISTRADA',0.00,0.00,'2024-09-09',0,1,1),(123,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-09',0.00,1000.00,'REGISTRADA',0.00,0.00,'2024-09-09',0,1,1),(124,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-09',0.00,7000.00,'REGISTRADA',0.00,0.00,'2024-09-09',0,1,1),(125,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-10',0.00,1600.00,'REGISTRADA',0.00,0.00,'2024-09-10',0,1,1),(126,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-13',0.00,2700.00,'REGISTRADA',0.00,0.00,'2024-09-13',0,1,1),(127,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-13',0.00,4200.00,'REGISTRADA',0.00,0.00,'2024-09-13',0,1,1),(128,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-16',0.00,14200.00,'REGISTRADA',0.00,0.00,'2024-09-16',0,1,1),(129,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-16',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-09-16',0,1,1),(130,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-16',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-09-16',0,1,1),(131,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-16',0.00,6200.00,'REGISTRADA',0.00,0.00,'2024-09-16',0,1,1),(132,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-09-17',0.00,2000.00,'REGISTRADA',0.00,0.00,'2024-09-17',0,1,1),(133,1,1,1,'TICKET','FV',NULL,'CONTADO','2024-11-15',0.00,800.00,'REGISTRADA',0.00,0.00,'2024-11-15',0,1,1);

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

/* Procedure structure for procedure `prc_ActualizarDetalleVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ActualizarDetalleVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ActualizarDetalleVenta`(IN `p_codigo_producto` VARCHAR(20), IN `p_cantidad` FLOAT, IN `p_id` INT)
BEGIN

 declare v_nro_boleta varchar(20);
 declare v_total_venta float;

/*
ACTUALIZAR EL STOCK DEL PRODUCTO QUE SEA MODIFICADO
......
.....
.......
*/

/*
ACTULIZAR CODIGO, CANTIDAD Y TOTAL DEL ITEM MODIFICADO
*/

 UPDATE venta_detalle 
 SET codigo_producto = p_codigo_producto, 
 cantidad = p_cantidad, 
 total_venta = (p_cantidad * (select precio_venta_producto from productos where codigo_producto = p_codigo_producto))
 WHERE id = p_id;
 
 set v_nro_boleta = (select nro_boleta from venta_detalle where id = p_id);
 set v_total_venta = (select sum(total_venta) from venta_detalle where nro_boleta = v_nro_boleta);
 
 update venta_cabecera
   set total_venta = v_total_venta
 where nro_boleta = v_nro_boleta;

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_eliminar_venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_eliminar_venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_eliminar_venta`(IN `p_nro_boleta` VARCHAR(8))
BEGIN

DECLARE v_codigo VARCHAR(20);
DECLARE v_cantidad FLOAT;
DECLARE done INT DEFAULT FALSE;

DECLARE cursor_i CURSOR FOR 
SELECT codigo_producto,cantidad 
FROM venta_detalle 
where CAST(nro_boleta AS CHAR CHARACTER SET utf8)  = CAST(p_nro_boleta AS CHAR CHARACTER SET utf8) ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cursor_i;
read_loop: LOOP
FETCH cursor_i INTO v_codigo, v_cantidad;

	IF done THEN
	  LEAVE read_loop;
	END IF;
    
    UPDATE PRODUCTOS 
       SET stock_producto = stock_producto + v_cantidad
    WHERE CAST(codigo_producto AS CHAR CHARACTER SET utf8) = CAST(v_codigo AS CHAR CHARACTER SET utf8);
    
END LOOP;
CLOSE cursor_i;

DELETE FROM VENTA_DETALLE WHERE CAST(nro_boleta AS CHAR CHARACTER SET utf8) = CAST(p_nro_boleta AS CHAR CHARACTER SET utf8) ;
DELETE FROM VENTA_CABECERA WHERE CAST(nro_boleta AS CHAR CHARACTER SET utf8)  = CAST(p_nro_boleta AS CHAR CHARACTER SET utf8) ;

SELECT 'Se eliminó correctamente la venta';
END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ListarCategorias` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ListarCategorias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ListarCategorias`()
BEGIN
select * from categorias;
END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ListarProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ListarProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ListarProductos`()
SELECT   '' as detalles,
		codigo_producto,
		id_categoria_producto,
		nombre_categoria,
		descripcion_producto,
		ROUND(precio_compra_producto,2) as precio_compra_producto,
		ROUND(precio_venta_producto,2) as precio_venta_producto,
        ROUND(precio_mayor_producto,2) as precio_mayor_producto,
        ROUND(precio_oferta_producto,2) as precio_oferta_producto,
		case when c.aplica_peso = 1 then concat(stock_producto,' Kg(s)')
			else concat(stock_producto,' Und(s)') end as stock_producto,
		case when c.aplica_peso = 1 then concat(minimo_stock_producto,' Kg(s)')
			else concat(minimo_stock_producto,' Und(s)') end as minimo_stock_producto,
		case when c.aplica_peso = 1 then concat(ventas_producto,' Kg(s)') 
			else concat(ventas_producto,' Und(s)') end as ventas_producto,
		ROUND(costo_total_producto,2) as costo_total_producto,
		fecha_creacion_producto,
		fecha_actualizacion_producto,
		'' as acciones
	FROM productos p INNER JOIN categorias c on p.id_categoria_producto = c.id_categoria 
	order by p.codigo_producto desc */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ListarProductosMasVendidos` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ListarProductosMasVendidos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ListarProductosMasVendidos`()
    NO SQL
BEGIN

select  p.codigo_producto,
		p.descripcion_producto,
        sum(vd.cantidad) as cantidad,
        sum(Round(vd.total_venta,2)) as total_venta
from venta_detalle vd inner join productos p on vd.codigo_producto = p.codigo_producto
group by p.codigo_producto,
		p.descripcion_producto
order by  sum(Round(vd.total_venta,2)) DESC
limit 10;

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ListarProductosPocoStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ListarProductosPocoStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ListarProductosPocoStock`()
    NO SQL
BEGIN
select p.codigo_producto,
		p.descripcion_producto,
        p.stock_producto,
        p.minimo_stock_producto
from productos p
where p.stock_producto <= p.minimo_stock_producto
order by p.stock_producto asc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ObtenerDatosDashboard` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ObtenerDatosDashboard` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ObtenerDatosDashboard`()
    NO SQL
BEGIN
 DECLARE totalProductos INT;
DECLARE totalCompras float;
DECLARE totalVentas FLOAT;
/*DECLARE ganancias float*/
DECLARE productosPocoStock int;
DECLARE ventasHoy FLOAT;

SET totalProductos  =(SELECT COUNT(*) FROM producto p);
 SET totalCompras = (SELECT
      SUM(p.compra)
    FROM producto p);
SET totalVentas = (SELECT
      SUM(vc.venta_total)
    FROM venta vc);
SET productosPocoStock = (SELECT
      COUNT(1)
    FROM producto p
    WHERE p.producto_stock <= p.cant_minima);
    
    SET ventasHoy = (SELECT
      SUM(vc.venta_total)
    FROM venta vc
    WHERE DATE(vc.venta_fecha) = CURDATE());
SELECT
    IFNULL(totalProductos, 0) AS totalProductos,
    IFNULL(CONCAT('', FORMAT(totalCompras, 2)), 0) AS totalCompras,
    IFNULL(CONCAT('', FORMAT(totalVentas, 2)), 0) AS totalVentas,
   /* IFNULL(CONCAT('S./ ', FORMAT(ganancias, 2)), 0) AS ganancias*/
    IFNULL(productosPocoStock, 0) AS productosPocoStock,
    IFNULL(CONCAT('', FORMAT(ventasHoy, 2)), 0) AS ventasHoy;

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_obtenerNroBoleta` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_obtenerNroBoleta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_obtenerNroBoleta`()
    NO SQL
select serie_boleta,
		IFNULL(LPAD(max(c.nro_correlativo_venta)+1,8,'0'),'00000001') nro_venta 
from empresa c */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ObtenerVentasMesActual` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ObtenerVentasMesActual` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ObtenerVentasMesActual`()
    NO SQL
BEGIN
SELECT DATE(vc.venta_fecha) AS fecha_venta,
SUM(round(vc.venta_total, 2)) AS total_Venta,
(SELECT sum(round(vc1.venta_total, 2))
 from venta AS vc1
where date(vc1.venta_fecha) >= date(last_day(now() - INTERVAL 2 month) + INTERVAL 1 day)
		and date(vc1.venta_fecha) <= last_day(last_day(now() - INTERVAL 2 month) + INTERVAL 1 day)
        and date(vc1.venta_fecha) = DATE_ADD(vc.venta_fecha, INTERVAL -1 MONTH)
		group by date(vc1.venta_fecha)) as total_venta_ant
 FROM venta vc 
where date(vc.venta_fecha) >= date(last_day(now() - INTERVAL 1 month) + INTERVAL 1 day)
and date(vc.venta_fecha) <= last_day(date(CURRENT_DATE))
group by date(vc.venta_fecha);

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_ObtenerVentasMesAnterior` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_ObtenerVentasMesAnterior` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_ObtenerVentasMesAnterior`()
    NO SQL
BEGIN
SELECT date(vc.fecha_venta) as fecha_venta,
		sum(round(vc.total_venta,2)) as total_venta,
        sum(round(vc.total_venta,2)) as total_venta_ant
FROM venta_cabecera vc
where date(vc.fecha_venta) >= date(last_day(now() - INTERVAL 2 month) + INTERVAL 1 day)
and date(vc.fecha_venta) <= last_day(last_day(now() - INTERVAL 2 month) + INTERVAL 1 day)
group by date(vc.fecha_venta);
END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_registrar_kardex_bono` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_registrar_kardex_bono` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_registrar_kardex_bono`(IN `p_codigo_producto` VARCHAR(20), IN `p_concepto` VARCHAR(100), IN `p_nuevo_stock` FLOAT)
BEGIN

	declare v_unidades_ex float;
	declare v_costo_unitario_ex float;    
	declare v_costo_total_ex float;
    
    declare v_unidades_in float;
	declare v_costo_unitario_in float;    
	declare v_costo_total_in float;
    
	/*OBTENEMOS LAS ULTIMAS EXISTENCIAS DEL PRODUCTO*/
    
    SELECT k.ex_costo_unitario , k.ex_unidades, k.ex_costo_total
    into v_costo_unitario_ex, v_unidades_ex, v_costo_total_ex
    FROM KARDEX K
    WHERE K.CODIGO_PRODUCTO = p_codigo_producto
    ORDER BY ID DESC
    LIMIT 1;
    
    /*SETEAMOS LOS VALORES PARA EL REGISTRO DE INGRESO*/
    SET v_unidades_in = p_nuevo_stock;
    SET v_costo_unitario_in = 0;
    SET v_costo_total_in = v_unidades_in * v_costo_unitario_in;
    
    /*SETEAMOS LAS EXISTENCIAS ACTUALES*/
    SET v_unidades_ex = ROUND(v_unidades_in,2);    
    SET v_costo_total_ex = ROUND(v_costo_total_ex + v_costo_total_in,2);
    
    IF(v_costo_total_ex > 0) THEN
		SET v_costo_unitario_ex = ROUND(v_costo_total_ex/v_unidades_ex,2);
	else
		SET v_costo_unitario_ex = ROUND(0,2);
    END IF;
    
        
	INSERT INTO KARDEX(codigo_producto,
						fecha,
                        concepto,
                        comprobante,
                        in_unidades,
                        in_costo_unitario,
                        in_costo_total,
                        ex_unidades,
                        ex_costo_unitario,
                        ex_costo_total)
				VALUES(p_codigo_producto,
						curdate(),
                        p_concepto,
                        '',
                        v_unidades_in,
                        v_costo_unitario_in,
                        v_costo_total_in,
                        v_unidades_ex,
                        v_costo_unitario_ex,
                        v_costo_total_ex);

	/*ACTUALIZAMOS EL STOCK, EL NRO DE VENTAS DEL PRODUCTO*/
	UPDATE PRODUCTOS 
	SET stock_producto = v_unidades_ex, 
        precio_compra_producto = v_costo_unitario_ex,
        costo_total_producto = v_costo_total_ex
	WHERE codigo_producto = p_codigo_producto ;                      

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_registrar_kardex_existencias` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_registrar_kardex_existencias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_registrar_kardex_existencias`(IN `p_codigo_producto` VARCHAR(25), IN `p_concepto` VARCHAR(100), IN `p_comprobante` VARCHAR(100), IN `p_unidades` FLOAT, IN `p_costo_unitario` FLOAT, IN `p_costo_total` FLOAT)
BEGIN
  INSERT INTO KARDEX (codigo_producto, fecha, concepto, comprobante, ex_unidades, ex_costo_unitario, ex_costo_total)
    VALUES (p_codigo_producto, CURDATE(), p_concepto, p_comprobante, p_unidades, p_costo_unitario, p_costo_total);

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_registrar_kardex_vencido` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_registrar_kardex_vencido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_registrar_kardex_vencido`(IN `p_codigo_producto` VARCHAR(20), IN `p_concepto` VARCHAR(100), IN `p_nuevo_stock` FLOAT)
BEGIN

	declare v_unidades_ex float;
	declare v_costo_unitario_ex float;    
	declare v_costo_total_ex float;
    
    declare v_unidades_out float;
	declare v_costo_unitario_out float;    
	declare v_costo_total_out float;
    
	/*OBTENEMOS LAS ULTIMAS EXISTENCIAS DEL PRODUCTO*/    
    SELECT k.ex_costo_unitario , k.ex_unidades, k.ex_costo_total
    into v_costo_unitario_ex, v_unidades_ex, v_costo_total_ex
    FROM KARDEX K
    WHERE K.CODIGO_PRODUCTO = p_codigo_producto
    ORDER BY ID DESC
    LIMIT 1;
    
    /*SETEAMOS LOS VALORES PARA EL REGISTRO DE SALIDA*/
    SET v_unidades_out = p_nuevo_stock;
    SET v_costo_unitario_out = 0;
    SET v_costo_total_out = v_unidades_out * v_costo_unitario_out;
    
    /*SETEAMOS LAS EXISTENCIAS ACTUALES*/
    SET v_unidades_ex = ROUND(v_unidades_out,2);    
    SET v_costo_total_ex = ROUND(v_costo_total_ex - v_costo_total_out,2);
    
    IF(v_costo_total_ex > 0) THEN
		SET v_costo_unitario_ex = ROUND(v_costo_total_ex/v_unidades_ex,2);
	else
		SET v_costo_unitario_ex = ROUND(0,2);
    END IF;
    
        
	INSERT INTO KARDEX(codigo_producto,
						fecha,
                        concepto,
                        comprobante,
                        out_unidades,
                        out_costo_unitario,
                        out_costo_total,
                        ex_unidades,
                        ex_costo_unitario,
                        ex_costo_total)
				VALUES(p_codigo_producto,
						curdate(),
                        p_concepto,
                        '',
                        v_unidades_out,
                        v_costo_unitario_out,
                        v_costo_total_out,
                        v_unidades_ex,
                        v_costo_unitario_ex,
                        v_costo_total_ex);

	/*ACTUALIZAMOS EL STOCK, EL NRO DE VENTAS DEL PRODUCTO*/
	UPDATE PRODUCTOS 
	SET stock_producto = v_unidades_ex, 
        precio_compra_producto = v_costo_unitario_ex,
        costo_total_producto = v_costo_total_ex
	WHERE codigo_producto = p_codigo_producto ;                      

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_registrar_kardex_venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_registrar_kardex_venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_registrar_kardex_venta`(IN `p_codigo_producto` VARCHAR(20), IN `p_fecha` DATE, IN `p_concepto` VARCHAR(100), IN `p_comprobante` VARCHAR(100), IN `p_unidades` FLOAT)
BEGIN

	declare v_unidades_ex float;
	declare v_costo_unitario_ex float;    
	declare v_costo_total_ex float;
    
    declare v_unidades_out float;
	declare v_costo_unitario_out float;    
	declare v_costo_total_out float;
    

	/*OBTENEMOS LAS ULTIMAS EXISTENCIAS DEL PRODUCTO*/
    
    SELECT k.ex_costo_unitario , k.ex_unidades, k.ex_costo_total
    into v_costo_unitario_ex, v_unidades_ex, v_costo_total_ex
    FROM KARDEX K
    WHERE K.CODIGO_PRODUCTO = p_codigo_producto
    ORDER BY ID DESC
    LIMIT 1;
    
    /*SETEAMOS LOS VALORES PARA EL REGISTRO DE SALIDA*/
    SET v_unidades_out = p_unidades;
    SET v_costo_unitario_out = v_costo_unitario_ex;
    SET v_costo_total_out = p_unidades * v_costo_unitario_ex;
    
    /*SETEAMOS LAS EXISTENCIAS ACTUALES*/
    SET v_unidades_ex = ROUND(v_unidades_ex - v_unidades_out,2);    
    SET v_costo_total_ex = ROUND(v_costo_total_ex -  v_costo_total_out,2);
    
    IF(v_costo_total_ex > 0) THEN
		SET v_costo_unitario_ex = ROUND(v_costo_total_ex/v_unidades_ex,2);
	else
		SET v_costo_unitario_ex = ROUND(0,2);
    END IF;
    
        
	INSERT INTO KARDEX(codigo_producto,
						fecha,
                        concepto,
                        comprobante,
                        out_unidades,
                        out_costo_unitario,
                        out_costo_total,
                        ex_unidades,
                        ex_costo_unitario,
                        ex_costo_total)
				VALUES(p_codigo_producto,
						p_fecha,
                        p_concepto,
                        p_comprobante,
                        v_unidades_out,
                        v_costo_unitario_out,
                        v_costo_total_out,
                        v_unidades_ex,
                        v_costo_unitario_ex,
                        v_costo_total_ex);

	/*ACTUALIZAMOS EL STOCK, EL NRO DE VENTAS DEL PRODUCTO*/
	UPDATE PRODUCTOS 
	SET stock_producto = v_unidades_ex, 
		ventas_producto = ventas_producto + v_unidades_out,
        precio_compra_producto = v_costo_unitario_ex,
        costo_total_producto = v_costo_total_ex
	WHERE codigo_producto = p_codigo_producto ;                      

END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_registrar_venta_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_registrar_venta_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_registrar_venta_detalle`(IN `p_nro_boleta` VARCHAR(8), IN `p_codigo_producto` VARCHAR(20), IN `p_cantidad` FLOAT, IN `p_total_venta` FLOAT)
BEGIN
declare v_precio_compra float;
declare v_precio_venta float;

SELECT p.precio_compra_producto,p.precio_venta_producto
into v_precio_compra, v_precio_venta
FROM productos p
WHERE p.codigo_producto  = p_codigo_producto;
    
INSERT INTO venta_detalle(nro_boleta,codigo_producto, cantidad, costo_unitario_venta,precio_unitario_venta,total_venta, fecha_venta) 
VALUES(p_nro_boleta,p_codigo_producto,p_cantidad, v_precio_compra, v_precio_venta,p_total_venta,curdate());
                                                        
END */$$
DELIMITER ;

/* Procedure structure for procedure `prc_top_ventas_categorias` */

/*!50003 DROP PROCEDURE IF EXISTS  `prc_top_ventas_categorias` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_top_ventas_categorias`()
BEGIN

select cast(sum(vd.total_venta)  AS DECIMAL(8,2)) as y, c.nombre_categoria as label
    from venta_detalle vd inner join productos p on vd.codigo_producto = p.codigo_producto
                        inner join categorias c on c.id_categoria = p.id_categoria_producto
    group by c.nombre_categoria
    LIMIT 10;
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

/* Procedure structure for procedure `sp_add_document_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_add_document_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_document_type`(
	IN `NOMBRE` VARCHAR(80),
	IN `ABREVIATURA` CHAR(50),
	IN `COMPANY_ID` INT,
	IN `IDUSER` INT
)
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM document_type
 WHERE `name`=NOMBRE);
IF @CANTIDAD= 0 THEN 
INSERT INTO document_type(`name`,abbreviation,company_id,created_by)
VALUES (NOMBRE,ABREVIATURA,COMPANY_ID,IDUSER);
SELECT 1;

 ELSE 

 SELECT 2;

 END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_agregar_iva` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_agregar_iva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_iva`(
	IN `COD` VARCHAR(50),
	IN `TAR_IVA` DOUBLE,
	IN `DESCRIPCION` VARCHAR(250),
	IN `IDEMPRESA` INT
)
BEGIN

DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM iva

 WHERE `nombre`=DESCRIPCION);

IF @CANTIDAD= 0 THEN 

INSERT INTO iva(`codigo`,tarifa,nombre,
`idempresa`)

VALUES (COD,TAR_IVA,DESCRIPCION,IDEMPRESA);


SELECT 1;


 ELSE 


 SELECT 2;


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

/* Procedure structure for procedure `sp_dashboard_datos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_dashboard_datos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dashboard_datos`()
BEGIN
 DECLARE totalProductos int;
  DECLARE totalCompras float;
  DECLARE totalVentas float;
  
  DECLARE productosPocoStock int;
  DECLARE ventasHoy float;
  SET totalProductos = (SELECT
      COUNT(*)
    FROM producto p);
  SET totalCompras = (SELECT  
sum(c.compra_total)  FROM compra c);
  /*set totalVentas = (select sum(vc.total_venta) from venta_cabecera vc where EXTRACT(MONTH FROM vc.fecha_venta) = EXTRACT(MONTH FROM curdate()) and EXTRACT(YEAR FROM vc.fecha_venta) = EXTRACT(YEAR FROM curdate()));*/
  SET totalVentas = (SELECT SUM(v.venta_total)
 FROM venta v);
  /*set ganancias = (select sum(vd.total_venta - (p.precio_compra_producto * vd.cantidad)) 
  					from venta_detalle vd inner join productos p on vd.codigo_producto = p.codigo_producto
                   where EXTRACT(MONTH FROM vd.fecha_venta) = EXTRACT(MONTH FROM curdate()) 
                   and EXTRACT(YEAR FROM vd.fecha_venta) = EXTRACT(YEAR FROM curdate()));*/
  /*SET ganancias = (SELECT sum(vd.dv_cantidad * vd.dv_precio)
  FROM detalle_venta vd);*/
  SET productosPocoStock = (SELECT COUNT(1)
  FROM producto p
  WHERE p.producto_stock <=p.cant_minima);
  SET ventasHoy = (SELECT sum(dv.venta_total)
   FROM venta dv
   WHERE DATE(dv.venta_fecha) =CURDATE());

  SELECT
    IFNULL(totalProductos, 0) AS totalProductos,
    IFNULL(CONCAT('$./ ', FORMAT(totalCompras, 2)), 0) AS totalCompras,
    IFNULL(CONCAT('$./ ', FORMAT(totalVentas, 2)), 0) AS totalVentas,
    /*IFNULL(CONCAT('S./ ', FORMAT(ganancias, 2)), 0) AS ganancias,*/
    IFNULL(productosPocoStock, 0) AS productosPocoStock,
    IFNULL(CONCAT('$./ ', FORMAT(ventasHoy, 2)), 0) AS ventasHoy;


END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_DETAIL_QUOTES_ADD` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_DETAIL_QUOTES_ADD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DETAIL_QUOTES_ADD`(
	IN `ID` INT,
	IN `IDPRODUCTO` INT,
	IN `CANTIDAD` DOUBLE,
	IN `PRECIO` DOUBLE,
	IN `DCTO` DOUBLE
)
BEGIN
 INSERT INTO `quotation_detail`(`quote_id`,`producto_id`,`cantidad`,`precio`,`descuento`,`estatus`)

 VALUES(ID,IDPRODUCTO,CANTIDAD,PRECIO,DCTO,'INGRESADA');
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_ESTATUS_CONCEPTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_ESTATUS_CONCEPTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ESTATUS_CONCEPTO`(
	IN `IDCONCEPTO` INT,
	IN `ESTATUS` VARCHAR(50)
)
BEGIN
 UPDATE concepto SET 
 	estatus = ESTATUS 
	where id = IDCONCEPTO;
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

/* Procedure structure for procedure `sp_listar_quotes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listar_quotes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_quotes`(
	IN `FINICIO` DATE,
	IN `FFIN` DOUBLE
)
BEGIN
SELECT q.id, 
q.empresa_id,
q.cliente_id,
concat_ws(' ',`persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) as cliente,
q.bodega_id,
b.nombre_bodega,
q.usuario_id,
u.usuario_nombre,
q.tipo, q.fecha_quote, q.fecha_vencimiento,
q.impuesto,q.total,q.estatus,
q.porcentaje,q.total_dcto,q.fregistro
FROM quotes q
INNER JOIN usuario u
ON q.usuario_id = u.usuario_id
INNER JOIN bodega b ON
q.bodega_id = b.id
INNER JOIN empresa e ON
 q.empresa_id = e.ID
 INNER  JOIN cliente c on
 q.cliente_id  = c.idcliente
INNER JOIN `persona` 
        ON (`c`.`persona_id`
		   = `persona`.`persona_id`)
		   WHERE `q`.fecha_quote between FINICIO AND FFIN;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_ROL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_ROL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ROL`()
SELECT * FROM  rol */$$
DELIMITER ;

/* Procedure structure for procedure `SP_LISTAR_SALIDA_CON_DETALLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_LISTAR_SALIDA_CON_DETALLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_SALIDA_CON_DETALLE`()
BEGIN
  SELECT
        s.id AS salida_id,
        s.fecha,
        s.id_usuario,
        u.usuario_nombre AS nombre_usuario,
        s.id_bodega,
        b.nombre_bodega AS nombre_bodega,
        s.tipo_salida,
        s.motivo,
        ds.id AS detalle_salida_id,
        ds.id_producto,
        p.producto_nombre AS nombre_producto,
        ds.cantidad,
        ds.precio_unitario,
        (ds.cantidad * ds.precio_unitario) AS total
    FROM
        salida s
    INNER JOIN
        detalle_salida ds ON s.id = ds.id_salida
    INNER JOIN
        usuario u ON s.id_usuario = u.usuario_id
    INNER JOIN
        bodega b ON s.id_bodega = b.id
    INNER JOIN
        producto p ON ds.id_producto = p.producto_id
        ORDER BY
		  s.fecha DESC, s.id DESC;
END */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_CONCEPTO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_CONCEPTO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CONCEPTO`(
	IN `IDCONCEPTO` INT,
	IN `DESCRIPCION_ACTUAL` VARCHAR(250),
	IN `DESCRIPCION_NUEVO` VARCHAR(250),
	IN `ESTATUS_CON` VARCHAR(50)
)
BEGIN

DECLARE CANTIDAD INT;

IF DESCRIPCION_ACTUAL = DESCRIPCION_NUEVO THEN

	UPDATE concepto set

	estatus=ESTATUS_CON

	where id = IDCONCEPTO;

select 1;

ELSE 

SET @CANTIDAD:=(SELECT COUNT(*)
 FROM concepto WHERE descripcion=DESCRIPCION_NUEVO);

if  @CANTIDAD = 0 THEN

UPDATE concepto set

estatus=ESTATUS_CON,

descripcion=DESCRIPCION_NUEVO

where id = IDCONCEPTO;

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

/* Procedure structure for procedure `sp_modificar_estado_iva` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_modificar_estado_iva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_estado_iva`(
	IN `IDIVA` INT,
	IN `ESTATUS_IMP` VARCHAR(50)
)
BEGIN
UPDATE iva SET 
`estado` = ESTATUS_IMP 
WHERE `id` = IDIVA;
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

/* Procedure structure for procedure `SP_MODIFICAR_ESTATUS_TIPO_COMPROBANTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_ESTATUS_TIPO_COMPROBANTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_TIPO_COMPROBANTE`(
	IN `IDTIPO_CP` INT,
	IN `ESTATUS_CP` VARCHAR(50)
)
UPDATE tipo_comprobante set 
estatus = ESTATUS_CP 
where id = IDTIPO_CP */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_IVA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_IVA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_IVA`(
	IN `IDIVA` INT,
	IN `COD_ACTUAL` VARCHAR(50),
	IN `COD_NUEVO` VARCHAR(50),
	IN `TARIFA_IVA` FLOAT,
	IN `NOMBRE_IVA` VARCHAR(500),
	IN `IDTIPOIMP` INT
)
BEGIN
DECLARE CANTIDAD INT;
IF COD_ACTUAL = COD_NUEVO THEN
	UPDATE iva set
	tarifa=TARIFA_IVA,
	nombre=NOMBRE_IVA,
	idTipoImpuesto=IDTIPOIMP
	where id = IDIVA;
select 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*)
 FROM iva WHERE 
 codigo=COD_NUEVO);
if  @CANTIDAD = 0 THEN
UPDATE iva SET
	codigo=COD_NUEVO,
	tarifa=TARIFA_IVA,
	nombre=NOMBRE_IVA,
	idTipoImpuesto=IDTIPOIMP
	where id = IDIVA;
select 1;
ELSE 
select 2;
END IF;
END IF;
END */$$
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

/* Procedure structure for procedure `SP_MODIFICAR_TIPO_COMPROBANTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_MODIFICAR_TIPO_COMPROBANTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_TIPO_COMPROBANTE`(
	IN `IDTIPO` INT,
	IN `TIPO_ACTUAL` VARCHAR(50),
	IN `TIPO_NUEVA` VARCHAR(50),
	IN `DESCRIPCION_CP` VARCHAR(50)
)
BEGIN
DECLARE CANTIDAD INT;
IF TIPO_ACTUAL = TIPO_NUEVA THEN
    UPDATE tipo_comprobante set
    descripcion=DESCRIPCION_CP
    where id = IDTIPO;
select 1;
ELSE 
SET @CANTIDAD:=(SELECT COUNT(*) FROM tipo_comprobante
 WHERE abreviatura=TIPO_NUEVA);
if  @CANTIDAD = 0 THEN
 UPDATE tipo_comprobante set
    abreviatura=TIPO_NUEVA,
    descripcion=DESCRIPCION_CP
    where id = IDTIPO;
select 1;
ELSE 
select 2;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DEPTO`(
	IN `DESCRIPCION` VARCHAR(50)
)
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTO`(
	IN `CODIGO` VARCHAR(100),
	IN `NOMBRE` VARCHAR(100),
	IN `DESCRIPCION_PD` TEXT,
	IN `CODIGO_BARRA` TEXT,
	IN `PRESENTACION` VARCHAR(250),
	IN `IDBODEGA` INT,
	IN `CANTIDAD_MIN` VARCHAR(100),
	IN `CANTIDAD_INICIAL` VARCHAR(100),
	IN `IDCATEGORIA` VARCHAR(100),
	IN `IDUNIDAD` INT,
	IN `IDTIPO` INT,
	IN `IDMARCA` INT,
	IN `IDIVA` INT,
	IN `RUTA` VARCHAR(255),
	IN `PRECIO_COMPRA` DOUBLE,
	IN `PRECIO_VENTA` DOUBLE,
	IN `IDEMPRESA` TEXT
)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_codigo =CODIGO OR producto_cod_barra =CODIGO_BARRA);
IF @CANTIDAD =0 THEN
INSERT INTO `producto` (`producto_codigo`,`producto_nombre`,producto_descripcion,producto_cod_barra,
`producto_presentacion`,`id_bodega`,
                        cant_minima,`producto_stock`,
	
`id_categoria`, `id_unidad`, `idTipoProducto`,`id_marca`,producto.IdIva, `producto_foto`, `compra`, `producto_precioventa`, 
`producto_estatus`,producto.`idempresa`) VALUES(CODIGO,NOMBRE,DESCRIPCION_PD,CODIGO_BARRA,
PRESENTACION,IDBODEGA, 
CANTIDAD_MIN, CANTIDAD_INICIAL,IDCATEGORIA,IDUNIDAD, IDTIPO,IDMARCA,IDIVA,RUTA,PRECIO_COMPRA,  PRECIO_VENTA,'ACTIVO',IDEMPRESA);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR2`(
	IN `NOMBRE` VARCHAR(50),
	IN `APEPAT` VARCHAR(50),
	IN `APEMAT` VARCHAR(50),
	IN `NRO_DOCUMENTO` VARCHAR(50),
	IN `TIPO_DOC` VARCHAR(50),
	IN `TIPO_CONTRIBUYENTE` VARCHAR(100),
	IN `TELEFONO` VARCHAR(50),
	IN `DIRECCION` VARCHAR(50),
	IN `CORREO` VARCHAR(100),
	IN `RAZON_SOCIAL` VARCHAR(255),
	IN `NUM_PROVEEDOR` VARCHAR(255),
	IN `IDCIUDAD` INT,
	IN `IDEMPRESA` INT,
	IN `IDTIPO_TERCERO` INT
)
BEGIN
DECLARE  cantidad INT;
SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);
IF @cantidad = 0 THEN
INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,
`persona_nrodocumento`,
`persona_tipodocumento`,
`tipo_contribuyente`, `persona_telefono`,
`persona_direccion`,`persona_correo`,   `persona_fregistro`,
`persona_estatus`,idempresa, `id_tipo_tercero`)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,
TIPO_CONTRIBUYENTE,TELEFONO,DIRECCION, CORREO,  CURDATE(),'ACTIVO',IDEMPRESA,IDTIPO_TERCERO);
INSERT INTO  proveedor(`proveedor_fregistro`,`proveedor_estatus`,`persona_id`,`proveedor_razon_social`,proveedor_num_contacto,idciudad, `idempresa`) 
VALUES (CURDATE(),'ACTIVO',LAST_INSERT_ID(),RAZON_SOCIAL,NUM_PROVEEDOR,IDCIUDAD, IDEMPRESA);
SELECT 1;
ELSE 
SELECT 2;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_REGISTRAR_QUOTES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_QUOTES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_QUOTES`(
	IN `IDEMPRESA` INT,
	IN `IDCLIENTE` INT,
	IN `IDBODEGA` INT,
	IN `IDUSUARIO` INT,
	IN `IDCOMPROBANTE` INT,
	IN `NO_QUOTE` INT,
	IN `FEC_QUOTE_VENCE` DATE,
	IN `QUOTE_IMP` DOUBLE,
	IN `QUOTE_TOTAL` DOUBLE,
	IN `QUOTE_PORCENTAJE` DOUBLE,
	IN `QUOTE_DCTO` DOUBLE
)
BEGIN
INSERT INTO quotes(empresa_id,cliente_id,
bodega_id,usuario_id,tipo_comprobante_id,
quote_no,fecha_quote,
fecha_vencimiento,impuesto,
total,porcentaje,total_dcto)
VALUES (IDEMPRESA,IDCLIENTE,IDBODEGA,IDUSUARIO,IDCOMPROBANTE,
NO_QUOTE,CURDATE(),
FEC_QUOTE_VENCE,QUOTE_IMP,QUOTE_TOTAL,QUOTE_PORCENTAJE,
QUOTE_DCTO);
 SELECT LAST_INSERT_ID();
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

/* Procedure structure for procedure `SP_REGISTRAR_TIPO_COMPROBANTE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_REGISTRAR_TIPO_COMPROBANTE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TIPO_COMPROBANTE`(
	IN `ABREVIATURA` VARCHAR(50),
	IN `DESCRIPCION_COMPROBANTE` VARCHAR(250),
	IN `IDEMPRESA` INT
)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) 
FROM `tipo_comprobante` WHERE
 `descripcion` = DESCRIPCION_COMPROBANTE);
IF @CANTIDAD = 0 THEN
INSERT INTO tipo_comprobante (abreviatura,descripcion,
  estatus,`idEmpresa`)
VALUES (ABREVIATURA,DESCRIPCION_COMPROBANTE,'ACTIVO',IDEMPRESA);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TIPO_PRODUCTO`(
	IN `NOMBRE` VARCHAR(200),
	IN `IDEMPRESA` INT
)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) 
FROM `tipo_producto` WHERE `tipo_producto` = NOMBRE);
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_VENTA`(
	IN `IDCLIENTE` INT,
	IN `IDBODEGA` INT,
	IN `IDUSUARIO` INT,
	IN `TIPO_COMPROBANTE` VARCHAR(50),
	IN `SERIE_COMPROBANTE` VARCHAR(50),
	IN `TIPO_PAGO` VARCHAR(50),
	IN `IMPUESTO` DECIMAL(10,2),
	IN `TOTAL` DECIMAL(10,2),
	IN `ESTADO` VARCHAR(50),
	IN `PORCENTAJE` DECIMAL(10,2),
	IN `DCTO_TOTAL` DECIMAL(10,2),
	IN `FECHA_VENCIMIENTO` DATE,
	IN `DIAS_PAGO` INT,
	IN `IDEMPRESA` INT,
	IN `IDCAJA` INT
)
BEGIN
 INSERT INTO venta(`cliente_id`,`bodega_id`, usuario_id,`venta_tipocomprobante`,
 `venta_serie`, tipo_pago,`venta_fecha` ,
 `venta_impuesto`,`venta_total`,venta_estatus,
 venta_porcentaje,venta_total_dcto, 
 `fecha_vencimiento`,dias_pago,
 `idempresa`,idcaja) VALUES 
 (IDCLIENTE,IDBODEGA,IDUSUARIO,
 TIPO_COMPROBANTE,SERIE_COMPROBANTE,
     TIPO_PAGO,CURDATE(), 
	  IMPUESTO,TOTAL,ESTADO,
	  PORCENTAJE,DCTO_TOTAL,
	  FECHA_VENCIMIENTO,
	  DIAS_PAGO,
	  IDEMPRESA,IDCAJA
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TraerDatosWidgets`(
	IN `INICIO` DATE,
	IN `FIN` DATE
)
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
