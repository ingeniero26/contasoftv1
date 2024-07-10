

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

INSERT INTO arl VALUES("1","223132","ARL DE PRUEBA","CARTAGENA","CARTGENA","43545","EMAIL@GMAIL.COM","2022-09-17 16:24:02","ACTIVO","1");
INSERT INTO arl VALUES("2","32434","ARL POSITIVA EJEMPLO","EL CARMEN DE BOLIVAR","NO SE DONDE QUEDA","4545454","NOSE1@GMAIL.COM","2022-10-17 16:07:29","ACTIVO","1");



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




CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO bodega VALUES("1","PRINCIPAL","2022-07-13 15:44:32","ACTIVO","1");



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

INSERT INTO caja VALUES("1","GENERAL","ACTIVO","2022-07-13 15:20:34","1");



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

INSERT INTO cargos VALUES("1","INGENIERO DE SISTEMAS","1","2023-05-24 19:56:27","ACTIVO");



CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(150) DEFAULT NULL,
  `categoria_fregistro` date DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO categoria VALUES("1","sillas","2022-07-13","ACTIVO","1");
INSERT INTO categoria VALUES("2","estufas","2022-07-13","ACTIVO","1");
INSERT INTO categoria VALUES("3","Papeleria","2022-08-22","ACTIVO","1");
INSERT INTO categoria VALUES("4","ventiladores","2022-08-22","ACTIVO","1");
INSERT INTO categoria VALUES("5","chanclas","2023-04-13","ACTIVO","1");
INSERT INTO categoria VALUES("6","herramientas","2023-05-18","ACTIVO","1");
INSERT INTO categoria VALUES("7","repuesto verntilador","2024-04-16","ACTIVO","1");
INSERT INTO categoria VALUES("8","repuesto estufas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("9","repuesto licuadora","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("10","repuesto lavadora","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("11","colchones","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("12","camas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("13","colchonetas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("14","cacharros","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("15","BOTA VENUS TELA","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("16","BOTA PANTANERA VENUS","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("17","BOTA GRULLA","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("18","utensilios de cocina","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("19","loza y cristaleria","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("20","jugueteria","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("21","morrales y maletas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("22","mallas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("23","licuadoras","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("24","neveras","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("25","OLLAS A PRESION","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("26","molinos y repuestos","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("27","cuchillos","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("28","ollas de aluminio","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("29","CABAS ICOPOR","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("30","tornilleria","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("31","cables","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("32","cuerdas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("33","televisores","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("34","ponchera y tazones","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("35","tanques plasticos","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("36","baldes plasticos","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("37","hamacas","2024-05-22","ACTIVO","1");
INSERT INTO categoria VALUES("38","MESAS PLASTICAS ","2024-05-31","ACTIVO","1");
INSERT INTO categoria VALUES("39","ASEO PERSONAL","2024-05-31","ACTIVO","1");
INSERT INTO categoria VALUES("40","LOZEROS Y PORTACUBIERTOS","2024-05-31","ACTIVO","1");
INSERT INTO categoria VALUES("41","BOTA PANTANERA VEREDA","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("42","BOTA PANTANERA MACHA","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("43","BOTA PANTANERA TITAN","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("44","BOTA VENUS ESTAMPADA","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("45","BOTA ANDINA DE DAMA","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("46","BOTA VENUS DE NIÑO","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("47","BOTA MAXTER","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("48","BOTA ARGOS","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("49","ZAPATO DE DAMA ","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("50","ZAPATO COLEGIAL NIÑO","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("51","GUAYOS Y ZAPATILLAS","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("52","BOTA DE TRABAJO ARGOS Y WELLCO","2024-06-01","ACTIVO","1");
INSERT INTO categoria VALUES("53","termos cafeteros","2024-06-05","ACTIVO","1");
INSERT INTO categoria VALUES("54","PESOS Y BASCULAS","2024-06-05","ACTIVO","1");
INSERT INTO categoria VALUES("55","NEVERAS Y TERMOS PLASTICOS","2024-06-05","ACTIVO","1");
INSERT INTO categoria VALUES("56","CHANCLA SOLIMAR HOMBRE","2024-06-06","ACTIVO","1");
INSERT INTO categoria VALUES("57","CHANCLA SOLIMAR DAMA","2024-06-06","ACTIVO","1");
INSERT INTO categoria VALUES("58","LAVADORAS","2024-06-08","ACTIVO","1");
INSERT INTO categoria VALUES("59","UTILES ESCOLARES","2024-06-08","ACTIVO","1");
INSERT INTO categoria VALUES("60","VARIOS","2024-06-08","ACTIVO","1");
INSERT INTO categoria VALUES("61","COBIJAS Y SABANAS","2024-06-08","ACTIVO","1");
INSERT INTO categoria VALUES("62","ENVASES HERMETICOS ","2024-06-08","ACTIVO","1");
INSERT INTO categoria VALUES("63","JARRAS PLASTICAS","2024-06-11","ACTIVO","1");
INSERT INTO categoria VALUES("64","UTENCILIOS PARA BAÑO","2024-06-12","ACTIVO","1");
INSERT INTO categoria VALUES("65","UTENSILIOS DE ASEO","2024-06-13","ACTIVO","1");
INSERT INTO categoria VALUES("66","MACETAS","2024-06-14","ACTIVO","1");
INSERT INTO categoria VALUES("67","CALDEROS ","2024-06-14","ACTIVO","1");
INSERT INTO categoria VALUES("68","ELECTRODOMESTICOS ","2024-06-21","ACTIVO","1");
INSERT INTO categoria VALUES("69","VARIOS 2","2024-06-22","ACTIVO","1");



CREATE TABLE `categoriaarl` (
  `IdCategoriaARL` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la categoria de ARL',
  `DescCategoriaARL` varchar(60) NOT NULL COMMENT 'Descripcion de la categoria de ARL',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje que cubre el ARL por categoria',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaciones o comentarios de la categoria de riesgo',
  PRIMARY KEY (`IdCategoriaARL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




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

INSERT INTO centro_costos VALUES("1","1","1","PRINCIPAL","ACTIVO","2023-08-11 12:55:27");



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

INSERT INTO ciudades VALUES("1","EL CARMEN DE BOLIVAR","1","1","ACTIVO","2024-05-20 13:48:10");
INSERT INTO ciudades VALUES("2","Cartagena","1","1","ACTIVO","2024-05-20 13:48:11");
INSERT INTO ciudades VALUES("3","San Jacinto","1","1","ACTIVO","2024-05-20 13:48:12");
INSERT INTO ciudades VALUES("4","San Juan Nepomuceno","1","","ACTIVO","2022-09-10 12:04:54");
INSERT INTO ciudades VALUES("5","Lorica","3","1","ACTIVO","2024-04-16 20:51:08");
INSERT INTO ciudades VALUES("6","Zambrano","1","1","ACTIVO","2024-05-20 13:49:53");



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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cliente VALUES("10","2024-05-21","ACTIVO","25","1","1");
INSERT INTO cliente VALUES("11","2024-05-22","ACTIVO","26","1","1");
INSERT INTO cliente VALUES("12","2024-05-22","ACTIVO","27","1","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO compra VALUES("3","15","1","1","TICKET","2575","5455","CONTADO","2024-05-23","0.00","640000.00","CANCELADA","0.00","0.00","2024-05-23","1");
INSERT INTO compra VALUES("4","10","1","1","FACTURA","00045","2233","CONTADO","2024-05-31","0.00","0.00","CANCELADA","19.00","0.00","2024-05-31","1");
INSERT INTO compra VALUES("5","11","1","1","FACTURA","1577","4566","CONTADO","2024-06-01","0.00","0.00","CANCELADA","19.00","0.00","2024-06-01","1");
INSERT INTO compra VALUES("6","8","1","1","FACTURA","154545","8744987","CONTADO","2024-06-04","0.00","0.00","CANCELADA","19.00","0.00","2024-06-04","1");
INSERT INTO compra VALUES("7","10","1","1","TICKET","","","CREDITO","2024-06-08","0.00","2640000.00","CANCELADA","0.00","0.00","2024-07-07","1");
INSERT INTO compra VALUES("8","10","1","1","FACTURA","14136","36+5959+5","CONTADO","2024-06-11","0.00","0.00","CANCELADA","19.00","0.00","2024-06-11","1");
INSERT INTO compra VALUES("9","10","1","1","FACTURA","14136","0.24135","CONTADO","2024-06-11","0.00","0.00","CANCELADA","19.00","0.00","2024-06-11","1");
INSERT INTO compra VALUES("11","24","1","1","TICKET","6545644","414564","CONTADO","2024-06-13","0.00","294000.00","CANCELADA","0.00","0.00","2024-06-13","1");
INSERT INTO compra VALUES("12","23","1","1","TICKET","4555","777755","CONTADO","2024-06-17","0.00","1036000.00","CANCELADA","0.00","0.00","2024-06-17","1");
INSERT INTO compra VALUES("13","19","1","1","TICKET","00193062656","00193062656","CREDITO","2024-06-06","0.00","938432.00","POR_PAGAR","0.00","0.00","2024-07-08","1");
INSERT INTO compra VALUES("14","11","1","1","TICKET","49666","49666","CONTADO","2024-06-18","0.00","1409756.00","POR_PAGAR","0.00","0.00","2024-07-18","1");
INSERT INTO compra VALUES("15","26","1","1","TICKET","1545415615","445444564","CONTADO","2024-06-19","0.00","272400.00","CANCELADA","0.00","0.00","2024-06-19","1");
INSERT INTO compra VALUES("16","26","1","1","TICKET","456456454","456565","CONTADO","2024-06-19","0.00","418800.00","CANCELADA","0.00","0.00","2024-06-19","1");
INSERT INTO compra VALUES("17","26","1","1","TICKET","84847","4654654","CONTADO","2024-06-22","0.00","831000.00","CANCELADA","0.00","0.00","2024-06-22","1");
INSERT INTO compra VALUES("18","26","1","1","TICKET","654544","65454","CONTADO","2024-06-22","0.00","12500.00","CANCELADA","0.00","0.00","2024-06-22","1");



CREATE TABLE `concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `concepto_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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

INSERT INTO cuentas VALUES("1","1","1","","ACTIVO","CLASE","0","0","0","0","","","","","2023-09-15 14:49:56","ACTIVO");
INSERT INTO cuentas VALUES("2","1","11","","DISPONLE","GRUPO","0","0","0","0","","","","","2023-09-15 14:53:44","ACTIVO");
INSERT INTO cuentas VALUES("3","1","1105","","CAJA","CUENTA GENERAL","0","0","0","0","","","","","2023-09-15 14:55:24","ACTIVO");
INSERT INTO cuentas VALUES("4","1","110505","","CAJA GENERAL","CUENTA DE DETALLE","1","0","0","0","","","","","2023-09-15 14:56:23","ACTIVO");
INSERT INTO cuentas VALUES("5","1","110510","","CAJA MENORES","CUENTA DE DETALLE","1","0","0","0","","","","","2023-09-15 15:00:15","ACTIVO");
INSERT INTO cuentas VALUES("6","1","110515","","MONEDA EXTRANGERA","CUENTA DE DETALLE","1","0","0","0","","","","","2023-09-15 19:53:40","ACTIVO");
INSERT INTO cuentas VALUES("7","1","1110","","BANCOS","CUENTA GENERAL","0","0","0","0","","","","","2023-09-15 19:56:12","ACTIVO");
INSERT INTO cuentas VALUES("8","1","111005","","MONEDA NACIONAL","CUENTA DE DETALLE","1","0","0","0","","","","","2023-09-15 20:02:17","ACTIVO");
INSERT INTO cuentas VALUES("9","1","111010","","MONEDA EXTRANGERA","CUENTA DE DETALLE","1","0","0","0","","","","","2023-09-15 20:02:34","ACTIVO");
INSERT INTO cuentas VALUES("10","1","1115","","RESEMESAS EN TRANSITO","CUENTA GENERAL","0","0","0","0","","","","","2023-09-15 20:04:03","ACTIVO");
INSERT INTO cuentas VALUES("12","1","1120","","CUENTAS DE AHORRO","CUENTA GENERAL","0","0","0","0","","","","","2023-09-21 14:43:59","ACTIVO");
INSERT INTO cuentas VALUES("13","1","112005","","BANCOS","CUENTA DE DETALLE","1","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("14","1","112010","","CORPORACIONES DE AHORRO Y VIVIENDA ","CUENTA DE DETALLE","1","0","0","0","0","","","0","2023-09-21 14:47:39","ACTIVO");
INSERT INTO cuentas VALUES("15","1","112015","","ORGANISMOS COOPERATIVOS FINANCIEROS ","CUENTA DE DETALLE","1","0","0","0","0","","","0","2023-09-21 14:48:56","ACTIVO");
INSERT INTO cuentas VALUES("16","1","1125","","FONDOS"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("17","1","12","","INVERSIONES","GRUPO","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("18","1","1205","","ACCIONES"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("19","1","120599","","AJUSTES POR INFLACION ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("20","1","1210","","CUOTAS O PARTES DE INTERES SOCIAL "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("21","1","121099","","AJUSTES POR INFLACION ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 15:13:02","ACTIVO");
INSERT INTO cuentas VALUES("22","1","1215","","BONOS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 15:14:49","ACTIVO");
INSERT INTO cuentas VALUES("23","1","1225","","CERTIFICADOS "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("24","1","122505","OBLIGACIONES","CERTIFICADOS DE DEPOSITO A TERMINO (C.D.T.) ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("25","1","122510","OBLIGACIONES","CERTIFICADOS DE DEPOSITO DE AHORRO ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("26","1","122515","OBLIGACIONES","CERTIFICADOS DE AHORRO DE VALOR CONSTANTE (C.A.V.C.) ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("27","1","122595","OBLIGACIONES","OTROS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("28","1","1230","","PAPELES COMERCIALES"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("29","1","123005","OBLIGACIONES","EMPRESAS COMERCIALES","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("30","1","123010","OBLIGACIONES","EMPRESAS INDUSTRIALES","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("31","1","123015","OBLIGACIONES","EMPRESAS DE SERVICIOS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("32","1","1235","","TITULOS"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("33","1","123515","OBLIGACIONES","TITULOS DE TESORERIA (T.E.S.) ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("34","1","123555","OBLIGACIONES","TITULOS FINANCIEROS INDUSTRIALES Y COMERCIALES ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("35","1","123560","OBLIGACIONES","TESOROS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("36","1","123565","OBLIGACIONES","TITULOS DE DEVOLUCION DE IMPUESTOS NACIONALES (TIDIS) ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("37","1","123570","OBLIGACIONES","TITULOS INMOBILIARIOS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("38","1","123595","OBLIGACIONES","OTROS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("39","1","1240","","ACEPTACIONES BANCARIAS O FINANCIERAS ","CUENTA GENERAL","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("40","1","124005","OBLIGACIONES","BANCOS COMERCIALES ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("41","1","124010","OBLIGACIONES","COMPAÑIAS DE FINANCIMENTO COMERCIAL","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("42","1","124015","OBLIGACIONES","CORPORACIONES FINANCIERAS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("43","1","124095","OBLIGACIONES","OTRAS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("44","1","1245","","DERECHOS FIDUCIARIOS "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("45","1","124505","OBLIGACIONES","FIDEICOMISOS DE INVERSION MONEDA NACIONAL ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("46","1","124510","OBLIGACIONES","FIDEICOMISOS DE INVERSION MONEDA EXTRANJERA ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("47","1","1250","","DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIADAS (REPOS) "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("48","1","125005","OBLIGACIONES","ACCIONES ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("49","1","125010","OBLIGACIONES","CUOTAS O PARTES DE INTERES SOCIAL ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("50","1","125015","OBLIGACIONES","BONOS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("51","1","125020","OBLIGACIONES","CEDULAS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("52","1","125025","OBLIGACIONES","CERTIFICADOS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("53","1","125030","OBLIGACIONES","PAPELES COMERCIALES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("54","1","125035","OBLIGACIONES","TITULOS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("55","1","125040","OBLIGACIONES","ACEPTACIONES BANCARIAS O FINANCIERAS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("56","1","125099","OBLIGACIONES","AJUSTES POR INFLACION ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("57","1","1155","","OBLIGATORIAS"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("58","1","125505","OBLIGACIONES","BONOS DE FINANCIAMIENTO ESPECIAL ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("59","1","125510","OBLIGACIONES","BONOS DE FINANCIAMIENTO PRESUPUESTAL ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("60","1","125515","OBLIGACIONES","BONOS PARA DESARROLLO SOCIAL Y SEGURIDAD INTERNA (B.D.S.I.) ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("61","1","125595","OBLIGACIONES","OTRAS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("62","1","1260","","CUENTAS EN PARTICIPACION "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("63","1","126099","OBLIGACIONES","AJUSTES POR INFLACION ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("64","1","1295","","OTRAS INVERSIONES "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("65","1","129599","OBLIGACIONES","AJUSTES POR INFLACION ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("66","1","1299","","PROVISIONES"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("67","1","129905","OBLIGACIONES","ACCIONES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("68","1","129910","OBLIGACIONES","CUOTAS O PARTES DE INTERES SOCIAL ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("69","1","129915","OBLIGACIONES","BONOS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("70","1","129920","OBLIGACIONES","CEDULAS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("71","1","129925","OBLIGACIONES","CERTIFICADOS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("72","1","129930","OBLIGACIONES","PAPELES COMERCIALES","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("73","1","129935","OBLIGACIONES","TITULOS","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("74","1","129940","OBLIGACIONES","ACEPTACIONES BANCARIAS O FINANCIERAS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("75","1","129945","OBLIGACIONES","DERECHOS FIDUCIARIOS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("76","1","129950","OBLIGACIONES","DERECHOS DE RECOMPRA DE INVERSIONES NEGOCIADAS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("77","1","129955","OBLIGACIONES","OBLIGATORIAS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("78","1","129960","OBLIGACIONES","CUENTAS EN PARTICIPACION ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("79","1","129995","OBLIGACIONES","OTRAS INVERSIONES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("80","1","13","","DEUDORES","GRUPO","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("81","1","1305","","CLIENTES"," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-09-21 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("82","1","130505","OBLIGACIONES","NACIONALES","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 08:17:07","ACTIVO");
INSERT INTO cuentas VALUES("83","1","130510","OBLIGACIONES","DEL EXTERIOR","","0","0","0","1","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("84","1","130515","OBLIGACIONES","DEUDORES DEL SISTEMA","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("85","1","1310","","CUENTAS CORRIENTES COMERCIALES","","0","0","0","0","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("86","1","131005","OBLIGACIONES","CASA MATRIZ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("87","1","131010","OBLIGACIONES","COMPAÑIAS VINCULADAS","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 08:20:51","ACTIVO");
INSERT INTO cuentas VALUES("88","1","131015","OBLIGACIONES","ACCIONISTAS O SOCIOS","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 08:21:44","ACTIVO");
INSERT INTO cuentas VALUES("89","1","131020","OBLIGACIONES","PARTICULARES","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("90","1","131095","OBLIGACIONES","OTRAS","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 08:23:45","ACTIVO");
INSERT INTO cuentas VALUES("91","1","1315","","CUENTAS POR  COBRAR A CASA MATRIZ","","0","0","0","0","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("92","1","131505","OBLIGACIONES","VENTAS","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("93","1","131510","OBLIGACIONES","PAGOS A NOMBRE DE CASA MATRIZ ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("94","1","131515","OBLIGACIONES","VALORES RECIBIDOS POR CASA MATRIZ ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-09-22 09:05:19","ACTIVO");
INSERT INTO cuentas VALUES("95","1","131520","BALANCE O SALDO","PRESTAMOS ","CUENTA DE DETALLE","0","0","0","0","0","CORRIENTE","","0","2023-10-18 19:03:24","ACTIVO");
INSERT INTO cuentas VALUES("96","1","1320","","CUENTAS POR COBRAR A VINCULADOS ECONOMICOS "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("97","1","132005","OBLIGACIONES","FILIALES ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("98","1","132010","OBLIGACIONES","SUBSIDIARIAS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("99","1","132015","OBLIGACIONES","SUCURSALES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("100","1","1325","","CUENTA S POR COBRAR A SOCIOS Y ACCIONISTAS "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("101","1","132505","OBLIGACIONES","A SOCIOS ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("102","1","132510","OBLIGACIONES","A ACCIONISTAS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("103","1","1328","","APORTES POR COBRAR "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("104","1","1330","","ANTICIPOS Y AVANCES "," CUENTA GENERAL ","0","0","0","0","0","","","0","2023-10-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("105","1","133005","OBLIGACIONES","A PROVEEDORES","","0","0","0","1","0","","","0","2024-02-18 17:02:15","ACTIVO");
INSERT INTO cuentas VALUES("106","1","133010","OBLIGACIONES","A CONTRATISTAS","","0","0","0","1","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("107","1","133015","OBLIGACIONES","A TRABAJADORES","","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("108","1","133095","OBLIGACIONES","OTROS","","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("109","1","1332","","CUENTAS DE OPERACION CONJUNTA "," CUENTA GENERAL ","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("110","1","1335","","DEPOSITOS "," CUENTA GENERAL ","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("111","1","133505","OBLIGACIONES","PARA IMPORTACIONES ","CUENTA DE DETALLE","0","0","0","1","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("112","1","133510","OBLIGACIONES","PARA SERVICIOS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("113","1","133515","OBLIGACIONES","PARA CONTRATOS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("114","1","133520","OBLIGACIONES","PARA RESPONSABILIDADES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("115","1","133525","OBLIGACIONES","PARA JUICIOS EJECUTIVOS ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("116","1","133530","OBLIGACIONES","PARA ADQUISICION DE ACCIONES, CUOTAS O DERECHOS SOCIALES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("117","1","133535","OBLIGACIONES","EN GARANTIA ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("118","1","133595","OBLIGACIONES","OTROS","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("119","1","1340","","PROMESAS DE COMPRA VENTA "," CUENTA GENERAL ","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("120","1","134005","BALANCE O SALDO","DE BIENES RAICES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("121","1","134010","BALANCE O SALDO","DE MAQUINARIA Y EQUIPO ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("122","1","134095","BALANCE O SALDO","DE OTROS BIENES ","CUENTA DE DETALLE","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");
INSERT INTO cuentas VALUES("123","1","1345","","INGRESOS POR COBRAR "," CUENTA GENERAL ","0","0","0","0","0","","","0","2024-02-18 00:00:00","ACTIVO");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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

INSERT INTO departamentos VALUES("1","Bolivar","ACTIVO","2022-09-23 19:25:59","1");
INSERT INTO departamentos VALUES("2","Sucre","ACTIVO","2022-09-23 19:26:00","1");
INSERT INTO departamentos VALUES("3","Cordoba","ACTIVO","2022-09-23 19:26:01","1");
INSERT INTO departamentos VALUES("4","Atlantico","ACTIVO","2022-09-23 19:26:02","1");
INSERT INTO departamentos VALUES("5","Cesar","ACTIVO","2022-09-23 19:26:03","1");
INSERT INTO departamentos VALUES("6","Magdalena","ACTIVO","2022-09-23 19:26:04","1");
INSERT INTO departamentos VALUES("7","Antioquia","ACTIVO","2022-09-23 19:26:09","1");
INSERT INTO departamentos VALUES("8","Cundinamarca","ACTIVO","2023-12-09 20:17:45","1");
INSERT INTO departamentos VALUES("9","Casanare","ACTIVO","2023-12-09 20:18:12","1");
INSERT INTO departamentos VALUES("10","Boyaca","ACTIVO","2023-12-09 20:18:35","1");
INSERT INTO departamentos VALUES("11","Arauca","ACTIVO","2023-12-09 20:19:21","1");
INSERT INTO departamentos VALUES("12","Caldas","ACTIVO","2023-12-09 20:19:46","1");
INSERT INTO departamentos VALUES("13","Caqueta","ACTIVO","2023-12-09 20:20:01","1");
INSERT INTO departamentos VALUES("14","Amazonas","ACTIVO","2023-12-09 20:20:20","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO detalle_compra VALUES("1","3","1","20","32000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("2","4","14","52","38000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("3","5","161","4","55000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("4","6","15","1","82500","0","INGRESADA");
INSERT INTO detalle_compra VALUES("5","7","317","30","88000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("6","8","68","6","66110","0","INGRESADA");
INSERT INTO detalle_compra VALUES("7","8","364","9","22641","0","INGRESADA");
INSERT INTO detalle_compra VALUES("8","9","702","10","4500","0","INGRESADA");
INSERT INTO detalle_compra VALUES("9","11","842","7","42000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("10","12","875","10","70000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("11","12","561","8","42000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("12","13","90","6","42656","0","INGRESADA");
INSERT INTO detalle_compra VALUES("13","13","91","8","42656","0","INGRESADA");
INSERT INTO detalle_compra VALUES("14","13","92","4","42656","0","INGRESADA");
INSERT INTO detalle_compra VALUES("15","13","93","4","42656","0","INGRESADA");
INSERT INTO detalle_compra VALUES("16","14","122","5","38000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("17","14","123","5","38000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("18","14","124","5","38000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("19","14","125","4","38000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("20","14","513","2","30688","0","INGRESADA");
INSERT INTO detalle_compra VALUES("21","14","515","2","30688","0","INGRESADA");
INSERT INTO detalle_compra VALUES("22","14","514","2","30688","0","INGRESADA");
INSERT INTO detalle_compra VALUES("23","14","515","2","30688","0","INGRESADA");
INSERT INTO detalle_compra VALUES("24","14","515","2","30688","0","INGRESADA");
INSERT INTO detalle_compra VALUES("25","14","513","2","30688","0","INGRESADA");
INSERT INTO detalle_compra VALUES("26","14","129","2","36000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("27","14","134","2","36000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("28","14","121","4","38000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("29","14","108","1","23500","0","INGRESADA");
INSERT INTO detalle_compra VALUES("30","15","421","6","25300","0","INGRESADA");
INSERT INTO detalle_compra VALUES("31","15","422","6","11700","0","INGRESADA");
INSERT INTO detalle_compra VALUES("32","15","422","6","8400","0","INGRESADA");
INSERT INTO detalle_compra VALUES("33","16","831","24","5800","0","INGRESADA");
INSERT INTO detalle_compra VALUES("34","16","827","24","7450","0","INGRESADA");
INSERT INTO detalle_compra VALUES("35","16","829","24","4200","0","INGRESADA");
INSERT INTO detalle_compra VALUES("36","17","765","1","62000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("37","17","660","11","22000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("38","17","813","10","3800","0","INGRESADA");
INSERT INTO detalle_compra VALUES("39","17","921","3","22000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("40","17","921","3","22000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("41","17","921","3","22000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("42","17","1121","36","1500","0","INGRESADA");
INSERT INTO detalle_compra VALUES("43","17","981","50","1500","0","INGRESADA");
INSERT INTO detalle_compra VALUES("44","17","983","50","1800","0","INGRESADA");
INSERT INTO detalle_compra VALUES("45","17","1135","12","6000","0","INGRESADA");
INSERT INTO detalle_compra VALUES("46","18","797","1","12500","0","INGRESADA");



CREATE TABLE `detalle_salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsalida` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idsalida` (`idsalida`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `detalle_salida_ibfk_1` FOREIGN KEY (`idsalida`) REFERENCES `salida` (`id`),
  CONSTRAINT `detalle_salida_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO detalle_venta VALUES("1","1","1","2.00","46000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("2","2","1","2.00","48000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("3","2","14","2.00","42500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("4","3","14","4.00","42500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("5","4","14","5.00","42500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("6","5","14","25.00","42500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("7","6","1","20.00","48000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("8","7","1","20.00","48000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("9","8","17","1.00","9499.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("10","9","17","1.00","9000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("11","10","17","1.00","9499.00","284.97","INGRESADA");
INSERT INTO detalle_venta VALUES("12","11","17","1.00","9499.00","474.95","INGRESADA");
INSERT INTO detalle_venta VALUES("13","12","17","1.00","9000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("14","13","17","1.00","9000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("15","15","17","1.00","9499.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("16","14","17","1.00","9499.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("17","16","163","1.00","78000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("18","17","135","2.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("19","18","142","1.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("20","19","147","2.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("21","20","152","2.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("22","21","153","2.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("23","22","155","2.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("24","23","156","1.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("25","24","161","4.00","78000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("26","25","122","1.00","50000.00","4000.00","INGRESADA");
INSERT INTO detalle_venta VALUES("27","26","126","1.00","50000.00","0.00","ANULADA");
INSERT INTO detalle_venta VALUES("28","27","90","1.00","53000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("29","28","22","12.00","45000.00","0.00","ANULADA");
INSERT INTO detalle_venta VALUES("30","29","38","2.00","45000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("31","30","32","4.00","37500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("32","30","28","1.00","26000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("33","30","74","2.00","23000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("34","31","45","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("35","32","364","1.00","29000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("36","33","366","1.00","26000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("37","34","138","1.00","110000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("38","35","60","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("39","35","374","1.00","48500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("40","36","162","1.00","70000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("41","37","28","1.00","23999.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("42","38","364","1.00","29000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("43","39","117","1.00","47000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("44","40","29","2.00","47000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("45","40","28","2.00","26000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("46","41","38","1.00","42000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("47","42","328","1.00","300000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("48","43","94","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("49","44","93","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("50","45","83","1.00","48000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("51","46","459","1.00","35000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("52","47","60","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("53","48","476","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("54","49","500","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("55","50","164","1.00","78000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("56","51","90","1.00","51000.00","0.00","ANULADA");
INSERT INTO detalle_venta VALUES("57","52","74","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("58","53","500","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("59","54","493","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("60","55","198","1.00","65000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("61","56","528","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("62","57","509","1.00","38000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("63","58","509","1.00","40000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("64","59","89","1.00","51000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("65","60","490","1.00","11000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("66","61","37","1.00","60000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("67","62","366","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("68","63","103","1.00","36000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("69","64","490","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("70","64","490","1.00","11000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("71","65","40","1.00","40000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("72","66","29","1.00","45000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("73","67","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("74","68","307","1.00","95000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("75","69","246","1.00","42000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("76","70","74","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("77","71","561","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("78","72","506","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("79","73","366","2.00","250000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("80","74","149","1.00","70000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("81","75","74","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("82","76","513","1.00","40000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("83","77","604","10.00","1500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("84","78","74","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("85","79","327","1.00","300000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("86","80","80","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("87","81","92","1.00","55000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("88","82","610","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("89","83","626","1.00","18500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("90","84","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("91","85","490","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("92","86","610","1.00","13000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("93","87","118","1.00","45000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("94","88","490","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("95","89","609","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("96","90","355","1.00","82000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("97","91","606","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("98","91","612","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("99","92","424","1.00","150000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("100","93","489","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("101","94","510","1.00","38000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("102","95","94","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("103","96","121","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("104","97","561","2.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("105","98","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("106","99","729","1.00","19000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("107","100","681","2.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("108","101","444","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("109","102","74","1.00","23000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("110","103","60","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("111","104","807","1.00","14000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("112","105","126","1.00","55000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("113","105","55","1.00","32000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("114","106","561","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("115","107","499","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("116","108","631","1.00","260000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("117","109","602","1.00","7000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("118","110","610","1.00","13000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("119","111","742","1.00","5500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("120","112","724","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("121","112","78","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("122","113","355","1.00","82000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("123","114","561","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("124","115","506","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("125","115","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("126","116","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("127","117","659","1.00","35000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("128","118","505","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("129","119","730","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("130","120","348","1.00","92000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("131","121","639","1.00","178000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("132","122","851","2.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("133","123","561","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("134","124","658","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("135","125","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("136","126","489","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("137","127","160","1.00","75000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("138","128","73","1.00","60000.00","0.00","ANULADA");
INSERT INTO detalle_venta VALUES("139","129","31","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("140","130","503","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("141","131","503","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("142","132","493","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("143","133","905","2.00","2500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("144","134","500","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("145","135","561","6.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("146","136","52","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("147","137","902","1.00","23000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("148","138","84","1.00","46000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("149","139","875","1.00","85000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("150","140","492","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("151","141","643","1.00","82000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("152","142","27","2.00","31500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("153","142","875","1.00","85000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("154","143","724","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("155","144","652","1.00","10000.00","0.00","ANULADA");
INSERT INTO detalle_venta VALUES("156","145","724","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("157","145","832","1.00","9000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("158","146","364","1.00","32000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("159","147","28","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("160","148","644","1.00","35000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("161","149","72","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("162","150","827","2.00","9000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("163","150","832","2.00","9000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("164","151","495","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("165","152","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("166","153","850","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("167","153","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("168","154","828","1.00","8500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("169","155","626","1.00","18000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("170","155","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("171","155","644","1.00","35000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("172","155","754","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("173","155","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("174","155","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("175","155","475","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("176","155","983","1.00","2500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("177","155","655","1.00","9500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("178","155","652","2.00","11000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("179","155","876","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("180","155","753","1.00","1000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("181","155","660","1.00","30000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("182","155","353","1.00","195000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("183","155","875","1.00","850000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("184","156","949","2.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("185","157","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("186","158","473","1.00","13000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("187","159","503","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("188","160","876","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("189","161","321","1.00","280000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("190","162","608","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("191","163","198","1.00","62000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("192","164","639","1.00","178000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("193","165","848","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("194","166","145","1.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("195","167","881","1.00","6800.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("196","167","881","1.00","6800.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("197","168","724","2.00","5500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("198","169","481","1.00","57000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("199","170","728","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("200","170","728","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("201","171","495","1.00","15999.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("202","172","867","1.00","8500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("203","173","949","1.00","5500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("204","174","506","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("205","175","515","1.00","40000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("206","176","503","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("207","177","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("208","178","881","2.00","6500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("209","179","722","3.00","12500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("210","179","735","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("211","179","851","2.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("212","180","481","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("213","181","735","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("214","182","336","1.00","90000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("215","182","828","1.00","8000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("216","182","652","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("217","182","866","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("218","183","705","1.00","8500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("219","184","838","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("220","185","740","4.00","7000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("221","186","956","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("222","187","93","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("223","188","827","1.00","9500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("224","189","163","1.00","70000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("225","190","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("226","191","828","1.00","8000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("227","192","856","2.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("228","192","651","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("229","192","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("230","192","753","3.00","900.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("231","192","492","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("232","193","851","2.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("233","194","501","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("234","195","463","1.00","35000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("235","196","490","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("236","197","503","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("237","198","500","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("238","199","646","1.00","56000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("239","200","850","2.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("240","201","876","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("241","202","875","1.00","90000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("242","203","91","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("243","204","84","1.00","47000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("244","205","724","1.00","5500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("245","206","509","1.00","38000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("246","207","559","1.00","70000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("247","208","533","1.00","7000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("248","209","877","1.00","7000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("249","210","555","1.00","68000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("250","211","835","1.00","45000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("251","212","875","1.00","85000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("252","213","735","1.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("253","214","499","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("254","215","500","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("255","216","950","2.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("256","217","949","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("257","218","32","2.00","40000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("258","219","671","2.00","4000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("259","220","1047","1.00","2500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("260","221","473","2.00","12500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("261","222","307","1.00","98000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("262","223","78","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("263","223","111","1.00","47000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("264","224","682","1.00","13500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("265","225","694","1.00","26000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("266","226","28","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("267","227","500","2.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("268","228","645","1.00","36000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("269","229","90","1.00","55000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("270","230","560","1.00","95000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("271","230","504","1.00","12000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("272","230","367","1.00","22500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("273","231","24","4.00","42500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("274","232","788","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("275","233","609","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("276","234","748","1.00","11000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("277","235","365","1.00","30000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("278","235","46","1.00","30000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("279","235","753","1.00","1000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("280","236","105","1.00","38000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("281","237","1131","1.00","5500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("282","238","741","2.00","6000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("283","238","707","2.00","4500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("284","239","505","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("285","240","887","1.00","2500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("286","241","741","1.00","6000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("287","242","28","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("288","242","753","2.00","1000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("289","243","485","1.00","120000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("290","243","495","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("291","244","875","1.00","85000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("292","245","123","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("293","246","643","1.00","82000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("294","247","1076","1.00","24500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("295","248","651","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("296","249","813","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("298","250","814","1.00","4000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("299","250","1173","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("300","249","814","1.00","4000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("301","250","850","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("302","249","1173","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("303","249","850","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("304","251","506","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("306","253","506","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("307","254","1205","1.00","35000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("308","255","905","1.00","2700.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("309","256","122","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("310","257","506","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("311","258","970","2.00","6000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("312","258","754","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("313","259","117","1.00","48000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("314","260","605","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("315","260","607","1.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("316","260","748","1.00","11500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("317","260","679","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("318","260","1257","2.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("319","260","506","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("320","260","739","1.00","14000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("321","260","749","1.00","2800.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("322","260","388","1.00","155000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("323","260","1271","1.00","5500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("324","261","735","1.00","12500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("325","261","734","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("326","261","793","1.00","12500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("327","262","757","1.00","12500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("328","263","831","1.00","7000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("329","264","829","1.00","6500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("330","265","1087","21.00","1700.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("331","265","1052","24.00","250.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("332","266","474","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("333","267","907","2.00","6500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("334","267","679","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("335","267","610","1.00","13500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("336","268","74","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("337","269","74","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("338","270","1179","1.00","20000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("339","271","706","1.00","8000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("340","272","887","1.00","2500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("341","273","501","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("342","274","1141","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("343","274","1193","1.00","13000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("344","275","561","2.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("345","276","673","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("346","277","754","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("347","277","864","1.00","6000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("348","278","850","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("349","278","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("350","279","944","1.00","80000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("351","280","89","1.00","52000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("352","281","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("353","282","1257","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("354","282","1089","1.00","1500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("355","282","1089","1.00","1500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("356","283","850","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("357","284","1271","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("358","285","754","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("359","286","850","1.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("360","287","561","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("361","288","38","1.00","48000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("362","288","1007","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("363","288","728","1.00","16000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("364","288","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("365","288","851","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("366","288","1257","1.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("367","288","850","2.00","3000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("368","288","492","2.00","24000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("369","288","515","1.00","40000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("370","288","91","1.00","55000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("371","288","499","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("372","288","658","1.00","22000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("373","289","500","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("374","290","1236","1.00","2500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("375","291","851","3.00","2000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("376","291","695","1.00","33000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("377","292","398","1.00","170000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("378","292","37","2.00","60000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("379","292","46","2.00","30000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("380","292","52","1.00","17000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("381","292","740","1.00","7000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("382","292","741","1.00","6000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("383","292","742","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("384","292","744","3.00","3500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("385","292","1171","2.00","3500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("386","292","1194","2.00","14000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("387","292","1271","2.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("388","292","985","1.00","200000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("389","292","602","1.00","5000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("390","292","1419","2.00","10000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("391","293","881","1.00","6800.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("392","294","600","2.00","6500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("393","295","28","6.00","25000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("394","296","124","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("395","297","805","1.00","8000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("396","297","95","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("397","297","561","1.00","50000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("398","297","999","1.00","32000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("399","297","1273","1.00","3500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("400","297","68","1.00","75000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("401","297","1385","1.00","45000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("402","297","610","1.00","13000.00","0.00","INGRESADA");



CREATE TABLE `dpto` (
  `IdDpto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del area al que pertenece',
  `DescDpto` varchar(60) NOT NULL COMMENT 'Descripcion del departamento donde labora',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdDpto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO dpto VALUES("1","SISTEMA","2022-09-26 20:55:41","ACTIVO");



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

INSERT INTO empleados VALUES("1","1070813753","JERSON BATISTA","EL CARMEN","132132","1321","INFO@GMAIL.COM","1989-05-26","1","1","1","","","2022-09-23 18:41:24","ACTIVO","1","1");



CREATE TABLE `empresa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nit` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `Representante` varchar(255) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Logo` varchar(255) DEFAULT NULL,
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

INSERT INTO empresa VALUES("1","9112176","ALMACEN ALCON","ALBERTO CONDE FERRER","EL CARMEN DE BOLIVAR","3017580396","tes@gmail.com","controlador/empresa/img/IMG61120239202.png","2","1","2024-05-21 12:37:46","ACTIVO");



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

INSERT INTO eps VALUES("1","2313232","EPS PRUEBA","CARMEN DE BOL","CALLE 25","654654","PRUEBA@GMAIL.COM","2022-09-18 17:15:12","ACTIVO","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO gastos VALUES("1","3","2023-05-23","119600","001","1","","2023-05-23 11:20:03","ACTIVO","1","1","CANCELADA");
INSERT INTO gastos VALUES("2","2","2023-11-07","121212","5456","1","","2023-11-06 09:06:06","ACTIVO","1","1","ENTREGADA");
INSERT INTO gastos VALUES("3","2","2024-05-21","20000","6867","1","","2024-05-20 18:19:04","ACTIVO","1","1","ENTREGADA");
INSERT INTO gastos VALUES("4","4","2024-05-21","12000","01","1","COMPRAS  COMIDA","2024-05-21 12:47:39","ACTIVO","1","1","CANCELADA");



CREATE TABLE `iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `tarifa` double DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `idTipoImpuesto` int(11) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NULL DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iva_empresa` (`idEmpresa`),
  KEY `FK_iva_tipo_impuestos` (`idTipoImpuesto`),
  CONSTRAINT `FK_iva_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_iva_tipo_impuestos` FOREIGN KEY (`idTipoImpuesto`) REFERENCES `tipo_impuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO iva VALUES("1","01","19","IVA GENERAL DE PRODUCTOS","1","ACTIVO","2023-11-17 10:43:42","1");
INSERT INTO iva VALUES("3","02","0","NO APLICA TARIFA","2","INACTIVO","2023-11-27 00:00:00","1");
INSERT INTO iva VALUES("4","03","5","TARIFA 5%","1","INACTIVO","2023-11-27 00:00:00","1");



CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO marcas VALUES("1","samuray","ACTIVO","2024-05-22 14:01:46","1");
INSERT INTO marcas VALUES("2","MARCA GENERAL","ACTIVO","2023-04-10 09:13:39","1");
INSERT INTO marcas VALUES("3","india","ACTIVO","2024-05-22 14:02:28","1");
INSERT INTO marcas VALUES("4","vaniplas","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("5","rimax","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("6","imusa","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("7","haceb","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("8","corona","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("9","rimo","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("10","universal","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("11","hogar plas","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("12","masso","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("13","grulla","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("14","venus","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("15","oster","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("16","abaa","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("17","lynx","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("18","continental","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("19","mabbe","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("20","sueño flex","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("21","relax","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("22","serraty","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("23","alteza","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("24","home elements","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("25","DKasa","ACTIVO","2024-05-22 00:00:00","1");
INSERT INTO marcas VALUES("26","Colplas","ACTIVO","2024-05-31 00:00:00","1");
INSERT INTO marcas VALUES("27","Sorplas","ACTIVO","2024-05-31 00:00:00","1");
INSERT INTO marcas VALUES("28","Multimarcas","ACTIVO","2024-05-31 00:00:00","1");
INSERT INTO marcas VALUES("29","KENDY","ACTIVO","2024-05-31 00:00:00","1");
INSERT INTO marcas VALUES("30","VEREDA","ACTIVO","2024-06-01 00:00:00","1");
INSERT INTO marcas VALUES("31","CROYDON","ACTIVO","2024-06-01 00:00:00","1");
INSERT INTO marcas VALUES("32","MAXTER","ACTIVO","2024-06-01 16:45:35","1");
INSERT INTO marcas VALUES("33","ARGOS","ACTIVO","2024-06-01 00:00:00","1");
INSERT INTO marcas VALUES("34","SOLIMAR","ACTIVO","2024-06-06 00:00:00","1");
INSERT INTO marcas VALUES("35","ALCON","ACTIVO","2024-06-07 00:00:00","1");
INSERT INTO marcas VALUES("36","KALLEY","ACTIVO","2024-06-08 00:00:00","1");
INSERT INTO marcas VALUES("37","MABE","ACTIVO","2024-06-08 00:00:00","1");
INSERT INTO marcas VALUES("38","VISIVO","ACTIVO","2024-06-08 00:00:00","1");
INSERT INTO marcas VALUES("39","ROYAL","ACTIVO","2024-06-08 00:00:00","1");



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

INSERT INTO pension VALUES("1","5465655","PRUEBA PENSION","CARMEN DE BOLIVAR","KRA 45","4654654","PRUEBA@GMAIL.COM","2022-09-18 17:33:26","ACTIVO","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO persona VALUES("1","JERSON TEST","BATISTA TEST","VEGA TEST","Persona Natural","1070813753","CEDULA","el centro","2022-07-13","ingjerson@gmail.com","2022-07-13","ACTIVO","1","3","ACTIVO","2024-05-20 20:05:31");
INSERT INTO persona VALUES("25","CLIENTE  ","POR","MOSTRADOR","Persona Natural","10000001","CEDULA","121321321","EL CARMEN DE BOLIVAR","mostrador@gmail.com","2024-05-21","ACTIVO","1","2","","2024-06-02 13:00:53");
INSERT INTO persona VALUES("26","anderson ","cohen ","luna ","Persona Natural","1052080150","CEDULA","3022689908","la avenida","","2024-05-22","ACTIVO","1","2","","2024-05-22 12:03:40");
INSERT INTO persona VALUES("27","claudia ","rocha","perez","Persona Natural","1052078219","CEDULA","3234326420","calle 33 kr 42-10","claurocha28@hotmail.com","2024-05-22","ACTIVO","1","2","","2024-05-22 14:44:21");
INSERT INTO persona VALUES("28","DISTRIBUIDORA KIRAMAR   S A S ","XXXXXXXX","XXXXXXX","Persona Juridica","8001568892","NIT","300000000000","kr43g calle 24","KIRAMAR@gmail.com","2024-05-22","ACTIVO","1","1","","2024-05-22 15:39:01");
INSERT INTO persona VALUES("29","Meico S A        WILSON","ARRIETA","ROMER","Persona Natural","8901011760","NIT","3000000000","CALLE30 #15-276","MEICO@gmail.com ","2024-05-23","ACTIVO","1","1","","2024-05-23 13:13:17");
INSERT INTO persona VALUES("30","LANDERS SAS             ","DESCONOCIDO","DESCONOCIDO","Persona Natural","8909000982","NIT","3500060","CR 53 #30-27 MEDELLIN","facturacion@landers.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 13:16:45");
INSERT INTO persona VALUES("31","KIRAMAR SAS             Amelia","Nieto","DESCONOCIDO","Persona Natural","8001568893","PASAPORTE","3113239975","dig..51 #31-120 soledad atlantico","facturacion@kiramar.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:21:39");
INSERT INTO persona VALUES("32","Argos representaciones sas    TOMAS ","HERNADEZ","DESCONOCIDO","Persona Natural","9012466946","NIT","3176590160","KM 4 PLT RICA SAN JERONIMO","facturacion@ARGOS.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:30:44");
INSERT INTO persona VALUES("33","TOOLS DISTRIBUCIONES JS  SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","90136513600","NIT","6521268","TV 54#21B 50BG 5","facturacion@TOOLS.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:35:19");
INSERT INTO persona VALUES("34","CORBETA  SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","8909009431","NIT","3426456","TV 54#21B 50BG 5","facturacion@CORBETA.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:37:49");
INSERT INTO persona VALUES("35","COMERCIALIZA  SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","901148822","NIT","6053694584","CALLE 68B #68-73 BARRANQUILLA","facturacion@COMERCIALIZA.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:49:20");
INSERT INTO persona VALUES("36","FABRIPOR  SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","9010083278","NIT","3152116655","KM 45  VIA CIENEGA DE ORO","facturacion@FABRIPOR.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:54:05");
INSERT INTO persona VALUES("37","FOAMTECK  SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","90113369273","NIT","4359914","CALLE 70# 7R BIS 107","facturacion@FOAMTECK.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 14:58:25");
INSERT INTO persona VALUES("38","SORPLAST  SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","9010972714","NIT","3006545773","CALLE 32# 41-139 ITAGUI","facturacion@SORPLAST.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 15:01:37");
INSERT INTO persona VALUES("39","TALLER FAMILIAR ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","35962891","NIT","3000000000","CR 40 #32-28 BARRANQUILLA","facturacion@TALLERFAMILIAR.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 15:04:01");
INSERT INTO persona VALUES("40","PLASTICAUCHO ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","805014351","NIT","4898999","CR 35 #13-55 VALLE DEL CAUCA","recepcionfacturadeventa@plasticaucho.com","2024-05-23","ACTIVO","1","1","","2024-05-23 15:09:09");
INSERT INTO persona VALUES("41","TEXCOMERCIAL SAS","DESCONOCIDO","DESCONOCIDO","Persona Juridica","8909225861","NIT","0000000000","KM 5 VIA GALAPAGO BARRANQUILLA","facuracion@TEXCOMERCIALSAS.COM","2024-05-23","ACTIVO","1","1","","2024-05-23 15:14:26");
INSERT INTO persona VALUES("42","PLASDECPOR SAS","DESCONOCIDO","DESCONOCIDO","Persona Juridica","9003341322","NIT","7842812","CL 37 # 1B MONTERIA","info@plasdecor.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 15:19:43");
INSERT INTO persona VALUES("43","CONTINENTAL SAS","DESCONOCIDO","DESCONOCIDO","Persona Juridica","8605113411","NIT","018000113435","CL 8 SUR #18-206 SOACHA ","comercial@estufascontinental.com.co","2024-05-23","ACTIVO","1","1","","2024-05-23 15:22:57");
INSERT INTO persona VALUES("44","RELAX SA ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","8020196905","NIT","35968601","AV CIRCUNVALAR 28B 33 BARRANQUILLA","facturacion#RELAXSA.COM","2024-05-23","ACTIVO","1","1","","2024-05-23 15:26:24");
INSERT INTO persona VALUES("45","GRUPOLITORAL SAS","DESCONOCIDO","DESCONOCIDO","Persona Juridica","8909269330","NIT","7853487","CR 6 # 79-80 MONTERIA ","facturacion@LITORAL.COM","2024-05-23","ACTIVO","1","1","","2024-05-23 15:28:05");
INSERT INTO persona VALUES("46","COLCHONES SERRATI SAS ","DESCONOCIDO","DESCONOCIDO","Persona Juridica","9011365835","NIT","3102211470","VIA 40 # 85-999 BARRANQUILLA ","cartera@colchonesserrati.com.cop","2024-05-23","ACTIVO","1","1","","2024-05-23 15:29:52");
INSERT INTO persona VALUES("47","MIGUEL ","VERGARA","NO","Persona Natural","000000000","CEDULA","3000000000","","","2024-06-19","ACTIVO","1","1","","2024-06-19 10:49:50");



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
) ENGINE=InnoDB AUTO_INCREMENT=1499 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO producto VALUES("1","0001","ZAPATOS DE DAMA","TALLA XL","","GENERAL","1","10","0","2","1","1","2","3","controlador/productos/img/default.png","28000.00","48000.00","INACTIVO","2024-06-04 14:39:25","1");
INSERT INTO producto VALUES("14","0002","silla frescura ","naranja","0002","0002","1","5","52","1","1","1","4","1","controlador/productos/img/default.png","35000.00","42500.00","INACTIVO","2024-05-31 15:36:05","1");
INSERT INTO producto VALUES("15","0003","LICUADORA ALTEZA PRAKTI MIX","negra","0003","2 en 1","1","1","3","23","1","1","23","1","controlador/productos/img/default.png","58500.00","98000.00","ACTIVO","2024-06-04 13:46:22","1");
INSERT INTO producto VALUES("16","0004","ventilador de pedestal alteza","malla metalica ","0004","18 pulgadas","1","2","6","4","1","1","23","1","controlador/productos/img/default.png","195600.00","248000.00","ACTIVO","2024-05-23 11:04:17","1");
INSERT INTO producto VALUES("17","7450077032009","estencion 3 metros ","estencion","7450077032009","3 metros ","1","3","1","31","1","1","2","1","controlador/productos/img/default.png","6200.00","9499.00","ACTIVO","2024-06-01 15:58:25","1");
INSERT INTO producto VALUES("18","0005","SILLA VANIPLAS SIN BRAZO","Sin Brazo","0005","Original","1","5","24","1","1","1","4","1","controlador/productos/img/default.png","30000.00","35000.00","ACTIVO","2024-06-01 09:16:28","1");
INSERT INTO producto VALUES("19","0006","Silla Colplas SIN BRAZO","Sin Brazo","0006","Economica","1","5","31","1","1","1","26","1","controlador/productos/img/default.png","29000.00","34000.00","ACTIVO","2024-05-31 17:52:26","1");
INSERT INTO producto VALUES("20","0007","Silla Rimax Ecologica sin brazo","Sin Brazo","0007","Economica","1","5","12","1","1","1","5","1","controlador/productos/img/default.png","27500.00","32500.00","ACTIVO","2024-05-31 17:54:00","1");
INSERT INTO producto VALUES("21","0008","SILLA RIMAX PLAYERA","Playera","0008","Original","1","5","13","1","1","1","5","1","controlador/productos/img/default.png","55000.00","64000.00","ACTIVO","2024-06-01 09:17:20","1");
INSERT INTO producto VALUES("22","0009","SILLA COLPLAS HALLURE","Hallure","0009","Semiplayera","1","5","30","1","1","1","26","1","controlador/productos/img/default.png","40000.00","49000.00","ACTIVO","2024-06-02 13:56:10","1");
INSERT INTO producto VALUES("23","0010","SILLA COLPLAS OCEANIA","Oceania","0010","Economica","1","5","22","1","1","1","26","1","controlador/productos/img/default.png","27500.00","32500.00","ACTIVO","2024-06-01 09:18:01","1");
INSERT INTO producto VALUES("24","0011","SILLA VANIPPLAS  FRESCURA","Frescura","0011","Original","1","5","48","1","1","1","4","1","controlador/productos/img/default.png","38000.00","44000.00","ACTIVO","2024-06-19 09:52:28","1");
INSERT INTO producto VALUES("25","0012","SILLA RIMAX ECOLOGICA CON BRAZO","Ecologica","0012","CON BRAZO","1","2","4","1","1","1","5","1","controlador/productos/img/default.png","33000.00","39000.00","ACTIVO","2024-06-01 09:19:51","1");
INSERT INTO producto VALUES("26","0013","SILLA RIMAX ORIGINAL CON BRAZO","Original","0013","Blanca","1","5","27","1","1","1","5","1","controlador/productos/img/default.png","44000.00","49000.00","ACTIVO","2024-06-01 09:20:25","1");
INSERT INTO producto VALUES("27","0014","SILLA RIMO BANBU","BANBU","0014","ECOLOGICA","1","5","58","1","1","1","5","1","controlador/productos/img/default.png","29000.00","34000.00","ACTIVO","2024-06-14 15:59:58","1");
INSERT INTO producto VALUES("28","0015","SILLA EUSSE","CON BRAZO","0015","ECOLOGICA","1","5","19","1","1","1","5","1","controlador/productos/img/default.png","20000.00","26000.00","ACTIVO","2024-06-22 11:17:06","1");
INSERT INTO producto VALUES("29","0016","SILLA RIMAX ETERNA","ETERNA","0016","WENGUE","1","5","8","1","1","1","5","1","controlador/productos/img/default.png","40000.00","47000.00","ACTIVO","2024-06-08 13:43:33","1");
INSERT INTO producto VALUES("30","0017","SILLA VANIPLAS BANVINNY","BANVINNY","0017","NIÑO","1","5","11","1","1","1","4","1","controlador/productos/img/default.png","19000.00","23000.00","ACTIVO","2024-06-01 09:25:03","1");
INSERT INTO producto VALUES("31","0018","SILLA SORPLAS NIÑO","NIÑO","0018","ECOLOGICA","1","5","21","1","1","1","27","1","controlador/productos/img/default.png","5500.00","9500.00","ACTIVO","2024-06-14 10:41:48","1");
INSERT INTO producto VALUES("32","0019","SILLA RIMO BRISA","BRISA","0019","ORIGINAL","1","5","12","1","1","1","5","1","controlador/productos/img/default.png","31000.00","37500.00","ACTIVO","2024-06-18 11:45:53","1");
INSERT INTO producto VALUES("33","0020","BUTACO COLPLAS","COLPLAS","0020","ECOLOGICA","1","5","5","1","1","1","26","1","controlador/productos/img/default.png","10500.00","14500.00","ACTIVO","2024-06-01 09:27:04","1");
INSERT INTO producto VALUES("34","0021","BUTACO RIMAX RATTAN","RATTAN","0021","ORIGINAL","1","2","4","1","1","1","5","1","controlador/productos/img/default.png","20000.00","25000.00","ACTIVO","2024-06-01 09:27:24","1");
INSERT INTO producto VALUES("35","0022","SILLA SORPLAS PLAYERA NIÑO","PLAYERA","0022","ECPLOGICA","1","5","7","1","1","1","27","1","controlador/productos/img/default.png","10500.00","13500.00","ACTIVO","2024-06-01 09:27:43","1");
INSERT INTO producto VALUES("36","0023","BUTACO RATTAN ECONOMICO","RATTAN","0023","ECONOMICO","1","5","23","1","1","1","28","1","controlador/productos/img/default.png","7000.00","11500.00","ACTIVO","2024-06-01 09:28:07","1");
INSERT INTO producto VALUES("37","0024","TANQUE COLPLAS 160 LITROS","160 LITROS","0024","ECOLOGICO","1","3","17","35","1","1","26","1","controlador/productos/img/default.png","55000.00","62000.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("38","0025","TANQUE COLPLAS 120 LITROS","120 LITROS","0025","ECOLOGICO","1","3","14","35","1","1","26","1","controlador/productos/img/default.png","41000.00","48000.00","ACTIVO","2024-06-22 09:43:55","1");
INSERT INTO producto VALUES("39","0026","TANQUE VANIPLAS 110 LITROS","110 LITROS","0026","ORIGINAL","1","3","5","35","1","1","26","1","controlador/productos/img/default.png","42000.00","49000.00","ACTIVO","2024-06-01 09:30:37","1");
INSERT INTO producto VALUES("40","0027","TANQUE COLPAS 105 LITROS","105 LITROS","0027","ECOLOGICO","1","3","3","35","1","1","26","1","controlador/productos/img/default.png","36000.00","43000.00","ACTIVO","2024-06-08 12:45:23","1");
INSERT INTO producto VALUES("41","0028","TANQUE COLPLAS 80 LITROS","80 LITROS","0028","ECOLOGICO","1","3","18","35","1","1","26","1","controlador/productos/img/default.png","30000.00","37000.00","ACTIVO","2024-06-01 09:31:05","1");
INSERT INTO producto VALUES("42","0029","TANQUE BASURA 120 LITROS","120 LITROS","0029","ECOLOGICO","1","3","7","35","1","1","26","1","controlador/productos/img/default.png","68000.00","78000.00","ACTIVO","2024-06-01 09:31:22","1");
INSERT INTO producto VALUES("43","0030","TANQUE COLPLAS 50 LITROS","50 LITROS","0030","ECOLOGICO","1","3","4","35","1","1","26","1","controlador/productos/img/default.png","22000.00","27000.00","ACTIVO","2024-06-01 09:31:49","1");
INSERT INTO producto VALUES("44","0031","TANQUE COLPLAS 220 LITROS","220 LITROS","0031","ECOLOGICO","1","1","2","35","1","1","26","1","controlador/productos/img/default.png","130000.00","158000.00","ACTIVO","2024-06-01 09:32:06","1");
INSERT INTO producto VALUES("45","0032","TANQUE VANIPLAS 65 LITROS","65 LITROS","0032","ORIGINAL","1","3","6","35","1","1","4","1","controlador/productos/img/default.png","20000.00","25000.00","ACTIVO","2024-06-04 11:12:54","1");
INSERT INTO producto VALUES("46","0033","TANQUE RIMO #6","#6","0033","ECOLOGICO","1","3","5","35","1","1","9","1","controlador/productos/img/default.png","26000.00","32000.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("47","0034","TANQUE COLPLAS 20 LITROS","20 LITROS","0034","ECOLOGICO","1","3","18","35","1","1","26","1","controlador/productos/img/default.png","12000.00","16000.00","ACTIVO","2024-06-01 09:32:58","1");
INSERT INTO producto VALUES("48","0035","TANQUE RIMO #2","#2","0035","ECOLOGICO","1","3","6","35","1","1","9","1","controlador/productos/img/default.png","17000.00","22000.00","ACTIVO","2024-06-01 09:33:30","1");
INSERT INTO producto VALUES("49","0036","TANQUE RIMO #3","#3","0036","ECOLOGICO","1","3","9","35","1","1","9","1","controlador/productos/img/default.png","22000.00","27500.00","ACTIVO","2024-06-01 09:33:53","1");
INSERT INTO producto VALUES("50","0037","TANQUE COLPLAS 30 LITROS","30 LITROS","0037","ECOLOGICO","1","3","6","35","1","1","26","1","controlador/productos/img/default.png","16000.00","21000.00","ACTIVO","2024-06-01 09:34:08","1");
INSERT INTO producto VALUES("51","0038","BALDE RIMO #10 TAPA AMARILLA","#10 TAPA AMARILLA","0038","ECOLOGICO","1","3","13","35","1","1","9","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-01 09:34:26","1");
INSERT INTO producto VALUES("52","0039","BALDE MUNDOPLAS 20 LITROS CON MANIJA","20 LITROS CON MANIJA","0039","ECOLOGICO","1","3","10","35","1","1","28","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("53","0040","TANQUE RIMO #1","#1","0040","ECOLOGICO","1","3","11","35","1","1","9","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-01 09:35:00","1");
INSERT INTO producto VALUES("54","0041","CESTA DE ROPA COLPLAS CON TAPA","CON TAPA","0041","ORIGINAL","1","3","5","35","1","1","26","1","controlador/productos/img/default.png","35000.00","42000.00","ACTIVO","2024-06-01 09:35:23","1");
INSERT INTO producto VALUES("55","0042","CESTA DE ROPA RIMAX CON TAPA","CON TAPA","0042","ORIGINAL","1","3","1","35","1","1","5","1","controlador/productos/img/default.png","27000.00","32000.00","ACTIVO","2024-06-12 15:20:05","1");
INSERT INTO producto VALUES("56","0043","BALDE GIRAR PEQUEÑO 3 LITROS","3 LITROS","004","ECOLOGICO","1","3","9","35","1","1","28","1","controlador/productos/img/default.png","3500.00","5000.00","ACTIVO","2024-06-01 09:36:57","1");
INSERT INTO producto VALUES("57","0044","BALDE GIRAR PEQUEÑO 3L CON TAPA","3 LITROS CON TAPA","0044","ECONOMICO","1","3","9","35","1","1","28","1","controlador/productos/img/default.png","3500.00","5000.00","ACTIVO","2024-06-01 09:37:18","1");
INSERT INTO producto VALUES("58","0045","CESTO DE ROPA PEQUEÑA REDONDA","REDONDA","0045","ECONOMICO","1","3","41","35","1","1","27","1","controlador/productos/img/default.png","6500.00","10000.00","ACTIVO","2024-06-01 09:37:44","1");
INSERT INTO producto VALUES("59","0046","CESTA DE ROPA PEQUEÑA CUADRADO","CUADRADA","0046","ECONOMICA","1","3","44","35","1","1","27","1","controlador/productos/img/default.png","6500.00","10000.00","ACTIVO","2024-06-01 09:37:57","1");
INSERT INTO producto VALUES("60","0047","CESTA DE ROPA  ECONOMICA GRANDE ","REDONDA","0047","ECONOMICA","1","3","7","35","1","1","27","1","controlador/productos/img/default.png","7500.00","11500.00","ACTIVO","2024-06-12 15:05:06","1");
INSERT INTO producto VALUES("61","0048","PONCHERA 100 LITROS","100 LITROS","0048","ECOLOGICA","1","2","3","34","1","1","28","1","controlador/productos/img/default.png","29000.00","35000.00","ACTIVO","2024-06-01 09:29:39","1");
INSERT INTO producto VALUES("62","0049","BUTACO CERRABLE","EXPANDIBLE","0049","ECONOMICO","1","3","3","1","1","1","28","1","controlador/productos/img/default.png","19000.00","24000.00","ACTIVO","2024-05-31 17:03:03","1");
INSERT INTO producto VALUES("63","0050","TANQUE DE ORGANICOS CON RUEDAS","CON RUEDAS","0050","INDUSTRIAL","1","1","2","35","1","1","28","1","controlador/productos/img/default.png","210000.00","258000.00","ACTIVO","2024-06-01 09:38:29","1");
INSERT INTO producto VALUES("64","0051","MESA RIMAX NIÑO","NIÑO","0051","ORIGINAL","1","3","6","38","1","1","5","1","controlador/productos/img/default.png","58000.00","65000.00","ACTIVO","2024-06-01 09:40:13","1");
INSERT INTO producto VALUES("65","0052","CESTA DE BASURA GRANDE CON PEDAL","CON PEDAL","0052","ECONOMICA","1","3","25","35","1","1","27","1","controlador/productos/img/default.png","24000.00","32000.00","ACTIVO","2024-06-01 09:38:45","1");
INSERT INTO producto VALUES("66","0053","CESTA DE BASURA MEDIANA CON PEDAL","CON PEDAL","0053","ECONOMICA","1","3","17","35","1","1","27","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-01 09:39:01","1");
INSERT INTO producto VALUES("67","0054","MESA RIMAX GRANDE 4 PUESTOS","4 PUESTOS ","0054","ORIGINAL","1","3","5","38","1","1","5","1","controlador/productos/img/default.png","68000.00","85000.00","ACTIVO","2024-06-01 09:40:26","1");
INSERT INTO producto VALUES("68","0055","MESA RIMO 4 PUESTOS","4 PUESTOS ","0055","ECONOMICA","1","3","14","38","1","1","9","1","controlador/productos/img/default.png","60000.00","78000.00","ACTIVO","2024-06-22 13:45:57","1");
INSERT INTO producto VALUES("69","0056","BACINILLA EUSSE GRANDE","GRANDE","0056","ECONOMICA","1","3","17","34","1","1","28","1","controlador/productos/img/default.png","3000.00","5000.00","ACTIVO","2024-06-01 09:29:50","1");
INSERT INTO producto VALUES("70","0057","BALDE INDUSTRIAL IMUSA CON ESCURRIDOR","CON ESCURRIDOR","0057","ORIGINAL","1","3","5","36","1","1","6","1","controlador/productos/img/default.png","38000.00","48000.00","ACTIVO","2024-06-01 09:39:23","1");
INSERT INTO producto VALUES("71","0058","BALDE IMUSA CON ESCURRIDOR PROBOCA","CON ESCURRIDOR PROBOCA","0058","ORIGINAL","1","3","10","36","1","1","6","1","controlador/productos/img/default.png","30000.00","38000.00","ACTIVO","2024-06-01 09:39:43","1");
INSERT INTO producto VALUES("72","0059","BALON DE PASTA MULTICOLOR","MULTICOLOR","0059","ECONOMICO","1","3","16","20","1","1","28","1","controlador/productos/img/default.png","1400.00","2000.00","ACTIVO","2024-06-14 17:39:13","1");
INSERT INTO producto VALUES("73","0060","PORTA VAJILLA RIMAX BEIGE","BEIGE","0060","ORIGINAL","1","1","1","40","1","1","5","1","controlador/productos/img/default.png","58000.00","68000.00","ACTIVO","2024-06-14 12:32:18","1");
INSERT INTO producto VALUES("74","0061","BALDE KENDY CON ESCURRIDOR","CON ESCURRIDOR","0061","ORIGINAL","1","3","3","36","1","1","29","1","controlador/productos/img/default.png","16000.00","23000.00","ACTIVO","2024-06-21 09:49:10","1");
INSERT INTO producto VALUES("75","0063","BOTA VENUS ESTAMPADA TL 36","DAMA","0063","PANTANERA","1","2","2","44","1","1","14","1","controlador/productos/img/default.png","35000.00","55000.00","ACTIVO","2024-06-01 10:07:45","1");
INSERT INTO producto VALUES("76","0064","BOTA VENUS ESTAMPADA TL 37","DAMA","0064","PANTANERA","1","2","2","44","1","1","14","1","controlador/productos/img/default.png","35000.00","55000.00","ACTIVO","2024-06-01 10:09:08","1");
INSERT INTO producto VALUES("77","0065","BOTA VENUS ESTAMPADA TL 38","DAMA","0065","PANTANERA ","1","2","2","44","1","1","14","1","controlador/productos/img/default.png","35000.00","55000.00","ACTIVO","2024-06-01 10:09:45","1");
INSERT INTO producto VALUES("78","0066","BOTA VENUS ESTAMPADA TL 39","DAMA","0066","PANTANERA","1","2","0","44","1","1","14","1","controlador/productos/img/default.png","35000.00","55000.00","ACTIVO","2024-06-18 15:10:47","1");
INSERT INTO producto VALUES("79","0067","BOTA VENUS ESTAMPADA TL 40","DAMA","0067","PANTANERA","1","2","0","44","1","1","14","1","controlador/productos/img/default.png","35000.00","55000.00","ACTIVO","2024-06-01 10:11:39","1");
INSERT INTO producto VALUES("80","0068","BOTA VENUS ESTAMPADA TL 41","DAMA","0068","PANTANERA","1","2","1","44","1","1","14","1","controlador/productos/img/default.png","35000.00","55000.00","ACTIVO","2024-06-10 12:39:15","1");
INSERT INTO producto VALUES("81","0069","BOTA ANDINA DE DAMA TL 34","DAMA","0069","PANTANERA","1","2","1","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-01 10:20:21","1");
INSERT INTO producto VALUES("82","0070","BOTA ANDINA DE DAMA TL 35","VENUS","0070","PANTANERA","1","2","1","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-01 10:21:57","1");
INSERT INTO producto VALUES("83","0071","BOTA ANDINA DE DAMA TL 36","VENUS","0071","PANTANERA","1","2","3","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-06 17:38:00","1");
INSERT INTO producto VALUES("84","0072","BOTA ANDINA DE DAMA TL 37","VENUS","0072","PANTANERA","1","2","2","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-17 17:28:50","1");
INSERT INTO producto VALUES("85","0073","BOTA ANDINA DE DAMA TL 38","VENUS","0073","PANTANERA","1","2","3","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-01 10:24:23","1");
INSERT INTO producto VALUES("86","0074","BOTA ANDINA DE DAMA TL 39","VENUS","0074","PANTANERA ","1","2","3","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-01 10:25:27","1");
INSERT INTO producto VALUES("87","0075","BOTA ANDINA DE DAMA TL 40 ","VENUS","0075","PANTANERA","1","2","0","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-01 10:26:05","1");
INSERT INTO producto VALUES("88","0076","BOTA ANDINA DE DAMA TL 41","VENUS","0076","PANTANERA","1","2","0","45","1","1","14","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-01 10:26:37","1");
INSERT INTO producto VALUES("89","0077","BOTA PANTANERA LLANERA TL 38","VENUS","0077","HOMBRE","1","2","3","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-21 14:35:32","1");
INSERT INTO producto VALUES("90","0078","BOTA PANTANERA LLANERA TL 39","VENUS","0078","HOMBRE","1","2","8","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-19 09:16:47","1");
INSERT INTO producto VALUES("91","0079","BOTA PANTANERA LLANERA TL 40","VENUS","0079","HOMBRE ","1","2","6","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("92","0080","BOTA PANTANERA LLANERA TL 41","VENUS","0080","HOMBRE ","1","2","7","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-17 17:23:52","1");
INSERT INTO producto VALUES("93","0081","BOTA PANTANERA LLANERA TL 42","VENUS","0081","HOMBRE","1","2","6","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-17 17:23:52","1");
INSERT INTO producto VALUES("94","0083","BOTA PANTANERA LLANERA TL 43","VENUS","0083","HOMBRE","1","2","1","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-12 10:20:08","1");
INSERT INTO producto VALUES("95","0084","BOTA PANTANERA LLANERA TL 44","VENUS","0084","HOMBRE","1","2","1","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-22 13:45:56","1");
INSERT INTO producto VALUES("96","0082","BOTA PANTANERA LLANERA TL 37","VENUS","0082","HOMBRE","1","2","7","16","1","1","14","1","controlador/productos/img/default.png","42600.00","55000.00","ACTIVO","2024-06-01 10:44:55","1");
INSERT INTO producto VALUES("97","0085","BOTA VENUS NIÑO TL 21","NIÑO","0085","PANTANERA","1","2","1","46","1","1","14","1","controlador/productos/img/default.png","19000.00","29000.00","ACTIVO","2024-06-01 10:50:31","1");
INSERT INTO producto VALUES("98","0086","BOTA VENUS NIÑO TL 22","NIÑO","0086","PANTANERA","1","2","0","46","1","1","14","1","controlador/productos/img/default.png","19000.00","29000.00","ACTIVO","2024-06-01 10:51:11","1");
INSERT INTO producto VALUES("99","0087","BOTA VENUS NIÑO TL 23","NIÑO","0087","PANTANERA","1","2","0","46","1","1","14","1","controlador/productos/img/default.png","19000.00","29001.00","ACTIVO","2024-06-01 10:51:44","1");
INSERT INTO producto VALUES("100","0088","BOTA VENUS NIÑO TL 24","NIÑO","0088","PANTANERA ","1","2","0","46","1","1","14","1","controlador/productos/img/default.png","19000.00","29000.00","ACTIVO","2024-06-01 10:52:16","1");
INSERT INTO producto VALUES("101","0089","BOTA VENUS NIÑO TL 25","NIÑO","0089","PANTANERA","1","2","3","46","1","1","14","1","controlador/productos/img/default.png","19000.00","29000.00","ACTIVO","2024-06-01 10:53:47","1");
INSERT INTO producto VALUES("102","0090","BOTA VENUS NIÑO TL 26","NIÑO","0090","PANTANERA ","1","2","3","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-01 10:55:04","1");
INSERT INTO producto VALUES("103","0091","BOTA VENUS NIÑO TL 27","NIÑO","0091","PANTANERA","1","2","5","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-08 11:38:15","1");
INSERT INTO producto VALUES("104","0092","BOTA VENUS NIÑO TL 28","NIÑO","0092","PANTANERA","1","2","8","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-01 11:02:25","1");
INSERT INTO producto VALUES("105","0093","BOTA VENUS NIÑO TL 29","NIÑO","0093","PANTANERA","1","2","3","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-19 12:19:57","1");
INSERT INTO producto VALUES("106","0094","BOTA VENUS NIÑO TL 30","NIÑO","0094","PANTANERA ","1","2","4","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38001.00","ACTIVO","2024-06-01 11:06:11","1");
INSERT INTO producto VALUES("107","0095","BOTA VENUS NIÑO TL 31","NIÑO","0095","PANTANERA","1","2","2","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-01 11:04:53","1");
INSERT INTO producto VALUES("108","0096","BOTA VENUS NIÑO TL 32","NIÑO","0096","PANTANERA","1","2","2","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("109","0097","BOTA VENUS NIÑO TL 33","NIÑO","0097","PANTANERA","1","2","2","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-01 11:12:48","1");
INSERT INTO producto VALUES("110","0098","BOTA VENUS NIÑO TL 34","NIÑO","0098","PANTANERA","1","2","1","46","1","1","14","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-01 11:13:31","1");
INSERT INTO producto VALUES("111","0099","BOTA VEREDA TL 37","HOMBRE","0099","PANTANERA","1","2","5","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-18 15:10:48","1");
INSERT INTO producto VALUES("112","0100","BOTA VEREDA TL 38","HOMBRE","0100","PANTANERA","1","2","4","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:19:32","1");
INSERT INTO producto VALUES("113","0101","BOTA VEREDA TL 39","HOMBRE","0101","PANTANERA","1","2","4","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:20:12","1");
INSERT INTO producto VALUES("114","0102","BOTA VEREDA TL 40","HOMBRE","0102","PANTANERA","1","2","6","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:20:43","1");
INSERT INTO producto VALUES("115","0103","BOTA VEREDA TL 41","HOMBRE","0103","PANTANERA","1","2","6","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:21:12","1");
INSERT INTO producto VALUES("116","0104","BOTA VEREDA TL 42","HOMBRE","0104","PANTANERA","1","2","6","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:22:06","1");
INSERT INTO producto VALUES("117","0105","BOTA VEREDA TL 43","HOMBRE","0105","PANTANERA","1","2","3","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-20 13:27:59","1");
INSERT INTO producto VALUES("118","0106","BOTA VEREDA TL 44","HOMBRE","0106","PANTANERA ","1","2","3","41","1","1","30","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-11 10:23:19","1");
INSERT INTO producto VALUES("119","0107","BOTA MACHA TL 37","HOMBRE","0107","PANTANERA","1","2","1","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-01 11:25:02","1");
INSERT INTO producto VALUES("120","0108","BOTA MACHA TL 38","HOMBRE","0108","PANTANERA ","1","2","2","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-01 11:25:33","1");
INSERT INTO producto VALUES("121","0109","BOTA MACHA 39","HOMBRE","0109","PANTANERA","1","2","16","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("122","0110","BOTA MACHA TL 40","HOMBRE","0110","PANTANERA","1","2","4","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-20 11:31:31","1");
INSERT INTO producto VALUES("123","0111","BOTA MACHA TL 41","HOMBRE","0111","PANTANERA","1","2","6","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-19 18:01:27","1");
INSERT INTO producto VALUES("124","0112","BOTA MACHA TL 42","HOMBRE","0112","PANTANERA","1","2","4","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-22 11:20:51","1");
INSERT INTO producto VALUES("125","0113","BOTA MACHA TL 43","HOMBRE","0113","PANTANERA","1","2","4","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("126","0114","BOTA MACHA TL 44","HOMBRE","0114","PANTANERA","1","2","1","41","1","1","30","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-12 15:20:05","1");
INSERT INTO producto VALUES("127","0115","BOTA TITAN TL 37","HOMBRE","0115","PANTANERA","1","2","0","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:31:16","1");
INSERT INTO producto VALUES("128","0116","BOTA TITAN TL 38","HOMBRE","0116","PANTANERA","1","2","1","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:31:50","1");
INSERT INTO producto VALUES("129","0117","BOTA TITAN TL 39","HOMBRE","0117","PANTANERA","1","2","5","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("130","0118","BOTA TITAN TL 40","HOMBRE","0118","PANTANERA","1","2","2","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:32:49","1");
INSERT INTO producto VALUES("131","0119","BOTA TITAN TL 41","HOMBRE","0119","PANTANERA","1","2","2","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:33:22","1");
INSERT INTO producto VALUES("132","0120","BOTA TITAN TL 42","HOMBRE","0120","PANTANERA","1","2","0","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:33:53","1");
INSERT INTO producto VALUES("133","0121","BOTA TITAN TL 43","HOMBRE","0121","PANTANERA","1","2","2","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 11:34:29","1");
INSERT INTO producto VALUES("134","0122","BOTA TITAN TL 44","HOMBRE","0122","PANTANERA","1","2","2","43","1","1","31","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("135","0123","BOTA GRULLA NEGRA TL 37","HOMBRE","0123","TRABAJO","1","2","3","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:08:14","1");
INSERT INTO producto VALUES("136","0124","BOTA GRULLA NEGRA TL 38","HOMBRE","0124","TRABAJO","1","2","2","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:44:23","1");
INSERT INTO producto VALUES("137","0125","BOTA GRULLA NEGRA TL 39","HOMBRE","0125","TRABAJO","1","2","1","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:45:01","1");
INSERT INTO producto VALUES("138","0126","BOTA GRULLA NEGRA TL 40","HOMBRE","0126","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-05 16:08:23","1");
INSERT INTO producto VALUES("139","0127","BOTA GRULLA NEGRA TL 41","HOMBRE","0127","TRABAJO","1","2","2","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:46:39","1");
INSERT INTO producto VALUES("140","0128","BOTA GRULLA NEGRA TL 42","HOMBRE","0128","TRABAJO","1","2","2","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:47:19","1");
INSERT INTO producto VALUES("141","0129","BOTA GRULLA NEGRA TL 43","HOMBRE","0129","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:47:58","1");
INSERT INTO producto VALUES("142","0130","BOTA GRULLA NEGRA TL 44","HOMBRE","0130","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:08:47","1");
INSERT INTO producto VALUES("143","0131","BOTRA GRULLA SIENA TL 37","HOMBRE","0131","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:50:21","1");
INSERT INTO producto VALUES("144","0132","BOTA GRULLA SIENA TL 38","HOMBRE","0132","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:51:07","1");
INSERT INTO producto VALUES("145","0133","BOTA GRULLA SIENA TL 39","HOMBRE","0133","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-16 10:53:56","1");
INSERT INTO producto VALUES("146","0134","BOTA GRULLA SIENA TL 40","HOMBRE","0134","TRABAJO","1","2","1","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:52:36","1");
INSERT INTO producto VALUES("147","0135","BOTA GRULLA SIENA TL 41","HOMBRE","0135","TRABAJO","1","2","2","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:09:46","1");
INSERT INTO producto VALUES("148","0136","BOTA GRULLA SIENA TL 42","HOMBRE","0136","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:53:51","1");
INSERT INTO producto VALUES("149","0137","BOTA GRULLA SIENA TL 43","HOMBRE","0137","TRABAJO","1","2","1","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-09 10:10:17","1");
INSERT INTO producto VALUES("150","0138","BOTA GRULLA SIENA TL 44","HOMBRE","0138","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:54:55","1");
INSERT INTO producto VALUES("151","0139","BOTA GRULLA ORO TL 37","HOMBRE","0139","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:56:00","1");
INSERT INTO producto VALUES("152","0140","BOTA GRULLA ORO TL 38","HOMBRE","0140","TRABAJO","1","2","1","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:11:20","1");
INSERT INTO producto VALUES("153","0141","BOTA GRULLA ORO TL 39","HOMBRE","0141","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:11:48","1");
INSERT INTO producto VALUES("154","0142","BOTA GRULLA ORO TL 40","HOMBRE","0142","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 11:58:34","1");
INSERT INTO producto VALUES("155","0143","BOTA GRULLA ORO TL 41","HOMBRE","0143","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:12:09","1");
INSERT INTO producto VALUES("156","0144","BOTA GRULLA ORO TL 42","HOMBRE","0144","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 17:12:42","1");
INSERT INTO producto VALUES("157","0145","BOTA GRULLA ORO TL 43","HOMBRE","0145","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 12:00:00","1");
INSERT INTO producto VALUES("158","0146","BOTA GRULLA ORO TL 44","HOMBRE","0146","TRABAJO","1","2","0","17","1","1","13","1","controlador/productos/img/default.png","95000.00","120000.00","ACTIVO","2024-06-01 12:00:40","1");
INSERT INTO producto VALUES("159","0147","BOTA MAXTER TL 37","HOMBRE","0147","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:04:13","1");
INSERT INTO producto VALUES("160","0148","BOTA MAXTER TL 38","HOMBRE","0148","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-14 10:11:45","1");
INSERT INTO producto VALUES("161","0149","BOTA MAXTER TL 39","HOMBRE","0149","TRABAJO","1","2","5","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 17:21:25","1");
INSERT INTO producto VALUES("162","0150","BOTA MAXTER TL 40","HOMBRE","0150","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-06 09:01:57","1");
INSERT INTO producto VALUES("163","0151","BOTA MAXTER NEGRA TL 41","HOMBRE","0151","TRABAJO","1","2","1","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-17 11:27:42","1");
INSERT INTO producto VALUES("164","0152","BOTA MAXTER NEGRA TL 42","HOMBRE","0152","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-07 12:48:54","1");
INSERT INTO producto VALUES("165","0153","BOTA MAXTER NEGRA TL 43","HOMBRE","0153","TRABAJO","1","2","4","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:10:13","1");
INSERT INTO producto VALUES("166","0154","BOTA MAXTER CAFE TL 37","HOMBRE","0154","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:11:05","1");
INSERT INTO producto VALUES("167","0155","BOTA MAXTER CAFE TL 38","HOMBRE","0155","TRABAJO","1","2","1","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:11:41","1");
INSERT INTO producto VALUES("168","1156","BOTA MAXTER CAFE TL 39","HOMBRE","0156","TRABAJO","1","2","1","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:12:04","1");
INSERT INTO producto VALUES("169","0157","BOTA MAXTER CAFE TL 40","HOMBRE","0157","TRABAJO","1","2","1","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:12:50","1");
INSERT INTO producto VALUES("170","0158","BOTA MAXTER CAFE TL 41","HOMBRE","0158","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:13:25","1");
INSERT INTO producto VALUES("171","0159","BOTA MAXTER CAFE TL 42","HOMBRE","0159","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:13:50","1");
INSERT INTO producto VALUES("172","0160","BOTA MAXTER CAFE TL 43","HOMBRE","0160","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:14:21","1");
INSERT INTO producto VALUES("173","0161","BOTA MAXTER MIEL TL 37","HOMBRE","0161","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:16:39","1");
INSERT INTO producto VALUES("174","0162","BOTA MAXTER MIEL TL 38","HOMBRE","0162","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:17:19","1");
INSERT INTO producto VALUES("175","0163","BOTA MAXTER MIEL TL 39","HOMBRE","0163","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:17:45","1");
INSERT INTO producto VALUES("176","0164","BOTA MAXTER MIEL TL 40","HOMBRE","0164","TRABAJO","1","2","2","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:18:10","1");
INSERT INTO producto VALUES("177","0165","BOTA MAXTER MIEL TL 41","HOMBRE","0165","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:18:38","1");
INSERT INTO producto VALUES("178","0166","BOTA MAXTER MIEL TL 42","HOMBRE","0166","TRABAJO","1","2","0","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:19:15","1");
INSERT INTO producto VALUES("179","0167","BOTA MAXTER MIEL TL 43","HOMBRE","0167","TRABAJO","1","2","3","47","1","1","32","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-01 12:19:50","1");
INSERT INTO producto VALUES("180","0168","BOTA ZEUS NEGRA NIÑO TL 25","NIÑO","0168","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 12:22:33","1");
INSERT INTO producto VALUES("181","0169","BOTA ZEUS NEGRA NIÑO TL 26","NIÑO","0169","TELA","1","2","2","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 12:23:10","1");
INSERT INTO producto VALUES("182","0170","BOTA ZEUS NEGRA NIÑO TL 27","NIÑO","0170","TELA","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 12:23:54","1");
INSERT INTO producto VALUES("183","0171","BOTA ZEUS NEGRA NIÑO TL 28","NIÑO","0171","TELA","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 12:24:21","1");
INSERT INTO producto VALUES("184","0172","BOTA ZEUS NEGRA NIÑO TL 29","NIÑO","0172","TELA","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 12:24:46","1");
INSERT INTO producto VALUES("185","0173","BOTA ZEUS NEGRA NIÑO TL 30","NIÑO","0173","TELA","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 12:25:15","1");
INSERT INTO producto VALUES("186","0174","BOTA ZEUS NEGRA NIÑO TL 31"," NIÑO TL 31","0174","TELA","1","2","2","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 12:58:37","1");
INSERT INTO producto VALUES("187","0175","BOTA ZEUS NEGRA NIÑO TL 32"," NIÑO TL 32","0175","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 12:59:29","1");
INSERT INTO producto VALUES("188","0176","BOTA ZEUS NEGRA NIÑO TL 33"," NIÑO TL 33","0176","TELA","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 12:59:57","1");
INSERT INTO producto VALUES("189","0177","BOTA ZEUS NEGRA NIÑO TL 34"," NIÑO TL 34","0177","TELA","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","35000.00","47999.00","ACTIVO","2024-06-01 13:00:30","1");
INSERT INTO producto VALUES("190","0178","BOTA ZEUS NEGRA NIÑO TL 35"," NIÑO TL 34","0178","TELA","1","2","5","15","1","1","14","1","controlador/productos/img/default.png","35000.00","47998.00","ACTIVO","2024-06-01 13:01:00","1");
INSERT INTO producto VALUES("191","0179","BOTA ZEUS NEGRA NIÑO TL 36"," NIÑO TL 34","0179","TELA","1","2","8","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:01:23","1");
INSERT INTO producto VALUES("192","0180","BOTA ZEUS NEGRA HOMBRE TL 37"," NIÑO TL 37","0180","TELA","1","2","5","15","1","1","14","1","controlador/productos/img/default.png","40000.00","52000.00","ACTIVO","2024-06-01 13:08:59","1");
INSERT INTO producto VALUES("193","0181","BOTA ZEUS NEGRA HOMBRE TL 38"," NIÑO TL 38","0181","TELA","1","2","5","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:07:13","1");
INSERT INTO producto VALUES("194","0182","BOTA ZEUS NEGRA HOMBRE TL 39"," NIÑO TL 39","0182","TELA","1","2","2","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:07:49","1");
INSERT INTO producto VALUES("195","0183","BOTA ZEUS NEGRA NIÑO TL 40"," HOMBRE TL 39","0183","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:08:17","1");
INSERT INTO producto VALUES("196","0184","BOTA ZEUS NEGRA HOMBRE TL 41"," HOMBRE TL 41","0184","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:09:59","1");
INSERT INTO producto VALUES("197","0185","BOTA ZEUS NEGRA NIÑO TL 42"," HOMBRE TL 42","0185","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:06:19","1");
INSERT INTO producto VALUES("198","0186","BOTA ZEUS NEGRA HOMBRE TL 43"," HOMBRE TL 43","0186","TELA","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-15 17:09:20","1");
INSERT INTO producto VALUES("199","0187","BOTA ZEUS ROJA NIÑO TL 25","NIÑO TL 25","0187","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:12:42","1");
INSERT INTO producto VALUES("200","0188","BOTA ZEUS ROJA NIÑO TL 26","NIÑO TL 26","0188","TELA","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:13:41","1");
INSERT INTO producto VALUES("201","0189","BOTA ZEUS ROJA NIÑO TL 27","NIÑO TL 27","0189","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:14:10","1");
INSERT INTO producto VALUES("202","0190","BOTA ZEUS ROJA NIÑO TL 28","NIÑO TL 28","0190","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:14:41","1");
INSERT INTO producto VALUES("203","0191","BOTA ZEUS ROJA NIÑO TL 29","NIÑO TL 28","0191","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:15:04","1");
INSERT INTO producto VALUES("204","0192","BOTA ZEUS ROJA NIÑO TL 30","NIÑO TL 30","0192","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:15:34","1");
INSERT INTO producto VALUES("205","0193","BOTA ZEUS ROJA NIÑO TL 31","NIÑO TL 31","0193","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 13:16:10","1");
INSERT INTO producto VALUES("206","0194","BOTA ZEUS ROJA NIÑO TL 32","NIÑO TL 32","0194","TELA","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 13:16:34","1");
INSERT INTO producto VALUES("207","0195","BOTA ZEUS ROJA NIÑO TL 33","NIÑO TL 33","0195","TELA ","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 13:16:57","1");
INSERT INTO producto VALUES("208","0196","BOTA ZEUS ROJA NIÑO TL 34","NIÑO TL 34","0196","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 13:17:25","1");
INSERT INTO producto VALUES("209","0197","BOTA ZEUS ROJA NIÑO TL 35","NIÑO TL 35","0197","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","40000.00","52000.00","ACTIVO","2024-06-01 13:18:02","1");
INSERT INTO producto VALUES("210","0198","BOTA ZEUS ROJA NIÑO TL 36","NIÑO TL 36","0198","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","40000.00","52000.00","ACTIVO","2024-06-01 13:18:31","1");
INSERT INTO producto VALUES("211","0199","BOTA ZEUS ROJA HOMBRE TL 37","HOMBRE TL 37","0199","TELA ","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","40000.00","52000.00","ACTIVO","2024-06-01 13:19:33","1");
INSERT INTO producto VALUES("212","0200","BOTA ZEUS ROJA HOMBRE TL 38","HOMBRE TL 38","0200","TELA ","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:20:13","1");
INSERT INTO producto VALUES("213","0201","BOTA ZEUS ROJA HOMBRE TL 39","HOMBRE TL 39","0201","TELA ","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:20:42","1");
INSERT INTO producto VALUES("214","0202","BOTA ZEUS ROJA HOMBRE TL 40","HOMBRE TL 40","0202","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:21:19","1");
INSERT INTO producto VALUES("215","0203","BOTA ZEUS ROJA HOMBRE TL 41","HOMBRE TL 41","0203","TELA ","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:21:46","1");
INSERT INTO producto VALUES("216","0204","BOTA ZEUS ROJA HOMBRE TL 42","HOMBRE TL 42","0204","TELA","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:22:08","1");
INSERT INTO producto VALUES("217","0205","BOTA ZEUS ROJA HOMBRE TL 43","HOMBRE TL 43","0205","TELA ","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:22:44","1");
INSERT INTO producto VALUES("218","0206","BOTA ZEUS BLANCA NIÑO TL 25","NIÑO TL 25","0206","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:23:39","1");
INSERT INTO producto VALUES("219","0207","BOTA ZEUS BLANCA NIÑO TL 26","NIÑO TL 26","0207","TELA ","1","2 ","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:24:08","1");
INSERT INTO producto VALUES("220","0208","BOTA ZEUS BLANCA NIÑO TL 27","NIÑO TL 27","0208","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:24:36","1");
INSERT INTO producto VALUES("221","0209","BOTA ZEUS BLANCA NIÑO TL 28","NIÑO TL 28","0209","TELA ","1"," 2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:25:00","1");
INSERT INTO producto VALUES("222","0210","BOTA ZEUS BLANCA NIÑO TL 29","NIÑO TL 29","0210","TELA ","1","2","0","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:25:29","1");
INSERT INTO producto VALUES("223","0211","BOTA ZEUS BLANCA NIÑO TL 30","NIÑO TL 30","0211","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-01 13:26:02","1");
INSERT INTO producto VALUES("224","0212","BOTA ZEUS BLANCA NIÑO TL 31","NIÑO TL 31","0212","TELA ","1","2","2","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:26:48","1");
INSERT INTO producto VALUES("225","0213","BOTA ZEUS BLANCA NIÑO TL 32","NIÑO TL 32","0213","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:27:16","1");
INSERT INTO producto VALUES("226","0214","BOTA ZEUS BLANCA NIÑO TL 33","NIÑO TL 33","0214","TELA ","1","2","2","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:27:43","1");
INSERT INTO producto VALUES("227","0215","BOTA ZEUS BLANCA NIÑO TL 34","NIÑO TL 34","0215","TELA ","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:28:11","1");
INSERT INTO producto VALUES("228","0216","BOTA ZEUS BLANCA NIÑO TL 35","NIÑO TL 35","0216","TELA ","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:28:45","1");
INSERT INTO producto VALUES("229","0217","BOTA ZEUS BLANCA NIÑO TL 36","NIÑO TL 36","0217","TELA ","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:29:14","1");
INSERT INTO producto VALUES("230","0218","BOTA ZEUS BLANCA HOMBRE TL 37","HOMBRE TL 37","0218","TELA ","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-01 13:30:37","1");
INSERT INTO producto VALUES("231","0219","BOTA ZEUS BLANCA HOMBRE TL 38","HOMBRE TL 38","0219","TELA ","1","2","3","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:31:11","1");
INSERT INTO producto VALUES("232","0220","BOTA ZEUS BLANCA HOMBRE TL 39","HOMBRE TL 39","0220","TELA ","1","2","4","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:31:41","1");
INSERT INTO producto VALUES("233","0221","BOTA ZEUS BLANCA HOMBRE TL 40","HOMBRE TL 40","0221","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:32:30","1");
INSERT INTO producto VALUES("234","0222","BOTA ZEUS BLANCA HOMBRE TL 41","HOMBRE TL 41","0222","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:32:57","1");
INSERT INTO producto VALUES("235","0223","BOTA ZEUS BLANCA HOMBRE TL 42","HOMBRE TL 42","0223","TELA ","1","2","1","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:33:25","1");
INSERT INTO producto VALUES("236","0224","BOTA ZEUS BLANCA HOMBRE TL 43","HOMBRE TL 43","0224","TELA ","1","2","2","15","1","1","14","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-01 13:34:04","1");
INSERT INTO producto VALUES("237","0225","ZAPATO DE DAMA NEGRO/NEGRO TL 34","TALLA 34","0225","TELA","1","2","3","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:42:44","1");
INSERT INTO producto VALUES("238","0226","ZAPATO DE DAMA NEGRO/NEGRO TL 36","TALLA 36","0226","TELA","1","2","1","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:43:32","1");
INSERT INTO producto VALUES("239","0227","ZAPATO DE DAMA NEGRO/NEGRO TL 37","TALLA 37","0227","TELA","1","2","0","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:44:17","1");
INSERT INTO producto VALUES("240","0228","ZAPATO DE DAMA NEGRO/NEGRO TL 38","TALLA 38","0228","TELA","1","2","0","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:44:41","1");
INSERT INTO producto VALUES("241","0229","ZAPATO DE DAMA NEGRO/NEGRO TL 39","TALLA 39","0229","TELA","1","2","2","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:45:41","1");
INSERT INTO producto VALUES("242","0230","ZAPATO DE DAMA BLANCO/NEGRO TL 34","TALLA 34","0230","TELA","1","2","0","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:47:00","1");
INSERT INTO producto VALUES("243","0231","ZAPATO DE DAMA BLANCO/NEGRO TL 35","TALLA 35","0231","TELA","1","2","6","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:48:09","1");
INSERT INTO producto VALUES("244","0232","ZAPATO DE DAMA BLANCO/NEGRO TL 36","TALLA 36","0232","TELA","1","2","4","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:48:39","1");
INSERT INTO producto VALUES("245","0233","ZAPATO DE DAMA BLANCO/NEGRO TL 37","TALLA 37","0233","TELA","1","2","5","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:49:21","1");
INSERT INTO producto VALUES("246","0234","ZAPATO DE DAMA BLANCO/NEGRO TL 38","TALLA 38","0234","TELA","1","2","1","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-08 16:24:59","1");
INSERT INTO producto VALUES("247","0235","ZAPATO DE DAMA BLANCO/NEGRO TL 39","TALLA 39","0235","TELA","1","2","2","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:50:16","1");
INSERT INTO producto VALUES("248","0236","ZAPATO DE DAMA BLANCO/NEGRO TL 40","TALLA 40","0236","TELA","1","2","2","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:50:48","1");
INSERT INTO producto VALUES("249","0237","ZAPATO DE DAMA BLANCO/NEGRO TL 41","TALLA 41","0237","TELA","1","2","3","49","1","1","14","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-01 13:51:26","1");
INSERT INTO producto VALUES("250","0238","ZAPATO DE DAMA NEGRO/NEGRO TL 35","TALLA 35","0238","TELA","1","2","0","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:52:24","1");
INSERT INTO producto VALUES("251","0239","ZAPATO DE DAMA NEGRO/NEGRO TL 40","TALLA 40","0239","TELA","1","2","6","49","1","1","14","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:53:18","1");
INSERT INTO producto VALUES("252","0240","ZAPATO COLEGIAL NIÑO TL 21","EDER","0240","SINTETICO","1","2","2","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 13:56:34","1");
INSERT INTO producto VALUES("253","0241","ZAPATO COLEGIAL NIÑO TL 22","EDER","0241","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 13:57:47","1");
INSERT INTO producto VALUES("254","0242","ZAPATO COLEGIAL NIÑO TL 23","EDER","0242","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 13:58:09","1");
INSERT INTO producto VALUES("255","0243","ZAPATO COLEGIAL NIÑO TL 24","EDER","0243","SINTETICA","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 13:58:39","1");
INSERT INTO producto VALUES("256","0244","ZAPATO COLEGIAL NIÑO TL 25","EDER","0244","SINTETICA","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","19000.00","24999.00","ACTIVO","2024-06-01 13:59:02","1");
INSERT INTO producto VALUES("257","0245","ZAPATO COLEGIAL NIÑO TL 26","EDER","0245","SINTETICA","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 13:59:43","1");
INSERT INTO producto VALUES("258","0246","ZAPATO COLEGIAL NIÑO TL 27","EDER","0246","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:00:11","1");
INSERT INTO producto VALUES("259","0247","ZAPATO COLEGIAL NIÑO TL 28","EDER","0247","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:01:07","1");
INSERT INTO producto VALUES("260","0248","ZAPATO COLEGIAL NIÑO TL 29","EDER","0248","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:01:46","1");
INSERT INTO producto VALUES("261","0249","ZAPATO COLEGIAL NIÑO TL 30","EDER","0249","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:02:29","1");
INSERT INTO producto VALUES("262","0250","ZAPATO COLEGIAL NIÑO TL 31","EDER","0250","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:03:01","1");
INSERT INTO producto VALUES("263","0251","ZAPATO COLEGIAL NIÑO TL 32","EDER","0251","SINTETICA","1","2","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:03:24","1");
INSERT INTO producto VALUES("264","0252","ZAPATO COLEGIAL NIÑO TL 33","EDER","0252","SINTETICA","1","","1","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:04:20","1");
INSERT INTO producto VALUES("265","0253","ZAPATO COLEGIAL NIÑO TL 34","EDER","0253","SINTETICA","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:05:20","1");
INSERT INTO producto VALUES("266","0254","ZAPATO COLEGIAL NIÑO TL 35","EDER","0254","SINTETICA","1","2","2","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:06:05","1");
INSERT INTO producto VALUES("267","0255","ZAPATO COLEGIAL NIÑO TL 36","EDER","0255","SINTETICA","1","2","2","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:06:50","1");
INSERT INTO producto VALUES("268","0256","ZAPATO COLEGIAL NIÑO TL 37","EDER","0256","SINTETICO","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:07:46","1");
INSERT INTO producto VALUES("269","0257","ZAPATO COLEGIAL NIÑO TL 38","EDER","0257","SINTETICO","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:08:14","1");
INSERT INTO producto VALUES("270","0258","ZAPATO COLEGIAL NIÑO TL 39","EDER","0258","SINTETICO","1","2","2","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:09:20","1");
INSERT INTO producto VALUES("271","0259","ZAPATO COLEGIAL NIÑO TL 40","EDER","0259","SINTETICO","1","2","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:09:50","1");
INSERT INTO producto VALUES("272","0260","ZAPATO COLEGIAL NIÑA TL 21","EDER","0260","SINTETICO","1","2","3","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 14:21:46","1");
INSERT INTO producto VALUES("273","0261","ZAPATO COLEGIAL NIÑA TL 22","EDER","0261","SINTETICO","1","","1","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 14:23:10","1");
INSERT INTO producto VALUES("274","0262","ZAPATO COLEGIAL NIÑA TL 23","EDER","0262","SINTETICO","1","2","3","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 14:24:14","1");
INSERT INTO producto VALUES("275","0263","ZAPATO COLEGIAL NIÑA TL 24","EDER","0263","SINTETICO","1","","1","50","1","1","28","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-01 14:25:26","1");
INSERT INTO producto VALUES("276","0264","ZAPATO COLEGIAL NIÑA TL 25","EDER","0264","SINTETICO","1","1","2","50","1","1","28","1","controlador/productos/img/default.png","19000.00","22000.00","ACTIVO","2024-06-01 14:26:39","1");
INSERT INTO producto VALUES("277","0265","ZAPATO COLEGIAL NIÑA TL 26","EDER","0265","SINTETICO","1","1","2","50","1","1","28","1","controlador/productos/img/default.png","19000.00","32000.00","ACTIVO","2024-06-01 14:27:47","1");
INSERT INTO producto VALUES("278","0266","ZAPATO COLEGIAL NIÑA TL 27","EDER","0266","SINTETICO","1","1","1","50","1","1","28","1","controlador/productos/img/default.png","19000.00","32000.00","ACTIVO","2024-06-01 14:28:33","1");
INSERT INTO producto VALUES("279","0267","ZAPATO COLEGIAL NIÑA TL 28","EDER","0267","SINTETICO","1","1","4","50","1","1","28","1","controlador/productos/img/default.png","19000.00","32000.00","ACTIVO","2024-06-01 14:29:17","1");
INSERT INTO producto VALUES("280","0268","ZAPATO COLEGIAL NIÑA TL 29","EDER","0268","SINTETICO","1","1","0","50","1","1","28","1","controlador/productos/img/default.png","19000.00","32000.00","ACTIVO","2024-06-01 14:29:48","1");
INSERT INTO producto VALUES("281","0269","ZAPATO COLEGIAL NIÑA TL 30","EDER","0269","SINTETICO","1","1","0","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:31:14","1");
INSERT INTO producto VALUES("282","0270","ZAPATO COLEGIAL NIÑA TL 31","EDER","0270","SINTETICO","1","1","3","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:32:02","1");
INSERT INTO producto VALUES("283","0271","ZAPATO COLEGIAL NIÑA TL 32","EDER","0271","SINTETICO","1","1","4","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:32:29","1");
INSERT INTO producto VALUES("284","0272","ZAPATO COLEGIAL NIÑA TL 33","EDER","0272","SINTETICO","1","1","1","50","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-01 14:33:34","1");
INSERT INTO producto VALUES("285","0273","ZAPATO COLEGIAL NIÑA TL 34","EDER","0273","SINTETICO","1","1","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:37:09","1");
INSERT INTO producto VALUES("286","0274","ZAPATO COLEGIAL NIÑA TL 35","EDER","0274","SINTETICO","1","1","2","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:37:48","1");
INSERT INTO producto VALUES("287","0275","ZAPATO COLEGIAL NIÑA TL 36","EDER","0275","SINTETICO","1","1","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:38:19","1");
INSERT INTO producto VALUES("288","0276","ZAPATO COLEGIAL NIÑA TL 37","EDER","0276","SINTETICO","1","1","0","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:38:59","1");
INSERT INTO producto VALUES("289","0277","ZAPATO COLEGIAL NIÑA TL 38","EDER","0277","SINTETICO","1","1","0","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:39:44","1");
INSERT INTO producto VALUES("290","0278","ZAPATO COLEGIAL NIÑA TL 39","EDER","0278","SINTETICO","1","1","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:40:22","1");
INSERT INTO producto VALUES("291","0279","ZAPATO COLEGIAL NIÑA TL 40","EDER","0279","SINTETICO","1","1","1","50","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-01 14:40:59","1");
INSERT INTO producto VALUES("292","0280","GUAYOS MARACANA TL 38","GUIAYOS ","0280","CUERO","1","1","5","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 14:46:46","1");
INSERT INTO producto VALUES("293","0281","GUAYOS MARACANA TL 39","GUIAYOS ","0281","CUERO","1","1","1","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 14:53:27","1");
INSERT INTO producto VALUES("294","0282","GUAYOS MARACANA TL 40","GUIAYOS ","0282","CUERO","1","1","0","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 14:55:31","1");
INSERT INTO producto VALUES("295","0283","GUAYOS MARACANA TL 41","GUIAYOS ","0283","CUERO","1","1","3","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 14:56:23","1");
INSERT INTO producto VALUES("296","0284","GUAYOS MARACANA TL 42","GUIAYOS ","0284","CUERO","1","1","4","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 14:57:13","1");
INSERT INTO producto VALUES("297","0285","ZAPATILLA MARACANA TL 34","ZAPATILLA","0285","CUERO","1","1","2","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:01:21","1");
INSERT INTO producto VALUES("298","0286","ZAPATILLA MARACANA TL 38","ZAPATILLA","0286","CUERO","1","1","1","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:02:09","1");
INSERT INTO producto VALUES("299","0287","ZAPATILLA MARACANA TL 39","ZAPATILLA","0287","CUERO","1","1","1","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:04:54","1");
INSERT INTO producto VALUES("300","0288","ZAPATILLA MARACANA TL 35","ZAPATILLA","0288","CUERO","1","1","1","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:05:32","1");
INSERT INTO producto VALUES("301","0289","ZAPATILLA MARACANA TL 37","ZAPATILLA","0289","CUERO","1","1","1","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:06:11","1");
INSERT INTO producto VALUES("302","0290","ZAPATILLA MARACANA TL 36","ZAPATILLA","0290","CUERO","1","1","0","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:07:05","1");
INSERT INTO producto VALUES("303","0291","ZAPATILLA MARACANA TL 40","ZAPATILLA","0291","CUERO","1","1","0","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:07:48","1");
INSERT INTO producto VALUES("304","0292","ZAPATILLA MARACANA TL 41","ZAPATILLA","0292","CUERO","1","1","0","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:08:19","1");
INSERT INTO producto VALUES("305","0293","ZAPATILLA MARACANA TL 42","ZAPATILLA","0293","CUERO","1","1","0","51","1","1","2","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-01 15:09:05","1");
INSERT INTO producto VALUES("306","0294","BOTA ARGOS Y WELLCO TL 38","AMARILLA","0294","CUERO","1","1","2","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:27:15","1");
INSERT INTO producto VALUES("307","0295","BOTA ARGOS Y WELLCO TL 39","AMARILLA","0295","CUERO","1","1","0","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-18 12:34:41","1");
INSERT INTO producto VALUES("308","0296","BOTA ARGOS Y WELLCO TL 40","AMARILLA","0296","CUERO","1","1","0","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:28:42","1");
INSERT INTO producto VALUES("309","0297","BOTA ARGOS Y WELLCO TL 41","AMARILLA","0297","CUERO","1","1","3","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:29:52","1");
INSERT INTO producto VALUES("310","0298","BOTA ARGOS Y WELLCO TL 42","AMARILLA","0298","CUERO","1","1","2","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:30:34","1");
INSERT INTO producto VALUES("311","0299","BOTA ARGOS Y WELLCO TL 43","AMARILLA","0299","CUERO","1","1","3","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:31:17","1");
INSERT INTO producto VALUES("312","0300","BOTA ARGOS Y WELLCO TL 44","AMARILLA","0300","CUERO","1","1","0","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:32:05","1");
INSERT INTO producto VALUES("313","0301","BOTA ARGOS Y WELLCO TL 37","AMARILLA","0301","CUERO","1","1","0","52","1","1","2","1","controlador/productos/img/default.png","80000.00","98000.00","ACTIVO","2024-06-01 17:32:46","1");
INSERT INTO producto VALUES("314","0302","LICUADORA ALTEZA MAX PRO ","VASO PLATICO ","0302","NEGRA","1","0","4","23","1","1","23","1","controlador/productos/img/default.png","95000.00","115000.00","ACTIVO","2024-06-04 13:34:44","1");
INSERT INTO producto VALUES("315","0304","LICUADORA UNIVERSAL VASO VIDRIO","4 VELOCIDADES","0304","NEGRA","1","0","2","23","1","1","10","1","controlador/productos/img/default.png","82000.00","98000.00","ACTIVO","2024-06-04 13:52:47","1");
INSERT INTO producto VALUES("316","0305","LICUADORA IMUSA POWERMIX","VASO PLASTICO","0305","2 VELOCIDADES","1","3","11","23","1","1","6","1","controlador/productos/img/default.png","82000.00","98000.00","ACTIVO","2024-06-04 14:28:00","1");
INSERT INTO producto VALUES("317","0306","LICUADORA SAMURAY OPTIMIX PLUS ","VASO PLASTICO","0306","2 VELOCIDADES","1","3","45","23","1","1","1","1","controlador/productos/img/default.png","75800.00","88000.00","ACTIVO","2024-06-09 11:49:23","1");
INSERT INTO producto VALUES("318","0307","LICUADORA SAMURAY VASO VIDRIO ","VASO PLASTICO","0307","OPTIX PLUS","1","1","1","23","1","1","1","1","controlador/productos/img/default.png","105000.00","135000.00","ACTIVO","2024-06-04 14:31:34","1");
INSERT INTO producto VALUES("319","0308","LICUADORA IMUSA ULTRAFORCE XL","VASO VIDRIO 2.2L","0308","MOTOR METALICO","1","0","1","23","1","1","6","1","controlador/productos/img/default.png","205000.00","248000.00","ACTIVO","2024-06-04 14:16:35","1");
INSERT INTO producto VALUES("320","0309","LICUADORA OSTER ALL- METAL DRIVE","VASO VIDRIO ","0309","MOTOR PLASTICO","1","2","9","23","1","1","15","1","controlador/productos/img/default.png","140000.00","188000.00","ACTIVO","2024-06-04 14:24:15","1");
INSERT INTO producto VALUES("321","0310","LICUADORA OSTER CLASSIC 1000-W","VASO VIDRIO ","0310","MOTOR METALICO","1","1","1","23","1","1","15","1","controlador/productos/img/default.png","245000.00","310000.00","ACTIVO","2024-06-15 15:49:38","1");
INSERT INTO producto VALUES("322","0311","LICUADORA OSTER CLASSIC 700-W","VASO DE VIDRIO","0311","MOTOR METALICO","1","1","2","23","1","1","15","1","controlador/productos/img/default.png","235000.00","290000.00","ACTIVO","2024-06-04 14:36:28","1");
INSERT INTO producto VALUES("323","0312","LICUADORA HOME ELEMENTS CON PICA TODO","VASO DE VIDRIO","0312","6 VELOCIDADES","1","0","1","23","1","1","24","1","controlador/productos/img/default.png","158000.00","215000.00","ACTIVO","2024-06-04 14:38:40","1");
INSERT INTO producto VALUES("324","0313","ESTUFA CONTINENTAL DE EMPOTRAR VIDRIO","4 PUESTOS","0313","GN","1","0","1","2","1","1","18","1","controlador/productos/img/default.png","670000.00","750000.00","ACTIVO","2024-06-04 14:45:16","1");
INSERT INTO producto VALUES("325","0314","ESTUFA CONTINENTAL 4 PUESTOS-QL (GLP)","PLATAFORMA ACERO","0314","SOBRE MESA","1","1","2","2","1","1","18","1","controlador/productos/img/default.png","240000.00","295000.00","ACTIVO","2024-06-04 14:53:44","1");
INSERT INTO producto VALUES("326","0315","ESTUFA CONTINENTAL 4 PUESTOS-QL (GN)","PLATAFORMA ACERO","0315","SOBRE MESA","1","1","3","2","1","1","18","1","controlador/productos/img/default.png","240000.00","295000.00","ACTIVO","2024-06-04 14:55:56","1");
INSERT INTO producto VALUES("327","0316","ESTUFA HACEB 4 PUESTOS-AL (GLP)","PLATAFORMA ACERO","0316","SOBRE MESA","1","1","1","2","1","1","7","1","controlador/productos/img/default.png","260000.00","310000.00","ACTIVO","2024-06-10 10:32:04","1");
INSERT INTO producto VALUES("328","0317","ESTUFA HACEB 4 PUESTOS-AL (GN)","PLATAFORMA ACERO","0317","SOBRE MESA","1","1","2","2","1","1","7","1","controlador/productos/img/default.png","260000.00","310000.00","ACTIVO","2024-06-06 12:11:46","1");
INSERT INTO producto VALUES("329","0318","ESTUFA CONTINENTAL 3 PUESTOS (GLP)","PLATAFORMA PELTRE","0318","QL","1","1","2","2","1","1","7","1","controlador/productos/img/default.png","142000.00","180000.00","ACTIVO","2024-06-04 15:07:14","1");
INSERT INTO producto VALUES("330","0319","ESTUFA CONTINENTAL 3 PUESTOS (GN)","PLATAFORMA PELTRE","0319","QL","1","1","2","2","1","1","18","1","controlador/productos/img/default.png","142000.00","180000.00","ACTIVO","2024-06-04 15:08:41","1");
INSERT INTO producto VALUES("331","0320","ESTUFA CONTINENTAL-AL 2 PUESTOS-(GLP)","PLATAFORMA ACERO","0320","SOBRE MESA","1","1","6","2","1","1","18","1","controlador/productos/img/default.png","142000.00","180000.00","ACTIVO","2024-06-04 15:15:37","1");
INSERT INTO producto VALUES("332","0321","ESTUFA CONTINENTAL -AL 2 PUESTOS (GN)","PLATAFORMA ACERO","0321","SOBRE MESA","1","1","5","2","1","1","18","1","controlador/productos/img/default.png","142000.00","180000.00","ACTIVO","2024-06-04 15:14:57","1");
INSERT INTO producto VALUES("333","0322","ESTUFA CONTINENTAL 4 PUESTOS-AL (GN)","PLATAFORMA ACERO","03225","SOBRE MESA","1","1","4","2","1","1","18","1","controlador/productos/img/default.png","275000.00","325000.00","ACTIVO","2024-06-04 15:20:51","1");
INSERT INTO producto VALUES("334","0323","ESTUFA CONTINENTAL 4 PUESTOS-AL (GLP)","PLATAFORMA ACERO","0323","SOBRE MESA","1","1","0","2","1","1","18","1","controlador/productos/img/default.png","275000.00","325000.00","ACTIVO","2024-06-04 15:25:33","1");
INSERT INTO producto VALUES("335","0324","ESTUFA ABBA 2 PUESTOS-QL (GN)","PLATAFORMA PELTRE","0324","SOBRE MESA","1","3","20","2","1","1","16","1","controlador/productos/img/default.png","80000.00","95000.00","ACTIVO","2024-06-04 15:30:34","1");
INSERT INTO producto VALUES("336","0325","ESTUFA ABBA 2 PUESTOS-QL (GLP)","PLATAFORMA PELTRE","0325","SOBRE MESA","1","3","16","2","1","1","16","1","controlador/productos/img/default.png","80000.00","95000.00","ACTIVO","2024-06-17 10:05:59","1");
INSERT INTO producto VALUES("337","0326","ESTUFA ABBA 2 PUESTOS-AL (GN)","PLATAFORMA PELTRE","0326","SOBRE MESA","1","1","1","2","1","1","16","1","controlador/productos/img/default.png","91500.00","110000.00","ACTIVO","2024-06-04 15:34:32","1");
INSERT INTO producto VALUES("338","0327","ESTUFA ABBA 2 PUESTOS-AL (GLP)","PLATAFORMA PELTRE","0327","SOBRE MESA","1","1","3","2","1","1","16","1","controlador/productos/img/default.png","91500.00","110000.00","ACTIVO","2024-06-04 15:36:17","1");
INSERT INTO producto VALUES("339","0328","ESTUFA ABBA 4 PUESTOS-QL (GN)","PLATAFORMA PELTRE","0328","SOBFRE MESA ","1","","3","2","1","1","16","1","controlador/productos/img/default.png","250000.00","285000.00","ACTIVO","2024-06-04 15:39:20","1");
INSERT INTO producto VALUES("340","0329","ESTUFA ABBA 4 PUESTOS-QL (GLP)","PLATAFORMA PELTRE","0329","SOBRE MESA","1","1","0","2","1","1","16","1","controlador/productos/img/default.png","250000.00","285000.00","ACTIVO","2024-06-04 15:40:03","1");
INSERT INTO producto VALUES("341","0330","ESTUFA ABBA 4 PUESTOS-AL (GN)","PLATAFORMA PELTRE","0330","SOBRE MESA","1","1","0","2","1","1","16","1","controlador/productos/img/default.png","260000.00","295000.00","ACTIVO","2024-06-04 15:41:23","1");
INSERT INTO producto VALUES("342","0331","ESTUFA ABBA 4 PUESTOS-AL (GLP)","PLATAFORMA PELTRE","0331","SOBRE MESA","1","1","0","2","1","1","16","1","controlador/productos/img/default.png","260000.00","295000.00","ACTIVO","2024-06-04 15:42:19","1");
INSERT INTO producto VALUES("343","0332","ESTUFA ABBA EN ACERO 4 PUESTOS-AL (GN)","PLATAFORMA ACERO","0332","SOBRE MESA","1","1","0","2","1","1","16","1","controlador/productos/img/default.png","275000.00","310000.00","ACTIVO","2024-06-04 15:48:37","1");
INSERT INTO producto VALUES("344","0333","ESTUFA ABBA EN ACERO 4 PUESTOS-AL (GLP)","PLATAFORMA ACERO","0333","SOBRE MESA","1","1","0","2","1","1","16","1","controlador/productos/img/default.png","275000.00","310000.00","ACTIVO","2024-06-04 15:51:02","1");
INSERT INTO producto VALUES("345","0336","ESTUFA HACEB 2 PUESTOS-(GN)","PLATAFORMA ACERO","0336","SOBRTE MESA","1","2","7","2","1","1","7","1","controlador/productos/img/default.png","81999.00","95000.00","ACTIVO","2024-06-04 15:54:29","1");
INSERT INTO producto VALUES("346","0339","MOLINO CORONA PARA GRANO","MOLINO DE ,MANO","0339","GRANO","1","2","18","26","1","1","8","1","controlador/productos/img/default.png","102000.00","125000.00","ACTIVO","2024-06-04 15:58:39","1");
INSERT INTO producto VALUES("347","0340","MOLINO CORONA PARA CARNE","MOLINO DE ,MANO","03340","PARA CARNE","1","1","2","26","1","1","8","1","controlador/productos/img/default.png","107000.00","135000.00","ACTIVO","2024-06-04 16:21:03","1");
INSERT INTO producto VALUES("348","0345","ESTUFA 2 PUESTO HACEB (GLP)","BASE PELTRE ","03345","SOBRE MESA","1","1","7","2","1","1","7","1","controlador/productos/img/default.png","82000.00","95000.00","ACTIVO","2024-06-13 16:51:14","1");
INSERT INTO producto VALUES("349","0346","ESTUFA ELECTRICA HACEB 2 PUESTOS","BASE PELTRE ","0346","ELECTRICA","1","1","9","2","1","1","7","1","controlador/productos/img/default.png","168000.00","190000.00","ACTIVO","2024-06-04 17:12:31","1");
INSERT INTO producto VALUES("350","0347","ESTUFA ELECTRICA HACEB 1 PUESTO","BASE PELTRE ","0347","ELECTRICA","1","1","1","2","1","1","7","1","controlador/productos/img/default.png","78000.00","95000.00","ACTIVO","2024-06-04 17:14:03","1");
INSERT INTO producto VALUES("351","0348","ESTUFA ELECTRICA ABBA 2 PUESTO","BASE PELTRE ","0348","ELECTRICA","1","2","6","2","1","1","16","1","controlador/productos/img/default.png","162000.00","178000.00","ACTIVO","2024-06-04 17:15:43","1");
INSERT INTO producto VALUES("352","0349","ESTUFA ELECTRICA ABBA 1 PUESTO","BASE PELTRE ","0349","ELECTRICA","1","1","0","2","1","1","16","1","controlador/productos/img/default.png","78000.00","90000.00","ACTIVO","2024-06-04 17:17:11","1");
INSERT INTO producto VALUES("353","0350","ESTUFA DE GASOLINA CONTINENTAL","BASE PELTRE ","0350","GASOLINA","1","1","1","2","1","1","16","1","controlador/productos/img/default.png","150000.00","198000.00","ACTIVO","2024-06-15 14:06:41","1");
INSERT INTO producto VALUES("354","0351","ESTUFA UNIVERSAL ELECTRICA","BASE PELTRE ","0351","ELECTRICA","1","1","2","2","1","1","10","1","controlador/productos/img/default.png","68000.00","85000.00","ACTIVO","2024-06-04 17:19:39","1");
INSERT INTO producto VALUES("355","0352","ESTUFA  LYNX 2 PUESTO (GN)","BASE PELTRE ","0352","SOBRE MESA","1","2","4","2","1","1","10","1","controlador/productos/img/default.png","73000.00","85000.00","ACTIVO","2024-06-13 14:26:37","1");
INSERT INTO producto VALUES("356","0353","ESTUFA  LYNX 2 PUESTO (GLP)","BASE PELTRE ","0353","SOBRE MESA","1","2","0","2","1","1","2","1","controlador/productos/img/default.png","73000.00","85000.00","ACTIVO","2024-06-11 11:35:27","1");
INSERT INTO producto VALUES("357","0354","ESTUFA CON GAVINETE HECEB ","BASE ACERO QUEMADORV-AL","0354","GAVINETE","1","1","1","2","1","1","7","1","controlador/productos/img/default.png","550000.00","680000.00","ACTIVO","2024-06-04 17:23:57","1");
INSERT INTO producto VALUES("358","0355","ESTUFA MABE PARA EMPOTRAR 60-44","BASE ACERO QUEMADORV-AL","0355","ACERO","1","1","1","2","1","1","19","1","controlador/productos/img/default.png","355000.00","490000.00","ACTIVO","2024-06-04 17:26:04","1");
INSERT INTO producto VALUES("359","0356","ESTUFA HACEB PAREA EMPOTRAR 60-43","BASE ACERO QUEMADORV-AL","0356","QUEMADOR AL","1","1","1","2","1","1","19","1","controlador/productos/img/default.png","355000.00","490000.00","ACTIVO","2024-06-04 17:28:15","1");
INSERT INTO producto VALUES("360","0357","ESTUFA DKASA 4 PUESTO (GLP)","BASE PELTRE","0357","SOBRE MESA","1","2","1","2","1","1","25","1","controlador/productos/img/default.png","238000.00","285000.00","ACTIVO","2024-06-04 17:36:14","1");
INSERT INTO producto VALUES("361","0358","ESTUFA DKASA 4 PUESTO (GN)","BASE PELTRE","0358","SOBRE MESA","1","2","0","2","1","1","25","1","controlador/productos/img/default.png","238000.00","285000.00","ACTIVO","2024-06-04 17:36:54","1");
INSERT INTO producto VALUES("362","0341","TERMO CAFE 1-L EVER HOUSE ","TERMO LISO Y DECORADO","0341","1L","1","2","18","53","1","1","25","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-05 11:05:47","1");
INSERT INTO producto VALUES("363","0342","TERMO DECORADO 1 LITRO","TERMO  DECORADO","0342","INFANTIL","1","2","16","53","1","1","25","1","controlador/productos/img/default.png","19000.00","25000.00","ACTIVO","2024-06-05 11:07:53","1");
INSERT INTO producto VALUES("364","0343","TERMO IMUSA 1 LITRO","TERMO  LISO","0343","1L","1","5","34","53","1","1","6","1","controlador/productos/img/default.png","24000.00","32000.00","ACTIVO","2024-06-14 16:51:38","1");
INSERT INTO producto VALUES("365","0344","TERMO IMUSA 0.75 LITROS","TERMO  LISO","0344","0.75L","1","3","6","53","1","1","6","1","controlador/productos/img/default.png","24000.00","31000.00","ACTIVO","2024-06-19 11:07:51","1");
INSERT INTO producto VALUES("366","0359","TERMO COLPLAS 1 LITTRO","TERMO  LISO","0359","1L","1","3","3","53","1","1","26","1","controlador/productos/img/default.png","21000.00","27000.00","ACTIVO","2024-06-09 09:40:23","1");
INSERT INTO producto VALUES("367","0360","TERMO DECORADO 0.5 LITROS ","TERMO  DECORADO","0360","0.5L","1","2","6","53","1","1","28","1","controlador/productos/img/default.png","15800.00","22500.00","ACTIVO","2024-06-19 09:19:07","1");
INSERT INTO producto VALUES("368","0361","TERMO INOXIDABLE 0.32L ","TERMO ESTATO","0361","0.32L","1","2","3","53","1","1","28","1","controlador/productos/img/default.png","19500.00","27500.00","ACTIVO","2024-06-05 11:19:46","1");
INSERT INTO producto VALUES("369","0362","TERMO INOXIDABLE 0.5L","TERMO ESTATO","0362","0.5L","1","2","5","53","1","1","28","1","controlador/productos/img/default.png","17500.00","25000.00","ACTIVO","2024-06-05 11:20:49","1");
INSERT INTO producto VALUES("370","0363","TERMO INOXIDABLE 1 LITRO","TERMO ESTATO","0363","1L","1","2","6","53","1","1","28","1","controlador/productos/img/default.png","27500.00","34500.00","ACTIVO","2024-06-05 11:23:05","1");
INSERT INTO producto VALUES("371","0364","TERMO INOXIDABLE PARA ALIMENTOS 0.75L","TERMO ESTATO","0364","ALIMENTOS ","1","1","1","53","1","1","28","1","controlador/productos/img/default.png","27500.00","38000.00","ACTIVO","2024-06-05 11:24:28","1");
INSERT INTO producto VALUES("372","0365","TERMO IMUSA DECORADO 0.25L","TERMO NIÑO","0365","0.25L","1","2","4","53","1","1","6","1","controlador/productos/img/default.png","17500.00","25000.00","ACTIVO","2024-06-05 11:26:10","1");
INSERT INTO producto VALUES("373","0366","TERMO INOXIDABLE ","TERMO LISO","0366","0.5L","1","1","1","53","1","1","28","1","controlador/productos/img/default.png","14000.00","21000.00","ACTIVO","2024-06-05 11:28:20","1");
INSERT INTO producto VALUES("374","0367","TERMO BOMBA  INOXIDABLE 1.9 LITROS","TERMO LISO INOXIDABLE","0367","1.9L","1","1","4","53","1","1","28","1","controlador/productos/img/default.png","35000.00","48500.00","ACTIVO","2024-06-05 17:20:08","1");
INSERT INTO producto VALUES("375","0368","TERMO BOMBA  INOXIDABLE 2.5 LITROS","TERMO LISO INOXIDABLE","0368","2.5L","1","1","2","53","1","1","28","1","controlador/productos/img/default.png","65000.00","82000.00","ACTIVO","2024-06-05 11:35:09","1");
INSERT INTO producto VALUES("376","0369","TERMO BOMBA  INOXIDABLE 3 LITROS","TERMO LISO INOXIDABLE","0369","3L","1","1","2","53","1","1","28","1","controlador/productos/img/default.png","75000.00","96000.00","ACTIVO","2024-06-05 11:35:50","1");
INSERT INTO producto VALUES("377","0370","NEVERA MABE  384  LITROS  AUTOMATICA","NEVERA   AUTOMATICA","0370","384 LITROS","1","1","2","24","1","1","19","1","controlador/productos/img/default.png","1830000.00","21500000.00","ACTIVO","2024-06-05 12:21:12","1");
INSERT INTO producto VALUES("378","0371","TV EXCLUSIV  40 PULGADAS","TEVISOR  ESMAR 40 PULGADAS","0371","40 PULGADAS","1","1","1","33","1","1","28","1","controlador/productos/img/default.png","870000.00","1150000.00","ACTIVO","2024-06-05 12:40:52","1");
INSERT INTO producto VALUES("379","0372","TV 32&quot; CAIXUN SMARTV","SMARTV","0372","32&quot;","1","1","2","33","1","1","28","1","controlador/productos/img/default.png","580000.00","680000.00","ACTIVO","2024-06-05 13:13:09","1");
INSERT INTO producto VALUES("380","0373","HORNO PROFECIONAL DKASA 45L","TOSTADOR ","0373","1600W","1","1","1","2","1","1","25","1","controlador/productos/img/default.png","330000.00","495000.00","ACTIVO","2024-06-05 13:18:33","1");
INSERT INTO producto VALUES("381","0374","HORNO PROFECIONAL DKASA 32L","TOSTADOR ","0374","1500W","1","1","1","2","1","1","25","1","controlador/productos/img/default.png","238100.00","375000.00","ACTIVO","2024-06-05 13:20:06","1");
INSERT INTO producto VALUES("382","0375","FREIDORA DE AIRE OSTER 4L","FREIDORA ","0375","4L","1","1","1","2","1","1","15","1","controlador/productos/img/default.png","256600.00","348000.00","ACTIVO","2024-06-05 13:23:01","1");
INSERT INTO producto VALUES("383","0376","VENTILADOR UNIVERSAL 8&quot;","MESA Y PARED","0376","8&quot;","1","2","5","4","1","1","10","1","controlador/productos/img/default.png","68000.00","98000.00","ACTIVO","2024-06-05 13:26:49","1");
INSERT INTO producto VALUES("384","0377","VENTILADOR LYNX 8&quot;","MESA Y PARED","0377","8&quot;","1","1","3","4","1","1","17","1","controlador/productos/img/default.png","53000.00","78000.00","ACTIVO","2024-06-05 13:28:37","1");
INSERT INTO producto VALUES("385","0378","VENTILADOR PARA CARRO 12 VOLTIOS GRANDE ","VENTILADOR CARRO","0378","12V","1","1","2","4","1","1","2","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-05 14:01:32","1");
INSERT INTO producto VALUES("386","0379","VENTILADOR PARA CARRO 12 VOLTIOS PEQUEÑO","VENTILADOR CARRO","0379","12V","1","1","2","4","1","1","2","1","controlador/productos/img/default.png","48000.00","68000.00","ACTIVO","2024-06-05 14:02:45","1");
INSERT INTO producto VALUES("387","0380","HORNO MICROHONDAS HACEB","HORNO","0380","0.7","1","1","1","2","1","1","2","1","controlador/productos/img/default.png","325000.00","430000.00","ACTIVO","2024-06-05 14:07:22","1");
INSERT INTO producto VALUES("388","0381","PESO ELECTRONICO 40KG","PESO","0381","40KG","1","1","2","54","1","1","2","1","controlador/productos/img/default.png","120000.00","155000.00","ACTIVO","2024-06-20 16:10:30","1");
INSERT INTO producto VALUES("389","0382","BATERIA 7 PIEZAS DKASA","ZARTENES","0382","7PIZ","1","1","2","18","1","1","25","1","controlador/productos/img/default.png","129000.00","188000.00","ACTIVO","2024-06-05 14:17:55","1");
INSERT INTO producto VALUES("390","0383","EXPRIMIDOR DE NARANJA INDUSTRIAL","EXPRIMIDOR UNIVERSAL","0383","ALUMINIO","1","1","2","18","1","1","10","1","controlador/productos/img/default.png","179000.00","248000.00","ACTIVO","2024-06-05 14:24:43","1");
INSERT INTO producto VALUES("391","0384","OLLA A PRESION INDIA 6 LITROS","ALUMINIO","0384","6L","1","2","12","25","1","1","3","1","controlador/productos/img/default.png","78000.00","95000.00","ACTIVO","2024-06-05 14:29:31","1");
INSERT INTO producto VALUES("393","0385","OLLA A PRESION CORONA 4 LITROS","ALUMINIO","0385","4L","1","2","5","25","1","1","8","1","controlador/productos/img/default.png","65000.00","78000.00","ACTIVO","2024-06-05 14:39:36","1");
INSERT INTO producto VALUES("394","0386","OLLA A PRESION UMCO 6 LITROS","ALUMINIO","0386","4L","1","1","1","25","1","1","2","1","controlador/productos/img/default.png","78000.00","92000.00","ACTIVO","2024-06-05 14:41:51","1");
INSERT INTO producto VALUES("395","0387","OLLA A PRESION UMCO 4 LITROS","ALUMINIO","0387","4L","1","1","1","25","1","1","2","1","controlador/productos/img/default.png","68000.00","82000.00","ACTIVO","2024-06-05 14:43:11","1");
INSERT INTO producto VALUES("396","0388","OLLA A PRESION IMUSA 6 LITROS","ALUMINIO","0388","6L","1","1","5","25","1","1","6","1","controlador/productos/img/default.png","88000.00","110000.00","ACTIVO","2024-06-05 14:44:32","1");
INSERT INTO producto VALUES("397","0389","OLLA A PRESION IMUSA 4 LITROS","ALUMINIO","0389","4L","1","1","1","25","1","1","6","1","controlador/productos/img/default.png","88000.00","105000.00","ACTIVO","2024-06-05 14:45:33","1");
INSERT INTO producto VALUES("398","0390","OLLA A PRESION CORONA 13 LITROS","ALUMINIO","0390","13L","1","1","2","25","1","1","8","1","controlador/productos/img/default.png","158100.00","180000.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("399","0391","OLLA A PRESION INDIA 10 LITROS","ALUMINIO","0391","10L","1","1","1","25","1","1","8","1","controlador/productos/img/default.png","160000.00","198000.00","ACTIVO","2024-06-05 14:51:13","1");
INSERT INTO producto VALUES("400","0392","OLLA A PRESION INDIA 13 LITROS","ALUMINIO","0392","13L","1","1","1","25","1","1","8","1","controlador/productos/img/default.png","250000.00","285000.00","ACTIVO","2024-06-05 14:52:02","1");
INSERT INTO producto VALUES("401","0393","OLLA A PRESION UNIVERSAL 13 LITROS","ALUMINIO","0393","13L","1","1","3","25","1","1","10","1","controlador/productos/img/default.png","270000.00","320000.00","ACTIVO","2024-06-05 14:53:37","1");
INSERT INTO producto VALUES("402","0394","OLLA A PRESION UNIVERSAL 10 LITROS","ALUMINIO","0394","10L","1","1","4","25","1","1","10","1","controlador/productos/img/default.png","170000.00","220000.00","ACTIVO","2024-06-05 14:54:46","1");
INSERT INTO producto VALUES("403","0395","OLLA A PRESION UNIVERSAL 6 LITROS","ALUMINIO","0395","6L","1","1","5","25","1","1","10","1","controlador/productos/img/default.png","1280000.00","168000.00","ACTIVO","2024-06-05 14:55:44","1");
INSERT INTO producto VALUES("404","0396","OLLA A PRESION UNIVERSAL 4 LITROS","ALUMINIO","0396","4L","1","1","4","25","1","1","10","1","controlador/productos/img/default.png","1180000.00","145000.00","ACTIVO","2024-06-05 14:56:56","1");
INSERT INTO producto VALUES("405","0397","OLLA A PRESION UNIVERSAL 3.5 LITROS","ALUMINIO","0397","3.5L","1","1","2","25","1","1","10","1","controlador/productos/img/default.png","880000.00","119000.00","ACTIVO","2024-06-05 14:57:58","1");
INSERT INTO producto VALUES("406","0398","OLLA A PRESION UNIVERSAL 3 LITROS","ALUMINIO","0398","3L","1","1","1","25","1","1","10","1","controlador/productos/img/default.png","820000.00","105000.00","ACTIVO","2024-06-05 14:58:39","1");
INSERT INTO producto VALUES("407","0399","OLLA ARROCERA UNIVERSAL 5 TAZAS","ANTIADERENTE","0399","5T","1","1","2","25","1","1","10","1","controlador/productos/img/default.png","820000.00","105000.00","ACTIVO","2024-06-05 15:00:53","1");
INSERT INTO producto VALUES("408","0400","OLLA A PRESION HOME ELEMENTS 9 LITROS","3 PITOS ALUMINIO","0400","9L","1","1","1","25","1","1","24","1","controlador/productos/img/default.png","162000.00","195000.00","ACTIVO","2024-06-05 15:04:34","1");
INSERT INTO producto VALUES("409","0401","OLLA A PRESION HOME ELEMENTS 4 LITROS","3 PITOS ALUMINIO","0401","4L","1","1","2","25","1","1","24","1","controlador/productos/img/default.png","86200.00","110000.00","ACTIVO","2024-06-05 15:05:49","1");
INSERT INTO producto VALUES("410","0402","OLLA A PRESION HOME ELEMENTS 2 LITROS","3 PITOS ALUMINIO","0402","2L","1","1","1","25","1","1","24","1","controlador/productos/img/default.png","68200.00","85000.00","ACTIVO","2024-06-05 15:06:49","1");
INSERT INTO producto VALUES("411","0403","NEVERA PLASTICA EXTRA 42 LITROS","NEVERA ","0403","42L","1","1","2","55","1","1","2","1","controlador/productos/img/default.png","188000.00","230000.00","ACTIVO","2024-06-05 15:15:45","1");
INSERT INTO producto VALUES("412","0404","NEVERA PLASTICA EXTRA 3 LITROS","NEVERA ","0404","3L","1","1","2","55","1","1","2","1","controlador/productos/img/default.png","28000.00","42000.00","ACTIVO","2024-06-05 15:16:39","1");
INSERT INTO producto VALUES("413","0405","TERMO PLSTICO EXTRA 8 LITROS","TERMO","0405","8L","1","1","2","55","1","1","2","1","controlador/productos/img/default.png","78000.00","98000.00","ACTIVO","2024-06-05 15:18:08","1");
INSERT INTO producto VALUES("414","0406","TERMO PLSTICO EXTRA 2 LITROS","TERMO","0406","2L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","38000.00","52000.00","ACTIVO","2024-06-05 15:19:08","1");
INSERT INTO producto VALUES("415","0407","TERMO PLSTICO EXTRA 1 LITROS","TERMO","0407","1L","1","1","7","55","1","1","2","1","controlador/productos/img/default.png","20000.00","29000.00","ACTIVO","2024-06-05 15:19:58","1");
INSERT INTO producto VALUES("416","0408","TERMO PLASTICO POPOTAMO 51 LITROS","TERMO","0408","51L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","210000.00","298000.00","ACTIVO","2024-06-05 15:23:23","1");
INSERT INTO producto VALUES("417","0409","TERMO PLASTICO POPOTAMO 44 LITROS","TERMO","0409","44L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","230000.00","295000.00","ACTIVO","2024-06-05 15:24:11","1");
INSERT INTO producto VALUES("418","0410","TERMO PLASTICO POPOTAMO 15 LITROS","TERMO","0410","15L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","130000.00","175000.00","ACTIVO","2024-06-05 15:25:03","1");
INSERT INTO producto VALUES("419","0411","TERMO PLASTICO POPOTAMO 4 LITROS","TERMO","0411","4L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-05 15:25:49","1");
INSERT INTO producto VALUES("420","0412","TERMOLAR 2.5 LITROS","TERMO","0412","2.5L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-05 15:27:17","1");
INSERT INTO producto VALUES("421","0413","TERMO PLASTICO ECONOMICO 7.5 LITROS","TERMO","0413","7.5L","1","1","7","55","1","1","2","1","controlador/productos/img/default.png","28000.00","48000.00","ACTIVO","2024-06-19 11:00:32","1");
INSERT INTO producto VALUES("422","0414","TERMO PLASTICO ECONOMICO 2 LITROS","TERMO","0414","2L","1","1","13","55","1","1","2","1","controlador/productos/img/default.png","13000.00","18000.00","ACTIVO","2024-06-19 11:00:32","1");
INSERT INTO producto VALUES("423","0415","TERMO PLASTICO ECONOMICO 1 LITROS","TERMO","0415","1L","1","1","1","55","1","1","2","1","controlador/productos/img/default.png","9000.00","13000.00","ACTIVO","2024-06-05 15:29:54","1");
INSERT INTO producto VALUES("424","0416","COLCHONETA 100*190*18","COLCHONETA 100*190*18","0416","18","1","2","4","13","1","1","20","1","controlador/productos/img/default.png","120000.00","155000.00","ACTIVO","2024-06-11 16:10:28","1");
INSERT INTO producto VALUES("425","0417","COLCHONETA 100*190*14","COLCHONETA 100*190*14","0417","14","1","2","13","13","1","1","20","1","controlador/productos/img/default.png","110000.00","135000.00","ACTIVO","2024-06-05 17:00:28","1");
INSERT INTO producto VALUES("426","0418","COLCHONETA 100*190*12","COLCHONETA 100*190*","0418","12","1","2","7","13","1","1","20","1","controlador/productos/img/default.png","85000.00","110000.00","ACTIVO","2024-06-05 17:25:58","1");
INSERT INTO producto VALUES("427","0419","colchoneta para guarderia 70*100*10","70*100*10","0419","10","1","2","10","13","1","1","28","1","controlador/productos/img/default.png","45000.00","55000.00","ACTIVO","2024-06-06 15:22:22","1");
INSERT INTO producto VALUES("428","0420","COLCHONETA PARA GUARDERIA 70*100*7","70*100*7","0420","7","1","2","2","13","1","1","28","1","controlador/productos/img/default.png","35000.00","45000.00","ACTIVO","2024-06-06 15:23:59","1");
INSERT INTO producto VALUES("429","0421","COLCHONETA 140*190*20","COLCHONETA 140*190*20","0421","20","1","2","2","13","1","1","28","1","controlador/productos/img/default.png","200000.00","235000.00","ACTIVO","2024-06-06 15:25:23","1");
INSERT INTO producto VALUES("430","0422","COLCHONETA 140*190*18","COLCHONETA 140*190*18","0422","18","1","2","2","13","1","1","28","1","controlador/productos/img/default.png","190000.00","220000.00","ACTIVO","2024-06-06 15:26:22","1");
INSERT INTO producto VALUES("431","0423","COLCHONETA 140*190*14","COLCHONETA 140*190*14","0423","14","1","2","2","13","1","1","28","1","controlador/productos/img/default.png","150000.00","175000.00","ACTIVO","2024-06-06 15:27:08","1");
INSERT INTO producto VALUES("432","0424","COLCHONETA 140*190*12","COLCHONETA 140*190*12","0424","12","1","2","12","13","1","1","28","1","controlador/productos/img/default.png","130000.00","155000.00","ACTIVO","2024-06-06 15:28:14","1");
INSERT INTO producto VALUES("433","0425","COLCHON GENERICO 100*190*15","COLCHON GENERICO 100*190*15","0425","15","1","2","8","13","1","1","28","1","controlador/productos/img/default.png","160000.00","195000.00","ACTIVO","2024-06-06 15:29:19","1");
INSERT INTO producto VALUES("434","0426","COLCHON GENERICO 100*190*20","COLCHON GENERICO 100*190*20","0426","20","1","2","2","13","1","1","28","1","controlador/productos/img/default.png","180000.00","210000.00","ACTIVO","2024-06-06 15:30:00","1");
INSERT INTO producto VALUES("435","0427","COLCHON SUEÑO FLEX 100*190*25 (D23)","COLCHON SUEÑO FLEX 100*190*25 (D23)","0427","25","1","2","1","11","1","1","20","1","controlador/productos/img/default.png","290000.00","420000.00","ACTIVO","2024-06-07 15:36:53","1");
INSERT INTO producto VALUES("436","0428","COLCHON SUEÑO FLEX 140*190*30 (D30)","COLCHON SUEÑO FLEX 140*190*30 (D30)","0428","30","1","2","1","11","1","1","20","1","controlador/productos/img/default.png","490000.00","680000.00","ACTIVO","2024-06-07 15:32:54","1");
INSERT INTO producto VALUES("437","0429","COLCHON SUEÑO FLEX 140*190*25 (D23)","COLCHON SUEÑO FLEX 140*190*25 (D23)","0429","25","1","2","3","11","1","1","20","1","controlador/productos/img/default.png","430000.00","580000.00","ACTIVO","2024-06-06 15:34:49","1");
INSERT INTO producto VALUES("438","0430","COLCHON SERRATY 140*190*25 (ANATOMICO)","COLCHON SERRATY 140*190*25 (ANATOMICO)","0430","25","1","2","2","11","1","1","20","1","controlador/productos/img/default.png","370000.00","450000.00","ACTIVO","2024-06-06 15:36:08","1");
INSERT INTO producto VALUES("439","0431","COLCHON SERRATY 140*190*35 (ANATOMICO)","COLCHON SERRATY 140*190*35 (ANATOMICO)","0431","35","1","2","1","11","1","1","20","1","controlador/productos/img/default.png","420000.00","600000.00","ACTIVO","2024-06-07 15:27:44","1");
INSERT INTO producto VALUES("440","0432","COLCHON HIGHT CONFOR 140*190*30 (D23)","COLCHON HIGHT CONFOR 140*190*30 (D23)","0432","30","1","2","1","11","1","1","28","1","controlador/productos/img/default.png","500000.00","600000.00","ACTIVO","2024-06-06 15:38:52","1");
INSERT INTO producto VALUES("441","0433","COLCHON HIGHT CONFOR 140*190*25 (D23)","COLCHON HIGHT CONFOR 140*190*25 (D23)","0433","25","1","2","1","11","1","1","28","1","controlador/productos/img/default.png","420000.00","500000.00","ACTIVO","2024-06-06 15:40:10","1");
INSERT INTO producto VALUES("442","0434","COLCHON CARIBBEAN BLUE 120*190*25 (D23)","COLCHON CARIBBEAN BLUE 120*190*25 (D23)","0434","25","1","2","2","11","1","1","28","1","controlador/productos/img/default.png","330000.00","450000.00","ACTIVO","2024-06-07 15:53:40","1");
INSERT INTO producto VALUES("443","0435","COLCHON CARIBBEAN BLUE 140*190*25 (D23)","COLCHON CARIBBEAN BLUE 140*190*25 (D23)","0435","25","1","2","1","11","1","1","28","1","controlador/productos/img/default.png","330000.00","400000.00","ACTIVO","2024-06-06 15:42:30","1");
INSERT INTO producto VALUES("444","0436","ALMOHADA ECONIMICA","ESPONJA","0436","ECONOMICA","1","5","71","13","1","1","28","1","controlador/productos/img/default.png","11000.00","16000.00","ACTIVO","2024-06-12 14:08:33","1");
INSERT INTO producto VALUES("445","0437","ALMOHADA SILICONA ORIGINAL","SILICONA","0437","ORIGINAL","1","5","23","13","1","3","28","1","controlador/productos/img/default.png","35000.00","45000.00","ACTIVO","2024-06-06 15:47:32","1");
INSERT INTO producto VALUES("446","0438","BOLSO CROM GRANDE","BOLSO CROM GRANDE","0438","GRANDE","1","5","33","21","1","1","28","1","controlador/productos/img/default.png","42000.00","58000.00","ACTIVO","2024-06-06 15:49:53","1");
INSERT INTO producto VALUES("447","0439","BOLSO CROM PEQUEÑO","BOLSO CROM PEQUEÑO","0439","PEQUEÑO","1","5","9","21","1","1","28","1","controlador/productos/img/default.png","41000.00","52000.00","ACTIVO","2024-06-06 15:51:05","1");
INSERT INTO producto VALUES("448","0440","BOLSO RDA GRANDE NIÑA","BOLSO RDA GRANDE NIÑA","0440","GRANDE","1","5","5","21","1","1","28","1","controlador/productos/img/default.png","44000.00","58000.00","ACTIVO","2024-06-06 15:52:53","1");
INSERT INTO producto VALUES("449","0441","BOLSO RDA PEQUEÑO NIÑA","BOLSO RDA PEQUEÑO NIÑA","0441","PEQUEÑO","1","5","2","21","1","1","28","1","controlador/productos/img/default.png","41000.00","52000.00","ACTIVO","2024-06-06 15:55:03","1");
INSERT INTO producto VALUES("450","0442","BOLSO KAT GRANDE","TIPO MORRAL","0442","GRANDE","1","5","9","21","1","1","28","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-06 15:56:32","1");
INSERT INTO producto VALUES("451","0443","BOLSO SINTETICO DE DAMA PEQUEÑO","CORAZONES","0443","CORAZONES","1","5","10","21","1","1","28","1","controlador/productos/img/default.png","11000.00","16000.00","ACTIVO","2024-06-06 15:57:36","1");
INSERT INTO producto VALUES("452","0444","BOLSO TOTO MARQUILLA GRANDE","TIPO MORRAL","0444","MARQUILLA","1","2","4","21","1","1","28","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-06 15:59:35","1");
INSERT INTO producto VALUES("453","0445","BOLSO RDK HOMBRE","TIPO MORRAL","0445","MASCULINO","1","5","6","21","1","1","28","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-06 16:01:21","1");
INSERT INTO producto VALUES("454","0446","BOLSO RDK ESTAMPADO NIÑO","ESTAMPADO","0446","ESTAMPADO","1","5","5","21","1","1","28","1","controlador/productos/img/default.png","23000.00","32000.00","ACTIVO","2024-06-06 16:02:27","1");
INSERT INTO producto VALUES("455","0447","BOLSO NIÑO FORRO PLASTICO","ESTAMPADO","0447","PLASTICO","1","5","10","21","1","1","28","1","controlador/productos/img/default.png","16000.00","25000.00","ACTIVO","2024-06-06 16:03:23","1");
INSERT INTO producto VALUES("456","0448","BOLSO CON LUCES NIÑO","ESTAMPADO","0448","CON LUCES","1","5","11","21","1","1","28","1","controlador/productos/img/default.png","16000.00","25000.00","ACTIVO","2024-06-06 16:04:23","1");
INSERT INTO producto VALUES("457","0449","BOLSO VIAJERO TOTO","TIPO TULA","0449","VIAJERO","1","2","5","21","1","1","28","1","controlador/productos/img/default.png","42000.00","58000.00","ACTIVO","2024-06-06 16:05:21","1");
INSERT INTO producto VALUES("458","0450","BOLSO VIAJERO GRANDE ","CUADRADO","0450","GRANDE","1","2","13","21","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-06 16:06:37","1");
INSERT INTO producto VALUES("459","0451","BOLSO VIAJERO MEDIANO","CUADRADO","0451","MEDIANO","1","5","18","21","1","1","28","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-07 09:26:02","1");
INSERT INTO producto VALUES("460","0452","BOLSO VIAJERO PEQUEÑO","CUADRADO","0452","PEQUEÑO","1","2","2","21","1","1","28","1","controlador/productos/img/default.png","12000.00","18000.00","ACTIVO","2024-06-06 16:08:42","1");
INSERT INTO producto VALUES("461","0453","TULA VIAJERA ECONOMICA","EXPANDIBLE","0453","ECONOMICA","1","2","2","21","1","1","28","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-06 16:10:00","1");
INSERT INTO producto VALUES("462","0454","BOLSO DE LONA TIPO CARRIEL","LONA","0454","CARRIEL","1","2","2","21","1","1","28","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-06 16:11:19","1");
INSERT INTO producto VALUES("463","0455","RIÑONERA CROM","RIÑONERA","0455","GRANDE","1","5","6","21","1","1","28","1","controlador/productos/img/default.png","25000.00","38000.00","ACTIVO","2024-06-17 16:02:35","1");
INSERT INTO producto VALUES("464","0456","RIÑONERA MARQUILLA ECONOMICO","RIÑONERA","0456","ECONOMICO","1","5","8","21","1","1","28","1","controlador/productos/img/default.png","8000.00","13500.00","ACTIVO","2024-06-06 16:14:31","1");
INSERT INTO producto VALUES("465","0457","RIÑONERA DE MARQUILLA SINTETICA","RIÑONERA","0457","SINTETICA","1","5","6","21","1","1","28","1","controlador/productos/img/default.png","6000.00","19500.00","ACTIVO","2024-06-06 16:16:33","1");
INSERT INTO producto VALUES("466","0458","RIÑONERA MARQUILLA EVILLA GRUESA","RIÑONERA","0458","GRUESA","1","2","8","21","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-06 16:18:37","1");
INSERT INTO producto VALUES("467","0459","MOCHILA ECONOMICA","MOCHILA","0459","ECONOMICA","1","5","12","21","1","1","28","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-06 16:20:07","1");
INSERT INTO producto VALUES("468","0460","TULA ECONOMICA","TIPO TULA","0460","ECONOMICA","1","2","4","21","1","1","28","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-06 16:21:04","1");
INSERT INTO producto VALUES("469","0461","TULA ESTAMPADA ","TIPO TULA","0461","ESTAMPADA","1","2","10","21","1","1","28","1","controlador/productos/img/default.png","6000.00","9500.00","ACTIVO","2024-06-06 16:21:53","1");
INSERT INTO producto VALUES("470","0462","TULA DE MARQUILLA","TIPO TULA","0462","MARQUILLA","1","2","5","21","1","1","28","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-06 16:22:43","1");
INSERT INTO producto VALUES("471","0463","BOLSO DE CORREDERA REFORZADA XXL","BOLSO DE CORREDERA REFORZADA XXL","0463","REFORZADA","1","5","17","21","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-06 16:24:40","1");
INSERT INTO producto VALUES("472","0464","BOLSO DE CORREDERA REFORZADA XL","BOLSO DE CORREDERA REFORZADA XL","0464","REFORZADA","1","5","7","21","1","1","28","1","controlador/productos/img/default.png","11000.00","15000.00","ACTIVO","2024-06-06 16:25:26","1");
INSERT INTO producto VALUES("473","0465","BOLSO DE CORREDERA REFORZADA L","BOLSO DE CORREDERA REFORZADA L","0465","REFORZADA","1","2","0","21","1","1","28","1","controlador/productos/img/default.png","9000.00","13000.00","ACTIVO","2024-06-18 12:28:30","1");
INSERT INTO producto VALUES("474","0466","BOLSA MERCADERA","MERCADERA","0466","ECONOMICA","1","5","19","21","1","1","28","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-20 17:02:33","1");
INSERT INTO producto VALUES("475","0467","RIÑONERA CAMUFLADA","RIÑONERA","0467","CLAMUFADA","1","2","2","21","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-15 14:06:41","1");
INSERT INTO producto VALUES("476","0468","PIERNERA CAMUFLADA","PIERNERA","0468","CAMUFLADA","1","2","0","21","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-07 11:27:56","1");
INSERT INTO producto VALUES("477","0469","BOLSO ECONIMICO PEQUEÑO","PEQUEÑO","0469","ECONOMICO","1","2","4","21","1","1","28","1","controlador/productos/img/default.png","9000.00","13000.00","ACTIVO","2024-06-06 16:36:37","1");
INSERT INTO producto VALUES("478","0470","BOLSO ECONOMICO MEDIANO","MEDIANO","0470","ECONOMICO","1","2","2","21","1","1","28","1","controlador/productos/img/default.png","11000.00","16000.00","ACTIVO","2024-06-06 16:37:28","1");
INSERT INTO producto VALUES("479","0471","RIÑONERA RENO PEQUEÑA","RIÑONERA","0471","PEQUEÑA","1","2","6","21","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-06 16:38:25","1");
INSERT INTO producto VALUES("480","0472","RIÑONERA RENO MEDIANA","RIÑONERA","0472","MEDIANA","1","2","3","21","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-06 16:39:25","1");
INSERT INTO producto VALUES("481","0473","CARRIEL CAT PEQUEÑO ORIGINAL","PEQUEÑO","0473","ORIGINAL","1","2","1","21","1","1","28","1","controlador/productos/img/default.png","42000.00","57000.00","ACTIVO","2024-06-16 13:20:29","1");
INSERT INTO producto VALUES("482","0474","CARRIEL CAT MEDIANO ORIGINAL","MEDIANO","0474","ORIGINAL","1","2","1","21","1","1","28","1","controlador/productos/img/default.png","50000.00","68000.00","ACTIVO","2024-06-06 16:46:12","1");
INSERT INTO producto VALUES("483","0475","RIÑONERA MARQUILLA PEQUEÑA","RIÑONERA","0475","PEQUEÑA","1","2","2","21","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-06 16:47:19","1");
INSERT INTO producto VALUES("484","0476","MALETA ESTAMPADA GRANDE","GRANDE","0476","ESTAMPADA","1","2","1","21","1","1","28","1","controlador/productos/img/default.png","120000.00","155000.00","ACTIVO","2024-06-06 16:48:13","1");
INSERT INTO producto VALUES("485","0477","MALETA AMERICANA PEQUEÑA","PEQUEÑA","0477","AMERICANA","1","2","0","21","1","1","28","1","controlador/productos/img/default.png","100000.00","130000.00","ACTIVO","2024-06-19 16:52:44","1");
INSERT INTO producto VALUES("486","0478","MALETA ECONOMICA PEQUEÑA","PEQUEÑA","0478","ECONOMICA","1","2","1","21","1","1","28","1","controlador/productos/img/default.png","85000.00","110000.00","ACTIVO","2024-06-06 16:51:35","1");
INSERT INTO producto VALUES("487","0479","TAPETE PEQUEÑO","PEQUEÑO","0479","ECONOMICO","1","2","12","14","1","1","28","1","controlador/productos/img/default.png","6000.00","9500.00","ACTIVO","2024-06-06 16:52:53","1");
INSERT INTO producto VALUES("488","0480","PELLON PARA MOTO","PARA MOTO","0480","PELLON","1","2","3","14","1","1","28","1","controlador/productos/img/default.png","15000.00","20000.00","ACTIVO","2024-06-06 16:53:59","1");
INSERT INTO producto VALUES("489","0481","CHANCLA PANAN","ROJA","0481","CAUCHO","1","2","24","5","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-14 10:10:32","1");
INSERT INTO producto VALUES("490","0482","CHANCLA SUPERBUENA DAMA","DAMA","0482","INYECTADA","1","5","27","5","1","1","28","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-17 16:13:03","1");
INSERT INTO producto VALUES("491","0483","CHANCLA SUPERBUENA HOMBRE","HOMBRE","0483","INYECTADA","1","5","10","5","1","1","28","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-06 16:57:53","1");
INSERT INTO producto VALUES("492","0484","CHANCLA MASHMELLO ADULTO","ADULTO","0484","MASHMELLO","1","5","21","5","1","1","28","1","controlador/productos/img/default.png","16000.00","24000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("493","0485","CHANCLA CANOA ADULTO","ADULTO","0485","INYECTADA","1","5","20","5","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-14 11:54:55","1");
INSERT INTO producto VALUES("494","0486","CHANCLA CANOA NIÑO","NIÑO","0486","INYECTADA","1","2","7","5","1","1","28","1","controlador/productos/img/default.png","14000.00","18000.00","ACTIVO","2024-06-06 17:02:56","1");
INSERT INTO producto VALUES("495","0487","CHANCLA IPANEMA","3 PULLAS","0487","BOTONES","1","5","14","5","1","1","28","1","controlador/productos/img/default.png","11000.00","15999.00","ACTIVO","2024-06-19 16:52:44","1");
INSERT INTO producto VALUES("496","0488","CHANCLA SEÑORIAL CAPELLADA","CAPELLADA","0488","SEÑORIAL","1","2","4","5","1","1","28","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-06 17:06:48","1");
INSERT INTO producto VALUES("497","0489","ZAPATO INYECTADO ADULTO","ADULTO","0489","INYECTADO","1","2","17","5","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-06 17:07:41","1");
INSERT INTO producto VALUES("498","0490","ZAPATO INYECTADO NIÑO","NIÑO","0490","INYECTADO","1","5","28","5","1","1","28","1","controlador/productos/img/default.png","8000.00","13500.00","ACTIVO","2024-06-06 17:08:39","1");
INSERT INTO producto VALUES("499","0491","SAPO HOMBRE CAMUFLADO","HOMBRE","0491","CAMUFLADO","1","2","6","5","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("500","0492","SAPO HOMBRE ","HOMBRE","0492","LISO","1","5","18","5","1","1","28","1","controlador/productos/img/default.png","9000.00","16000.00","ACTIVO","2024-06-22 09:46:04","1");
INSERT INTO producto VALUES("501","0493","SAPO JUVENIL","JUVENIL","0493","LISO","1","5","19","5","1","1","28","1","controlador/productos/img/default.png","8000.00","16000.00","ACTIVO","2024-06-21 11:37:13","1");
INSERT INTO producto VALUES("502","0494","SAPO DAMA","DAMA","0494","LISO","1","5","34","5","1","1","28","1","controlador/productos/img/default.png","8000.00","15000.00","ACTIVO","2024-06-06 17:12:40","1");
INSERT INTO producto VALUES("503","0495","SAPO NIÑO","NIÑO","0495","LISO","1","5","26","5","1","1","28","1","controlador/productos/img/default.png","7000.00","12000.00","ACTIVO","2024-06-17 16:14:34","1");
INSERT INTO producto VALUES("504","0496","CHANCLA EVACOL CAPELLADA JUVENIL","JUVENIL","0496","CAPELLADA","1","5","27","5","1","1","28","1","controlador/productos/img/default.png","7000.00","12000.00","ACTIVO","2024-06-19 09:19:07","1");
INSERT INTO producto VALUES("505","0497","CHANCLA EVACOL CAPELLADA HOMBRE","HOMBRE","0497","CAPELLADA","1","5","6","5","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-19 13:43:34","1");
INSERT INTO producto VALUES("506","0498","CHANCLA 3 LINIEAS HOMBRE","HOMBRE","0498","3 LINEAS","1","5","19","5","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-20 16:10:29","1");
INSERT INTO producto VALUES("507","0499","ZAPATO SEÑORIAL ECONOMICO","SEÑORIAL","0499","ECONOMICO","1","2","7","49","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-06 17:18:25","1");
INSERT INTO producto VALUES("508","0500","CHANCLA SOLIMAR DAMA XL","CHANCLA SOLIMAR DAMA XL","0500","NEGRA","1","2","8","57","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-06 17:21:20","1");
INSERT INTO producto VALUES("509","0501","CHANCLA SOLIMAR DAMA L","CHANCLA SOLIMAR DAMA L","0501","NEGRA","1","2","0","57","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-17 17:33:25","1");
INSERT INTO producto VALUES("510","0502","CHANCLA SOLIMAR DAMA M","CHANCLA SOLIMAR DAMA M","0502","NEGRA","1","2","0","57","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-11 17:41:38","1");
INSERT INTO producto VALUES("511","0503","CHANCLA SOLIMAR DAMA S","CHANCLA SOLIMAR DAMA S","0503","NEGRA","1","2","4","57","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-06 17:23:14","1");
INSERT INTO producto VALUES("512","0504","CHANCLA SOLIMAR DAMA XS","CHANCLA SOLIMAR DAMA XS","0504","NEGRA","1","2","6","57","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-06 17:23:49","1");
INSERT INTO producto VALUES("513","0505","CHANCLA SOLIMAR HOMBRE XXL","CHANCLA SOLIMAR HOMBRE XXL","0505","NEGRA","1","2","4","56","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("514","0506","CHANCLA SOLIMAR HOMBRE XL","CHANCLA SOLIMAR HOMBRE XL","0506","NEGRA","1","2","3","56","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-19 10:21:38","1");
INSERT INTO producto VALUES("515","0507","CHANCLA SOLIMAR HOMBRE L","CHANCLA SOLIMAR HOMBRE L","0507","NEGRA","1","2","6","56","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("516","0508","CHANCLA SOLIMAR HOMBRE M","CHANCLA SOLIMAR HOMBRE M","0508","NEGRA","1","2","0","56","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-06 17:26:18","1");
INSERT INTO producto VALUES("517","0509","CHANCLA SOLIMAR HOMBRE S","CHANCLA SOLIMAR HOMBRE S","0509","NEGRA","1","2","0","56","1","1","34","1","controlador/productos/img/default.png","34500.00","40000.00","ACTIVO","2024-06-06 17:26:41","1");
INSERT INTO producto VALUES("518","0510","CHANCLA SANDA DAMA","TRANSPARENTE","0510","DAMA","1","2","12","5","1","1","28","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-06 17:28:16","1");
INSERT INTO producto VALUES("519","0511","ZANDALIA CAPELLADA HOMBRE","HOMBRE","0511","CAPELLADA","1","2","3","5","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-06 17:29:17","1");
INSERT INTO producto VALUES("520","0512","ZANDALIA 3 PULLAS HOMBRE","3 PULLAS","0512","HOMBRE","1","2","1","5","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-06 17:29:54","1");
INSERT INTO producto VALUES("521","0513","ABARCA TL 18-30","3 PULLAS","0513","CUERO","1","2","6","5","1","1","28","1","controlador/productos/img/default.png","9000.00","13500.00","ACTIVO","2024-06-06 17:31:16","1");
INSERT INTO producto VALUES("522","0514","ABARCA TL 31-40","3 PULLAS","0514","CUERO","1","5","34","5","1","1","28","1","controlador/productos/img/default.png","11000.00","17000.00","ACTIVO","2024-06-06 17:32:04","1");
INSERT INTO producto VALUES("523","0515","CHANCLA RIDER HOMBRE","3 PULLAS","0515","HOMBRE","1","2","12","5","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-06 17:33:15","1");
INSERT INTO producto VALUES("524","0516","CHANCLA EVACOL CAMUFLADA","3 PULLAS","0516","BOTON","1","2","12","5","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-06 17:40:33","1");
INSERT INTO producto VALUES("525","0517","CHANCLA HAVAIANA HOMBRE","3 PULLAS","0517","HOMBRE","1","2","5","5","1","1","28","1","controlador/productos/img/default.png","10000.00","15000.00","ACTIVO","2024-06-06 17:43:10","1");
INSERT INTO producto VALUES("526","0518","CHANCLA IPANEMA HOMBRE","3 PULLAS","0518","HOMBRE","1","2","2","5","1","1","28","1","controlador/productos/img/default.png","15000.00","20000.00","ACTIVO","2024-06-06 17:44:32","1");
INSERT INTO producto VALUES("527","0519","CHANCLA EVACOL 3 PULLAS BOTON","3 PULLAS","0519","BOTON","1","2","2","5","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-06 17:46:25","1");
INSERT INTO producto VALUES("528","0520","CHANCLA IMITACION SOLIMAR","IMITACION","0520","ECONIMICA","1","2","4","5","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-07 16:25:09","1");
INSERT INTO producto VALUES("529","0521","CHANCLA SANDA HOMBRE 3 PULLAS","3 PULLAS","0521","HOMBRE","1","2","5","5","1","1","28","1","controlador/productos/img/default.png","10000.00","15000.00","ACTIVO","2024-06-06 17:50:30","1");
INSERT INTO producto VALUES("530","0522","CHANCLA WIDZ 3 PULLAS","3 PULLAS","0522","ECONOMICA","1","2","2","5","1","1","28","1","controlador/productos/img/default.png","7000.00","12000.00","ACTIVO","2024-06-06 17:52:13","1");
INSERT INTO producto VALUES("531","0523","CHANCLA WIDZ CAPELLADA","CAPELLADA","0523","ECONOMICA","1","2","2","5","1","1","28","1","controlador/productos/img/default.png","7000.00","12000.00","ACTIVO","2024-06-06 17:54:25","1");
INSERT INTO producto VALUES("532","0524","CHANCLA EVACOL INYECTADA 3 PULLAS","3 PULLAS","0524","INYECTADA","1","2","3","5","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-06 17:55:41","1");
INSERT INTO producto VALUES("533","0525","carcaza del motor negra alteza","repuesto","0525","1877","1","2","5","7","1","1","23","1","controlador/productos/img/default.png","4990.00","7500.00","ACTIVO","2024-06-17 17:56:41","1");
INSERT INTO producto VALUES("534","0526","carcza del motor trasera blanca","repuesto","0526","18BL","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","4990.00","7493.00","ACTIVO","2024-06-07 13:12:50","1");
INSERT INTO producto VALUES("535","0527","tapa del motor frontal blanca","repuesto","0527","1877","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","831.00","4500.00","ACTIVO","2024-06-07 13:13:14","1");
INSERT INTO producto VALUES("536","0528","tapa de motor frontal negra","repuesto","0528","18 BL","1","","6","7","1","1","23","1","controlador/productos/img/default.png","831.00","4500.00","ACTIVO","2024-06-07 13:13:30","1");
INSERT INTO producto VALUES("540","0529","helise cuatro aspas alteza","para ventilador","0529","1877","1","2","10","7","1","1","23","1","controlador/productos/img/default.png","14990.00","19500.00","ACTIVO","2024-06-07 12:09:01","1");
INSERT INTO producto VALUES("541","0530","hlice tiburon  abanico 16 pulgadas","ventilador de 16 pulgadas","0530","1651","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","9990.00","16500.00","ACTIVO","2024-06-07 12:19:46","1");
INSERT INTO producto VALUES("542","0531","malla trsera  metalica blanca","trasera","0531","1877","1","1","3","7","1","1","23","1","controlador/productos/img/default.png","17415.00","23500.00","ACTIVO","2024-06-07 12:27:09","1");
INSERT INTO producto VALUES("543","0532","malla delantera metalica alteza","delantera","0532","1877","1","1","3","7","1","1","23","1","controlador/productos/img/default.png","17415.00","23500.00","ACTIVO","2024-06-07 13:14:12","1");
INSERT INTO producto VALUES("544","0533","malla delantera plastica negra","negra","0533","18 BL","1","1","3","7","1","1","23","1","controlador/productos/img/default.png","9991.00","16500.00","ACTIVO","2024-06-07 13:14:54","1");
INSERT INTO producto VALUES("545","0534","MALLA TRSERA PLASTICA ALTEZA","REPUESTO ALTEZA","0534","18&quot;","1","1","3","7","1","1","23","1","controlador/productos/img/default.png","9988.00","16500.00","ACTIVO","2024-06-07 13:18:56","1");
INSERT INTO producto VALUES("546","0535","ROSCA DE MALLA ALTEZA","REPUESTO ALTEZA","0535","TUERCA PLASTICA","1","3","12","7","1","1","23","1","controlador/productos/img/default.png","1063.00","2500.00","ACTIVO","2024-06-07 13:21:00","1");
INSERT INTO producto VALUES("547","0536","ROSCA DE HELICE ALTEZA","REPUESTO ALTEZA","0536","PLASTICA","1","3","12","7","1","1","23","1","controlador/productos/img/default.png","988.00","2499.00","ACTIVO","2024-06-07 13:22:15","1");
INSERT INTO producto VALUES("548","0537","ROSCA HELICE BLANCA ALTEZA","REPUESTO ALTEZA","0537","BLANCA","1","3","12","7","1","1","23","1","controlador/productos/img/default.png","988.00","2500.00","ACTIVO","2024-06-07 13:23:25","1");
INSERT INTO producto VALUES("549","0538","CUELLO PEDESTAL BASICO NEGRO","REPUESTO ALTEZA","0538","NEGRO","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","2970.00","6500.00","ACTIVO","2024-06-07 13:25:52","1");
INSERT INTO producto VALUES("550","0539","CUELLO PEDESTAL BLANCO ALTEZA","REPUESTO ALTEZA","0539","BLANCO","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","2970.00","6500.00","ACTIVO","2024-06-07 13:27:17","1");
INSERT INTO producto VALUES("551","0540","CUELLO PERED BLANCO ALTEZA","REPUESTO ALTEZA","0540","BLANCO","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","4187.00","8500.00","ACTIVO","2024-06-07 13:29:12","1");
INSERT INTO producto VALUES("552","0541","CUELLO PARED NEGRO ALTEZA","REPUESTO ALTEZA","0541","NEGRO","1","2","6","7","1","1","23","1","controlador/productos/img/default.png","4599.00","8500.00","ACTIVO","2024-06-07 13:30:09","1");
INSERT INTO producto VALUES("553","0542","JARRA DE CAFETERA ALTEZA GRIS ","REPUESTO","0542","VIDRIO","1","1","2","53","1","1","23","1","controlador/productos/img/default.png","17450.00","25500.00","ACTIVO","2024-06-07 13:35:11","1");
INSERT INTO producto VALUES("554","0543","JARRA DE CAFETERA ALTEZA NEGRA","REPUESTO","0543","VIDRIO","1","1","2","53","1","1","23","1","controlador/productos/img/default.png","17450.00","25500.00","ACTIVO","2024-06-07 13:36:04","1");
INSERT INTO producto VALUES("555","0544","HAMACA SOMBRERO","HAMACA  NAILON","0544","68","1","3","6","37","1","1","28","1","controlador/productos/img/default.png","52000.00","68000.00","ACTIVO","2024-06-17 18:05:17","1");
INSERT INTO producto VALUES("556","0545","HAMACA UNICOLOR","HAMACA  HILO","0545","65","1","3","12","37","1","1","28","1","controlador/productos/img/default.png","50000.00","65000.00","ACTIVO","2024-06-07 13:40:15","1");
INSERT INTO producto VALUES("557","0546","HAMACA VALLENATA","HAMACA  HILO","0546","52","1","3","21","37","1","1","28","1","controlador/productos/img/default.png","43000.00","52000.00","ACTIVO","2024-06-07 13:41:10","1");
INSERT INTO producto VALUES("558","0547","HAMACA  JUMBO VALLENATA","HAMACA  HILO","0547","59","1","3","16","37","1","1","28","1","controlador/productos/img/default.png","46000.00","59000.00","ACTIVO","2024-06-07 13:42:00","1");
INSERT INTO producto VALUES("559","0548","HAMACA SABANERA","HAMACA  NAILON","0548","24","1","3","23","37","1","1","28","1","controlador/productos/img/default.png","60000.00","75000.00","ACTIVO","2024-06-17 17:51:12","1");
INSERT INTO producto VALUES("560","0549","HAMACA GUAJIRA ","HAMACA  NAILON","0549","98","1","3","11","37","1","1","28","1","controlador/productos/img/default.png","78000.00","98000.00","ACTIVO","2024-06-19 09:19:07","1");
INSERT INTO producto VALUES("561","0560","Ventilador pato pequeño ","Pequeño","0560","Pato","1","2","4","4","1","1","28","1","controlador/productos/img/default.png","39000.00","50000.00","ACTIVO","2024-06-22 13:45:56","1");
INSERT INTO producto VALUES("574","0561","Baldes con escurridor colplas","Con escurridor","0561","Colplas","1","2","16","36","1","1","26","1","controlador/productos/img/default.png","18000.00","24000.00","ACTIVO","2024-06-08 10:07:09","1");
INSERT INTO producto VALUES("575","0566","Cama doble pesada ","Doble","0566","Pesada","1","2","10","12","1","1","28","1","controlador/productos/img/default.png","470000.00","650000.00","ACTIVO","2024-06-08 10:06:26","1");
INSERT INTO producto VALUES("576","0567","CAMA SEMIPESADA DOBLE","Doble","0567","SEMIPESADA","1","2","4","12","1","1","28","1","controlador/productos/img/default.png","300000.00","480000.00","ACTIVO","2024-06-08 10:09:56","1");
INSERT INTO producto VALUES("577","0568","CAMA DOBLE SENCILLA","Doble","0568","SENCILLA","1","2","2","12","1","1","28","1","controlador/productos/img/default.png","200000.00","350000.00","ACTIVO","2024-06-08 10:11:33","1");
INSERT INTO producto VALUES("578","0569","CAMA SENCILLA DE UN CUERPO","UN CUERPO ","0569","SENCILLA","1","2","8","12","1","1","28","1","controlador/productos/img/default.png","150000.00","290000.00","ACTIVO","2024-06-08 10:13:04","1");
INSERT INTO producto VALUES("579","0570","CAMA UN CUERPO PESADA","UN CUERPO ","0570","PESADA","1","2","1","12","1","1","28","1","controlador/productos/img/default.png","300000.00","450000.00","ACTIVO","2024-06-08 10:14:10","1");
INSERT INTO producto VALUES("580","0571","CAMA ESTAMPADA SPIDERMAN","SPIDERMAN","0571","ESTAMPADA","1","2","1","12","1","1","28","1","controlador/productos/img/default.png","200000.00","300000.00","ACTIVO","2024-06-08 10:15:23","1");
INSERT INTO producto VALUES("581","0574","VENTILADOR LOCO KALLEY","KALLEY","0574","LOCO","1","2","4","4","1","1","36","1","controlador/productos/img/default.png","159000.00","185000.00","ACTIVO","2024-06-08 10:30:13","1");
INSERT INTO producto VALUES("582","0575","PRACTIMUEBLE X3 PUESTOS COLPLAS","COLPLAS","0575","X3 PUESTOS","1","2","6","4","1","1","36","1","controlador/productos/img/default.png","110000.00","135000.00","ACTIVO","2024-06-08 10:32:58","1");
INSERT INTO producto VALUES("583","0576","PRACTIMUEBLE X5 PUESTOS COLPLAS","COLPLAS","0576","X5 PUESTOS","1","2","2","58","1","1","26","1","controlador/productos/img/default.png","167000.00","198000.00","ACTIVO","2024-06-09 11:08:03","1");
INSERT INTO producto VALUES("584","0577","LAVADORA HACEB 7 KILOS","HACEB","0577","7 KILOS","1","2","5","58","1","1","7","1","controlador/productos/img/default.png","730000.00","820000.00","ACTIVO","2024-06-08 10:48:36","1");
INSERT INTO producto VALUES("585","0578","LAVADORA CHALLENGER 7 KILOS","CHALLENGER","0578","7 KILOS","1","2","1","58","1","1","28","1","controlador/productos/img/default.png","620000.00","700000.00","ACTIVO","2024-06-08 10:51:21","1");
INSERT INTO producto VALUES("586","0579","LAVADORA VISIVO 7 KILOS","VISIVO","0579","7 KILOS","1","2","5","58","1","1","38","1","controlador/productos/img/default.png","620000.00","700000.00","ACTIVO","2024-06-08 10:55:17","1");
INSERT INTO producto VALUES("587","0580","Lavadora mabe 11 kilos","MABE","0580","11  kilos","1","2","5","58","1","1","37","1","controlador/productos/img/default.png","740000.00","950000.00","ACTIVO","2024-06-09 11:25:23","1");
INSERT INTO producto VALUES("588","0581","LAVADORA MABE 13 KILOS","MABE","0581","13 KILOS","1","2","1","58","1","1","37","1","controlador/productos/img/default.png","900000.00","1100000.00","ACTIVO","2024-06-09 11:18:03","1");
INSERT INTO producto VALUES("589","0582","LAVADORA LYNX 6 KILOS","LYNX","0582","6 KILOS","1","2","1","58","1","1","17","1","controlador/productos/img/default.png","610000.00","680000.00","ACTIVO","2024-06-08 11:08:53","1");
INSERT INTO producto VALUES("590","0590","PLATERA DE PARED GRANDE","DE PARED","0590","GRANDE","1","2","6","40","1","1","28","1","controlador/productos/img/default.png","19000.00","28000.00","ACTIVO","2024-06-08 11:27:05","1");
INSERT INTO producto VALUES("591","0591","PLATERA DE PARED PEQUEÑA","DE PARED","0591","PEQUEÑA","1","2","5","40","1","1","28","1","controlador/productos/img/default.png","16000.00","25000.00","ACTIVO","2024-06-08 11:31:01","1");
INSERT INTO producto VALUES("592","0592","PORTA VAJILLA TAPA PLANA","PORTA VAJILLA","0592","TAPA PLANA","1","2","6","40","1","1","28","1","controlador/productos/img/default.png","43000.00","55000.00","ACTIVO","2024-06-08 11:33:03","1");
INSERT INTO producto VALUES("593","0562","ROLLO DE MALLA PARA POLLO","PARA POLLO","0562","DE MALLA","1","2","3","22","1","1","28","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-08 15:07:09","1");
INSERT INTO producto VALUES("594","0563","MALLA PARA POLLO (MENUDIADA)","PARA POLLO","0563","MENUDIADA","1","2","30MT","22","3","1","28","1","controlador/productos/img/default.png","1300.00","1700.00","ACTIVO","2024-06-08 15:09:35","1");
INSERT INTO producto VALUES("595","0564","ROLLO DE TELON TIPO SACO VERDE","TIPO SACO","0564","VERDE","1","2","1","22","1","1","28","1","controlador/productos/img/default.png","90000.00","120000.00","ACTIVO","2024-06-08 15:11:16","1");
INSERT INTO producto VALUES("596","0565","ROLLO TELON TIPO SACO (MENUDIADO)","TIPO SACO","0565","MENUDIADO","1","2","30MT","22","3","1","28","1","controlador/productos/img/default.png","2800.00","3500.00","ACTIVO","2024-06-08 15:13:11","1");
INSERT INTO producto VALUES("597","0572","TUBO DE CORTINA METALICO (MENUDIADO)","DE CORTINA","0572","METALICO","1","2","90MT","22","3","1","28","1","controlador/productos/img/default.png","2800.00","3500.00","ACTIVO","2024-06-08 15:14:36","1");
INSERT INTO producto VALUES("598","0583","PORTA COMIDA ECONOMICO ","PORTA COMIDA","0583","ECONOMICO","1","10","173","60","1","1","28","1","controlador/productos/img/default.png","2300.00","3000.00","ACTIVO","2024-06-08 15:20:12","1");
INSERT INTO producto VALUES("599","0584","CUBIERTERO DE MESA MUNDIPLAS","MUNDIPLAS","0584","DE MESA","1","2","12","60","1","1","28","1","controlador/productos/img/default.png","7500.00","11000.00","ACTIVO","2024-06-08 15:21:14","1");
INSERT INTO producto VALUES("600","0585","VASO DE NOCHE REY GRANDE","REY","0585","GRANDE","1","10","70","64","1","1","28","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-22 11:59:31","1");
INSERT INTO producto VALUES("601","0586","REGADERA PEQUEÑA","REGADERA","0586","PEQUEÑA","1","2","9","60","1","1","28","1","controlador/productos/img/default.png","6000.00","9500.00","ACTIVO","2024-06-08 15:23:09","1");
INSERT INTO producto VALUES("602","0587","EXPRIMIDOR TRAPERO REDONDO","REDONDO","0587","ECONOMICO","1","5","28","65","1","1","28","1","controlador/productos/img/default.png","3500.00","5500.00","ACTIVO","2024-06-22 10:11:52","1");
INSERT INTO producto VALUES("603","0588","MANGUERA PARA AGUA (ROJA)","PARA AGUA","0588","ROJA","1","2","90MT","60","3","1","28","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-08 15:25:07","1");
INSERT INTO producto VALUES("604","0589","MANGUERA PARA AGUA (VERDE)","PARA AGUA","0589","VERDE","1","2","90","60","3","1","28","1","controlador/productos/img/default.png","1200.00","1500.00","ACTIVO","2024-06-09 12:39:20","1");
INSERT INTO producto VALUES("605","0593","MALLA TRASERA N/18&quot; SAMURAY","18&quot;","0593","NEGRA","1","2","14","7","1","1","1","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-20 16:10:29","1");
INSERT INTO producto VALUES("606","0594","MALLA DELANTERA BLA/16&quot; SAMURAY","16&quot;","0594","BLANCA ","1","2","25","7","1","1","1","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-11 13:30:51","1");
INSERT INTO producto VALUES("607","0595","MALLA DELANTERA N/18&quot; SAMURAY","18&quot;","0595","NEGRA","1","2","4","7","1","1","1","1","controlador/productos/img/default.png","18000.00","25000.00","ACTIVO","2024-06-20 16:10:29","1");
INSERT INTO producto VALUES("608","0596","MALLA DELANTERA BLA/18&quot; SAMURAY","18&quot;","0596","BLANCA","1","2","12","7","1","1","1","1","controlador/productos/img/default.png","18000.00","25000.00","ACTIVO","2024-06-15 16:11:04","1");
INSERT INTO producto VALUES("609","0597","BASE PARED TIPO ZAPATO SAMURAY","TIPO ZAPATO","0597","PARA PARED","1","2","18","7","1","1","1","1","controlador/productos/img/default.png","18000.00","22000.00","ACTIVO","2024-06-19 10:33:11","1");
INSERT INTO producto VALUES("610","0598","HELICE SAMURAY 4 ASPAS","SAMURAY","0598","4 ASPAS","1","2","17","7","1","1","1","1","controlador/productos/img/default.png","9000.00","13500.00","ACTIVO","2024-06-22 13:45:57","1");
INSERT INTO producto VALUES("611","0599","BASE PEDESTAL SAMURAY TURBOSILENCIO","PEDESTAL","0599","TURBOSILENCIO","1","2","7","7","1","1","1","1","controlador/productos/img/default.png","27000.00","35000.00","ACTIVO","2024-06-08 15:37:24","1");
INSERT INTO producto VALUES("612","0600","MALLA TRASERA BLA/16&quot; SAMURAY","16&quot;","0600","BLANCA","1","2","8","7","1","1","1","1","controlador/productos/img/default.png","10000.00","15000.00","ACTIVO","2024-06-11 13:30:51","1");
INSERT INTO producto VALUES("613","0601","GARRAFA IMUSA 2 LITROS","2 LITROS","0601","IMUSA","1","2","8","60","1","1","6","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-08 15:44:36","1");
INSERT INTO producto VALUES("614","0602","GARRAFA IMUSA 4 LITROS ","4 LITROS","0602","IMUSA","1","2","9","60","1","1","6","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-08 15:47:10","1");
INSERT INTO producto VALUES("615","0603","GARRAFA IMUSA 8 LITROS ","8 LITROS","0603","IMUSA","1","2","16","60","1","1","6","1","controlador/productos/img/default.png","19000.00","24500.00","ACTIVO","2024-06-08 15:50:05","1");
INSERT INTO producto VALUES("616","0604","CANTINA ROYAL 7 LITROS","7 LITROS","0604","ROYAL","1","2","5","60","1","1","6","1","controlador/productos/img/default.png","12500.00","17500.00","ACTIVO","2024-06-08 15:51:34","1");
INSERT INTO producto VALUES("617","0605","CANTINA ROYAL 5 LITROS","ROYAL","0605","5 LITROS","1","2","3","60","1","1","39","1","controlador/productos/img/default.png","10400.00","13500.00","ACTIVO","2024-06-08 15:57:51","1");
INSERT INTO producto VALUES("618","0607","CANASTILLA VEJUCO PEQUEÑA","PEQUEÑA","0607","ECONOMICA","1","2","12","60","1","1","28","1","controlador/productos/img/default.png","5000.00","8000.00","ACTIVO","2024-06-08 16:00:36","1");
INSERT INTO producto VALUES("619","0608","CANASTILLA CAPERUSITA VEJUCO","CAPERUSITA","0608","VEJUCO","1","2","9","60","1","1","28","1","controlador/productos/img/default.png","15000.00","20000.00","ACTIVO","2024-06-08 16:01:38","1");
INSERT INTO producto VALUES("620","0609","CANASTILLA VEJUCO MEDIANA","MEDIANA","0609","VEJUCO","1","2","5","60","1","1","28","1","controlador/productos/img/default.png","10000.00","15000.00","ACTIVO","2024-06-08 16:02:29","1");
INSERT INTO producto VALUES("621","0610","CANASTILLA MINI CAPERUSITA","MINI","0610","CAPERUSITA","1","2","8","60","1","1","28","1","controlador/productos/img/default.png","5000.00","8000.00","ACTIVO","2024-06-08 16:03:09","1");
INSERT INTO producto VALUES("622","0611","TRISICLO COLPLAS NIÑO","NIÑO","0611","COLPLAS","1","2","4","20","1","1","28","1","controlador/productos/img/default.png","70000.00","85000.00","ACTIVO","2024-06-08 16:05:56","1");
INSERT INTO producto VALUES("623","0612","TRISICLO COLPLAS NIÑA","NIÑA","0612","COLPLAS","1","2","0","20","1","1","26","1","controlador/productos/img/default.png","70000.00","85000.00","ACTIVO","2024-06-08 16:05:09","1");
INSERT INTO producto VALUES("624","0613","RETROEXCABADORA COLPLAS","COLPLAS","0613","DIVERSION","1","2","2","20","1","1","26","1","controlador/productos/img/default.png","72000.00","95000.00","ACTIVO","2024-06-08 16:07:35","1");
INSERT INTO producto VALUES("625","0614","CARRO MONTABLE NIÑA","COLPLAS","0614","MONTABLE","1","2","2","20","1","1","26","1","controlador/productos/img/default.png","70000.00","85000.00","ACTIVO","2024-06-08 16:08:17","1");
INSERT INTO producto VALUES("626","0615","HELICE 6 ASPAS SAMURAY","SAMURAY","0615","6 ASPAS","1","2","7","7","1","1","1","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-15 14:06:40","1");
INSERT INTO producto VALUES("627","0616","VENTILADOR PARED HOME ELEMENTS 18&quot;","18&quot;","0616","PARA PARED","1","2","5","4","1","1","1","1","controlador/productos/img/default.png","160000.00","185000.00","ACTIVO","2024-06-08 16:12:34","1");
INSERT INTO producto VALUES("628","0618","VENTILADOR PARED HOME ELEMENTS 16&quot;","16&quot;","0618","PARA PARED","1","2","8","4","1","1","1","1","controlador/productos/img/default.png","155000.00","178000.00","ACTIVO","2024-06-08 16:14:06","1");
INSERT INTO producto VALUES("629","0617","VENTILADOR SILENCE FORCE CONTROL REMOTO","CONTROL REMOTO","0617","SILENCE FORCE","1","2","4","4","1","1","1","1","controlador/productos/img/default.png","280000.00","350000.00","ACTIVO","2024-06-08 16:15:52","1");
INSERT INTO producto VALUES("630","0619","VENTILADOR SAMURAY CONFORT","SAMURAY","0619","CONFORT","1","2","13","4","1","1","1","1","controlador/productos/img/default.png","190000.00","225000.00","ACTIVO","2024-06-08 16:16:54","1");
INSERT INTO producto VALUES("631","0620","VENTILADOR PEDESTAL FORCE PLUS SAMURAY","SAMURAY","0620","FORCE PLUS","1","2","13","4","1","1","1","1","controlador/productos/img/default.png","220000.00","260000.00","ACTIVO","2024-06-12 17:34:32","1");
INSERT INTO producto VALUES("632","0621","VENTILADOR PARED BLA/18&quot; SILENCE FORCE","18&quot; SAMURAY","0621","SILENCE FORCE","1","2","10","4","1","1","1","1","controlador/productos/img/default.png","175000.00","210000.00","ACTIVO","2024-06-08 16:19:41","1");
INSERT INTO producto VALUES("633","0622","VENTILADOR PARED N/18&quot; SILENCE FORCE","18&quot; SAMURAY","0622","SILENCE FORCE","1","2","3","4","1","1","1","1","controlador/productos/img/default.png","175000.00","210000.00","ACTIVO","2024-06-08 16:20:52","1");
INSERT INTO producto VALUES("639","0623","VENTILADOR PARED N/18&quot; TURBOPOWER","18&quot; SAMURAY","0623","TURBOPOWER","1","2","3","4","1","1","1","1","controlador/productos/img/default.png","147000.00","178000.00","ACTIVO","2024-06-16 10:49:09","1");
INSERT INTO producto VALUES("640","0624","VENTILADOR PARED BLA/18&quot; TURBOPOWER","18&quot; SAMURAY","0624","TURBOPOWER","1","2","0","4","1","1","1","1","controlador/productos/img/default.png","147000.00","178000.00","ACTIVO","2024-06-08 16:31:47","1");
INSERT INTO producto VALUES("641","0625","VENTILADOR MALLA METALICA SAMURAY","18&quot; SAMURAY","0625","MALLA METALICA","1","2","9","4","1","1","1","1","controlador/productos/img/default.png","200000.00","235000.00","ACTIVO","2024-06-08 16:35:43","1");
INSERT INTO producto VALUES("642","0626","VENTILADOR SAMURAY PEDESTAL TURBOPOWER","PEDESTAL SAMURAY","0626","TURBOPOWER","1","2","1","4","1","1","1","1","controlador/productos/img/default.png","200000.00","235000.00","ACTIVO","2024-06-08 16:36:59","1");
INSERT INTO producto VALUES("643","0627","ANTENA DIREC TV","TV","0627","ANTENA","1","2","3","60","1","1","28","1","controlador/productos/img/default.png","62000.00","85000.00","ACTIVO","2024-06-19 18:07:10","1");
INSERT INTO producto VALUES("644","0628","VASO LICUADORA DE VIDRIO IMUSA INFINITY FORE ","DE VIDRIO","0628","IMUSA","1","2","4","9","1","1","6","1","controlador/productos/img/default.png","30000.00","38000.00","ACTIVO","2024-06-15 14:06:40","1");
INSERT INTO producto VALUES("645","0629"," VASO LICUADORA DE VIDRO FACICLIP","DE VIDRIO","0629","FACICLIP","1","2","2","9","1","1","6","1","controlador/productos/img/default.png","30000.00","39000.00","ACTIVO","2024-06-18 17:43:29","1");
INSERT INTO producto VALUES("646","0630","VASO LICUADORA DE VIDRO IMUSA XL","DE VIDRIO","0630","XL","1","2","0","9","1","1","6","1","controlador/productos/img/default.png","47000.00","56000.00","ACTIVO","2024-06-17 16:37:21","1");
INSERT INTO producto VALUES("647","0631","VASO LICUADORA DE VIDRO UNIVERSAL REDONDO","DE VIDRIO","0631","REDONDO","1","2","3","9","1","1","6","1","controlador/productos/img/default.png","28000.00","35000.00","ACTIVO","2024-06-08 16:47:43","1");
INSERT INTO producto VALUES("648","0632","VASO LICUADORA DE VIDRO UNIVERSAL CUADRADO ","DE VIDRIO","0632","CUADRADO","1","2","4","9","1","1","6","1","controlador/productos/img/default.png","28000.00","35000.00","ACTIVO","2024-06-08 16:48:16","1");
INSERT INTO producto VALUES("649","0636","VASO LICUADORA DE VIDRO DUOMIX PRO","DE VIDRIO","0636","DUOMIX PRO","1","2","3","9","1","1","6","1","controlador/productos/img/default.png","20000.00","28000.00","ACTIVO","2024-06-08 16:49:19","1");
INSERT INTO producto VALUES("650","0634","VASO LICUADORA SAMURAY ORIGINAL","SAMURAY","0634","ORIGINAL","1","2","3","9","1","1","1","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-08 16:50:25","1");
INSERT INTO producto VALUES("651","0635","VASO LICUADORA SAMURAY IRROMPIBLE","SAMURAY","0635","IRROMPIBLE","1","2","1","9","1","1","1","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-19 18:08:59","1");
INSERT INTO producto VALUES("652","0633","VASO LICUADORA SAMURAY ECONOMICO","SAMURAY","0633","ECONOMICO","1","2","0","9","1","1","1","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-17 10:06:00","1");
INSERT INTO producto VALUES("653","0637","VASO LICUADORA OSTER ORIGINAL","OSTER","0637","ORIGINAL","1","2","5","9","1","1","15","1","controlador/productos/img/default.png","33000.00","42000.00","ACTIVO","2024-06-08 16:59:15","1");
INSERT INTO producto VALUES("654","0638","VASO LICUADORA OSTER ECONOMICO","OSTER","0638","ECONOMICO","1","2","11","9","1","1","15","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-08 17:00:13","1");
INSERT INTO producto VALUES("655","0639","VASO LICUADORA UNIVERSAL ECONOMICO","UNIVERSAL","0639","ECONOMICO","1","2","0","9","1","1","10","1","controlador/productos/img/default.png","5000.00","9500.00","ACTIVO","2024-06-15 14:06:41","1");
INSERT INTO producto VALUES("656","0640","EDREDON CAMA DOBLE CON CORTINA","CAMA DOBLE","0640","CON CORTINA","1","2","2","61","1","1","28","1","controlador/productos/img/default.png","85000.00","115000.00","ACTIVO","2024-06-08 17:05:03","1");
INSERT INTO producto VALUES("657","0641","EDREDON CAMA DOBLE","CAMA DOBLE","0641","EDREDON","1","2","2","61","1","1","28","1","controlador/productos/img/default.png","78000.00","98000.00","ACTIVO","2024-06-08 17:05:48","1");
INSERT INTO producto VALUES("658","0642","TOLDO CAMA DOBLE","CAMA DOBLE","0642","TOLDO","1","2","15","61","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("659","0643","TOLDO CAMA DOBLE ANTI A LUZ","CAMA DOBLE","0643","ANTI A LUZ","1","2","11","61","1","1","28","1","controlador/productos/img/default.png","28000.00","35000.00","ACTIVO","2024-06-13 16:15:41","1");
INSERT INTO producto VALUES("660","0644","COBIJA GRUESA CAMA DOBLE","CAMA DOBLE","0644","GRUESA","1","2","39","61","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-22 13:31:32","1");
INSERT INTO producto VALUES("661","0645","COBIJA GRUESA CAMA SENCILLA","SENCILLA","0645","GRUESA","1","2","1","61","1","1","28","1","controlador/productos/img/default.png","18000.00","25000.00","ACTIVO","2024-06-08 17:09:36","1");
INSERT INTO producto VALUES("662","0646","JUEGO DE SABANAS CAMA DOBLE","CAMA DOBLE","0646","JUEGO DE SABANAS","1","2","3","61","1","1","28","1","controlador/productos/img/default.png","30000.00","39000.00","ACTIVO","2024-06-08 17:10:40","1");
INSERT INTO producto VALUES("663","0647","JUEGO DE SABANAS CAMA SENCILLA ","SENCILLA","0647","JUEGO DE SABANAS","1","2","1","61","1","1","28","1","controlador/productos/img/default.png","25000.00","32000.00","ACTIVO","2024-06-08 17:11:34","1");
INSERT INTO producto VALUES("664","0648","JUEGO DE SABANAS CAMA SENCILLA LOGAN","SENCILLA","0648","LOGAN","1","2","4","61","1","1","28","1","controlador/productos/img/default.png","30000.00","39000.00","ACTIVO","2024-06-08 17:12:09","1");
INSERT INTO producto VALUES("665","0649","CORTINA PARA BAÑO ECONOMICA","PARA BAÑO","0649","ECONOMICA","1","2","18","61","1","1","28","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-08 17:12:55","1");
INSERT INTO producto VALUES("666","0650","CORTINA PARA BAÑO HOME G.O.H SIN GANCHO","SIN GANCHO","0650","PARA BAÑO","1","2","5","61","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-08 17:13:58","1");
INSERT INTO producto VALUES("667","0651","CORTINA PARA BAÑO HOME G.O.H CON GANCHO","CON GANCHO","0651","PARA BAÑO","1","2","6","61","1","1","28","1","controlador/productos/img/default.png","6000.00","9500.00","ACTIVO","2024-06-08 17:14:45","1");
INSERT INTO producto VALUES("668","0652","CORTINA PARA BAÑO 72*72","72*72","0652","PARA BAÑO","1","2","5","61","1","1","28","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-08 17:15:27","1");
INSERT INTO producto VALUES("669","0653","MANTEL ","PLASTICO","0653","DECORATIVO","1","2","5","61","1","1","28","1","controlador/productos/img/default.png","10000.00","17000.00","ACTIVO","2024-06-08 17:16:13","1");
INSERT INTO producto VALUES("670","0654","TOALLA COCINA","PLASTICO","0654","ESTAMPADA","1","2","13","61","1","1","28","1","controlador/productos/img/default.png","3000.00","3500.00","ACTIVO","2024-06-08 17:17:03","1");
INSERT INTO producto VALUES("671","0655","TOALLA VEKO GIMNASIO","VEKO","0655","GIMNASIO","1","2","22","61","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-18 12:12:00","1");
INSERT INTO producto VALUES("672","0656","PAÑOLETA","PEQUEÑA","0656","MULTICOLORES","1","10","68","61","1","1","28","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-08 17:18:48","1");
INSERT INTO producto VALUES("673","0657","MALLA TRASERA BLA/18&quot; SAMURAY","18&quot;","0657","TRASERA","1","2","0","7","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-21 12:47:42","1");
INSERT INTO producto VALUES("674","0658","MALLA TRASERA N/16&quot; SAMURAY","16&quot;","0658","TRASERA","1","2","1","7","1","1","1","1","controlador/productos/img/default.png","10000.00","15000.00","ACTIVO","2024-06-08 17:20:48","1");
INSERT INTO producto VALUES("675","0659","PROTECTOR DE COLCHON DOBLE","DOBLE","0659","PROTECTOR","1","2","3","61","1","1","28","1","controlador/productos/img/default.png","30000.00","39000.00","ACTIVO","2024-06-08 17:29:13","1");
INSERT INTO producto VALUES("676","0660","PROTECTOR DE COLCHON SENCILLO","SENCILLO","0660","PROTECTOR","1","2","1","61","1","1","28","1","controlador/productos/img/default.png","25000.00","32000.00","ACTIVO","2024-06-08 17:31:19","1");
INSERT INTO producto VALUES("677","0661","MALLA DELANTERA N/16&quot; SAMURAY","16&quot;","0661","DELANTERA","1","2","1","7","1","1","1","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-08 17:32:49","1");
INSERT INTO producto VALUES("678","0662","BASE SAMURAY DE VENTILADOR (MESA)","SAMURAY","0662"," BASE","1","2","5","7","1","1","1","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-08 17:35:43","1");
INSERT INTO producto VALUES("679","0663","HELICE SAMURAY 16&quot; 6 ASPAS","16&quot;","0663","6 ASPAS","1","2","4","7","1","1","1","1","controlador/productos/img/default.png","12000.00","16000.00","ACTIVO","2024-06-20 17:35:23","1");
INSERT INTO producto VALUES("680","0664","HELICE VENTILADOR SANYO ","SANYO","0664","REPUESTO","1","2","2","7","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-08 17:38:07","1");
INSERT INTO producto VALUES("681","0665","HELICE VENTILADOR DKASA/OLIMPO/HOME","DKASA/OLIMPO/HOME","0665","REPUESTO","1","2","0","7","1","1","28","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-12 13:56:43","1");
INSERT INTO producto VALUES("682","0666","HELICE VENTILADOR SAMURAY 3 ASPAS","SAMURAY","0666","3 ASPAS","1","2","0","7","1","1","1","1","controlador/productos/img/default.png","9000.00","13500.00","ACTIVO","2024-06-18 15:53:25","1");
INSERT INTO producto VALUES("683","0667","HELICE 8&quot; PICOLORO","8&quot;","0667","PICOLORO","1","2","2","7","1","1","28","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-08 17:41:03","1");
INSERT INTO producto VALUES("684","0668","HELICE 8&quot; UNIVERSAL ORIGINAL","8&quot;","0668","ORIGINAL","1","2","8","7","1","1","28","1","controlador/productos/img/default.png","18000.00","22000.00","ACTIVO","2024-06-08 17:42:20","1");
INSERT INTO producto VALUES("685","0669","CANTINA 3 LITROS ROYAL","3 LITROS","0669","ROYAL","1","2","1","60","1","1","39","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-08 17:43:21","1");
INSERT INTO producto VALUES("686","0670","REGADERA PEQUEÑA TROMPA ELEFANTE","PEQUEÑA","0670","TROMPA ELEFANTE","1","2","5","60","1","1","28","1","controlador/productos/img/default.png","11000.00","15000.00","ACTIVO","2024-06-08 17:44:17","1");
INSERT INTO producto VALUES("687","0671","REGADERA IMUSA GRANDE ","GRANDE","0671","REGADERA","1","2","7","60","1","1","6","1","controlador/productos/img/default.png","26000.00","32500.00","ACTIVO","2024-06-08 17:45:27","1");
INSERT INTO producto VALUES("688","0672","VENTILADOR PARED ALTEZA","ALTEZA","0672","DE PARED","1","2","3","4","1","1","28","1","controlador/productos/img/default.png","180000.00","210000.00","ACTIVO","2024-06-08 17:46:27","1");
INSERT INTO producto VALUES("689","0673","legumbrera 8 litros","tason cuadrado","0673","11955","1","2","30","34","1","1","9","1","controlador/productos/img/default.png","7318.00","11000.00","ACTIVO","2024-06-10 10:10:30","1");
INSERT INTO producto VALUES("690","0674","juego de bandeja con escurridor","escurridor imusa","0674","0212","1","1","6","34","1","1","6","1","controlador/productos/img/default.png","25093.00","330000.00","ACTIVO","2024-06-10 10:27:31","1");
INSERT INTO producto VALUES("691","0675","multiestante  para verdura","multiestante","0675","820","1","1","6","60","1","1","26","1","controlador/productos/img/default.png","7782.00","11000.00","ACTIVO","2024-06-10 10:46:26","1");
INSERT INTO producto VALUES("692","0676","balde 12 litros colplas man/metal","balde manija metalica","0676","247","1","4","40","36","1","1","26","1","controlador/productos/img/default.png","5946.00","8500.00","ACTIVO","2024-06-11 13:44:38","1");
INSERT INTO producto VALUES("693","0677","LEGUMBRERA 10 LITROS RIMO","PONCHERA RECTANGULAR","7707244886324","MULTICOLOR","1","5","22","34","1","1","9","1","controlador/productos/img/default.png","12800.00","18500.00","ACTIVO","2024-06-11 12:05:21","1");
INSERT INTO producto VALUES("694","0678"," BALDE 13 LITROS IMUSA","ORIGINAL ","0678","BLA/AZUL","1","3","18","36","1","1","6","1","controlador/productos/img/default.png","19796.00","25997.00","ACTIVO","2024-06-18 16:12:01","1");
INSERT INTO producto VALUES("695","0679","ESCURRIDOR IMUSA CON JARRA ","ORIGINAL ","0679","BLA/AZUL","1","1","5","40","1","1","6","1","controlador/productos/img/default.png","25093.00","32997.00","ACTIVO","2024-06-22 10:03:21","1");
INSERT INTO producto VALUES("696","0680","CODIMENTERO *4 CRIOLLO","ORIGINAL ","0680","CONDIMENTERO","1","3","12","18","1","1","28","1","controlador/productos/img/default.png","6288.00","9496.00","ACTIVO","2024-06-11 14:17:04","1");
INSERT INTO producto VALUES("697","0681","ENVASE HERMETICO 0.5L C/TAPA REY","ORIGINAL REY","0681","TAPA ROSCA","1","4","24","62","1","1","28","1","controlador/productos/img/default.png","1803.00","3500.00","ACTIVO","2024-06-11 14:26:43","1");
INSERT INTO producto VALUES("698","0682","ENVASE HERMETICO 2L C/TAPA REY","ORIGINAL REY","0682","TAPA ROSCA","1","4","24","62","1","1","28","1","controlador/productos/img/default.png","3562.00","5500.00","ACTIVO","2024-06-11 14:28:19","1");
INSERT INTO producto VALUES("699","0683","ENVASE HERMETICO 1.5L TAPA ROSCA","ORIGINAL REY","0683","TAPA ROSCA","1","4","24","62","1","1","28","1","controlador/productos/img/default.png","3076.00","4500.00","ACTIVO","2024-06-11 14:33:25","1");
INSERT INTO producto VALUES("700","0684","ENVASE HERMETICO 1L C/TAPA R","ORIGINAL REY","0684","TAPA ROSCA","1","4","24","62","1","1","28","1","controlador/productos/img/default.png","2433.00","4000.00","ACTIVO","2024-06-11 14:47:53","1");
INSERT INTO producto VALUES("701","0685","EXPRIMIDOR NARANJA C/TAPA REY","ORIGINAL REY","0685","REY","1","3","12","63","1","1","28","1","controlador/productos/img/default.png","5549.00","8500.00","ACTIVO","2024-06-11 14:49:12","1");
INSERT INTO producto VALUES("702","0686","PAPELERA CALADA PARIS","CALADA","0686","PARIS","1","2","12","35","1","1","28","1","controlador/productos/img/default.png","4500.00","7500.00","ACTIVO","2024-06-11 15:54:07","1");
INSERT INTO producto VALUES("703","0687","PAPELERA CALADA ROMA","CALADA","0687","ROMA","1","2","12","35","1","1","28","1","controlador/productos/img/default.png","5143.00","8500.00","ACTIVO","2024-06-11 14:55:47","1");
INSERT INTO producto VALUES("704","0688","CUBIERTERO CUADRADO C/TAPA REY","C/TAPA","0688","CUADRADA","1","2","6","40","1","1","28","1","controlador/productos/img/default.png","10272.00","14500.00","ACTIVO","2024-06-11 15:14:39","1");
INSERT INTO producto VALUES("705","0689","JARRA BONITA 2.5 LITROS C/TAPA REY","C/TAPA","0689","2.5 LITROS","1","2","23","63","1","1","28","1","controlador/productos/img/default.png","5143.00","8500.00","ACTIVO","2024-06-17 10:16:12","1");
INSERT INTO producto VALUES("706","0690","CUBIERTERO REDONDO REY","REDONDO","0690","REY","1","2","11","40","1","1","28","1","controlador/productos/img/default.png","5805.00","8500.00","ACTIVO","2024-06-21 10:06:49","1");
INSERT INTO producto VALUES("707","0691","JARRA 1 LITRO C/TAPA REY","C/TAPA","0691","1 LITRO","1","2","22","63","1","1","28","1","controlador/productos/img/default.png","2231.00","4500.00","ACTIVO","2024-06-19 13:39:32","1");
INSERT INTO producto VALUES("708","0692","JARRA 1.5 LITROS C/TAPA REY","C/TAPA","0692","1.5 LITROS","1","2","24","63","1","1","28","1","controlador/productos/img/default.png","3696.00","3500.00","ACTIVO","2024-06-11 15:17:52","1");
INSERT INTO producto VALUES("709","0693","PAPELERA CALADA DECORADA","CALADA","0693","DECORADA","1","2","12","63","1","1","28","1","controlador/productos/img/default.png","3711.00","9500.00","ACTIVO","2024-06-11 15:20:08","1");
INSERT INTO producto VALUES("710","0694","CAJA PANDORA #10","#10","0694","PANDORA","1","2","12","63","1","1","28","1","controlador/productos/img/default.png","1761.00","3500.00","ACTIVO","2024-06-11 15:23:03","1");
INSERT INTO producto VALUES("711","0695","CAJA PANDORA #20","#20","0695","PANDORA","1","2","12","63","1","1","28","1","controlador/productos/img/default.png","3955.00","6500.00","ACTIVO","2024-06-11 15:24:03","1");
INSERT INTO producto VALUES("712","0696","CAJA PANDORA #30","#30","0696","PANDORA","1","2","12","63","1","1","28","1","controlador/productos/img/default.png","5770.00","9000.00","ACTIVO","2024-06-11 15:24:41","1");
INSERT INTO producto VALUES("713","0697","APRTAMENTERO OVALADO REY","OVALADO","0697","REY","1","2","6","63","1","1","28","1","controlador/productos/img/default.png","15250.00","21000.00","ACTIVO","2024-06-11 15:25:57","1");
INSERT INTO producto VALUES("714","0698","PAPELERA TOKIO ","TOKIO","0698","PAPELERA","1","2","12","35","1","1","28","1","controlador/productos/img/default.png","2866.00","5500.00","ACTIVO","2024-06-11 15:27:13","1");
INSERT INTO producto VALUES("715","0699","HISOPO LAVA BAÑO CUADRADO","CUADRADO","0699","LAVA BAÑO","1","2","6","64","1","1","28","1","controlador/productos/img/default.png","6419.00","9500.00","ACTIVO","2024-06-19 15:09:46","1");
INSERT INTO producto VALUES("716","0700","PAPELERA AUTOMATICA STAR","AUTOMATICA","0700","STAR","1","2","3","64","1","1","28","1","controlador/productos/img/default.png","21162.00","29000.00","ACTIVO","2024-06-19 15:10:14","1");
INSERT INTO producto VALUES("717","0701","APARTAMENTERO RECTANGULAR","RECTANGULAR","0701","APARTAMENTERO","1","2","12","60","1","1","28","1","controlador/productos/img/default.png","15500.00","21000.00","ACTIVO","2024-06-11 15:31:09","1");
INSERT INTO producto VALUES("718","0702","PAPELERA FLORENCIA","FLORENCIA","0702","PAPELERA","1","2","12","35","1","1","28","1","controlador/productos/img/default.png","3928.00","6500.00","ACTIVO","2024-06-11 15:38:43","1");
INSERT INTO producto VALUES("719","0703","MOLINO DE GRANO VICTORIA","VICTORIA","0703","DE GRANO","1","2","6","26","1","1","28","1","controlador/productos/img/default.png","86343.00","110000.00","ACTIVO","2024-06-11 15:44:04","1");
INSERT INTO producto VALUES("720","0704","PATACONERA PLASTICA DOBLE USO","PLASTICA","0704","DOBLE","1","2","12","18","1","1","28","1","controlador/productos/img/default.png","17379.00","23000.00","ACTIVO","2024-06-11 15:42:12","1");
INSERT INTO producto VALUES("721","0705","PATACONERA PINTADA 16CM","16CM","0705","PINTADA","1","2","12","18","1","1","28","1","controlador/productos/img/default.png","60398.00","79000.00","ACTIVO","2024-06-11 15:43:02","1");
INSERT INTO producto VALUES("722","0706","INTERIOR LEOPOLDO","INTERIOR","0706","LEOPOLDO","1","2","9","61","1","1","28","1","controlador/productos/img/default.png","8000.00","12500.00","ACTIVO","2024-06-16 13:18:23","1");
INSERT INTO producto VALUES("723","0707","MEDIA COLEGIAL NIÑA","COLEGIAL","0707","NIÑA","1","2","18","61","1","1","28","1","controlador/productos/img/default.png","5000.00","7000.00","ACTIVO","2024-06-11 16:24:26","1");
INSERT INTO producto VALUES("724","0708","MEDIA FUTBOL HOMBRE","FUTBOL","0708","HOMBRE","1","10","75","61","1","1","28","1","controlador/productos/img/default.png","2500.00","5500.00","ACTIVO","2024-06-17 17:30:03","1");
INSERT INTO producto VALUES("725","0709","MEDIA FUTBOL NIÑO","FUTBOL","0709","NIÑO","1","5","20","61","1","1","28","1","controlador/productos/img/default.png","2500.00","5500.00","ACTIVO","2024-06-11 16:29:09","1");
INSERT INTO producto VALUES("726","0710","CANILLERA FUTBOL HOMBRE","FUTBOL","0710","HOMBRE","1","2","1","61","1","1","28","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-11 16:30:36","1");
INSERT INTO producto VALUES("727","0711","CANILLERA FUTBOL NIÑO","FUTBOL","0711","NIÑO","1","2","1","61","1","1","28","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-11 16:31:15","1");
INSERT INTO producto VALUES("728","0712","TOALLA BAÑO PROMOCION ","DE BAÑO","0712","PROMOCION","1","2","10","61","1","1","28","1","controlador/productos/img/default.png","9500.00","16000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("729","0713","TOALLA DE BAÑO GRANDE","DE BAÑO","0713","GRANDE","1","2","6","61","1","1","28","1","controlador/productos/img/default.png","12000.00","19000.00","ACTIVO","2024-06-12 12:55:18","1");
INSERT INTO producto VALUES("730","0714","MEDIA TOBILLERA","TOBILLERA","0714","DEPORTIVA","1","2","11","61","1","1","28","1","controlador/productos/img/default.png","2500.00","5000.00","ACTIVO","2024-06-13 16:39:55","1");
INSERT INTO producto VALUES("731","0715","MEDIA CLASICA","CLASICA","0715","MEDIA","1","10","38","61","1","1","28","1","controlador/productos/img/default.png","1300.00","2500.00","ACTIVO","2024-06-11 16:44:14","1");
INSERT INTO producto VALUES("732","0716","LIMA CHAIRA","CHAIRA","0716","LIMA","1","2","6","60","1","1","28","1","controlador/productos/img/default.png","7500.00","12500.00","ACTIVO","2024-06-12 09:39:12","1");
INSERT INTO producto VALUES("733","0717","PLATON #80 HOGAR PLAS","#80","0717","HOGAR PLAS","1","2","22","34","1","1","28","1","controlador/productos/img/default.png","27000.00","32000.00","ACTIVO","2024-06-12 10:05:46","1");
INSERT INTO producto VALUES("734","0718","PONCHERA #70 HOGAR PLAS","#70","0718","HOGAR PLAS","1","2","37","34","1","1","11","1","controlador/productos/img/default.png","17000.00","22000.00","ACTIVO","2024-06-20 16:20:51","1");
INSERT INTO producto VALUES("735","0719","PONCHERA 20 LITROS COLPLAS","20 LITROS","0719","COLPLAS","1","2","22","34","1","1","26","1","controlador/productos/img/default.png","8000.00","12500.00","ACTIVO","2024-06-20 16:20:51","1");
INSERT INTO producto VALUES("736","0720","PLATON #60 HOGAR PLAS","#60","0720","HOGAR PLAS","1","2","8","34","1","1","11","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-12 10:11:35","1");
INSERT INTO producto VALUES("737","0721","PONCHERA #60 PROMOCION ","#60","0721","PROMOCION","1","2","14","34","1","1","11","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-12 10:12:54","1");
INSERT INTO producto VALUES("738","0722","PLATON #52 HOGAR PLAS","#52","0722","HOGAR PLAS","1","2","8","34","1","1","11","1","controlador/productos/img/default.png","7000.00","9000.00","ACTIVO","2024-06-12 10:14:00","1");
INSERT INTO producto VALUES("739","0723","PONCHERA 28 LITROS SORPLAS","28 LITROS","0723","SORPLAS","1","2","1","34","1","1","11","1","controlador/productos/img/default.png","11000.00","14000.00","ACTIVO","2024-06-20 16:10:29","1");
INSERT INTO producto VALUES("740","0724","PONCHERA 12 LITROS SORPLAS","12 LITROS","0724","SORPLAS","1","10","77","34","1","1","27","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("741","0725","PONCHERA 8 LITROS SORPLAS","8 LITROS","0725","SORPLAS","1","10","79","34","1","1","27","1","controlador/productos/img/default.png","4000.00","6000.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("742","0726","PONCHERA 6 LITROS SORPLAS","6 LITROS","0726","SORPLAS","1","10","85","34","1","1","27","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("743","0727","PONCHERA 5 LITROS SORPLAS","5 LITROS","0727","SORPLAS","1","10","98","34","1","1","27","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-12 10:38:48","1");
INSERT INTO producto VALUES("744","0728","PONCHERA 4 LITROS SORPLAS","4 LITROS","0728","SORPLAS","1","10","95","34","1","1","27","1","controlador/productos/img/default.png","2500.00","3800.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("745","0729","PONCHERA 3 LITROS SORPLAS","3 LITROS","0729","SORPLAS","1","10","91","34","1","1","27","1","controlador/productos/img/default.png","2000.00","3200.00","ACTIVO","2024-06-12 10:44:31","1");
INSERT INTO producto VALUES("746","0730","PONCHERA #24 PLASTI Z","#24","0730","PLASTI Z","1","2","15","34","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-12 10:46:16","1");
INSERT INTO producto VALUES("747","0731","PONCHERA #30 CON OREJA PLASTI Z","#30","0731","PLASTI Z","1","2","5","34","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-12 10:47:22","1");
INSERT INTO producto VALUES("748","0732","PONCHERA #26 CON OREJAS PLASTI Z","#26","0732","PLASTI Z","1","2","2","34","1","1","28","1","controlador/productos/img/default.png","8000.00","11500.00","ACTIVO","2024-06-20 16:10:29","1");
INSERT INTO producto VALUES("749","0733","PONCHERA #26 ZETAPLAS","#26","0733","ZETAPLAS","1","2","6","34","1","1","28","1","controlador/productos/img/default.png","2000.00","2800.00","ACTIVO","2024-06-20 16:10:29","1");
INSERT INTO producto VALUES("750","0734","PONCHERA IMUSA 2 LITROS","2 LITROS","0734","IMUSA","1","2","4","34","1","1","6","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-12 10:54:09","1");
INSERT INTO producto VALUES("751","0735","CANASTILLA IMUSA (GALLETERA)","GALLETERA","0735","IMUSA","1","2","13","34","1","1","6","1","controlador/productos/img/default.png","15000.00","18500.00","ACTIVO","2024-06-12 10:55:10","1");
INSERT INTO producto VALUES("752","0736","CANASTILLA CALADA RECTANGLAR C/TAPA","C/TAPA","0736","RECTANGULAR","1","2","8","34","1","1","6","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-12 11:05:35","1");
INSERT INTO producto VALUES("753","0737","TAZA PATI ECONOMICA","PATI","0737","ECONOMICA","1","2","88","34","1","1","28","1","controlador/productos/img/default.png","800.00","1000.00","ACTIVO","2024-06-19 15:56:57","1");
INSERT INTO producto VALUES("754","0738","TAZA PATI PLASTI Z","PATI","0738","PLASTI Z","1","10","26","34","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-21 15:08:34","1");
INSERT INTO producto VALUES("755","0739","ENSALADERA COLPLAS GRANDE","GRANDE","0739","COLPLAS","1","2","2","34","1","1","26","1","controlador/productos/img/default.png","4500.00","5500.00","ACTIVO","2024-06-12 11:09:36","1");
INSERT INTO producto VALUES("756","0740","ENSALADERA COLPLAS PEQUEÑA","PEQUEÑA","0740","COLPLAS","1","10","40","34","1","1","26","1","controlador/productos/img/default.png","2700.00","3800.00","ACTIVO","2024-06-12 11:10:54","1");
INSERT INTO producto VALUES("757","0741","BALDE 18 LITROS COLPLAS","18 LITROS","0741","COLPLAS","1","2","3","34","1","1","26","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-20 16:23:50","1");
INSERT INTO producto VALUES("758","0742","BALDE 10 LITROS CON MANIJA METALICA","10 LITROS","0742","CON MANIJA ","1","2","16","34","1","1","26","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-12 11:14:09","1");
INSERT INTO producto VALUES("759","0743","BALDE 12 LITROS CON MANIJA PLASTICA","12 LITROS","0743","CON MANIJA","1","2","12","34","1","1","26","1","controlador/productos/img/default.png","6500.00","8500.00","ACTIVO","2024-06-12 11:15:04","1");
INSERT INTO producto VALUES("760","0744","BALDE DOBLE PISO SORPLAS","DOBLE PISO","0744","SORPLAS","1","2","26","34","1","1","27","1","controlador/productos/img/default.png","4000.00","5000.00","ACTIVO","2024-06-12 11:16:43","1");
INSERT INTO producto VALUES("761","0745","BALDE PARA CONSTRUCCION ","DOBLE PISO","0745","CONSTRUCCION","1","2","15","34","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-12 11:18:34","1");
INSERT INTO producto VALUES("762","0746","MOTO MOSTER GRANDE NIÑA","GRANDE","0746","NIÑA","1","2","3","20","1","1","28","1","controlador/productos/img/default.png","78000.00","95000.00","ACTIVO","2024-06-12 11:23:24","1");
INSERT INTO producto VALUES("763","0747","MOTO MOSTER GRANDE NIÑO","GRANDE","0747","NIÑO","1","2","1","20","1","1","28","1","controlador/productos/img/default.png","78000.00","95000.00","ACTIVO","2024-06-12 11:24:00","1");
INSERT INTO producto VALUES("764","0748","VOLQUETA COLPLAS CARBONERA","CARBONERA","0748","COLPLAS","1","2","2","20","1","1","26","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-12 11:28:23","1");
INSERT INTO producto VALUES("765","0749","MOTO PLASTICA MAFRA","PLASTICA","0749","MAFRA","1","2","3","20","1","1","28","1","controlador/productos/img/default.png","60000.00","78000.00","ACTIVO","2024-06-22 13:31:32","1");
INSERT INTO producto VALUES("766","0750","VOQUETA MONTABLE NIÑO","PLASTICA","0750","NIÑO","1","2","1","20","1","1","28","1","controlador/productos/img/default.png","60000.00","78000.00","ACTIVO","2024-06-12 11:32:39","1");
INSERT INTO producto VALUES("767","0751","CAMINADOR BABY","CAMINADOR","0751","BABY","1","2","3","20","1","1","28","1","controlador/productos/img/default.png","90000.00","115000.00","ACTIVO","2024-06-12 11:38:01","1");
INSERT INTO producto VALUES("768","0752"," VOLQUETA PLASTICA PEQEUÑA","PLASTICA","0752","PEQEUÑA","1","2","5","20","1","1","28","1","controlador/productos/img/default.png","14000.00","18000.00","ACTIVO","2024-06-12 11:39:20","1");
INSERT INTO producto VALUES("769","0753","BALON GOLTY MICRO","GOLTY","0753","MICRO","1","2","6","20","1","1","28","1","controlador/productos/img/default.png","90000.00","115000.00","ACTIVO","2024-06-12 11:40:36","1");
INSERT INTO producto VALUES("770","0754","BALON GOLTY #5 FUTBOL","GOLTY","0754","FUTBOL","1","2","0","20","1","1","28","1","controlador/productos/img/default.png","70000.00","98000.00","ACTIVO","2024-06-12 11:41:39","1");
INSERT INTO producto VALUES("771","0755","BALON GOLTY #4 FUTBOL","GOLTY","0755","FUTBOL","1","2","0","20","1","1","28","1","controlador/productos/img/default.png","70000.00","98000.00","ACTIVO","2024-06-12 11:42:26","1");
INSERT INTO producto VALUES("772","0756","BALON SCORE MICRO","SCORE","0756","MICRO","1","2","4","20","1","1","28","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-12 11:43:52","1");
INSERT INTO producto VALUES("773","0757","BALON SCORE FUTBOL","SCORE","0757","FUTBOL","1","2","0","20","1","1","28","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-12 11:44:37","1");
INSERT INTO producto VALUES("774","0758","BELILLO 3 METROS","3 METROS","0758","BELILLO","1","2","10","20","1","1","28","1","controlador/productos/img/default.png","2300.00","3500.00","ACTIVO","2024-06-12 11:47:46","1");
INSERT INTO producto VALUES("775","0759","BELILLO 2 METROS","2 METROS","0759","BELILLO","1","2","11","20","1","1","28","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-12 11:48:35","1");
INSERT INTO producto VALUES("776","0760","JUEGO DE TÉ ALUMINIO","ALUMINIO","0760","JUEGO","1","2","3","20","1","1","28","1","controlador/productos/img/default.png","3500.00","5000.00","ACTIVO","2024-06-12 11:51:10","1");
INSERT INTO producto VALUES("777","0761","JUEGO ARMATODO 72 FICHAS","72 FICHAS","0761","ARMATODO","1","2","2","20","1","1","28","1","controlador/productos/img/default.png","12000.00","15500.00","ACTIVO","2024-06-12 11:52:12","1");
INSERT INTO producto VALUES("778","0762","JUEGO ARMATODO 48 FICHAS","48 FICHAS","0762","ARMATODO","1","2","4","20","1","1","28","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-12 11:52:59","1");
INSERT INTO producto VALUES("779","0763","JUEGO ARMATODO 36 FICHAS","36 FICHAS","0763","ARMATODO","1","2","2","20","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-12 11:53:52","1");
INSERT INTO producto VALUES("780","0764","GABINETE CON ESPEJO RIMAX","RIMAX","0764","CON ESPEJO","1","2","2","64","1","1","5","1","controlador/productos/img/default.png","78400.00","98000.00","ACTIVO","2024-06-12 13:37:53","1");
INSERT INTO producto VALUES("781","0765","GABINETE PRIMEROS AUXILIOS EXTRA","EXTRA","0765","PRIMEROS AUXILOS","1","2","1","64","1","1","28","1","controlador/productos/img/default.png","51000.00","68000.00","ACTIVO","2024-06-12 13:39:10","1");
INSERT INTO producto VALUES("782","0766","MESA MULTIUSO 3 NIVELES RIMAX","RIMAX","0766","MULTIUSOS","1","2","10","38","1","1","5","1","controlador/productos/img/default.png","31500.00","42000.00","ACTIVO","2024-06-12 13:40:37","1");
INSERT INTO producto VALUES("783","0767","PORTARROLLO RIMAX","RIMAX","0767","PORTARROLLO","1","2","4","60","1","1","5","1","controlador/productos/img/default.png","19000.00","27500.00","ACTIVO","2024-06-12 13:42:11","1");
INSERT INTO producto VALUES("784","0768","MESA PORTATIL RIMAX","RIMAX","0768","PORTATIL","1","2","3","38","1","1","5","1","controlador/productos/img/default.png","33000.00","45000.00","ACTIVO","2024-06-12 13:43:56","1");
INSERT INTO producto VALUES("785","0769","ORGANIZADOR DE DUCHA RIMAX","RIMAX","0769","DE DUCHA","1","2","7","64","1","1","5","1","controlador/productos/img/default.png","16000.00","22000.00","ACTIVO","2024-06-12 13:44:40","1");
INSERT INTO producto VALUES("786","0770","ESQUINERO DE BAÑO COLPLAS","COLPLAS","0770","DE BAÑO","1","2","2","64","1","1","26","1","controlador/productos/img/default.png","13000.00","17500.00","ACTIVO","2024-06-12 13:45:33","1");
INSERT INTO producto VALUES("787","0771","ESQUINERO DE BAÑO MUNDIPLAS","MUNDIPLAS","0771","DE BAÑO","1","2","6","64","1","1","28","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-12 13:46:40","1");
INSERT INTO producto VALUES("788","0772","ORGANIZADOR DE BAÑO METALICO","METALICO","0772","DE BAÑO","1","2","3","64","1","1","28","1","controlador/productos/img/default.png","18000.00","24000.00","ACTIVO","2024-06-19 10:23:33","1");
INSERT INTO producto VALUES("789","0773","CANASTA MOVIL OVALADA RIMAX","RIMAX","0773","OVALADA","1","2","4","60","1","1","5","1","controlador/productos/img/default.png","51000.00","67000.00","ACTIVO","2024-06-12 13:48:43","1");
INSERT INTO producto VALUES("790","0774","CANASTA MOVIL RECTANGULAR RIMAX","RIMAX","0774","RECTANGULAR","1","2","4","60","1","1","5","1","controlador/productos/img/default.png","42000.00","56000.00","ACTIVO","2024-06-12 13:49:24","1");
INSERT INTO producto VALUES("791","0775","PAPELERA 12 LITROS COLPLAS C/PEDAL","12 LITROS","0775","COLPLAS","1","2","3","64","1","1","26","1","controlador/productos/img/default.png","18000.00","24000.00","ACTIVO","2024-06-12 13:51:56","1");
INSERT INTO producto VALUES("792","0776","PAPELERA 9 LITROS VAIVEN RIMO","9 LITROS","0776","VAIVEN","1","2","3","64","1","1","9","1","controlador/productos/img/default.png","12000.00","16000.00","ACTIVO","2024-06-12 13:55:37","1");
INSERT INTO producto VALUES("793","0777","PAPELERA 10 LITROS VAIVEN COLPLAS","10 LITROS","0777","VAIVEN","1","2","4","64","1","1","5","1","controlador/productos/img/default.png","9300.00","12500.00","ACTIVO","2024-06-20 16:20:51","1");
INSERT INTO producto VALUES("794","0778","PAPELERA 14 LITROS VAIVEN COLPLAS","14 LITROS","0778","VAIVEN","1","2","3","64","1","1","26","1","controlador/productos/img/default.png","10900.00","14500.00","ACTIVO","2024-06-12 14:08:06","1");
INSERT INTO producto VALUES("795","0779","PAPELERA 5 LITROS VAIVEN COLPLAS","5 LITROS ","0779","VAIVEN","1","2","","64","1","1","26","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-12 14:09:44","1");
INSERT INTO producto VALUES("796","0780","REPOSTRERO HERMETICO RIMO","HERMETICO","0780","RIMO","1","","6","18","1","1","9","1","controlador/productos/img/default.png","9300.00","12500.00","ACTIVO","2024-06-12 14:11:17","1");
INSERT INTO producto VALUES("797","0781","POTE HERMETICO GIGANTE RIMO","HERMETICO","0781","GIGANTE","1","2","6","18","1","1","9","1","controlador/productos/img/default.png","16300.00","16500.00","ACTIVO","2024-06-22 13:35:44","1");
INSERT INTO producto VALUES("798","0782","JARRA 4 LITROS REY","4 LITROS","0782","REY","1","2","5","63","1","1","9","1","controlador/productos/img/default.png","9300.00","12500.00","ACTIVO","2024-06-12 14:13:06","1");
INSERT INTO producto VALUES("799","0783","JARRA BONITA 4 LITROS REY","4 LITROS","0783","BONITA","1","2","4","63","1","1","28","1","controlador/productos/img/default.png","10200.00","13500.00","ACTIVO","2024-06-12 14:14:08","1");
INSERT INTO producto VALUES("800","0784","JARRA IMUSA 4 LITROS OVALADA ","4 LITROS","0784","OVALADA","1","2","5","63","1","1","6","1","controlador/productos/img/default.png","12400.00","16500.00","ACTIVO","2024-06-12 14:15:20","1");
INSERT INTO producto VALUES("801","0785","JARRA BONITA 2.5 LITROS REY","2.5 LITROS","0785","BONITA","1","2","8","63","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-12 14:16:11","1");
INSERT INTO producto VALUES("802","0786","JARRA CRISTALUZ 2.5 LITROS REY","2.5 LITROS","0786","CRISTALUZ","1","2","4","63","1","1","28","1","controlador/productos/img/default.png","5300.00","7500.00","ACTIVO","2024-06-12 14:16:53","1");
INSERT INTO producto VALUES("803","0787","JARRA IMUSA 2 LITROS C/TAPA","2 LITROS","0787","C/TAPA","1","2","7","63","1","1","6","1","controlador/productos/img/default.png","9300.00","12500.00","ACTIVO","2024-06-12 14:17:54","1");
INSERT INTO producto VALUES("804","0788","JARRA 1.8 LITROS VANIPLAS S/TAPA","2 LITROS","0788","S/TAPA","1","2","9","63","1","1","6","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-12 14:18:41","1");
INSERT INTO producto VALUES("805","0789","JARRA 1.5 LITROS IMUSA C/TAPA","2 LITROS","0789","C/TAPA","1","2","0","63","1","1","6","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-22 13:45:56","1");
INSERT INTO producto VALUES("806","0790","JARRA 3 LITROS FRUTAL ECONOMICA","2 LITROS","0790","ECONOMICA","1","","6","63","1","1","28","1","controlador/productos/img/default.png","3000.00","5500.00","ACTIVO","2024-06-12 14:31:57","1");
INSERT INTO producto VALUES("807","0791","JARRA 4 LITROS COLPAS C/TAPA","2 LITROS","0791","C/TAPA","1","2","1","63","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-12 15:17:22","1");
INSERT INTO producto VALUES("808","0792","TAZON ITALIANO REY","ITALIANO","0792","REY","1","2","1","63","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-12 14:33:38","1");
INSERT INTO producto VALUES("809","0793","ENSALADERA MELANINA C/TAPA","MELANINA","0793","C/TAPA","1","2","1","63","1","1","28","1","controlador/productos/img/default.png","14000.00","17500.00","ACTIVO","2024-06-12 14:34:21","1");
INSERT INTO producto VALUES("810","0794","BAÑERA COLPLAS PROMOCION ","COLPLAS","0794","PROMOCION","1","2","2","63","1","1","28","1","controlador/productos/img/default.png","7000.00","8500.00","ACTIVO","2024-06-12 14:35:26","1");
INSERT INTO producto VALUES("811","0795","BAÑERA SORPLAS PROMOCION","SORPLAS","0795","PROMOCION","1","5","28","63","1","1","28","1","controlador/productos/img/default.png","10000.00","13000.00","ACTIVO","2024-06-12 14:36:09","1");
INSERT INTO producto VALUES("812","0796","CONTENEDOR 22L C/TAPA Y GRIFO","22 LITROS","0796","C/TAPA Y GRIFO","1","2","6","36","1","1","27","1","controlador/productos/img/default.png","35000.00","42000.00","ACTIVO","2024-06-12 14:37:21","1");
INSERT INTO producto VALUES("813","0797","POTE TEWIS 2 LITROS KENDY","2 LITROS","0797","TEWIS","1","2","28","62","1","1","29","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-22 13:31:32","1");
INSERT INTO producto VALUES("814","0798","POTE TEWIS 0.98 LITROS KENDY","0.98 LITROS","0798","TEWIS","1","2","16","62","1","1","29","1","controlador/productos/img/default.png","2800.00","4000.00","ACTIVO","2024-06-20 09:34:50","1");
INSERT INTO producto VALUES("815","0799","TARRO MERCADO MUNDIPLAS","MERCADO","0799","MUNDIPLAS","1","","8","62","1","1","28","1","controlador/productos/img/default.png","3500.00","5500.00","ACTIVO","2024-06-12 14:39:58","1");
INSERT INTO producto VALUES("816","0800","POTE HERMETICO REDONDO 1.5 L ","1.5 LITROS","0800","REDONDO","1","2","3","62","1","1","28","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-12 14:42:21","1");
INSERT INTO producto VALUES("817","0801","PORTA CANUTOS","CANUTOS","0801","PITILLERO","1","2","7","60","1","1","28","1","controlador/productos/img/default.png","11000.00","13500.00","ACTIVO","2024-06-12 14:43:51","1");
INSERT INTO producto VALUES("818","0802","POTE CON ROSCA PROMOCION","CON ROSCA","0802","PROMOCION","1","2","7","62","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-12 14:51:04","1");
INSERT INTO producto VALUES("819","0803","PORTA ESPAGUETTI","PORTA ESPAGUETTI","0803","C/TAPA","1","1","3","62","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-13 13:21:39","1");
INSERT INTO producto VALUES("820","0804","PORTA GRANOS GRANDE","PORTA ","0804","C/TAPA","1","2","13","62","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-13 13:23:15","1");
INSERT INTO producto VALUES("821","0805","PORTA GRANOS PEQUEÑO","PORTA ","0805","C/TAPA","1","2","8","62","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-13 13:24:02","1");
INSERT INTO producto VALUES("822","0806","MOTO PLASTICA PROMOCION","MOTO NIÑO","0806","MOTO","1","2","2","20","1","1","28","1","controlador/productos/img/default.png","33000.00","42000.00","ACTIVO","2024-06-13 13:26:38","1");
INSERT INTO producto VALUES("823","0807","ESTERA","ESTERA","0807","ESTERA","1","","6","60","1","1","28","1","controlador/productos/img/default.png","20000.00","28000.00","ACTIVO","2024-06-13 13:28:59","1");
INSERT INTO producto VALUES("824","0808","BASE PARA NEVERA ","METALICA","0808","BASE PARA NEVERA ","1","3","6","60","1","1","28","1","controlador/productos/img/default.png","28000.00","39000.00","ACTIVO","2024-06-13 13:30:06","1");
INSERT INTO producto VALUES("825","0810","ANAFE DE MESA","METALICA","0810","ANAFE","1","","6","60","1","1","28","1","controlador/productos/img/default.png","20000.00","35000.00","ACTIVO","2024-06-13 13:51:01","1");
INSERT INTO producto VALUES("826","0815","CANASTILLA ALAMBRE GRANDE ","METALICA","0815","COLGANTE","1","2","6","60","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-13 13:52:46","1");
INSERT INTO producto VALUES("827","0816","CEPILLO DE BARRER XL","CEPILLO DE BARRER","0816","CEPILLO DE BARRER","1","5","32","65","1","1","28","1","controlador/productos/img/default.png","7000.00","9800.00","ACTIVO","2024-06-19 15:23:11","1");
INSERT INTO producto VALUES("828","0817","CEPILLO DE BARRER OG ","CEPILLO DE BARRER","0817","CEPILLO DE BARRER","1","5","8","65","1","1","28","1","controlador/productos/img/default.png","5998.00","8500.00","ACTIVO","2024-06-17 12:25:26","1");
INSERT INTO producto VALUES("829","0818","CEPILLO DE BARRER PROMOCION","CEPILLO DE BARRER","0818","CEPILLO DE BARRER","1","5","42","65","1","1","28","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-20 16:43:07","1");
INSERT INTO producto VALUES("830","0819","CEPILLO PARA PISO CERDA GRUESA","CEPILLO C/LIM/VIDRIO","0819","CEPILLO DE BARRER","1","5","","65","1","1","28","1","controlador/productos/img/default.png","5200.00","7800.00","ACTIVO","2024-06-13 14:03:04","1");
INSERT INTO producto VALUES("831","0820","TRAPERO 120g","TRAPERO 120g","0820","TRAPERO 120g","1","5","65","65","1","1","28","1","controlador/productos/img/default.png","5200.00","7800.00","ACTIVO","2024-06-20 16:27:59","1");
INSERT INTO producto VALUES("832","0821","TRAPERO 160g","TRAPERO 160g","0821","TRAPERO ","1","5","25","65","1","1","28","1","controlador/productos/img/default.png","7000.00","9800.00","ACTIVO","2024-06-14 17:52:10","1");
INSERT INTO producto VALUES("833","0822","ESCURRIDOR DE PLATO 3 NIVELES METALICO","ESCURRIDOR DE PLATO 3","0822","ESCURRIDOR DE PLATO 3","1","2","3","40","1","1","28","1","controlador/productos/img/default.png","26000.00","38000.00","ACTIVO","2024-06-13 14:14:59","1");
INSERT INTO producto VALUES("834","0809","ESCURRIDOR DE PLATOS 2 NIVELES METALICO","ESCURRIDOR DE PLATO 2","0809","ESCURRIDOR ","1","2","1","40","1","1","28","1","controlador/productos/img/default.png","17500.00","25000.00","ACTIVO","2024-06-13 14:16:43","1");
INSERT INTO producto VALUES("835","0823","PLATERA 3 NIVELES METALICA","PLATERA 3 NIVELES METALICA","0823","PLATERA 3 NIVELES ","1","2","4","40","1","1","28","1","controlador/productos/img/default.png","32000.00","45000.00","ACTIVO","2024-06-17 18:10:37","1");
INSERT INTO producto VALUES("836","0824","PLATERA 6 NIVELES METALICA","PLATERA 6 NIVELES METALICA","0824","PLATERA 6 NIVELES ","1","2","3","40","1","1","28","1","controlador/productos/img/default.png","82000.00","115000.00","ACTIVO","2024-06-13 14:19:49","1");
INSERT INTO producto VALUES("837","0825","PLATERA 5 NIVELES METALICA","PLATERA 5 NIVELES METALICA","0825","PLATERA 5 NIVELES ","1","2","3","40","1","1","28","1","controlador/productos/img/default.png","62300.00","89000.00","ACTIVO","2024-06-13 14:21:47","1");
INSERT INTO producto VALUES("838","0826","LIMPIA TECHO","LIMPIA TECHO","0826","LIMPIA TECHO","1","3","5","65","1","1","28","1","controlador/productos/img/default.png","9000.00","13000.00","ACTIVO","2024-06-17 10:18:21","1");
INSERT INTO producto VALUES("839","0827","PERCHERO DE MADERA PEQUEÑO","PERCHERO DE MADERA ","0827","PERCHERO DE MADERA ","1","5","14","60","1","1","28","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-13 14:42:51","1");
INSERT INTO producto VALUES("840","0828","PERCHERO DE MADERA GRANDE","PERCHERO DE MADERA ","0828","PERCHERO DE MADERA ","1","3","12","60","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-13 14:43:38","1");
INSERT INTO producto VALUES("841","0829","PARA SOL # 37","PARA SOL #","0829","PARA SOL #","1","2","1","60","1","1","28","1","controlador/productos/img/default.png","28000.00","37000.00","ACTIVO","2024-06-13 14:54:26","1");
INSERT INTO producto VALUES("842","0830","PARA SOL # 55","PARA SOL #","0830","PARA SOL #","1","2","8","60","1","1","28","1","controlador/productos/img/default.png","42000.00","55000.00","ACTIVO","2024-06-13 14:59:37","1");
INSERT INTO producto VALUES("843","0831","PARA SOL # 75","PARA SOL #","0831","PARA SOL #","1","2","4","60","1","1","28","1","controlador/productos/img/default.png","60000.00","75000.00","ACTIVO","2024-06-13 14:57:42","1");
INSERT INTO producto VALUES("844","0832","PARA SOL # 95","PARA SOL #","0832","PARA SOL #","1","2","4","60","1","1","28","1","controlador/productos/img/default.png","78000.00","95000.00","ACTIVO","2024-06-13 15:03:03","1");
INSERT INTO producto VALUES("845","0833","PARA SOL # 120","PARA SOL #","0833","PARA SOL #","1","2","9","60","1","1","28","1","controlador/productos/img/default.png","98000.00","120000.00","ACTIVO","2024-06-13 15:04:03","1");
INSERT INTO producto VALUES("846","0834","PARA SOL GIGANTE CUADRADO","PARA SOL #","0834","PARA SOL #","1","2","6","60","1","1","28","1","controlador/productos/img/default.png","139000.00","190000.00","ACTIVO","2024-06-13 15:07:23","1");
INSERT INTO producto VALUES("847","0861","PARA SOL GIGANTE DOBLE VARILLA","PARA SOL # 195","0861","PARA SOL #","1","2","1","60","1","1","28","1","controlador/productos/img/default.png","150000.00","195000.00","ACTIVO","2024-06-13 15:09:39","1");
INSERT INTO producto VALUES("848","0835","ALCANCIA POTE GRANDE ","POTE GRANDE ","0835","POTE GRANDE ","1","10","117","60","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-16 10:49:59","1");
INSERT INTO producto VALUES("849","0836","ALCANCIA POTE PEQUEÑO","POTE PEQUEÑO","0836","PLASTICA","1","10","110","60","1","1","28","1","controlador/productos/img/default.png","1100.00","1500.00","ACTIVO","2024-06-13 15:23:52","1");
INSERT INTO producto VALUES("850","0837","TRAMPA RATON GRANDE MADERA","TRAMPA RATON ","0837","TRAMPA RATON ","1","10","217","60","1","1","28","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("851","0838","TRAMPA RATON PEQUEÑA MADERA","TRAMPA RATON ","0838","TRAMPA RATON ","1","20","210","60","1","1","28","1","controlador/productos/img/default.png","1250.00","2000.00","ACTIVO","2024-06-22 10:03:21","1");
INSERT INTO producto VALUES("852","0839","MORTERO DE AJO PEQUEÑO","MORTERO DE AJO PEQUEÑO","0839","MORTERO DE AJO PEQUEÑO","1","5","34","60","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-13 15:49:15","1");
INSERT INTO producto VALUES("853","0840","SOMBRERO CONCHA DE HOBO GRANDE"," CONCHA DE HOBO","0840"," CONCHA DE HOBO","1","10","38","60","1","1","28","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-13 15:51:50","1");
INSERT INTO producto VALUES("854","0841","SOMBRERO CONCHA DE HOBO PEQUEÑO"," CONCHA DE HOBO","0841"," CONCHA DE HOBO","1","10","31","60","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-13 15:52:47","1");
INSERT INTO producto VALUES("855","0862"," SOMBRERO CONCHA DE HOBO RANCHERO"," CONCHA DE HOBO","0862"," CONCHA DE HOBO","1","2","5","60","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-13 15:54:37","1");
INSERT INTO producto VALUES("856","0842","CAJA TAIRONA #1-14L MEDIANA","CAJA TAIRONA #1-14L","0842","CAJA TAIRONA #1-14L","1","2","2","62","1","1","28","1","controlador/productos/img/default.png","15200.00","21000.00","ACTIVO","2024-06-17 15:26:56","1");
INSERT INTO producto VALUES("857","0843","CAJA TURIN #1-14L ALTA","CAJA TURIN #1-14L","0843","CAJA  #1-14L","1","","3","62","1","1","28","1","controlador/productos/img/default.png","11800.00","15500.00","ACTIVO","2024-06-13 16:11:38","1");
INSERT INTO producto VALUES("858","0844","CAJA TURIN #1-10L BAJA","CAJA TURIN #1-10L","0844","CAJA TURIN #1-10L","1","2","1","62","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-13 17:02:14","1");
INSERT INTO producto VALUES("859","0845","CAJA ALASKA #3-3.5L ALTA","CAJA ALASKA #3-3.5L ","0845","CAJA ALASKA #3-3.5L ","1","2","4","62","1","1","28","1","controlador/productos/img/default.png","5500.00","7500.00","ACTIVO","2024-06-13 17:16:22","1");
INSERT INTO producto VALUES("860","0846","CAJA KENDY #3-2.5L","CAJA KENDY #3-2.5L","0846","CAJA KENDY #3-2.5L","1","2","8","62","1","1","28","1","controlador/productos/img/default.png","5500.00","8500.00","ACTIVO","2024-06-13 17:18:26","1");
INSERT INTO producto VALUES("861","0847","CAJA MONACO #1-2.40 L MEDIANA","2.40 LITROS","0847","#1","1","2","12","62","1","1","28","1","controlador/productos/img/default.png","5500.00","7500.00","ACTIVO","2024-06-14 09:47:32","1");
INSERT INTO producto VALUES("862","0848","CAJA MONACO #2-3L MEDIANA","3 LITROS","0848","#2","1","2","7","62","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-14 09:56:04","1");
INSERT INTO producto VALUES("863","0849","CAJA KENDY #3-2.2L REDONDA","2.2 LITROS","0849","#3","1","2","3","62","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-14 09:56:30","1");
INSERT INTO producto VALUES("864","0850","CAJA ALASKA #3-2.8L","2.8 LITROS","0850","#3","1","2","0","62","1","1","28","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-21 13:05:27","1");
INSERT INTO producto VALUES("865","0851","CAJA ALSKA #4-4.8L","4.8 LITROS","0851","#4","1","2","2","62","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-14 09:59:00","1");
INSERT INTO producto VALUES("866","0852","CAJA KENDY #2-1.3L WATER","4.8 LITROS","0852","#2","1","2","9","62","1","1","29","1","controlador/productos/img/default.png","4000.00","5800.00","ACTIVO","2024-06-17 10:06:00","1");
INSERT INTO producto VALUES("867","0853","JUEGO DE POTE X3 A.C.S MALLA","X3","0853","A.C.S","1","2","7","62","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-16 11:36:47","1");
INSERT INTO producto VALUES("868","0854","CAJA KENDY #3-2.5L WATER","2.5 LITROS","0854","#3","1","2","2","62","1","1","29","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-14 10:19:07","1");
INSERT INTO producto VALUES("869","0855","RECIPIENTE FAMILIAR #4 RIMO","#4","0855","RIMO","1","2","1","62","1","1","9","1","controlador/productos/img/default.png","10000.00","13000.00","ACTIVO","2024-06-14 10:20:41","1");
INSERT INTO producto VALUES("870","0856","PORTACUBIERTOS DIAMANTE REDONDO","REDONDO","0856","DIAMANTE ","1","2","4","40","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-14 10:23:24","1");
INSERT INTO producto VALUES("871","0857","CUBIERTERO 3 DIVISIONES KENDY","3 DIVISIONES","0857","KENDY","1","2","9","40","1","1","29","1","controlador/productos/img/default.png","5500.00","7500.00","ACTIVO","2024-06-14 10:26:23","1");
INSERT INTO producto VALUES("872","0858","CUBIERTERO 4 DIVISIONES IMUSA","4 DIVISIONES","0858","IMUSA","1","2","2","40","1","1","6","1","controlador/productos/img/default.png","19000.00","24000.00","ACTIVO","2024-06-14 10:27:55","1");
INSERT INTO producto VALUES("873","0859","JUEGO TARRO MINI X3 DECORADO","X3","0859","DECORADO","1","2","3","62","1","1","28","1","controlador/productos/img/default.png","21000.00","26500.00","ACTIVO","2024-06-14 10:31:12","1");
INSERT INTO producto VALUES("874","0860","PORTA AREPAS","PORTA AREPAS","0860","PORTA AREPAS","1","2","2","62","1","1","28","1","controlador/productos/img/default.png","9800.00","12500.00","ACTIVO","2024-06-14 10:32:30","1");
INSERT INTO producto VALUES("875","0863","VENTILADOR PATO GRANDE ","PATO","0863","GRANDE","1","2","14","4","1","1","28","1","controlador/productos/img/default.png","70000.00","90000.00","ACTIVO","2024-06-19 16:58:52","1");
INSERT INTO producto VALUES("876","0864","BALDE CON ESCURRIDOR SORPLAST","CON ESCURRIDOR","0864","SORPLAST","1","2","7","36","1","1","27","1","controlador/productos/img/default.png","8000.00","11500.00","ACTIVO","2024-06-17 16:49:50","1");
INSERT INTO producto VALUES("877","0865","EXPRIMIDOR DE TRAPERO OVALADO","EXPRIMIDOR","0865","OVALADO","1","2","7","36","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-17 18:04:00","1");
INSERT INTO producto VALUES("878","0866","PINZA PURA ROPA PLASTICA PROMOCION","PLASTICA","0866","PROMOCION","1","2","8","65","1","1","28","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-14 10:50:30","1");
INSERT INTO producto VALUES("879","0867","PINZA PARA ROPA MADERA ","PARA ROPA","0867","MADERA","1","2","20","65","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-14 10:53:51","1");
INSERT INTO producto VALUES("880","0868","PINZA PARA ROPA PLASTICA MUKHI","PARA ROPA","0868","PLASTICA","1","2","5","65","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-14 10:54:54","1");
INSERT INTO producto VALUES("881","0869","CEPILLO DE LAVAR IMUSA","DE LAVAR","0869","IMUSA","1","2","18","65","1","1","6","1","controlador/productos/img/default.png","5000.00","6800.00","ACTIVO","2024-06-22 10:32:16","1");
INSERT INTO producto VALUES("882","0870","CEPILLO DE LAVAR VANIPLAST REF.95","DE LAVAR","0870","VANIPLAST","1","2","6","65","1","1","4","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-14 11:01:33","1");
INSERT INTO producto VALUES("883","0871","CEPILLO DE LAVAR SOFT BRUSH","DE LAVAR","0871","SOFT BRUSH","1","2","11","65","1","1","28","1","controlador/productos/img/default.png","7000.00","9200.00","ACTIVO","2024-06-14 11:05:59","1");
INSERT INTO producto VALUES("884","0872","CEPILLO DE LAVAR REF.35","DE LAVAR","0872","REF.35","1","2","9","65","1","1","28","1","controlador/productos/img/default.png","4500.00","6500.00","ACTIVO","2024-06-14 11:05:12","1");
INSERT INTO producto VALUES("885","0873","CEPILLO DE LAVAR REF.55","DE LAVAR","0873","REF.55","1","2","5","65","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-14 11:06:48","1");
INSERT INTO producto VALUES("886","0874","CEPILLO DE LAVAR CHINO","DE LAVAR","0874","CHINO","1","2","6","65","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-14 11:08:22","1");
INSERT INTO producto VALUES("887","0875","CEPILLO DE LAVAR PROMOCION","DE LAVAR","0875","PROMOCION","1","2","25","65","1","1","28","1","controlador/productos/img/default.png","1500.00","2500.00","ACTIVO","2024-06-21 10:53:07","1");
INSERT INTO producto VALUES("888","0876","BALDE 3 LITROS GIRAR C/TAPA","3 LITROS","0876","C/TAPA","1","2","9","36","1","1","28","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-14 11:10:52","1");
INSERT INTO producto VALUES("889","0877","MACETA DE PARED ESTRECHA ","DE PARED","0877","ESTRECHA","1","2","6","66","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-14 11:12:53","1");
INSERT INTO producto VALUES("890","0878","MACETA HOGARPLAST #16","#16","0878","HOGARPLAST","1","2","37","66","1","1","11","1","controlador/productos/img/default.png","18000.00","28000.00","ACTIVO","2024-06-14 11:22:29","1");
INSERT INTO producto VALUES("891","0879","MACETA HOGARPLAST #18","#18","0879","HOGARPLAST","1","2","32","66","1","1","11","1","controlador/productos/img/default.png","2000.00","3200.00","ACTIVO","2024-06-14 11:23:41","1");
INSERT INTO producto VALUES("892","0880","MACETA HANZAPLAST #17","#17","0880","HANZAPLAST","1","2","16","66","1","1","11","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-14 11:25:13","1");
INSERT INTO producto VALUES("893","0881","MACETA HOGARPLAST #22","#22","0881","HOGARPLAST","1","2","4","66","1","1","11","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-14 11:26:49","1");
INSERT INTO producto VALUES("894","0882","MACETA HOGARPLAST #24","#24","0882","HOGARPLAST","1","2","19","66","1","1","11","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-14 11:27:29","1");
INSERT INTO producto VALUES("895","0883","MACETA HOGARPLAST #28","#28","0883","HOGARPLAST","1","2","10","66","1","1","11","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-14 11:28:50","1");
INSERT INTO producto VALUES("896","0884","MACETA HOGARPLAST #29","#29","0884","HOGARPLAST","1","2","27","66","1","1","11","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-14 11:29:55","1");
INSERT INTO producto VALUES("897","0885","MACETA HOGARPLAST #27","#27","0885","HOGARPLAST","1","2","19","66","1","1","11","1","controlador/productos/img/default.png","4500.00","6500.00","ACTIVO","2024-06-14 11:31:05","1");
INSERT INTO producto VALUES("898","0886","MACETA DE PARED GRANDE","DE PARED","0886","GRANDE","1","2","16","66","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-14 11:33:28","1");
INSERT INTO producto VALUES("899","0887","MACETA HOGARPLAST #35","#35","0887","HOGARPLAST","1","2","4","66","1","1","11","1","controlador/productos/img/default.png","7000.00","9800.00","ACTIVO","2024-06-14 11:36:53","1");
INSERT INTO producto VALUES("900","0888","MACETA DE PARED PEQUEÑA","DE PARED","0888","PEQUEÑA","1","2","50","66","1","1","28","1","controlador/productos/img/default.png","1500.00","2500.00","ACTIVO","2024-06-14 11:38:21","1");
INSERT INTO producto VALUES("901","0889","MATERA JARDINERA GRANDE","JARDINERA","0889","GRANDE","1","2","2","66","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-14 11:39:53","1");
INSERT INTO producto VALUES("902","0890","MAZETA RECTANGULAR JARDINERA FRANJAS","JARDINERA","0890","FRANJAS","1","2","7","66","1","1","28","1","controlador/productos/img/default.png","19000.00","25500.00","ACTIVO","2024-06-14 15:13:18","1");
INSERT INTO producto VALUES("903","0891","MACETA RECTANGULAR JARDINERA ","JARDINERA","0891","RECTANGULAR ","1","2","5","66","1","1","28","1","controlador/productos/img/default.png","11001.00","16500.00","ACTIVO","2024-06-14 11:45:42","1");
INSERT INTO producto VALUES("904","0892","MATERA RECICLADA #15 PROMOCION","#15","0892","PROMOCION","1","2","45","66","1","1","28","1","controlador/productos/img/default.png","1300.00","2200.00","ACTIVO","2024-06-14 11:52:11","1");
INSERT INTO producto VALUES("905","0893","MATERA RECICLADA #16 PROMOCION","#16","0893","PROMOCION","1","2","33","66","1","1","28","1","controlador/productos/img/default.png","1500.00","2700.00","ACTIVO","2024-06-20 11:16:04","1");
INSERT INTO producto VALUES("906","0894","MATERA PARA COLGAR PLASTICA GRANDE","GRANDE","0894","PLASTICA","1","2","8","66","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-14 11:56:00","1");
INSERT INTO producto VALUES("907","0895","MATERA PARA COLGAR PLASTICA PEQUEÑA ","PEQUEÑA","0895","PLASTICA","1","2","8","66","1","1","28","1","controlador/productos/img/default.png","4300.00","6500.00","ACTIVO","2024-06-20 17:35:23","1");
INSERT INTO producto VALUES("908","0896","MACETA PARA COLGAR ESTRIADA","ESTRIADA","0896","PARA COLGAR","1","2","8","66","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-14 12:00:18","1");
INSERT INTO producto VALUES("909","0897","MACETA PLASTICA #10","#10","0897","PLASTICA","1","2","16","66","1","1","28","1","controlador/productos/img/default.png","1800.00","2900.00","ACTIVO","2024-06-14 12:01:43","1");
INSERT INTO producto VALUES("910","0898","MACETA PARA CACTUS MINI","MINI","0898","PARA CACTUS","1","2","30","66","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-14 12:02:46","1");
INSERT INTO producto VALUES("911","0899","ESCURRIDOR DE MACETA PEQEUÑA","PEQEUÑA","0899","ESCURRIDOR","1","2","42","66","1","1","28","1","controlador/productos/img/default.png","1000.00","1600.00","ACTIVO","2024-06-14 12:03:45","1");
INSERT INTO producto VALUES("912","0900","OLLA IMUSA #40","#40","0900","IMUSA","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","150000.00","185000.00","ACTIVO","2024-06-14 12:05:54","1");
INSERT INTO producto VALUES("913","0901","SUPERCLADERO IMUSA #40","SUPERCLADERO IMUSA #40","0901","#40","1","1","1","28","1","1","6","1","controlador/productos/img/default.png","150000.00","185000.00","ACTIVO","2024-06-14 13:28:28","1");
INSERT INTO producto VALUES("914","0902","SUPERCLADERO IMUSA #36","SUPERCLADERO IMUSA #36","0902","SUPERCLADERO IMUSA #36","1","1","1","28","1","1","6","1","controlador/productos/img/default.png","150000.00","155000.00","ACTIVO","2024-06-14 13:29:41","1");
INSERT INTO producto VALUES("915","0903","SUPERCLADERO IMUSA #32","SUPERCLADERO IMUSA #32","0903","SUPERCLADERO IMUSA #32","1","1","1","28","1","1","6","1","controlador/productos/img/default.png","85000.00","110000.00","ACTIVO","2024-06-14 13:30:43","1");
INSERT INTO producto VALUES("916","0904","OLLA IMUSA #36","#36","0904","IMUSA","1","2","1","28","1","1","6","1","controlador/productos/img/default.png","110000.00","145000.00","ACTIVO","2024-06-14 13:35:18","1");
INSERT INTO producto VALUES("917","0905","OLLA IMUSA #30","#30","0905","IMUSA","1","2","4","28","1","1","6","1","controlador/productos/img/default.png","59000.00","78000.00","ACTIVO","2024-06-14 13:35:59","1");
INSERT INTO producto VALUES("918","0906","OLLA IMUSA #28","#28","0906","IMUSA","1","2","8","28","1","1","6","1","controlador/productos/img/default.png","50000.00","69000.00","ACTIVO","2024-06-14 13:36:31","1");
INSERT INTO producto VALUES("919","0907","OLLA IMUSA #26","#26","0907","IMUSA","1","2","3","28","1","1","6","1","controlador/productos/img/default.png","42000.00","55000.00","ACTIVO","2024-06-14 13:37:02","1");
INSERT INTO producto VALUES("920","0908","OLLA IMUSA #24","#24","0908","IMUSA","1","2","1","28","1","1","6","1","controlador/productos/img/default.png","35000.00","43000.00","ACTIVO","2024-06-14 13:37:32","1");
INSERT INTO producto VALUES("921","0909","OLLA IMUSA #18","#18","0909","IMUSA","1","2","12","28","1","1","6","1","controlador/productos/img/default.png","24000.00","32000.00","ACTIVO","2024-06-22 13:31:32","1");
INSERT INTO producto VALUES("922","0910","OLLA DE PELTRE 14.8L","PELTRE","0910","14.8 LITROS","1","2","1","28","1","1","6","1","controlador/productos/img/default.png","160000.00","198000.00","ACTIVO","2024-06-14 13:38:56","1");
INSERT INTO producto VALUES("923","0911","OLLA DE PELTRE 9.5L","PELTRE","0911","9.5 LITROS","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","120000.00","158000.00","ACTIVO","2024-06-14 13:39:34","1");
INSERT INTO producto VALUES("924","0912","OLLA DE PELTRE 5.5L","PELTRE","0912","5.5L","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","105000.00","139000.00","ACTIVO","2024-06-14 13:40:08","1");
INSERT INTO producto VALUES("925","0913","OLLA DE PELTRE 4.4L","PELTRE","0913","4.4L","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","95000.00","126000.00","ACTIVO","2024-06-14 13:40:39","1");
INSERT INTO producto VALUES("926","0914","OLLA DE PELTRE 2.7L","PELTRE","0914","2.7L","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","60000.00","82000.00","ACTIVO","2024-06-14 13:41:16","1");
INSERT INTO producto VALUES("927","0915","OLLA DE PELTRE 1.6L","PELTRE","0915","1.6L","1","2","3","28","1","1","28","1","controlador/productos/img/default.png","50000.00","75000.00","ACTIVO","2024-06-14 13:41:53","1");
INSERT INTO producto VALUES("928","0916","TETERERA IMUSA","TETERERA","0916","IMUSA","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","68000.00","98000.00","ACTIVO","2024-06-14 13:42:28","1");
INSERT INTO producto VALUES("929","0917","CANTINA ALUMINIO 5L","ALUMINIO","0917","5L","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","32000.00","48000.00","ACTIVO","2024-06-14 13:43:05","1");
INSERT INTO producto VALUES("930","0918","PRACTIRIMO 13L C/MANIJA","13L","0918","C/MANIJA","1","2","6","62","1","1","28","1","controlador/productos/img/default.png","20000.00","29000.00","ACTIVO","2024-06-14 13:48:39","1");
INSERT INTO producto VALUES("931","0919","CAJA MONSERRAT #3-35L","35L","0919","#3","1","2","4","62","1","1","28","1","controlador/productos/img/default.png","32000.00","44500.00","ACTIVO","2024-06-14 13:48:20","1");
INSERT INTO producto VALUES("932","0920","CAJA MONSERRAT #3-50L","50L","0920","#3","1","2","5","62","1","1","28","1","controlador/productos/img/default.png","40000.00","52000.00","ACTIVO","2024-06-14 13:47:57","1");
INSERT INTO producto VALUES("933","0921","CAJA MONSERRAT #3-65L","65L","0921","#3","1","2","5","62","1","1","28","1","controlador/productos/img/default.png","56000.00","68000.00","ACTIVO","2024-06-14 13:46:33","1");
INSERT INTO producto VALUES("934","0922","VASO DE NOCHE DE PELTRE","PELTRE","0922","DE NOCHE","1","2","9","62","1","1","28","1","controlador/productos/img/default.png","40000.00","65000.00","ACTIVO","2024-06-14 13:47:30","1");
INSERT INTO producto VALUES("935","0923","SUPERCALDERO INDIA 60*40","INDIA","0923","SUPERCALDERO INDIA","1","2","1","67","1","1","28","1","controlador/productos/img/default.png","330000.00","420000.00","ACTIVO","2024-06-14 13:52:20","1");
INSERT INTO producto VALUES("936","0924","SUPERCALDERO INDIA 60*50","60*50","0924","SUPERCALDERO INDIA","1","2","1","67","1","1","3","1","controlador/productos/img/default.png","450000.00","530000.00","ACTIVO","2024-06-14 13:53:46","1");
INSERT INTO producto VALUES("937","0925","SUPERCALDERO INDIA 50*20","50*20","0925","SUPERCALDERO INDIA","1","2","2","67","1","1","3","1","controlador/productos/img/default.png","160000.00","220000.00","ACTIVO","2024-06-14 13:54:22","1");
INSERT INTO producto VALUES("938","0926","SUPERCALDERO INDIA 50*40","50*40","0926","SUPERCALDERO INDIA","1","2","1","67","1","1","3","1","controlador/productos/img/default.png","220000.00","298000.00","ACTIVO","2024-06-14 13:54:57","1");
INSERT INTO producto VALUES("939","0927","SUPERCALDERO INDIA 50*30","50*30","0927","SUPERCALDERO INDIA","1","2","2","67","1","1","3","1","controlador/productos/img/default.png","200000.00","265000.00","ACTIVO","2024-06-14 13:55:26","1");
INSERT INTO producto VALUES("940","0928","SUPERCALDERO INDIA 40*40","40*40","0928","SUPERCALDERO INDIA","1","2","2","67","1","1","3","1","controlador/productos/img/default.png","170000.00","225000.00","ACTIVO","2024-06-14 13:55:58","1");
INSERT INTO producto VALUES("941","0929","SUPERCALDERO INDIA 40*30","40*30","0929","SUPERCALDERO INDIA","1","2","3","67","1","1","3","1","controlador/productos/img/default.png","130000.00","185000.00","ACTIVO","2024-06-14 13:56:41","1");
INSERT INTO producto VALUES("942","0930","SUPERCALDERO INDIA #34","#34","0930","SUPERCALDERO INDIA","1","2","4","67","1","1","3","1","controlador/productos/img/default.png","60000.00","79000.00","ACTIVO","2024-06-14 13:57:38","1");
INSERT INTO producto VALUES("943","0931","SUPERCALDERO INDIA #32","#32","0931","SUPERCALDERO INDIA ","1","2","2","67","1","1","3","1","controlador/productos/img/default.png","58000.00","75000.00","ACTIVO","2024-06-14 13:58:12","1");
INSERT INTO producto VALUES("944","0932","OLLA INDIA #36","#36","0932","OLLA INDIA ","1","2","1","28","1","1","3","1","controlador/productos/img/default.png","70000.00","85000.00","ACTIVO","2024-06-21 14:04:46","1");
INSERT INTO producto VALUES("945","0933","OLLA INDIA #40","#40","0933","OLLA INDIA ","1","2","1","28","1","1","3","1","controlador/productos/img/default.png","85000.00","110000.00","ACTIVO","2024-06-14 13:59:46","1");
INSERT INTO producto VALUES("946","0934","OLLA INDIA #38","#38","0934","OLLA INDIA ","1","2","1","28","1","1","3","1","controlador/productos/img/default.png","75000.00","95000.00","ACTIVO","2024-06-14 14:00:11","1");
INSERT INTO producto VALUES("947","0935","OLLA INDIA #34","#34","0935","OLLA INDIA ","1","2","1","28","1","1","3","1","controlador/productos/img/default.png","64000.00","79000.00","ACTIVO","2024-06-14 14:00:41","1");
INSERT INTO producto VALUES("948","0936","OLLA INDIA #32","#32","0936","OLLA INDIA ","1","2","1","28","1","1","3","1","controlador/productos/img/default.png","60000.00","75000.00","ACTIVO","2024-06-14 14:01:07","1");
INSERT INTO producto VALUES("949","0937","VASO DE NOCHE COLPLAS GRANDE","DE NOCHE","0937","VASO DE NOCHE","1","2","58","64","1","1","26","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-18 10:57:04","1");
INSERT INTO producto VALUES("950","0938","VASO DE NOCHE REY PEQEUÑO NIÑO","DE NOCHE","0938","VASO DE NOCHE","1","2","26","64","1","1","28","1","controlador/productos/img/default.png","2300.00","3500.00","ACTIVO","2024-06-18 10:46:52","1");
INSERT INTO producto VALUES("951","0939","VASO DE NOCHE GIRAR GRANDE","DE NOCHE","0939","VASO DE NOCHE","1","2","19","64","1","1","28","1","controlador/productos/img/default.png","2800.00","4000.00","ACTIVO","2024-06-14 14:04:48","1");
INSERT INTO producto VALUES("952","0940","VASO DE NOCHE MUNDOBABY","VASO DE NOCHE MUNDOBABY","0940","VASO DE NOCHE ","1","1","9","64","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-14 14:17:35","1");
INSERT INTO producto VALUES("953","0941","VASO DE NOCHE GIRAR PEQUEÑO ","VASO DE NOCHE MUNDOBABY","0941","VASO DE NOCHE ","1","1","46","64","1","1","28","1","controlador/productos/img/default.png","1200.00","2000.00","ACTIVO","2024-06-14 14:18:24","1");
INSERT INTO producto VALUES("954","0942","VASO DE NOCHE VANYPLAST GRANDE ","VASO DE NOCHE MUNDOBABY","0942","VASO DE NOCHE ","1","1","2","64","1","1","4","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-14 14:21:01","1");
INSERT INTO producto VALUES("955","0943","BOTIQUIN KENDY #2-10L","BOTIQUIN KENDY #2-10L","0943","BOTIQUIN ","1","1","12","62","1","1","29","1","controlador/productos/img/default.png","17000.00","23000.00","ACTIVO","2024-06-14 14:27:22","1");
INSERT INTO producto VALUES("956","0944","BOTIQUIN KENDY #1-5L","BOTIQUIN KENDY #1-5L","0944","BOTIQUIN ","1","1","7","62","1","1","29","1","controlador/productos/img/default.png","12000.00","17000.00","ACTIVO","2024-06-17 10:29:11","1");
INSERT INTO producto VALUES("957","0945","CAJA DE HERRAMIENTAS 16&quot; REY ","CAJA DE HERRAMIENTAS 16&quot; REY ","0945","CAJA DE HERRAMIENTAS ","1","1","2","62","1","1","28","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-14 14:30:17","1");
INSERT INTO producto VALUES("958","0946","CAJA DE HERRAMIENTAS 16&quot; RIMO","CAJA DE HERRAMIENTAS 16&quot; RIMO ","0946","CAJA DE HERRAMIENTAS ","1","1","1","62","1","1","28","1","controlador/productos/img/default.png","29000.00","39000.00","ACTIVO","2024-06-14 14:31:42","1");
INSERT INTO producto VALUES("959","0947","CAJA VANITY ELEGANTE RIMA","CAJA VANITY ELEGANTE RIMA","0947","CAJA VANITY ","1","1","5","62","1","1","28","1","controlador/productos/img/default.png","45000.00","57000.00","ACTIVO","2024-06-14 14:32:57","1");
INSERT INTO producto VALUES("960","0948","CAJA VANITY BEAUTY RIMA ","CAJA VANITY BEAUTY RIMA ","0948","CAJA VANITY BEAUTY RIMA ","1","1","2","62","1","1","28","1","controlador/productos/img/default.png","37000.00","47000.00","ACTIVO","2024-06-14 14:33:52","1");
INSERT INTO producto VALUES("961","0949","CAJA CON DIVISION 2.5L PLESCO","CAJA CON DIVISION 2.5L PLESCO","0949","CAJA CON DIVISION ","1","1","23","62","1","1","28","1","controlador/productos/img/default.png","4500.00","6500.00","ACTIVO","2024-06-14 14:37:04","1");
INSERT INTO producto VALUES("962","0950","NECESER 10&quot; COLPLAST ","NECESER 10&quot; COLPLAST ","0950","NECESER ","1","1","2","62","1","1","28","1","controlador/productos/img/default.png","16000.00","21000.00","ACTIVO","2024-06-14 14:38:19","1");
INSERT INTO producto VALUES("963","0951","PRACTICAJA #2 FEMENINA ","PRACTICAJA #2 FEMENINA ","0951","PRACTICAJA ","1","1","4","62","1","1","28","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-14 15:03:03","1");
INSERT INTO producto VALUES("964","0952","CAJA SALENTE #4-5L CON BANDEJA ","CAJA SALENTE #4-5L CON BANDEJA ","0952","CAJA SALENTE ","1","1","1","62","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-14 15:04:10","1");
INSERT INTO producto VALUES("965","0953","RECIPIENTE FAMILIAR 4L #4","RECIPIENTE FAMILIAR 4L #4","0953","RECIPIENTE FAMILIAR ","1","1","3","62","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-14 15:06:54","1");
INSERT INTO producto VALUES("966","0954","CAJA MONACO #1- 5L ","CAJA MONACO #1- 5L ","0954","CAJA MONACO ","1","1","2","62","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-14 15:07:49","1");
INSERT INTO producto VALUES("967","0955","PORTACOMIDAS RECTANGULAR PEQUEÑO ","PORTACOMIDAS RECTANGULAR PEQUEÑO ","0955","PORTACOMIDAS ","1","1","4","62","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-14 15:09:02","1");
INSERT INTO producto VALUES("968","0956","RECIPIENTE FAMILIAR #2- 1.2L ","RECIPIENTE FAMILIAR #2- 1.2L ","0956","RECIPIENTE FAMILIAR","1","1","8","62","1","1","28","1","controlador/productos/img/default.png","4500.00","6800.00","ACTIVO","2024-06-14 15:10:06","1");
INSERT INTO producto VALUES("969","0957","CAJA PICNIC #1- 0.7L ","CAJA PICNIC #1- 0.7L ","0957","CAJA PICNIC ","1","1","2","62","1","1","28","1","controlador/productos/img/default.png","2200.00","3800.00","ACTIVO","2024-06-14 15:11:02","1");
INSERT INTO producto VALUES("970","0958","TAZON #4 RIMO ","TAZON #4 RIMO ","0958","TAZON #4 RIMO ","1","1","4","34","1","1","28","1","controlador/productos/img/default.png","4300.00","6500.00","ACTIVO","2024-06-20 13:00:30","1");
INSERT INTO producto VALUES("971","0959","CAJA KENDY #1- 0.35L ","CAJA KENDY #1 ","0959","CAJA KENDY #1 ","1","1","13","62","1","1","29","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-14 15:18:56","1");
INSERT INTO producto VALUES("972","0960","CAJA KENDY #1- 0.65L ","CAJA KENDY #1- 0.65L ","0960","CAJA KENDY #1","1","1","15","62","1","1","29","1","controlador/productos/img/default.png","3500.00","4500.00","ACTIVO","2024-06-14 15:19:46","1");
INSERT INTO producto VALUES("973","0961","CAJA KENDY #1- 0.5L ","CAJA KENDY #1- 0.55L ","0961","CAJA KENDY ","1","1","12","62","1","1","29","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-14 15:20:27","1");
INSERT INTO producto VALUES("974","0962","CAJA KENDY #1- 0.6L REDONDA ","CAJA KENDY #1- 0.6L ","0962","CAJA KENDY ","1","1","11","62","1","1","29","1","controlador/productos/img/default.png","3800.00","4800.00","ACTIVO","2024-06-14 15:21:07","1");
INSERT INTO producto VALUES("975","0963","RECIPIENTE HERMETICO 6 ONZAS #2 ","RECIPIENTE HERMETICO 6 ONZAS #2 ","0963","RECIPIENTE HERMETICO","1","","4","62","1","1","29","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-14 15:22:03","1");
INSERT INTO producto VALUES("976","0964","POTE TEWIS #3- 0.5L","POTE TEWIS #3- 0.5L","0964","POTE TEWIS ","1","1","19","62","1","1","28","1","controlador/productos/img/default.png","2700.00","3500.00","ACTIVO","2024-06-14 15:23:04","1");
INSERT INTO producto VALUES("977","0965","POTE TEWIS #2- 0.15L ","POTE TEWIS #3- 0.5L","0965","POTE TEWIS ","1","1","22","62","1","1","28","1","controlador/productos/img/default.png","1700.00","2500.00","ACTIVO","2024-06-14 15:24:03","1");
INSERT INTO producto VALUES("978","0966","RECIPIENTE TAPA ROSCA #1 ","RECIPIENTE TAPA ROSCA #1 ","0966","RECIPIENTE TAPA ROSCA ","1","1","2","62","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-14 15:24:48","1");
INSERT INTO producto VALUES("979","0967","EMBUDO GRANDE LOTE 311","EMBUDO GRANDE LOTE 311","0967","EMBUDO GRANDE ","1","1","21","62","1","1","28","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-14 15:25:48","1");
INSERT INTO producto VALUES("980","0968","EMBUDO PEQUEÑO  LOTE 30141","EMBUDO PEQUEÑO  LOTE 30141","0968","EMBUDO PEQUEÑO ","1","1","96","60","1","1","28","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-14 15:27:00","1");
INSERT INTO producto VALUES("981","0969","EMBUDO PEQUEÑO  PROMOCION ","EMBUDO PEQUEÑO  PROMOCION ","0969","EMBUDO PEQUEÑO  ","1","1","97","60","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-22 13:31:33","1");
INSERT INTO producto VALUES("982","0970","EMBUDO MEDIANO LOTE 15936","EMBUDO MEDIANO LOTE 15936","0970","EMBUDO MEDIANO ","1","1","5","60","1","1","28","1","controlador/productos/img/default.png","1800.00","2800.00","ACTIVO","2024-06-14 15:29:26","1");
INSERT INTO producto VALUES("983","0971","EMBUDO MEDIANO PROMOCION ","EMBUDO MEDIANO PROMOCION ","0971","EMBUDO MEDIANO ","1","1","61","60","1","1","28","1","controlador/productos/img/default.png","1700.00","2500.00","ACTIVO","2024-06-22 13:31:33","1");
INSERT INTO producto VALUES("984","0972","PORTACOMIDA CUADRADO PEQUEÑO","PORTACOMIDA CUADRADO PEQUEÑO","0972","PORTACOMIDA CUADRADO ","1","1","4","62","1","1","28","1","controlador/productos/img/default.png","3300.00","4500.00","ACTIVO","2024-06-14 15:35:50","1");
INSERT INTO producto VALUES("985","0973","CALDERO IMUSA #22","CALDERO IMUSA #22","0973","CALDERO IMUSA ","1","1","2","67","1","1","6","1","controlador/productos/img/default.png","198000.00","240000.00","ACTIVO","2024-06-22 10:11:52","1");
INSERT INTO producto VALUES("986","0974","CALDERO IMUSA #20","CALDERO IMUSA #20","0974","CALDERO IMUSA ","1","1","11","67","1","1","6","1","controlador/productos/img/default.png","142000.00","185000.00","ACTIVO","2024-06-14 15:37:34","1");
INSERT INTO producto VALUES("987","0975","CALDERO IMUSA #14","CALDERO IMUSA #14","0975","CALDERO IMUSA ","1","1","2","67","1","1","6","1","controlador/productos/img/default.png","100000.00","119000.00","ACTIVO","2024-06-14 15:38:03","1");
INSERT INTO producto VALUES("988","0976","CALDERO IMUSA #9","CALDERO IMUSA #9","0976","CALDERO IMUSA ","1","1","18","67","1","1","6","1","controlador/productos/img/default.png","62000.00","85000.00","ACTIVO","2024-06-14 15:38:35","1");
INSERT INTO producto VALUES("989","0977","CALDERO IMUSA #7","CALDERO IMUSA #7","0977","CALDERO IMUSA ","1","1","8","67","1","1","6","1","controlador/productos/img/default.png","58000.00","75000.00","ACTIVO","2024-06-14 15:39:46","1");
INSERT INTO producto VALUES("990","0978","CALDERO IMUSA #5","CALDERO IMUSA #5","0978","CALDERO IMUSA ","1","1","14","67","1","1","6","1","controlador/productos/img/default.png","52000.00","65000.00","ACTIVO","2024-06-14 15:40:16","1");
INSERT INTO producto VALUES("991","0979","CALDERO IMUSA #4","CALDERO IMUSA #4","0979","CALDERO IMUSA ","1","1","17","67","1","1","6","1","controlador/productos/img/default.png","48000.00","58000.00","ACTIVO","2024-06-14 15:40:54","1");
INSERT INTO producto VALUES("992","0980","CALDERO IMUSA #3","CALDERO IMUSA #3","0980","CALDERO IMUSA ","1","1","5","67","1","1","6","1","controlador/productos/img/default.png","38000.00","48000.00","ACTIVO","2024-06-14 15:41:22","1");
INSERT INTO producto VALUES("993","0981","CALDERO IMUSA #2","CALDERO IMUSA #2","0981","CALDERO IMUSA ","1","1","7","67","1","1","6","1","controlador/productos/img/default.png","32000.00","42000.00","ACTIVO","2024-06-14 15:42:26","1");
INSERT INTO producto VALUES("994","0982","CALDERO IMUSA #7 ANTIADERENTE ","CALDERO IMUSA #7 ANTIADERENTE ","0982","CALDERO IMUSA ","1","1","1","67","1","1","6","1","controlador/productos/img/default.png","75000.00","99000.00","ACTIVO","2024-06-14 15:43:17","1");
INSERT INTO producto VALUES("995","0983","CALDERO ARTESANAL #30","CALDERO ARTESANAL #30","0983","CALDERO ARTESANAL ","1","1","6","67","1","1","28","1","controlador/productos/img/default.png","50000.00","68000.00","ACTIVO","2024-06-14 15:44:33","1");
INSERT INTO producto VALUES("996","0984","CALDERO ARTESANAL #16","CALDERO ARTESANAL #16","0984","CALDERO ARTESANAL ","1","1","6","67","1","1","28","1","controlador/productos/img/default.png","35000.00","48000.00","ACTIVO","2024-06-14 15:45:02","1");
INSERT INTO producto VALUES("997","0985","CALDERO ARTESANAL #14","CALDERO ARTESANAL #14","0985","CALDERO ARTESANAL","1","1","6","67","1","1","28","1","controlador/productos/img/default.png","30000.00","42000.00","ACTIVO","2024-06-14 15:45:31","1");
INSERT INTO producto VALUES("998","0986","CALDERO ARTESANAL #12","CALDERO ARTESANAL #12","0986","CALDERO ARTESANAL ","1","1","6","67","1","1","28","1","controlador/productos/img/default.png","28000.00","39000.00","ACTIVO","2024-06-14 15:46:01","1");
INSERT INTO producto VALUES("999","0987","CALDERO ARTESANAL #10","CALDERO ARTESANAL #10","0987","CALDERO ARTESANAL ","1","1","4","67","1","1","28","1","controlador/productos/img/default.png","25000.00","35000.00","ACTIVO","2024-06-22 13:45:56","1");
INSERT INTO producto VALUES("1000","0988","CALDERO ARTESANAL #8","CALDERO ARTESANAL #8","0988","CALDERO ARTESANAL ","1","1","4","67","1","1","28","1","controlador/productos/img/default.png","20000.00","27001.00","ACTIVO","2024-06-14 15:47:07","1");
INSERT INTO producto VALUES("1001","0989","CALDERO ARTESANAL #6","CALDERO ARTESANAL #6","0989","CALDERO ARTESANAL ","1","1","4","67","1","1","28","1","controlador/productos/img/default.png","18000.00","25000.00","ACTIVO","2024-06-14 15:47:39","1");
INSERT INTO producto VALUES("1002","0990","LANA ESCOLAR","LANA ESCOLAR","0990","LANA ESCOLAR","1","5","21","59","1","1","28","1","controlador/productos/img/default.png","900.00","1500.00","ACTIVO","2024-06-15 16:15:07","1");
INSERT INTO producto VALUES("1003","0991","CORRECTOR LIQUIDO","CORRECTOR LIQUIDO","0991","CORRECTOR LIQUIDO","1","12","42","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1500.00","ACTIVO","2024-06-15 16:16:50","1");
INSERT INTO producto VALUES("1004","0992","IMPERMEABLE NIÑO","IMPERMEABLE NIÑO","0992","IMPERMEABLE NIÑO","1","3","18","59","1","1","28","1","controlador/productos/img/default.png","3500.00","5000.00","ACTIVO","2024-06-15 16:18:33","1");
INSERT INTO producto VALUES("1005","0993","DELANTAL ESCOLAR ","DELANTAL ESCOLAR ","0993","DELANTAL ESCOLAR ","1","3","8","59","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-15 16:19:57","1");
INSERT INTO producto VALUES("1006","0994","PALETAS ESCOLAR MULTICOLOR","PALETAS ESCOLAR","0994","PALETAS ESCOLAR","1","12","43","59","1","1","28","1","controlador/productos/img/default.png","1400.00","1900.00","ACTIVO","2024-06-15 16:21:12","1");
INSERT INTO producto VALUES("1007","0995","LIBRETA DE APUNTES","LIBRETA DE APUNTES","0995","LIBRETA DE APUNTES","1","6","6","59","1","1","28","1","controlador/productos/img/default.png","1200.00","2000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("1008","0996","LIBRETA DE APUNTES PLASTIFICADA","LIBRETA DE APUNTES","0996","LIBRETA DE APUNTES","1","6","10","59","1","1","28","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-15 16:23:36","1");
INSERT INTO producto VALUES("1009","0997","COSTITUCION POLITICA","COSTITUCION POLITICA","0997","COSTITUCION POLITICA","1","3","6","59","1","1","28","1","controlador/productos/img/default.png","1000.00","2000.00","ACTIVO","2024-06-15 16:24:43","1");
INSERT INTO producto VALUES("1010","0998","COLBON 20g","COLBON 20g","0998","COLBON 20g","1","6","72","59","1","1","28","1","controlador/productos/img/default.png","650.00","1000.00","ACTIVO","2024-06-15 16:26:17","1");
INSERT INTO producto VALUES("1011","0999","COLBON 40g","COLBON 40g","0999","COLBON 40g","1","6","9","59","1","1","28","1","controlador/productos/img/default.png","650.00","1000.00","ACTIVO","2024-06-15 16:29:50","1");
INSERT INTO producto VALUES("1012","1000","COLBON 125g","COLBON 125g","1000","COLBON 125g","1","6","8","59","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-15 16:31:54","1");
INSERT INTO producto VALUES("1013","1001","COLBON 240g","COLBON 240g","1001","COLBON 240g","1","6","6","59","1","1","28","1","controlador/productos/img/default.png","1900.00","2800.00","ACTIVO","2024-06-15 16:33:05","1");
INSERT INTO producto VALUES("1014","1004","TALONARIO DE RIFAS","TALONARIO DE RIFAS","1004","TALONARIO DE RIFAS","1","6","41","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-17 14:26:05","1");
INSERT INTO producto VALUES("1015","1002","SILICONA LIQUIDA 30ML","SILICONA LIQUIDA 30ML","1002","SILICONA LIQUIDA 30ML","1","6","6","59","1","1","28","1","controlador/productos/img/default.png","1400.00","2000.00","ACTIVO","2024-06-17 14:37:42","1");
INSERT INTO producto VALUES("1016","1003","SILICONA LIQUIDA 250ML","SILICONA LIQUIDA 250ML","1003","SILICONA LIQUIDA ","1","3","4","59","1","1","28","1","controlador/productos/img/default.png","6800.00","8500.00","ACTIVO","2024-06-17 14:38:55","1");
INSERT INTO producto VALUES("1017","1005","BORRADOR DE TABLERO","BORRADOR DE TABLERO","1005","BORRADOR DE TABLERO","1","3","12","59","1","1","28","1","controlador/productos/img/default.png","2100.00","2800.00","ACTIVO","2024-06-17 14:46:22","1");
INSERT INTO producto VALUES("1018","1006","TIZA DE BILLAR AZUL","BORRADOR DE TABLERO","1006","BORRADOR DE TABLERO","1","3","4","59","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-17 14:47:59","1");
INSERT INTO producto VALUES("1019","1007","TIZA DE BILLAR BLANCA*36","TIZA DE BILLAR BLANCA*36","1007","TIZA DE BILLAR BLANCA*36","1","3","7","59","1","1","28","1","controlador/productos/img/default.png","3600.00","4700.00","ACTIVO","2024-06-17 14:49:50","1");
INSERT INTO producto VALUES("1020","1008","GANCHO GRAPADORA ETERNA","GANCHO GRAPADORA ETERNA","1008","GANCHO GRAPADORA ETERNA","1","6","13","59","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-17 14:52:34","1");
INSERT INTO producto VALUES("1021","1009","GRAPADORA PEQUEÑA NORMAL","GRAPADORA PEQUEÑA NORMAL","1009","GRAPADORA PEQUEÑA NORMAL","1","3","12","59","1","1","28","1","controlador/productos/img/default.png","2800.00","4000.00","ACTIVO","2024-06-17 14:54:00","1");
INSERT INTO producto VALUES("1022","1010","GRAPADORA GRANDE","GRAPADORA GRANDE","1010","GRAPADORA GRANDE","1","3","2","59","1","1","28","1","controlador/productos/img/default.png","10500.00","14500.00","ACTIVO","2024-06-17 14:55:08","1");
INSERT INTO producto VALUES("1023","1011","GRAPADORA MEDIANA","GRAPADORA MEDIANA","1011","GRAPADORA ","1","3","6","59","1","1","28","1","controlador/productos/img/default.png","15000.00","19500.00","ACTIVO","2024-06-17 14:57:02","1");
INSERT INTO producto VALUES("1024","1012","GRAPADORA STAPLER","GRAPADORA STAPLER","1012","GRAPADORA STAPLER","1","3","3","59","1","1","28","1","controlador/productos/img/default.png","8000.00","9500.00","ACTIVO","2024-06-17 14:58:10","1");
INSERT INTO producto VALUES("1025","1013","CAJA DE GANCHO GRAPADORA PEQUEÑA","CAJA DE GANCHO GRAPADORA PEQUEÑA","1013","CAJA DE GANCHO GRAPADORA PEQUEÑA","1","6","21","59","1","1","28","1","controlador/productos/img/default.png","900.00","1500.00","ACTIVO","2024-06-17 14:59:57","1");
INSERT INTO producto VALUES("1026","1014","GRAPADORA MINI GRAPA PEQUEÑA","GRAPADORA MINI GRAPA PEQUEÑA","1014","GRAPADORA MINI GRAPA PEQUEÑA","1","3","11","59","1","1","28","1","controlador/productos/img/default.png","2000.00","2800.00","ACTIVO","2024-06-17 15:01:36","1");
INSERT INTO producto VALUES("1027","1015","TINTA PARA SELLO","TINTA PARA SELLO","1015","TINTA PARA SELLO","1","3","6","59","1","1","28","1","controlador/productos/img/default.png","2100.00","3000.00","ACTIVO","2024-06-17 15:02:40","1");
INSERT INTO producto VALUES("1028","1016","HUELLERO","HUELLERO","1016","HUELLERO","1","3","19","59","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-17 15:03:33","1");
INSERT INTO producto VALUES("1029","1017","ROLLO CINTA PEGA PRECIO S/REF","ROLLO CINTA PEGA PRECIO S/REF","1017","ROLLO CINTA PEGA PRECIO S/REF","1","10","100","59","1","1","28","1","controlador/productos/img/default.png","1200.00","1700.00","ACTIVO","2024-06-17 15:19:56","1");
INSERT INTO producto VALUES("1030","1018","ROLLO CINTA PEGA PRECIO C/REF","ROLLO CINTA PEGA PRECIO C/REF","1018","ROLLO CINTA PEGA PRECIO C/REF","1","10","49","59","1","1","28","1","controlador/productos/img/default.png","1300.00","1800.00","ACTIVO","2024-06-17 15:21:09","1");
INSERT INTO producto VALUES("1031","1019","CUCHILLA PARA EXACTO","CUCHILLA PARA EXACTO","1019","CUCHILLA PARA EXACTO","1","10","101","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1700.00","ACTIVO","2024-06-17 15:22:25","1");
INSERT INTO producto VALUES("1032","1020","LUPA GRANDE","LUPA","1020","GRANDE","1","2","3","59","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-18 09:35:38","1");
INSERT INTO producto VALUES("1033","1021","LUPA MEDIANA","LUPA","1021","MEDIANA","1"," 2","4","59","1","1","28","1","controlador/productos/img/default.png","1200.00","1800.00","ACTIVO","2024-06-18 09:39:13","1");
INSERT INTO producto VALUES("1034","1022","LUPA PEQEUÑA","LUPA","1022","PEQUEÑA","1","2","3","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1800.00","ACTIVO","2024-06-18 09:38:40","1");
INSERT INTO producto VALUES("1035","1023","GANCHO PARA LOTERIA MEDIANO","PARA LOTERIA","1023","GANCHO PARA LOTERIA","1","2","13","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-18 09:42:14","1");
INSERT INTO producto VALUES("1036","1024","GANCHO PARA LOTERIA PEQUEÑO","PARA LOTERIA","1024","GANCHO PARA LOTERIA","1","2","13","59","1","1","28","1","controlador/productos/img/default.png","500.00","800.00","ACTIVO","2024-06-18 09:43:32","1");
INSERT INTO producto VALUES("1037","1025","TIJERA SISA PEQEUÑA","PEQUEÑA","1025","SISA","1","2","4","59","1","1","28","1","controlador/productos/img/default.png","2800.00","3500.00","ACTIVO","2024-06-18 09:45:37","1");
INSERT INTO producto VALUES("1038","1026","TIJERA PUNTA ROMA","PUNTA ROMA","1026","TIJERA","1","2","2","59","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-18 09:47:24","1");
INSERT INTO producto VALUES("1039","1027","ESACTO ESCOLAR GRANDE","GRANDE","1027","ESCOLAR","1","2","24","59","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-18 09:48:35","1");
INSERT INTO producto VALUES("1040","1028","ESACTO ESCOLAR PEQUEÑO","PEQUEÑO","1028","ESCOLAR","1","2","4","59","1","1","28","1","controlador/productos/img/default.png","350.00","500.00","ACTIVO","2024-06-18 09:50:36","1");
INSERT INTO producto VALUES("1041","1029","SINTA SECRETARIA","SECRETARIA","1029","SECRETARIA","1","2","12","59","1","1","28","1","controlador/productos/img/default.png","300.00","500.00","ACTIVO","2024-06-18 09:52:08","1");
INSERT INTO producto VALUES("1042","1030","CHINCHE CABEZA DE PASTA","CABEZA DE PASTA","1030","CHINCHA","1","2","12","59","1","1","28","1","controlador/productos/img/default.png","2900.00","3800.00","ACTIVO","2024-06-18 09:53:29","1");
INSERT INTO producto VALUES("1043","1031","TEMPERAS X6","TEMPERAS","1031","X6","1","2","10","59","1","1","28","1","controlador/productos/img/default.png","2700.00","3500.00","ACTIVO","2024-06-18 09:54:59","1");
INSERT INTO producto VALUES("1044","1032","PLASTILINA GRANDE","PLASTILINA","1032","PLASTILINA","1","2","11","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1800.00","ACTIVO","2024-06-18 09:56:16","1");
INSERT INTO producto VALUES("1045","1033","PLASTILINA PEQEUÑA","PLASTILINA","1033","PLASTILINA","1","2","7","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-18 09:57:08","1");
INSERT INTO producto VALUES("1046","1034","CRAYOLA GRANDE","CRAYOLA","1034","GRANDE","1","2","3","59","1","1","28","1","controlador/productos/img/default.png","6200.00","7500.00","ACTIVO","2024-06-18 09:59:15","1");
INSERT INTO producto VALUES("1047","1035","VINILO GRANDE","VINILO","1035","GRANDE","1","","46","59","1","1","28","1","controlador/productos/img/default.png","1700.00","2500.00","ACTIVO","2024-06-18 12:18:51","1");
INSERT INTO producto VALUES("1048","1036","MARCADOR GRUESO","MARCADOR","1036","GRUESO","1","2","128","59","1","1","28","1","controlador/productos/img/default.png","1400.00","1700.00","ACTIVO","2024-06-18 10:02:22","1");
INSERT INTO producto VALUES("1049","1037","MARCADOR DELGADO X6","MARCADOR","1037","DELGADO","1","2","2","59","1","1","28","1","controlador/productos/img/default.png","2700.00","3500.00","ACTIVO","2024-06-18 10:03:46","1");
INSERT INTO producto VALUES("1050","1038","LAPICERO ETERNA","LAPICERO","1038","ETERNA","1","2","99","59","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-18 10:06:41","1");
INSERT INTO producto VALUES("1051","1039","LAPICERO TRIANGULAR","LAPICERO","1039","TRIANGULAR","1","10","320","59","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-18 10:09:19","1");
INSERT INTO producto VALUES("1052","1040","LAPIZ CORONA","LAPIZ","1040","LAPIZ","1","2","456","59","1","1","28","1","controlador/productos/img/default.png","200.00","500.00","ACTIVO","2024-06-20 16:56:39","1");
INSERT INTO producto VALUES("1053","1041","LAPIZ PLATINO","LAPIZ","1041","LAPIZ","1","2","250","59","1","1","28","1","controlador/productos/img/default.png","200.00","500.00","ACTIVO","2024-06-18 10:31:52","1");
INSERT INTO producto VALUES("1054","1042","LAPIZ MONGOL","LAPIZ","1042","LAPIZ","1","2","79","59","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-18 10:32:34","1");
INSERT INTO producto VALUES("1055","1043","LAPIZ PAPER MATE","LAPIZ","1043","LAPIZ","1","2","20","59","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-18 10:33:08","1");
INSERT INTO producto VALUES("1056","1044","LAPIZ ROJO","LAPIZ","1044","LAPIZ","1","2","58","59","1","1","28","1","controlador/productos/img/default.png","400.00","700.00","ACTIVO","2024-06-18 10:33:52","1");
INSERT INTO producto VALUES("1057","1045","PINCEL #3","PINCEL ","1045","PINCEL ","1","2","3","59","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-18 10:35:18","1");
INSERT INTO producto VALUES("1058","1046","PINCEL #5","PINCEL ","1046","PINCEL ","1","2","4","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-18 10:36:54","1");
INSERT INTO producto VALUES("1059","1047","PINCEL #6","PINCEL ","1047","PINCEL ","1","2","6","59","1","1","28","1","controlador/productos/img/default.png","800.00","1200.00","ACTIVO","2024-06-18 10:37:31","1");
INSERT INTO producto VALUES("1060","1048","PINCEL #7","PINCEL ","1048","PINCEL ","1","2","6","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1800.00","ACTIVO","2024-06-18 10:38:19","1");
INSERT INTO producto VALUES("1061","1049","PINCEL #8","PINCEL ","1049","PINCEL ","1","2","10","59","1","1","28","1","controlador/productos/img/default.png","1200.00","1600.00","ACTIVO","2024-06-18 10:39:18","1");
INSERT INTO producto VALUES("1062","1050","PINCEL #9","PINCEL ","1050","PINCEL ","1","2","5","59","1","1","28","1","controlador/productos/img/default.png","1300.00","1800.00","ACTIVO","2024-06-18 10:42:35","1");
INSERT INTO producto VALUES("1063","1051","PINCEL #10","PINCEL ","1051","PINCEL ","1","2","4","59","1","1","28","1","controlador/productos/img/default.png","1400.00","1900.00","ACTIVO","2024-06-18 10:43:11","1");
INSERT INTO producto VALUES("1064","1052","BORRADOR NATA","BORRADOR NATA","1052","BORRADOR NATA","1","2","154","59","1","1","28","1","controlador/productos/img/default.png","157.00","300.00","ACTIVO","2024-06-18 10:44:06","1");
INSERT INTO producto VALUES("1065","1053","SACAPUNTAS METALICO","SACAPUNTAS METALICO","1053","SACAPUNTAS METALICO","1","2","148","59","1","1","28","1","controlador/productos/img/default.png","140.00","300.00","ACTIVO","2024-06-18 10:45:00","1");
INSERT INTO producto VALUES("1066","1054","SACAPUNTAS PLASTICO","SACAPUNTAS PLASTICO","1054","SACAPUNTAS PLASTICO","1","2","228","59","1","1","28","1","controlador/productos/img/default.png","310.00","500.00","ACTIVO","2024-06-18 10:46:00","1");
INSERT INTO producto VALUES("1067","1055","ESCUADRA 45º","ESCUADRA 45º","1055","ESCUADRA 45º","1","2","9","59","1","1","28","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-18 11:02:05","1");
INSERT INTO producto VALUES("1068","1056","REGLA METALICA","REGLA METALICA","1056","REGLA METALICA","1","2","6","59","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-18 11:03:40","1");
INSERT INTO producto VALUES("1069","1057","REGLA DE MADERA","REGLA DE MADERA","1057","REGLA DE MADERA","1","2","21","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-18 11:04:20","1");
INSERT INTO producto VALUES("1070","1058","CAJA DE CHINCHE X50","CAJA DE CHINCHE X50","1058","CAJA DE CHINCHE X50","1","2","20","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1500.00","ACTIVO","2024-06-18 11:05:22","1");
INSERT INTO producto VALUES("1071","1059","LIBRETA 100 HOJAS NORMA","LIBRETA 100 HOJAS NORMA","1059","LIBRETA 100 HOJAS NORMA","1","2","157","59","1","1","28","1","controlador/productos/img/default.png","1800.00","2000.00","ACTIVO","2024-06-18 11:07:15","1");
INSERT INTO producto VALUES("1072","1060","LIBRETA 50 HOJAS NORMA","LIBRETA 50 HOJAS NORMA","1060","LIBRETA 50 HOJAS NORMA","1","2","3","59","1","1","28","1","controlador/productos/img/default.png","1400.00","1500.00","ACTIVO","2024-06-18 11:08:52","1");
INSERT INTO producto VALUES("1073","1061","LIBRETA PEQEUÑA 50 HOJAS NORMA","LIBRETA PEQEUÑA 50 HOJAS NORMA","1061","LIBRETA PEQUEÑA 50 HOJAS NORMA","1","2","15","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-18 11:10:24","1");
INSERT INTO producto VALUES("1074","1092","BLOCK TAMAÑO OFICIO","BLOCK TAMAÑO OFICIO","1062","BLOCK TAMAÑO OFICIO","1","2","36","59","1","1","28","1","controlador/productos/img/default.png","3400.00","4200.00","ACTIVO","2024-06-18 11:11:20","1");
INSERT INTO producto VALUES("1075","1063","BLOCK TAMAÑO CARTA","BLOCK TAMAÑO CARTA","1063","BLOCK TAMAÑO CARTA","1","2","27","59","1","1","28","1","controlador/productos/img/default.png","3500.00","3800.00","ACTIVO","2024-06-18 11:12:14","1");
INSERT INTO producto VALUES("1076","1064","RESMA TAMAÑO CARTA CARVAJAL","RESMA TAMAÑO CARTA CARVAJAL","1064","RESMA TAMAÑO CARTA CARVAJAL","1","2","3","59","1","1","28","1","controlador/productos/img/default.png","19000.00","24500.00","ACTIVO","2024-06-19 18:07:56","1");
INSERT INTO producto VALUES("1077","1065","RESMA TAMAÑO OFICIO CARVAJAL","RESMA TAMAÑO OFICIO CARVAJAL","1065","RESMA TAMAÑO OFICIO CARVAJAL","1","2","2","59","1","1","28","1","controlador/productos/img/default.png","18000.00","22500.00","ACTIVO","2024-06-18 11:27:28","1");
INSERT INTO producto VALUES("1078","1066","RESMA TAMAÑO OFICIO MARFIL","RESMA TAMAÑO OFICIO MARFIL","1066","RESMA TAMAÑO OFICIO MARFIL","1","2","2","59","1","1","28","1","controlador/productos/img/default.png","22000.00","28000.00","ACTIVO","2024-06-18 11:28:11","1");
INSERT INTO producto VALUES("1079","1067","FOAMI PEQUEÑO","FOAMI PEQUEÑO","1067","FOAMI PEQUEÑO","1","2","110","59","1","1","28","1","controlador/productos/img/default.png","350.00","500.00","ACTIVO","2024-06-18 11:29:22","1");
INSERT INTO producto VALUES("1080","1068","PAPEL COMETA","PAPEL COMETA","1068","PAPEL COMETA","1","2","300","59","1","1","28","1","controlador/productos/img/default.png","150.00","300.00","ACTIVO","2024-06-18 11:31:02","1");
INSERT INTO producto VALUES("1081","1069","CARTULINA PAGA DIARIO GRANDE","CARTULINA PAGA DIARIO GRANDE","1069","CARTULINA PAGA DIARIO GRANDE","1","2","12","59","1","1","28","1","controlador/productos/img/default.png","4200.00","6000.00","ACTIVO","2024-06-18 11:31:56","1");
INSERT INTO producto VALUES("1082","1070","CARTULINA PAGA DIARIO PEQEUÑA","CARTULINA PAGA DIARIO PEQEUÑA","1070","CARTULINA PAGA DIARIO PEQEUÑA","1","2","0","59","1","1","28","1","controlador/productos/img/default.png","3200.00","4500.00","ACTIVO","2024-06-18 11:32:45","1");
INSERT INTO producto VALUES("1083","1071","DICCIONARIO INGLES","DICCIONARIO INGLES","1071","DICCIONARIO INGLES","1","2","11","59","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-18 11:34:24","1");
INSERT INTO producto VALUES("1084","1072","DICCIONARIO ESPAÑOL","DICCIONARIO ESPAÑOL","1072","DICCIONARIO ESPAÑOL","1","2","9","59","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-18 11:35:18","1");
INSERT INTO producto VALUES("1085","1073","CARTILLA DE CARTON","CARTILLA DE CARTON","1073","CARTILLA DE CARTON","1","2","74","59","1","1","28","1","controlador/productos/img/default.png","350.00","500.00","ACTIVO","2024-06-18 11:37:02","1");
INSERT INTO producto VALUES("1086","1074","TABLA DE SUMAR","TABLA DE SUMAR","1074","TABLA DE SUMAR","1","2","26","59","1","1","28","1","controlador/productos/img/default.png","200.00","300.00","ACTIVO","2024-06-18 11:38:11","1");
INSERT INTO producto VALUES("1087","1075","SOPA DE LETRAS","SOPA DE LETRAS","1075","SOPA DE LETRAS","1","2","0","59","1","1","28","1","controlador/productos/img/default.png","1400.00","2000.00","ACTIVO","2024-06-20 16:56:38","1");
INSERT INTO producto VALUES("1088","1076","CARTUCHERA","CARTUCHERA","1076","CARTUCHERA","1","2","10","59","1","1","28","1","controlador/productos/img/default.png","2200.00","3000.00","ACTIVO","2024-06-18 11:40:26","1");
INSERT INTO producto VALUES("1089","1077","PARQUES","PARQUES","1077","PARQUES","1","2","46","59","1","1","28","1","controlador/productos/img/default.png","1800.00","2000.00","ACTIVO","2024-06-21 14:54:25","1");
INSERT INTO producto VALUES("1090","1078","FOLDER CARTON CON GANCHO","FOLDER CARTON CON GANCHO","1078","FOLDER CARTON CON GANCHO","1","2","31","59","1","1","28","1","controlador/productos/img/default.png","600.00","1000.00","ACTIVO","2024-06-18 11:42:29","1");
INSERT INTO producto VALUES("1091","1079","CARPETA PLASTICA","CARPETA PLASTICA","1079","CARPETA PLASTICA","1","6","6","59","1","1","28","1","controlador/productos/img/default.png","6000.00","7500.00","ACTIVO","2024-06-18 11:48:23","1");
INSERT INTO producto VALUES("1092","1080","CARPETA CON CAUCHO","CARPETA CON CAUCHO","1080","CARPETA CON CAUCHO","1","6","9","59","1","1","28","1","controlador/productos/img/default.png","2800.00","3500.00","ACTIVO","2024-06-18 11:49:54","1");
INSERT INTO producto VALUES("1093","1081","BOLSA MANILA GRANDE","BOLSA MANILA","1081","BOLSA MANILA","1","12","21","59","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-18 11:51:09","1");
INSERT INTO producto VALUES("1094","1082","BOLSA MANILA CORTA","BOLSA MANILA CORTA","1082","BOLSA MANILA","1","","40","59","1","1","28","1","controlador/productos/img/default.png","600.00","800.00","ACTIVO","2024-06-18 11:52:14","1");
INSERT INTO producto VALUES("1095","1083","TALONARIO FACTURA","TALONARIO FACTURA","1083","TALONARIO FACTURA","1","30","245","59","1","1","28","1","controlador/productos/img/default.png","600.00","800.00","ACTIVO","2024-06-18 11:53:34","1");
INSERT INTO producto VALUES("1096","1084","NACHO INICIAL","NACHO INICIAL","1084","NACHO INICIAL","1","3","9","59","1","1","28","1","controlador/productos/img/default.png","6500.00","8500.00","ACTIVO","2024-06-18 11:54:44","1");
INSERT INTO producto VALUES("1097","1085","NACHO LECTURA INTEGRADA","NACHO LECTURA INTEGRADA","1085","NACHO LECTURA INTEGRADA","1","3","12","59","1","1","28","1","controlador/productos/img/default.png","5500.00","7500.00","ACTIVO","2024-06-18 11:55:38","1");
INSERT INTO producto VALUES("1098","1086","NACHO ESCRIBE","NACHO ESCRIBE","1086","NACHO ESCRIBE","1","3","3","59","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-18 11:56:33","1");
INSERT INTO producto VALUES("1099","1087","NACHO INGLES","NACHO INGLES","1087","NACHO INGLES","1","3","3","59","1","1","28","1","controlador/productos/img/default.png","6000.00","7500.00","ACTIVO","2024-06-18 11:57:19","1");
INSERT INTO producto VALUES("1100","1088","FOAMI GRANDE ","FOAMI GRANDE ","1088","FOAMI GRANDE ","1","12","27","59","1","1","28","1","controlador/productos/img/default.png","1600.00","2000.00","ACTIVO","2024-06-18 11:58:01","1");
INSERT INTO producto VALUES("1101","1089","BOLSA REGALO GRANDE","BOLSA REGALO ","1089","BOLSA REGALO ","1","6","8","59","1","1","28","1","controlador/productos/img/default.png","2100.00","3000.00","ACTIVO","2024-06-18 11:58:50","1");
INSERT INTO producto VALUES("1102","1090","BOLSA REGALO  MEDIANA #3","BOLSA REGALO ","1090","BOLSA REGALO ","1","6","24","59","1","1","28","1","controlador/productos/img/default.png","2200.00","3000.00","ACTIVO","2024-06-18 12:00:43","1");
INSERT INTO producto VALUES("1103","1091","BOLSA REGALO MEDIANA #2","BOLSA REGALO ","1091","BOLSA REGALO ","1","6","5","59","1","1","28","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-18 12:01:41","1");
INSERT INTO producto VALUES("1104","1093","BOLSA REGALO  PEQEUÑA #3","BOLSA REGALO  PEQEUÑA #3","1093","BOLSA REGALO  PEQEUÑA #3","1","2","28","59","1","1","28","1","controlador/productos/img/default.png","1600.00","2000.00","ACTIVO","2024-06-18 13:50:53","1");
INSERT INTO producto VALUES("1105","1094","BOLSA REGALO  PEQEUÑA #2","BOLSA REGALO  PEQEUÑA #2","1094","BOLSA REGALO  PEQEUÑA #2","1","2","18","59","1","1","28","1","controlador/productos/img/default.png","1000.00","1500.00","ACTIVO","2024-06-18 13:52:48","1");
INSERT INTO producto VALUES("1106","1095","BOLSA REGALO  PEQEUÑA #1","BOLSA REGALO  PEQEUÑA #1","1095","BOLSA REGALO  PEQEUÑA #1","1","2","29","59","1","1","28","1","controlador/productos/img/default.png","600.00","1000.00","ACTIVO","2024-06-18 13:53:46","1");
INSERT INTO producto VALUES("1107","1096","TALCO VALNIS","TALCO VALNIS","1096","TALCO VALNIS","1","2","4","39","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-18 13:56:20","1");
INSERT INTO producto VALUES("1108","1097","CREMA CORPORAL","CREMA CORPORAL","1097","CREMA CORPORAL","1","2","6","39","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 13:57:37","1");
INSERT INTO producto VALUES("1109","1098","TALCO PARA PIE","TALCO PARA PIE","1098","TALCO PARA PIE","1","2","1","39","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-18 14:00:59","1");
INSERT INTO producto VALUES("1110","1099","ESPEJO CON MARCO","ESPEJO CON MARCO","1099","ESPEJO CON MARCO","1","2","11","60","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-18 14:02:35","1");
INSERT INTO producto VALUES("1111","1100","DOMINO SET OF 28","DOMINO SET OF 28","1100","DOMINO SET OF 28","1","2","6","20","1","1","28","1","controlador/productos/img/default.png","12500.00","19000.00","ACTIVO","2024-06-19 15:12:49","1");
INSERT INTO producto VALUES("1112","1101","DOMINO REF. 4807","DOMINO REF.4807","1101","DOMINO REF.4807","1","2","7","20","1","1","28","1","controlador/productos/img/default.png","8200.00","11000.00","ACTIVO","2024-06-18 14:06:29","1");
INSERT INTO producto VALUES("1113","1102","DOMINO REF. 4006 P","DOMINO REF. 4006 P","1102","DOMINO REF. 4006 P","1","2","10","20","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 14:07:19","1");
INSERT INTO producto VALUES("1114","1103","DOMINO CHISPITA #7","DOMINO CHISPITA #7","1103","DOMINO CHISPITA #7","1","2","3","20","1","1","28","1","controlador/productos/img/default.png","11500.00","15600.00","ACTIVO","2024-06-18 14:08:46","1");
INSERT INTO producto VALUES("1115","1104","CHUPA PARA BAÑO","CHUPA PARA BAÑO","1104","CHUPA PARA BAÑO","1","3","19","64","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-18 15:55:11","1");
INSERT INTO producto VALUES("1116","1105","CEPILLO LAVADOR AZUL VANIPLA","CEPILLO LAVADOR AZUL VANIPLA","1105","CEPILLO LAVADOR AZUL VANIPLA","1","3","11","64","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-18 15:56:46","1");
INSERT INTO producto VALUES("1117","1106","PERCHERO METALICO","PERCHERO METALICO","1106","PERCHERO METALICO","1","3","5","64","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-18 15:57:46","1");
INSERT INTO producto VALUES("1118","1107","COMEDERO  PERRO SILICONA","COEDERO PERRO SILICONA","1107","COEDERO PERRO SILICONA","1","3","8","60","1","1","28","1","controlador/productos/img/default.png","4500.00","6000.00","ACTIVO","2024-06-19 15:13:44","1");
INSERT INTO producto VALUES("1119","1108","COLADOR NP GRANDE","COLADOR NP","1108","COLADOR NP","1","6","33","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-19 15:15:38","1");
INSERT INTO producto VALUES("1120","1109","COLADOR PROMOCION GRANDE","COLADOR PROMOCION GRANDE","1109","COLADOR PROMOCION GRANDE","1","10","59","18","1","1","28","1","controlador/productos/img/default.png","1400.00","2000.00","ACTIVO","2024-06-18 16:02:39","1");
INSERT INTO producto VALUES("1121","1110","COLADOR GIRAR GRANDE","COLADOR GIRAR GRANDE","1110","COLADOR GIRAR GRANDE","1","10","92","18","1","1","28","1","controlador/productos/img/default.png","1700.00","2500.00","ACTIVO","2024-06-22 13:31:33","1");
INSERT INTO producto VALUES("1122","1111","COLADOR PROMOCION PEQUEÑO","COLADOR PROMOCION PEQUEÑO","1111","COLADOR PROMOCION PEQUEÑO","1","10","33","18","1","1","28","1","controlador/productos/img/default.png","1000.00","1500.00","ACTIVO","2024-06-18 16:05:27","1");
INSERT INTO producto VALUES("1123","1112","COLADOR GIRAR PEQUEÑO","COLADOR GIRAR PEQUEÑO","1112","COLADOR GIRAR PEQUEÑO","1","10","12","18","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-18 16:06:48","1");
INSERT INTO producto VALUES("1124","1113","COLADOR NP PEQUEÑO","COLADOR NP PEQUEÑO","1113","COLADOR NP PEQUEÑO","1","10","2","18","1","1","28","1","controlador/productos/img/default.png","2000.00","2500.00","ACTIVO","2024-06-18 16:07:45","1");
INSERT INTO producto VALUES("1125","1114","COLADOR INOXI PEQUEÑO","COLADOR INOXI PEQUEÑO","1114","COLADOR INOXI PEQUEÑO","1","3","4","18","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-18 16:10:23","1");
INSERT INTO producto VALUES("1126","1115","COLADOR METALICO 14CM IMUSA","COLADOR METALICO 14CM IMUSA","1115","COLADOR METALICO 14CM IMUSA","1","3","8","18","1","1","28","1","controlador/productos/img/default.png","11500.00","14500.00","ACTIVO","2024-06-18 16:16:42","1");
INSERT INTO producto VALUES("1127","1116","COLADOR METALICO 10CM IMUSA","COLADOR METALICO 10CM IMUSA","1116","COLADOR METALICO 10CM IMUSA","1","3","7","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 16:17:49","1");
INSERT INTO producto VALUES("1128","1117","COLADOR CONICO 24CM","COLADOR CONICO 24CM","1117","COLADOR CONICO 24CM","1","1","3","18","1","1","28","1","controlador/productos/img/default.png","17000.00","24500.00","ACTIVO","2024-06-18 16:19:02","1");
INSERT INTO producto VALUES("1129","1118","EXPRIMIDOR LIMON DKASA","EXPRIMIDOR LIMON DKASA","1118","EXPRIMIDOR LIMON DKASA","1","3","3","18","1","1","28","1","controlador/productos/img/default.png","7000.00","9600.00","ACTIVO","2024-06-18 16:23:30","1");
INSERT INTO producto VALUES("1130","1119","EXPRIMIDOR LIMON PEQUEÑO","EXPRIMIDOR LIMON PEQUEÑO","1119","EXPRIMIDOR LIMON PEQUEÑO","1","6","7","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-18 16:24:50","1");
INSERT INTO producto VALUES("1131","1120","EXPRIMIDOR LIMON MEDIANO","EXPRIMIDOR LIMON MEDIANO","1120","EXPRIMIDOR LIMON MEDIANO","1","6","3","18","1","1","28","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-19 13:38:22","1");
INSERT INTO producto VALUES("1132","1121","EXPRIMIDOR LIMON GRANDE","EXPRIMIDOR LIMON GRANDE","1121","EXPRIMIDOR LIMON GRANDE","1","6","7","18","1","1","28","1","controlador/productos/img/default.png","5500.00","7500.00","ACTIVO","2024-06-18 16:29:12","1");
INSERT INTO producto VALUES("1133","1122","PUNZON PICA HIELO","PUNZON PICA HIELO","1122","PUNZON PICA HIELO","1","6","20","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-18 16:30:36","1");
INSERT INTO producto VALUES("1134","1123","TENEDOR PICA HIELO","TENEDOR PICA HIELO","1123","TENEDOR PICA HIELO","1","3","5","18","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-18 16:31:51","1");
INSERT INTO producto VALUES("1135","1124","CUCHARA HELADERA GRANDE ","CUCHARA HELADERA GRANDE ","1124","CUCHARA HELADERA GRANDE ","1","6","19","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-22 13:31:33","1");
INSERT INTO producto VALUES("1136","1125","CUCHARA HELADERA PEQUEÑA","CUCHARA HELADERA PEQUEÑA","1125","CUCHARA HELADERA PEQUEÑA","1","6","11","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-18 16:37:05","1");
INSERT INTO producto VALUES("1137","1126","EXPRIMIDOR DE AJO","EXPRIMIDOR DE AJO","1126","EXPRIMIDOR DE AJO","1","3","4","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 16:38:29","1");
INSERT INTO producto VALUES("1138","1127","COLADOR CAFE ALAMBRE","COLADOR CAFE ALAMBRE","1127","COLADOR CAFE ALAMBRE","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","2000.00","2800.00","ACTIVO","2024-06-18 16:39:53","1");
INSERT INTO producto VALUES("1139","1128","PINZAS INOXI PEQUEÑA","PINZAS INOXI PEQUEÑA","1128","PINZAS INOXI PEQUEÑA","1","","10","18","1","1","28","1","controlador/productos/img/default.png","4500.00","6000.00","ACTIVO","2024-06-18 16:42:08","1");
INSERT INTO producto VALUES("1140","1129","TRITURADOR DE PAPA MAQUINA","TRITURADOR DE PAPA MAQUINA","1129","TRITURADOR DE PAPA MAQUINA","1","2","4","18","1","1","28","1","controlador/productos/img/default.png","16000.00","21000.00","ACTIVO","2024-06-18 16:43:10","1");
INSERT INTO producto VALUES("1141","1130","PINZA PEQUEÑA DKASA","PINZA PEQUEÑA DKASA","1130","PINZA PEQUEÑA DKASA","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-21 12:19:46","1");
INSERT INTO producto VALUES("1142","1131","CORTA PIZZA UNIVERSAL","CORTA PIZZA UNIVERSAL","1131","CORTA PIZZA UNIVERSAL","1","3","2","18","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-18 16:45:31","1");
INSERT INTO producto VALUES("1143","1132","CORTA PIZZA IMUSA","CORTA PIZZA IMUSA","1132","CORTA PIZZA IMUSA","1","3","9","18","1","1","28","1","controlador/productos/img/default.png","14000.00","19500.00","ACTIVO","2024-06-18 16:48:14","1");
INSERT INTO producto VALUES("1144","1133","EXPRIMIDOR DE AJO DKASA","EXPRIMIDOR DE AJO DKASA","1133","EXPRIMIDOR DE AJO DKASA","1","3","1","18","1","1","28","1","controlador/productos/img/default.png","15000.00","19500.00","ACTIVO","2024-06-18 16:49:16","1");
INSERT INTO producto VALUES("1145","1134","TIJERA DE COCINA DKASA","TIJERA DE COCINA DKASA","1134","TIJERA DE COCINA DKASA","1","1","5","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 16:50:24","1");
INSERT INTO producto VALUES("1146","1135","ABRE LATAS DKASA","ABRE LATAS DKASA","1135","ABRE LATAS DKASA","1","3","3","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-18 16:51:31","1");
INSERT INTO producto VALUES("1147","1136","PELADOR DE PAPA FASHION","PELADOR DE PAPA FASHION","1136","PELADOR DE PAPA FASHION","1","6","2","18","1","1","28","1","controlador/productos/img/default.png","1200.00","2000.00","ACTIVO","2024-06-18 16:53:04","1");
INSERT INTO producto VALUES("1148","1137","PELADOR DE PAPA PROMOCION","PELADOR DE PAPA PROMOCION","1137","PELADOR DE PAPA PROMOCION","1","10","16","18","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-18 16:54:11","1");
INSERT INTO producto VALUES("1149","1138","CORTA MANZANA","CORTA MANZANA","1138","CORTA MANZANA","1","1","5","18","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-18 16:55:02","1");
INSERT INTO producto VALUES("1150","1139","PALAUTRE DE COCINA ","PALAUTRE DE COCINA ","1139","PALAUTRE DE COCINA ","1","2","4","18","1","1","28","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-18 16:56:05","1");
INSERT INTO producto VALUES("1151","1140","ESPATULA DE SILICONA PEQUEÑA","ESPATULA DE SILICONA PEQUEÑA","1140","ESPATULA DE SILICONA PEQUEÑA","1","2","2","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 16:57:39","1");
INSERT INTO producto VALUES("1152","1141","MEDIDOR DE ONZAS","MEDIDOR DE ONZAS","1141","MEDIDOR DE ONZAS","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-18 17:00:44","1");
INSERT INTO producto VALUES("1153","1142","JUEGO DE PALINES *4  SUNPLAS","JUEGO DE PALINES *4  SUNPLAS","1142","JUEGO DE PALINES *4  SUNPLAS","1","6","27","18","1","1","28","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-18 17:02:35","1");
INSERT INTO producto VALUES("1154","1143","COLADOR DE TELA NP","COLADOR DE TELA NP","1143","COLADOR DE TELA NP","1","3","13","18","1","1","28","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-18 17:03:46","1");
INSERT INTO producto VALUES("1155","1144","CUCHARA PARA GRANOS PLASTICA","CUCHARA PARA GRANOS PLASTICA","1144","CUCHARA PARA GRANOS PLASTICA","1","3","14","18","1","1","28","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-18 17:05:17","1");
INSERT INTO producto VALUES("1156","1145","CUCHARA PARA GRANOS REY","CUCHARA PARA GRANOS REY","1145","CUCHARA PARA GRANOS REY","1","3","9","18","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-18 17:07:11","1");
INSERT INTO producto VALUES("1157","1146","GERINGA DE CREMA PASTEL","GERINGA DE CREMA PASTEL","1146","GERINGA DE CREMA PASTEL","1","3","10","18","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-18 17:08:17","1");
INSERT INTO producto VALUES("1158","1147","MANGA PASTELERA","MANGA PASTELERA","1147","MANGA PASTELERA","1","3","10","18","1","1","28","1","controlador/productos/img/default.png","8500.00","11500.00","ACTIVO","2024-06-18 17:09:30","1");
INSERT INTO producto VALUES("1159","1150","TRITURADOR DE PAPA MANUAL","TRITURADOR DE PAPA MANUAL","1150","TRITURADOR DE PAPA MANUAL","1","2","2","18","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-18 17:14:56","1");
INSERT INTO producto VALUES("1160","1151","SET*3 UTENCILIO DE COCINA","INCAMETAL","1151","INCAMETAL","1","2","2","18","1","1","28","1","controlador/productos/img/default.png","16000.00","22000.00","ACTIVO","2024-06-18 17:16:25","1");
INSERT INTO producto VALUES("1161","1152","TENEDOR DE ALUMINIO PEQUEÑO","TENEDOR DE ALUMINIO PEQUEÑO","1152","TENEDOR DE ALUMINIO PEQUEÑO","1","3","4","18","1","1","28","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-18 17:17:39","1");
INSERT INTO producto VALUES("1162","1153","CUCHARON INOXI DKASA","CUCHARON INOXI DKASA","1153","CUCHARON INOXI DKASA","1","3","4","18","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-18 17:18:40","1");
INSERT INTO producto VALUES("1163","1154","CUCHARON INOXI CHINO","CUCHARON INOXI CHINO","1154","CUCHARON INOXI CHINO","1","3","20","18","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-18 17:19:34","1");
INSERT INTO producto VALUES("1164","1155","PALA LISA INOXI DKASA","PALA LISA INOXI DKASA","1155","PALA LISA INOXI DKASA","1","3","1","18","1","1","28","1","controlador/productos/img/default.png","5000.00","9500.00","ACTIVO","2024-06-18 17:20:39","1");
INSERT INTO producto VALUES("1165","1157","CUCHARA ESPECIAL 34CM","CUCHARA ESPECIAL UNIVERSAL","1157","CUCHARA ESPECIAL","1","3","2","18","1","1","28","1","controlador/productos/img/default.png","8500.00","11000.00","ACTIVO","2024-06-18 17:22:34","1");
INSERT INTO producto VALUES("1166","1158","CUCHARA ESPECIAL 30CM","CUCHARA ESPECIAL 30CM","1158","CUCHARA ESPECIAL 30CM","1","3","1","18","1","1","28","1","controlador/productos/img/default.png","8500.00","11000.00","ACTIVO","2024-06-18 17:23:21","1");
INSERT INTO producto VALUES("1167","1159","ESPUMADERA ESPECIAL 35CM","ESPUMADERA ESPECIAL 35CM","1159","ESPUMADERA ESPECIAL 35CM","1","","1","18","1","1","28","1","controlador/productos/img/default.png","8500.00","11000.00","ACTIVO","2024-06-18 17:24:33","1");
INSERT INTO producto VALUES("1168","1160","CUCHARA NAILON IMUSA ","CUCHARA NAILON IMUSA ","1160","CUCHARA NAILON IMUSA ","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-19 11:13:41","1");
INSERT INTO producto VALUES("1169","1161","CUCHARON NAILON IMUSA","CUCHARON NAILON IMUSA","1161","CUCHARON NAILON IMUSA","1","3","3","18","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-19 11:14:43","1");
INSERT INTO producto VALUES("1170","1162","KIT UTENCILIOS *6 COCINA","KIT UTENCILIOS *6 ","1162","KIT UTENCILIOS *6 ","1","3","8","18","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-19 11:16:38","1");
INSERT INTO producto VALUES("1171","1163","CUCHARON PLASTICO REY","CUCHARON PLASTICO REY","1163","CUCHARON PLASTICO REY","1","3","1","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("1172","1164","CUCHARON PLASTICO PERSAL","CUCHARON PLASTICO PERSAL","1164","CUCHARON PLASTICO PERSAL","1","6","49","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-19 11:18:54","1");
INSERT INTO producto VALUES("1173","1165","CUCHARON PLASTICO PROMOCION","CUCHARON PLASTICO PROMOCION","1165","CUCHARON PLASTICO PROMOCION","1","6","42","18","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-20 09:34:51","1");
INSERT INTO producto VALUES("1174","1166","CUCHARON PLASTICO  EUSE PROMOCION","CUCHARON PLASTICO","1166","CUCHARON PLASTICO","1","6","31","18","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-19 11:20:55","1");
INSERT INTO producto VALUES("1175","1167","SANDUCHERA ALUMINIO","SANDUCHERA ALUMINIO","1167","SANDUCHERA ALUMINIO","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-19 11:23:09","1");
INSERT INTO producto VALUES("1176","1168","SARTEN ALUMINIO M/MADERA","SARTEN ALUMINIO M/MADERA","1168","SARTEN ALUMINIO M/MADERA","1","3","2","18","1","1","28","1","controlador/productos/img/default.png","10000.00","12000.00","ACTIVO","2024-06-19 11:24:57","1");
INSERT INTO producto VALUES("1177","1169","SARTEN 22CM OSARTY","SARTEN 22CM OSARTY","1169","SARTEN 22CM OSARTY","1","2","3","18","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-19 11:26:17","1");
INSERT INTO producto VALUES("1178","1170","PLANCHA ALUMINIO REDONDA #1","PLANCHA ALUMINIO","1170","PLANCHA ALUMINIO","1","3","3","18","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-19 11:32:34","1");
INSERT INTO producto VALUES("1179","1171","PLANCHA ALUMINIO REDONDA #2","PLANCHA ALUMINIO","1171","PLANCHA ALUMINIO","1","3","0","18","1","1","28","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-21 10:03:40","1");
INSERT INTO producto VALUES("1180","1172","TAJADOR DE ALUMINIO","TAJADOR DE ALUMINIO","1172","TAJADOR DE ALUMINIO","1","3","3","18","1","1","28","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-19 11:34:33","1");
INSERT INTO producto VALUES("1181","1173","CUCHARA PARA GRANO ALU/GRAN","CUCHARA PARA GRANO ALU/GRAN","1173","CUCHARA PARA GRANO ALU/GRAN","1","3","0","18","1","1","28","1","controlador/productos/img/default.png","13000.00","17000.00","ACTIVO","2024-06-19 11:37:46","1");
INSERT INTO producto VALUES("1182","1174","CUCHARA PARA GRANO ALU/MEDIA","CUCHARA PARA GRANO ALU/MEDIA","1174","CUCHARA PARA GRANO ALU/MEDIA","1","3","1","18","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-19 11:39:10","1");
INSERT INTO producto VALUES("1183","1175","CUCHARA PARA GRANO ALU/PEQ","CUCHARA PARA GRANO ALU/PEQ","1175","CUCHARA PARA GRANO ALU/PEQ","1","3","3","18","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-19 11:39:59","1");
INSERT INTO producto VALUES("1184","1176","MOLINILLO MADERA","MOLINILLO","1176","MOLINILLO","1","6","12","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-19 11:40:52","1");
INSERT INTO producto VALUES("1185","1177","MOLINILLO PLASTICO","MOLINILLO","1177","MOLINILLO","1","6","14","18","1","1","28","1","controlador/productos/img/default.png","3500.00","4500.00","ACTIVO","2024-06-19 11:41:30","1");
INSERT INTO producto VALUES("1186","1178","MOLINILLO ALAMBRE","MOLINILLO","1178","MOLINILLO","1","6","11","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-19 11:42:23","1");
INSERT INTO producto VALUES("1187","1179","PINZA DKASA GRANDE ","PINZA DKASA GRANDE ","1179","PINZA DKASA GRANDE ","1","3","28","18","1","1","28","1","controlador/productos/img/default.png","12000.00","16000.00","ACTIVO","2024-06-19 11:43:29","1");
INSERT INTO producto VALUES("1188","1180","PINZA ASADOS GRANDE ","PINZA AZADOS GRANDE ","1180","PINZA AZADOS GRANDE ","1","3","2","18","1","1","28","1","controlador/productos/img/default.png","8500.00","11500.00","ACTIVO","2024-06-20 15:41:56","1");
INSERT INTO producto VALUES("1189","1181","CUCHARA INCAMETAL EXTRALARGA","INCAMETAL EXTRALARGA","1181","INCAMETAL EXTRALARGA","1","2","1","18","1","1","28","1","controlador/productos/img/default.png","14000.00","17500.00","ACTIVO","2024-06-19 11:45:37","1");
INSERT INTO producto VALUES("1190","1182","PALA INCAMETAL EXTRALARGA","INCAMETAL EXTRALARGA","1182","INCAMETAL EXTRALARGA","1","2","1","18","1","1","28","1","controlador/productos/img/default.png","14000.00","17500.00","ACTIVO","2024-06-19 11:46:19","1");
INSERT INTO producto VALUES("1191","1183","PALA ALUMINIO M/MADERA","PALA ALUMINIO M/MADERA","1183","PALA ALUMINIO M/MADERA","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-19 11:47:23","1");
INSERT INTO producto VALUES("1192","1184","CUCHARA INDUSTRIAL","CUCHARA INDUSTRIAL","1184","CUCHARA INDUSTRIAL","1","3","11","18","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-19 11:48:32","1");
INSERT INTO producto VALUES("1193","1185","CUCHARA INDUSTRIAL M/MADERA","CUCHARA INDUSTRIAL","1185","CUCHARA INDUSTRIAL","1","3","8","18","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-21 12:19:46","1");
INSERT INTO producto VALUES("1194","1186","CUCHARA INDUSTRIAL M/ALUMI","CUCHARA INDUSTRIAL","1186","CUCHARA INDUSTRIAL","1","3","4","18","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-22 10:11:51","1");
INSERT INTO producto VALUES("1195","1187","ESPUMADERA INDUSTRIAL","ESPUMADERA INDUSTRIAL","1187","ESPUMADERA INDUSTRIAL","1","3","8","18","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-19 11:51:57","1");
INSERT INTO producto VALUES("1196","1188","PALA INDUSTRIAL","PALA INDUSTRIAL","1188","PALA INDUSTRIAL","1","3","6","18","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-19 11:52:41","1");
INSERT INTO producto VALUES("1197","1189","COLADOR INOXI 20CM","COLADOR INOXI 20CM","1189","COLADOR INOXI 20CM","1","3","9","18","1","1","28","1","controlador/productos/img/default.png","14000.00","17000.00","ACTIVO","2024-06-19 11:53:53","1");
INSERT INTO producto VALUES("1198","1190","CUCHARON PETERO","CUCHARON PETERO","1190","CUCHARON PETERO","1","1","2","18","1","1","28","1","controlador/productos/img/default.png","22000.00","32000.00","ACTIVO","2024-06-19 11:55:23","1");
INSERT INTO producto VALUES("1199","1191","COLADOR ACEITE MINI","COLADOR ACEITE MINI","1191","COLADOR ACEITE MINI","1","3","11","18","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-19 11:56:19","1");
INSERT INTO producto VALUES("1200","1192","TAZA CON COLADOR REY","TAZA CON COLADOR REY","1192","TAZA CON COLADOR REY","1","2","4","18","1","1","28","1","controlador/productos/img/default.png","10500.00","13500.00","ACTIVO","2024-06-19 11:57:27","1");
INSERT INTO producto VALUES("1201","1193","COMEDERO DE PERRO","COMEDERO DE PERRO","1193","COMEDERO DE PERRO","1","3","14","18","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-19 11:58:20","1");
INSERT INTO producto VALUES("1202","1194","COLADOR KENDI GRANDE ","COLADOR KENDI GRANDE ","1194","COLADOR KENDI GRANDE ","1","3","9","18","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-19 11:59:26","1");
INSERT INTO producto VALUES("1203","1195","ESCURRIDOR MUNDIPLAS","ESCURRIDOR MUNDIPLAS","1195","ESCURRIDOR MUNDIPLAS","1","3","8","18","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-19 12:00:29","1");
INSERT INTO producto VALUES("1204","1196","CABA ICOPOR 26L T/AZUL","CABA ICOPOR 26L TAPA AZUL","119","CABA ICOPOR 26L TAPA AZUL","1","6","24","29","1","1","28","1","controlador/productos/img/default.png","15000.00","27000.00","ACTIVO","2024-06-19 12:14:56","1");
INSERT INTO producto VALUES("1205","1197","CABA ICOPOR 42L T/AZUL","CABA ICOPOR","1197","CABA ICOPOR","1","6","23","29","1","1","28","1","controlador/productos/img/default.png","20000.00","35000.00","ACTIVO","2024-06-20 10:56:00","1");
INSERT INTO producto VALUES("1206","1198","TANQUE ICOPOR 100L T/ZUL","CABA ICOPOR","1198","CABA ICOPOR","1","2","6","29","1","1","28","1","controlador/productos/img/default.png","45000.00","65000.00","ACTIVO","2024-06-19 12:13:07","1");
INSERT INTO producto VALUES("1207","1199","TANQUE  ICOPOR 130L T/AZUL","TANQUE  ICOPOR 130L T/AZUL","1199","TANQUE  ICOPOR 130L T/AZUL","1","2","3","29","1","1","28","1","controlador/productos/img/default.png","60000.00","90000.00","ACTIVO","2024-06-19 12:14:10","1");
INSERT INTO producto VALUES("1208","1200","BOTA DE TRABAJO REF 126","BOTA DE TRABAJO REF 126","1200","BOTA DE TRABAJO REF 126","1","2","6","52","1","1","2","1","controlador/productos/img/default.png","75000.00","98000.00","ACTIVO","2024-06-19 13:35:25","1");
INSERT INTO producto VALUES("1209","1201","BOTA DE TRABAJO REF 036","BOTA DE TRABAJO REF 036","1201","BOTA DE TRABAJO REF 036","1","2","8","52","1","1","2","1","controlador/productos/img/default.png","85000.00","115000.00","ACTIVO","2024-06-19 13:36:18","1");
INSERT INTO producto VALUES("1210","1202","BOTA DE TRABAJO REF 903","BOTA DE TRABAJO REF 903","1202","BOTA DE TRABAJO REF 903","1","2","6","52","1","1","2","1","controlador/productos/img/default.png","70000.00","92000.00","ACTIVO","2024-06-19 13:37:08","1");
INSERT INTO producto VALUES("1211","1203","DOMINO REF 3796","DOMINO REF 3796","1203","DOMINO REF 3796","1","3","2","20","1","1","2","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-19 14:07:03","1");
INSERT INTO producto VALUES("1212","1204","DOMINO LATA REF 5010","DOMINO LATA REF 5010","1204","DOMINO LATA REF 5010","1","3","1","20","1","1","2","1","controlador/productos/img/default.png","18000.00","24000.00","ACTIVO","2024-06-19 14:08:08","1");
INSERT INTO producto VALUES("1213","1205","DOMINO LATA REF 10555","DOMINO LATA REF 10555","1205","DOMINO LATA REF 10555","1","3","2","20","1","1","2","1","controlador/productos/img/default.png","16000.00","22000.00","ACTIVO","2024-06-19 14:09:21","1");
INSERT INTO producto VALUES("1214","1206","CUBO RUBIK","CUBO RUBIK","1206","CUBO RUBIK","1","3","11","20","1","1","2","1","controlador/productos/img/default.png","5100.00","7500.00","ACTIVO","2024-06-19 14:11:36","1");
INSERT INTO producto VALUES("1215","1207","YENGA DE MADERA","YENGA DE MADERA","1207","YENGA DE MADERA","1","3","6","20","1","1","2","1","controlador/productos/img/default.png","5100.00","7500.00","ACTIVO","2024-06-19 14:12:32","1");
INSERT INTO producto VALUES("1216","1208","AJEDRES #3321","AJEDRES #3321","1208","AJEDRES #3321","1","","3","20","1","1","2","1","controlador/productos/img/default.png","8200.00","11500.00","ACTIVO","2024-06-19 14:13:57","1");
INSERT INTO producto VALUES("1217","1209","AJEDRES PEQUEÑO REF 0291","AJEDRES PEQUEÑO REF 0291","1209","AJEDRES PEQUEÑO REF 0291","1","3","4","20","1","1","2","1","controlador/productos/img/default.png","2300.00","4500.00","ACTIVO","2024-06-19 14:15:08","1");
INSERT INTO producto VALUES("1218","1210","BINGO CON CARTA","BINGO CON CARTA","1210","BINGO CON CARTA","1","3","4","20","1","1","2","1","controlador/productos/img/default.png","9500.00","13500.00","ACTIVO","2024-06-19 14:16:13","1");
INSERT INTO producto VALUES("1219","1211","FICHAS DE BINGO","FICHAS DE BINGO","1211","FICHAS DE BINGO","1","3","9","20","1","1","2","1","controlador/productos/img/default.png","2200.00","3500.00","ACTIVO","2024-06-19 14:18:30","1");
INSERT INTO producto VALUES("1220","1212","SIGLO","SIGLO","1212","SIGLO","1","3","2","20","1","1","2","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-19 14:19:16","1");
INSERT INTO producto VALUES("1221","1213","YOYO","YOYO","1213","YOYO","1","3","16","20","1","1","2","1","controlador/productos/img/default.png","2700.00","3500.00","ACTIVO","2024-06-19 14:20:09","1");
INSERT INTO producto VALUES("1222","1214","BINICULARES 6*35","BINICULARES 6*35","1214","BINICULARES 6*35","1","3","6","20","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-19 14:21:09","1");
INSERT INTO producto VALUES("1223","1215","BETUN NEGRO PEQUEÑO","BETUN NEGRO PEQUEÑO","1215","BETUN NEGRO PEQUEÑO","1","6","58","69","1","1","2","1","controlador/productos/img/default.png","1450.00","2000.00","ACTIVO","2024-06-22 15:39:18","1");
INSERT INTO producto VALUES("1224","1216","BETUN CAFE PEQUEÑO","BETUN CAFE PEQUEÑO","1216","BETUN CAFE PEQUEÑO","1","3","14","60","1","1","2","1","controlador/productos/img/default.png","1450.00","2000.00","ACTIVO","2024-06-19 14:23:51","1");
INSERT INTO producto VALUES("1225","1217","BETUN 30g ","BETUN 30g ","1217","BETUN 30g ","1","3","11","60","1","1","2","1","controlador/productos/img/default.png","2900.00","3700.00","ACTIVO","2024-06-19 14:25:17","1");
INSERT INTO producto VALUES("1226","1218","CEPILLO EMBOLAR GRANDE","CEPILLO EMBOLAR GRANDE","1218","CEPILLO EMBOLAR GRANDE","1","3","5","60","1","1","2","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-19 14:26:18","1");
INSERT INTO producto VALUES("1227","1219","CEPILLO EMBOLAR BRITNOY","CEPILLO EMBOLAR BRITNOY","1219","CEPILLO EMBOLAR BRITNOY","1","3","7","60","1","1","2","1","controlador/productos/img/default.png","5000.00","6700.00","ACTIVO","2024-06-19 14:27:49","1");
INSERT INTO producto VALUES("1228","1220","CEPILLO EMBOLAR REF 0468","CEPILLO EMBOLAR REF 0468","1220","CEPILLO EMBOLAR REF 0468","1","3","6","60","1","1","2","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-19 14:36:51","1");
INSERT INTO producto VALUES("1229","1221","CEPILLO EMBOLAR PEQUEÑO","CEPILLO EMBOLAR PEQUEÑO","1221","CEPILLO EMBOLAR PEQUEÑO","1","3","11","60","1","1","2","1","controlador/productos/img/default.png","1900.00","2800.00","ACTIVO","2024-06-19 14:37:56","1");
INSERT INTO producto VALUES("1230","1222","LIGA GRANDE ","LIGA GRANDE ","1222","LIGA GRANDE ","1","3","8","60","1","1","2","1","controlador/productos/img/default.png","12000.00","17500.00","ACTIVO","2024-06-19 14:39:20","1");
INSERT INTO producto VALUES("1231","1223","LIGA 300 GRAMOS ","LIGA 300 GRAMOS ","1223","LIGA 300 GRAMOS ","1","3","11","60","1","1","2","1","controlador/productos/img/default.png","9500.00","13500.00","ACTIVO","2024-06-19 14:40:26","1");
INSERT INTO producto VALUES("1232","1224","LIGA 100 GRAMOS ","LIGA 100 GRAMOS ","1224","LIGA 100 GRAMOS ","1","3","11","60","1","1","2","1","controlador/productos/img/default.png","3200.00","4500.00","ACTIVO","2024-06-19 14:41:18","1");
INSERT INTO producto VALUES("1233","1225","LIGA 1/4L","LIGA 1/4L","1225","LIGA 1/4L","1","3","2","60","1","1","2","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-19 14:42:41","1");
INSERT INTO producto VALUES("1234","1226","ESPEJO #5","ESPEJO #5","1226","ESPEJO #5","1","3","21","60","1","1","2","1","controlador/productos/img/default.png","3500.00","5000.00","ACTIVO","2024-06-19 14:43:44","1");
INSERT INTO producto VALUES("1235","1227","ESPEJO #3","ESPEJO #3","1227","ESPEJO #3","1","3","23","60","1","1","2","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-19 14:44:37","1");
INSERT INTO producto VALUES("1236","1228","ESPEJO #2","ESPEJO #2","1228","ESPEJO #2","1","3","11","60","1","1","2","1","controlador/productos/img/default.png","1600.00","2500.00","ACTIVO","2024-06-22 09:55:11","1");
INSERT INTO producto VALUES("1237","1229","ESPEJO #1","ESPEJO #1","1229","ESPEJO #1","1","3","3","60","1","1","2","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-19 14:50:06","1");
INSERT INTO producto VALUES("1238","1230","ESPEJO #7","ESPEJO #7","1230","ESPEJO #7","1","3","1","60","1","1","2","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-19 14:50:46","1");
INSERT INTO producto VALUES("1239","1231","BOLSA NN*10","BOLSA NN*10","1231","BOLSA NN*10","1","3","30","65","1","1","2","1","controlador/productos/img/default.png","4100.00","5500.00","ACTIVO","2024-06-19 15:07:09","1");
INSERT INTO producto VALUES("1240","1232","PALO DE ESCOBA ","PALO DE ESCOBA ","1232","PALO DE ESCOBA ","1","6","24","65","1","1","2","1","controlador/productos/img/default.png","1950.00","2700.00","ACTIVO","2024-06-19 15:07:28","1");
INSERT INTO producto VALUES("1241","1233","CEPILLO BARRE CALLE INDUSTRIAL","CEPILLO BARRE CALLE INDUSTRIAL","1233","CEPILLO BARRE CALLE INDUSTRIAL","1","3","6","65","1","1","2","1","controlador/productos/img/default.png","13800.00","17500.00","ACTIVO","2024-06-19 15:06:08","1");
INSERT INTO producto VALUES("1242","1234","HISOPO REDONDO PROMOCION","HISOPO REDONDO PROMOCION","1234","HISOPO REDONDO PROMOCION","1","3","24","64","1","1","28","1","controlador/productos/img/default.png","3850.00","5500.00","ACTIVO","2024-06-19 15:26:08","1");
INSERT INTO producto VALUES("1255","1235","TROMPO GRANDE ","TROMPO GRANDE ","1235","TROMPO GRANDE ","1","2","3","20","1","1","2","1","controlador/productos/img/default.png","10000.00","12000.00","ACTIVO","2024-06-20 14:36:49","1");
INSERT INTO producto VALUES("1256","1236","TROMPO PEQEÑO *12","TROMPO PEQEÑO *12","1236","TROMPO PEQEÑO *12","1","3","6","20","1","1","2","1","controlador/productos/img/default.png","6800.00","8500.00","ACTIVO","2024-06-20 14:37:39","1");
INSERT INTO producto VALUES("1257","1237","BOLITA DE CRISTAL","BOLITA DE CRISTAL","1237","BOLITA DE CRISTAL","1","6","19","20","1","1","2","1","controlador/productos/img/default.png","1600.00","2000.00","ACTIVO","2024-06-22 09:43:56","1");
INSERT INTO producto VALUES("1258","1238","TAPAS DE PRECION","TAPAS DE PRECION","1238","TAPAS DE PRECION","1","200","1100","69","1","1","2","1","controlador/productos/img/default.png","80.00","150.00","ACTIVO","2024-06-22 15:39:47","1");
INSERT INTO producto VALUES("1259","1239","ATOMIZADOR 600CC","ATOMIZADOR 600CC","1239","ATOMIZADOR 600CC","1","3","5","60","1","1","2","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-20 14:44:34","1");
INSERT INTO producto VALUES("1260","1240","ATOMIZADOR GRANDE ","ATOMIZADOR GRANDE ","1240","ATOMIZADOR GRANDE ","1","6","44","60","1","1","2","1","controlador/productos/img/default.png","2200.00","3000.00","ACTIVO","2024-06-20 14:45:31","1");
INSERT INTO producto VALUES("1261","1241","DISPENSADOR PARA JABON LIQUIDO","DISPENSADOR","1241","DISPENSADOR","1","3","12","60","1","1","2","1","controlador/productos/img/default.png","2500.00","3500.00","ACTIVO","2024-06-20 14:46:29","1");
INSERT INTO producto VALUES("1262","1242","ATOMIZADOR PEQUEÑO PROMOCION","ATOMIZADOR PEQUEÑO PROMOCION","1242","ATOMIZADOR PEQUEÑO PROMOCION","1","6","44","60","1","1","2","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-20 14:47:31","1");
INSERT INTO producto VALUES("1263","1243","ATOMIZADOR MINI ","ATOMIZADOR MINI ","1243","ATOMIZADOR MINI ","1","6","32","60","1","1","2","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-20 14:48:13","1");
INSERT INTO producto VALUES("1264","1244","PAQUETE CUCHARA PLASTICA *4"," CUCHARA PLASTICA *4","1244"," CUCHARA PLASTICA *4","1","3","7","60","1","1","2","1","controlador/productos/img/default.png","1400.00","1800.00","ACTIVO","2024-06-20 14:49:17","1");
INSERT INTO producto VALUES("1265","1245","ATOMIZADOR PEQUEÑO ","ATOMIZADOR PEQUEÑO ","1245","ATOMIZADOR PEQUEÑO ","1","6","12","60","1","1","2","1","controlador/productos/img/default.png","2000.00","2800.00","ACTIVO","2024-06-20 14:50:03","1");
INSERT INTO producto VALUES("1266","1246","PARRILLA ASADORA REDONDA ANTI..","REDONDA ANTI..","1246","REDONDA ANTI..","1","3","10","18","1","1","2","1","controlador/productos/img/default.png","8000.00","10500.00","ACTIVO","2024-06-20 15:41:15","1");
INSERT INTO producto VALUES("1267","1247","PARRILLA ASADORA CUADRADA  ANTI..","CUADRADA  ANTI..","1247","CUADRADA  ANTI..","1","2","11","18","1","1","2","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-20 15:41:34","1");
INSERT INTO producto VALUES("1268","1248","SARTEN TIPO MOJARRA","SARTEN TIPO MOJARRA","1248","SARTEN TIPO MOJARRA","1","1","1","18","1","1","2","1","controlador/productos/img/default.png","10000.00","15500.00","ACTIVO","2024-06-20 15:00:09","1");
INSERT INTO producto VALUES("1269","1249","PARRILLA ASADO METALICA","PARRILLA ASADO METALICA","1249","PARRILLA ASADO METALICA","1","3","12","18","1","1","2","1","controlador/productos/img/default.png","4500.00","6500.00","ACTIVO","2024-06-20 15:01:02","1");
INSERT INTO producto VALUES("1270","1250","PARRILLA ASADO REDONDA","PARRILLA ASADO ","1250","PARRILLA ASADO ","1","3","9","18","1","1","2","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-20 15:02:55","1");
INSERT INTO producto VALUES("1271","1251","CUCHARRA ARROCERA #2 PULIDA ","CUCHARRA ARROCERA #2 PULIDA ","1251","CUCHARRA ARROCERA #2 PULIDA ","1","12","52","18","1","1","2","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-22 10:11:52","1");
INSERT INTO producto VALUES("1272","1252","CUCHARRA ARROCERA #2 RUSTICA","CUCHARRA ARROCERA #2 RUSTICA","1252","CUCHARRA ARROCERA #2 RUSTICA","1","12","28","18","1","1","2","1","controlador/productos/img/default.png","3200.00","4000.00","ACTIVO","2024-06-20 15:05:57","1");
INSERT INTO producto VALUES("1273","1253","CUCHARRA ARROCERA #1 RUSTICA","CUCHARRA ARROCERA #1 RUSTICA","1253","CUCHARRA ARROCERA #1 RUSTICA","1","6","41","18","1","1","2","1","controlador/productos/img/default.png","2800.00","3500.00","ACTIVO","2024-06-22 13:45:57","1");
INSERT INTO producto VALUES("1274","1254","CUCHARRA ARROCERA #1 PULIDA","CUCHARRA ARROCERA ","1254","CUCHARRA ARROCERA ","1","","8","18","1","1","2","1","controlador/productos/img/default.png","3200.00","4000.00","ACTIVO","2024-06-20 15:07:35","1");
INSERT INTO producto VALUES("1275","1255","PALANGANA ALUMINIO","PALANGANA ALUMINIO","1255","PALANGANA ALUMINIO","1","1","5","18","1","1","2","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-20 15:08:24","1");
INSERT INTO producto VALUES("1276","1256","ASADOR DE CARNE M/MADERA","ASADOR DE CARNE M/MADERA","1256","ASADOR DE CARNE M/MADERA","1","1","4","18","1","1","2","1","controlador/productos/img/default.png","25000.00","35000.00","ACTIVO","2024-06-20 15:13:13","1");
INSERT INTO producto VALUES("1277","1257","MOLDE DE AREPA GRANDE C/RESORTE","MOLDE DE AREPA","1257","MOLDE DE AREPA","1","2","5","18","1","1","2","1","controlador/productos/img/default.png","8500.00","11500.00","ACTIVO","2024-06-20 15:14:16","1");
INSERT INTO producto VALUES("1278","1258","MOLDE DE AREPA PÈQUEÑO C/RESORTE","MOLDE DE AREPA","1258","MOLDE DE AREPA","1","2","3","18","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-20 15:15:01","1");
INSERT INTO producto VALUES("1279","1259","MOLDE EMPANADA P/GRANDE","MOLDE EMPANADA P/GRANDE","1259","MOLDE EMPANADA P/GRANDE","1","3","19","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-20 15:15:58","1");
INSERT INTO producto VALUES("1280","1260","PATACONERA ALUMINIO PEQUEÑA","PATACONERA ALUMINIO","1260","PATACONERA ALUMINIO","1","2","4","18","1","1","2","1","controlador/productos/img/default.png","15000.00","22000.00","ACTIVO","2024-06-20 15:16:54","1");
INSERT INTO producto VALUES("1281","1261","PATACONERA ALUMINIO MEDIANA","PATACONERA ALUMINIO","1261","PATACONERA ALUMINIO","1","2","3","18","1","1","2","1","controlador/productos/img/default.png","17000.00","25000.00","ACTIVO","2024-06-20 15:17:29","1");
INSERT INTO producto VALUES("1282","1262","MOLDE EMPANADA ALUMINIO","MOLDE EMPANADA ALUMINIO","1262","MOLDE EMPANADA ALUMINIO","1","2","9","18","1","1","2","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-20 15:18:17","1");
INSERT INTO producto VALUES("1283","1263","CORTA AREPA ALUMINIO","CORTA AREPA ALUMINIO","1263","CORTA AREPA ALUMINIO","1","2","6","18","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-20 15:19:20","1");
INSERT INTO producto VALUES("1284","1264","MARTILLO ALUMINIO GRANDE","MARTILLO ALUMINIO","1264","MARTILLO ALUMINIO","1","2","7","18","1","1","2","1","controlador/productos/img/default.png","10000.00","14500.00","ACTIVO","2024-06-20 15:20:19","1");
INSERT INTO producto VALUES("1285","1265","MARTILLO ALUMINIO PEQUEÑO","MARTILLO ALUMINIO","1265","MARTILLO ALUMINIO","1","2","2","18","1","1","2","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-20 15:20:49","1");
INSERT INTO producto VALUES("1286","1266","PORCIONADOR DE ARROZ","PORCIONADOR DE ARROZ","1266","PORCIONADOR DE ARROZ","1","2","24","18","1","1","2","1","controlador/productos/img/default.png","4000.00","6500.00","ACTIVO","2024-06-20 15:21:34","1");
INSERT INTO producto VALUES("1287","1267","PLATO LAMINA P/AREPA","PLATO LAMINA P/AREPA","1267","PLATO LAMINA P/AREPA","1","1","5","18","1","1","2","1","controlador/productos/img/default.png","3000.00","5500.00","ACTIVO","2024-06-20 15:22:22","1");
INSERT INTO producto VALUES("1288","1268","PARRILLA CARBON","PLATO LAMINA P/AREPA","1268","PARRILLA CARBON","1","2","5","18","1","1","2","1","controlador/productos/img/default.png","11000.00","16500.00","ACTIVO","2024-06-20 15:23:47","1");
INSERT INTO producto VALUES("1289","1269","CILINDRO CRISTAL 38*15","CILINDRO CRISTAL 38*15","1269","CILINDRO CRISTAL 38*15","1","2","4","19","1","1","2","1","controlador/productos/img/default.png","28000.00","38000.00","ACTIVO","2024-06-20 15:25:51","1");
INSERT INTO producto VALUES("1290","1270","CILINDRO CRISTAL 50*15","CILINDRO CRISTAL 38*15","1270","CILINDRO CRISTAL 38*15","1","2","4","19","1","1","2","1","controlador/productos/img/default.png","35000.00","45000.00","ACTIVO","2024-06-20 15:26:36","1");
INSERT INTO producto VALUES("1291","1271","CILINDRO CRISTAL 25*15","CILINDRO CRISTAL 25*15","1271","CILINDRO CRISTAL 25*15","1","2","2","19","1","1","2","1","controlador/productos/img/default.png","20000.00","28000.00","ACTIVO","2024-06-20 15:27:19","1");
INSERT INTO producto VALUES("1292","1272","FLORERO CRISTAL GRANDE","FLORERO CRISTAL GRANDE","1272","FLORERO CRISTAL GRANDE","1","2","12","19","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-20 15:28:01","1");
INSERT INTO producto VALUES("1293","1273","FLORERO CRISTAL CORRUGADO","FLORERO CRISTAL CORRUGADO","1273","FLORERO CRISTAL CORRUGADO","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-20 15:28:36","1");
INSERT INTO producto VALUES("1294","1274","FLORERO CRISTAL CORRUGADO PEQEUÑO","FLORERO CRISTAL CORRUGADO PEQEUÑO","1274","FLORERO CRISTAL CORRUGADO PEQEUÑO","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","8000.00","13000.00","ACTIVO","2024-06-20 15:29:15","1");
INSERT INTO producto VALUES("1295","1275","CILINDRO CRISTAL 35*10","CILINDRO CRISTAL 35*10","1275","CILINDRO CRISTAL 35*10","1","2","16","19","1","1","2","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-20 15:29:48","1");
INSERT INTO producto VALUES("1296","1276","CILINDRO CRISTAL 30*10 DECORADO","CILINDRO CRISTAL 30*10 DECORADO","1276","CILINDRO CRISTAL 30*10 DECORADO","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","12000.00","16000.00","ACTIVO","2024-06-20 15:30:33","1");
INSERT INTO producto VALUES("1297","1277","FLORERO FL 5 DECORADO","FLORERO FL 5 DECORADO","1277","FLORERO FL 5 DECORADO","1","2","2","19","1","1","2","1","controlador/productos/img/default.png","8000.00","10500.00","ACTIVO","2024-06-20 15:31:09","1");
INSERT INTO producto VALUES("1298","1278","FLORERO FL 3 DECORADO","FLORERO FL 3 DECORADO","1278","FLORERO FL 3 DECORADO","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-20 15:31:44","1");
INSERT INTO producto VALUES("1299","1279","LAMPARA PETROLEO","LAMPARA PETROLEO","1279","LAMPARA PETROLEO","1","2","4","19","1","1","2","1","controlador/productos/img/default.png","50000.00","69000.00","ACTIVO","2024-06-20 15:32:18","1");
INSERT INTO producto VALUES("1300","1280","FLORERO CLASICO 3","FLORERO CLASICO 3","1280","FLORERO CLASICO 3","1","2","5","19","1","1","2","1","controlador/productos/img/default.png","8000.00","11500.00","ACTIVO","2024-06-20 15:34:16","1");
INSERT INTO producto VALUES("1301","1281","FLORERO GIG MINI","FLORERO GIG MINI","1281","FLORERO GIG MINI","1","2","9","19","1","1","2","1","controlador/productos/img/default.png","3500.00","5500.00","ACTIVO","2024-06-20 15:35:00","1");
INSERT INTO producto VALUES("1302","1282","FLORERO FL 2 DECORADO","FLORERO FL 2 DECORADO","1282","FLORERO FL 2 DECORADO","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-20 15:36:01","1");
INSERT INTO producto VALUES("1303","1283","TUBO DE LINTERNA MINI","TUBO DE LINTERNA MINI","1283","TUBO DE LINTERNA MINI","1","2","11","19","1","1","2","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-20 15:36:54","1");
INSERT INTO producto VALUES("1304","1284","CHOCOLATERA PEQEUÑA C/TAPA","CHOCOLATERA PEQEUÑA C/TAPA","1284","CHOCOLATERA PEQEUÑA C/TAPA","1","2","12","18","1","1","2","1","controlador/productos/img/default.png","12000.00","15500.00","ACTIVO","2024-06-20 15:38:07","1");
INSERT INTO producto VALUES("1305","1285","CHOCOLATERA GRANDE C/TAPA","CHOCOLATERA GRANDE C/TAPA","1285","CHOCOLATERA GRANDE C/TAPA","1","2","12","18","1","1","2","1","controlador/productos/img/default.png","12000.00","15500.00","ACTIVO","2024-06-20 15:44:47","1");
INSERT INTO producto VALUES("1306","1339","BOLSA REGALO MEDIANA #1","BOLSA REGALO MEDIANA #1","1339","BOLSA REGALO MEDIANA #1","1","2","11","60","1","1","2","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-20 15:46:34","1");
INSERT INTO producto VALUES("1307","1286","CHOCOLATERA #8 5L ","CHOCOLATERA #8 5L ","1286","CHOCOLATERA ","1","1","3","28","1","1","28","1","controlador/productos/img/default.png","20000.00","28000.00","ACTIVO","2024-06-21 09:37:19","1");
INSERT INTO producto VALUES("1308","1287","CHOCOLATERA MEDIANA SIN TAPA ","CHOCOLATERA MEDIANA ","1287","CHOCOLATERA","1","1","9","28","1","1","28","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-21 09:38:21","1");
INSERT INTO producto VALUES("1309","1288","CHOCOLATERA MEDIANA CON TAPA ","CHOCOLATERA MEDIANA CON TAPA ","1288","CHOCOLATERA ","1","1","4","28","1","1","28","1","controlador/productos/img/default.png","14000.00","17000.00","ACTIVO","2024-06-21 09:39:09","1");
INSERT INTO producto VALUES("1310","1289","CHOCOLATERA PEQUEÑA DKASA ","CHOCOLATERA PEQUEÑA DKASA ","1289","CHOCOLATERA ","1","1","3","28","1","1","25","1","controlador/productos/img/default.png","13000.00","1700.00","ACTIVO","2024-06-21 09:41:55","1");
INSERT INTO producto VALUES("1311","1290","CHOCOLATERA PEQUEÑA SIN TAPA ","CHOCOLATERA PEQUEÑA SIN TAPA ","1290","CHOCOLATERA","1","1","1","28","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 09:43:12","1");
INSERT INTO producto VALUES("1312","1291","CHOCOLATERA 1.0 L- ILKO ","CHOCOLATERA 1.0 L- ILKO ","1291","CHOCOLATERA","1","1","1","28","1","1","28","1","controlador/productos/img/default.png","16000.00","22500.00","ACTIVO","2024-06-21 09:44:04","1");
INSERT INTO producto VALUES("1313","1292","JARRA 555 MINI C/TAPA ","JARRA 555 MINI C/TAPA ","1292","JARRA 555","1","1","11","28","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-21 09:44:54","1");
INSERT INTO producto VALUES("1314","1293","JARRA 555 MEDIANA C/TAPA ","JARRA 555 MEDIANA C/TAPA ","1293","JARRA 555 ","1","1","3","28","1","1","28","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 09:45:45","1");
INSERT INTO producto VALUES("1315","1294","JARRA 555 MINI S/TAPA","JARRA 555 MINI S/TAPA","1294","JARRA 555 MINI S/TAPA","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","4500.00","6500.00","ACTIVO","2024-06-21 10:10:58","1");
INSERT INTO producto VALUES("1316","1295","JARRA 555 10 CM","JARRA 555 10 CM","1295","JARRA 555 10 CM","1","2","9","28","1","1","28","1","controlador/productos/img/default.png","10000.00","11500.00","ACTIVO","2024-06-21 10:11:51","1");
INSERT INTO producto VALUES("1317","1296","VASO 555 GRANDE","VASO 555 GRANDE","1296","VASO 555 GRANDE","1","2","27","28","1","1","28","1","controlador/productos/img/default.png","3500.00","4500.00","ACTIVO","2024-06-21 10:13:22","1");
INSERT INTO producto VALUES("1318","1297","VASO 555 MEDIANO","VASO 555 MEDIANO","1297","VASO 555 MEDIANO","1","2","20","28","1","1","28","1","controlador/productos/img/default.png","2800.00","3500.00","ACTIVO","2024-06-21 10:14:06","1");
INSERT INTO producto VALUES("1319","1298","VASO 555 PEQEUÑO","VASO 555 PEQEUÑO","1298","VASO 555 PEQEUÑO","1","2","57","28","1","1","28","1","controlador/productos/img/default.png","2000.00","2600.00","ACTIVO","2024-06-21 10:14:45","1");
INSERT INTO producto VALUES("1320","1299","VASO PARA HELADO ","VASO PARA HELADO ","1299","VASO PARA HELADO ","1","2","960","28","1","1","28","1","controlador/productos/img/default.png","300.00","400.00","ACTIVO","2024-06-21 10:17:22","1");
INSERT INTO producto VALUES("1321","1300","HIELERA ALUMINIO","HIELERA ALUMINIO","1300","HIELERA ALUMINIO","1","2","10","28","1","1","28","1","controlador/productos/img/default.png","16000.00","22000.00","ACTIVO","2024-06-21 10:18:06","1");
INSERT INTO producto VALUES("1322","1301","BALDE 310 C/DISPENSADOR","BALDE 310 C/DISPENSADOR","1301","BALDE 310 C/DISPENSADOR","1","2","12","28","1","1","28","1","controlador/productos/img/default.png","20000.00","25500.00","ACTIVO","2024-06-21 10:19:40","1");
INSERT INTO producto VALUES("1323","1302","MEGA RIMO CUADRADO 20L C/GRIFO","MEGA RIMO CUADRADO 20L C/GRIFO","1302","MEGA RIMO CUADRADO 20L C/GRIFO","1","2","3","28","1","1","9","1","controlador/productos/img/default.png","30000.00","37500.00","ACTIVO","2024-06-21 10:20:53","1");
INSERT INTO producto VALUES("1324","1303","MEGA RIMO CUADRADO 14.5L S/GRIFO","MEGA RIMO CUADRADO 14.5L S/GRIFO","1303","MEGA RIMO CUADRADO 14.5L S/GRIFO","1","2","3","28","1","1","9","1","controlador/productos/img/default.png","18000.00","24000.00","ACTIVO","2024-06-21 10:22:13","1");
INSERT INTO producto VALUES("1325","1304","RALLADOR 4 CARAS ACERO INOXIDABLE","RALLADOR 4 CARAS ACERO INOXIDABLE","1304","RALLADOR 4 CARAS ACERO INOXIDABLE","1","2","23","28","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-21 10:23:10","1");
INSERT INTO producto VALUES("1326","1305","CAJA RALLADORA","CAJA RALLADORA","1305","CAJA RALLADORA","1","2","8","28","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-21 10:23:53","1");
INSERT INTO producto VALUES("1327","1306","RALLADOR 1 CARA","RALLADOR 1 CARA","1306","RALLADOR 1 CARA","1","2","23","28","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-21 10:24:35","1");
INSERT INTO producto VALUES("1328","1307","RALLADOR MINI HOME ELEMENTS","RALLADOR MINI HOME ELEMENTS","1307","RALLADOR MINI HOME ELEMENTS","1","2","4","28","1","1","28","1","controlador/productos/img/default.png","800.00","1500.00","ACTIVO","2024-06-21 10:25:49","1");
INSERT INTO producto VALUES("1329","1308","RALLADOR 6 CARAS GRANDE","RALLADOR 6 CARAS GRANDE","1308","RALLADOR 6 CARAS GRANDE","1","2","6","28","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-21 10:26:32","1");
INSERT INTO producto VALUES("1330","1309","RALLADOR 6 CARAS MEDIANO","RALLADOR 6 CARAS MEDIANO","1309","RALLADOR 6 CARAS MEDIANO","1","2","5","28","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-21 10:27:14","1");
INSERT INTO producto VALUES("1331","1310","RALLADOR INOXIDABLE UNIVERSAL","RALLADOR INOXIDABLE UNIVERSAL","1310","RALLADOR INOXIDABLE UNIVERSAL","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-21 10:28:02","1");
INSERT INTO producto VALUES("1332","1311","RALLADOR 4 CARAS LAMINA ESTAÑADA","RALLADOR 4 CARAS LAMINA ESTAÑADA","1311","RALLADOR 4 CARAS LAMINA ESTAÑADA","1","2","20","28","1","1","28","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-21 10:28:56","1");
INSERT INTO producto VALUES("1333","1312","MOLDE CUPCAKE","MOLDE CUPCAKE","1312","MOLDE CUPCAKE","1","2","5","28","1","1","28","1","controlador/productos/img/default.png","20000.00","26000.00","ACTIVO","2024-06-21 10:29:38","1");
INSERT INTO producto VALUES("1334","1313","REFRECTARIA MARINEX X3","REFRECTARIA MARINEX X3","1313","REFRECTARIA MARINEX X3","1","2","4","28","1","1","28","1","controlador/productos/img/default.png","72000.00","98000.00","ACTIVO","2024-06-21 10:30:23","1");
INSERT INTO producto VALUES("1335","1314","REFRECTARIA CUADRADA GRANDE","REFRECTARIA CUADRADA GRANDE","1314","REFRECTARIA CUADRADA GRANDE","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","22000.00","29000.00","ACTIVO","2024-06-21 10:31:10","1");
INSERT INTO producto VALUES("1336","1315","REFRECTARIA OVALADA","REFRECTARIA OVALADA","1315","REFRECTARIA OVALADA","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","23000.00","28000.00","ACTIVO","2024-06-21 10:32:02","1");
INSERT INTO producto VALUES("1337","1316","REFRECTARIA CUADRADA MEDIANA","REFRECTARIA CUADRADA MEDIANA","1316","REFRECTARIA CUADRADA MEDIANA","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","16000.00","22000.00","ACTIVO","2024-06-21 10:32:41","1");
INSERT INTO producto VALUES("1338","1317","REFRECTARIA CUADRADA PEQUEÑA","REFRECTARIA CUADRADA PEQUEÑA","1317","REFRECTARIA CUADRADA PEQUEÑA","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-21 10:33:25","1");
INSERT INTO producto VALUES("1339","1318","MOLDE PARA TORTA 1K","MOLDE PARA TORTA 1K","1318","MOLDE PARA TORTA 1K","1","2","7","28","1","1","28","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-21 10:34:04","1");
INSERT INTO producto VALUES("1340","1319","MOLDE PARA TORTA 300G","MOLDE PARA TORTA 300G","1319","MOLDE PARA TORTA 300G","1","2","3","28","1","1","28","1","controlador/productos/img/default.png","11000.00","15500.00","ACTIVO","2024-06-21 10:34:50","1");
INSERT INTO producto VALUES("1341","1320","MOLDE PARA TORTA 1/4","MOLDE PARA TORTA 1/4","1320","MOLDE PARA TORTA 1/4","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-21 10:36:02","1");
INSERT INTO producto VALUES("1342","1321","MOLDE DE TORTA MEDIA LIBRA MUNAL","MOLDE DE TORTA MEDIA LIBRA MUNAL","1321","MOLDE DE TORTA MEDIA LIBRA MUNAL","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","11000.00","14500.00","ACTIVO","2024-06-21 10:37:00","1");
INSERT INTO producto VALUES("1343","1322","MOLDE 1/2 LIBRA ANTIADERENTE","MOLDE 1/2 LIBRA ANTIADERENTE","1322","MOLDE 1/2 LIBRA ANTIADERENTE","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","13000.00","16500.00","ACTIVO","2024-06-21 10:37:59","1");
INSERT INTO producto VALUES("1344","1323","MOLDE 1/4 DE LIBRA","MOLDE 1/4 DE LIBRA","1323","MOLDE 1/4 DE LIBRA","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-21 10:38:49","1");
INSERT INTO producto VALUES("1345","1324","MOLDE CORAZON","MOLDE CORAZON","1324","MOLDE CORAZON","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","21000.00","28500.00","ACTIVO","2024-06-21 10:40:17","1");
INSERT INTO producto VALUES("1346","1325","BANDEJA ALUMINIO RECTANGULAR REF.210","BANDEJA ALUMINIO RECTANGULAR REF.210","1325","BANDEJA ALUMINIO RECTANGULAR REF.210","1","2","2","28","1","1","28","1","controlador/productos/img/default.png","33000.00","43000.00","ACTIVO","2024-06-21 10:41:39","1");
INSERT INTO producto VALUES("1347","1326","BANDEJA ALUMINIO RECTANGULAR REF.204","BANDEJA ALUMINIO RECTANGULAR REF.204","1326","BANDEJA ALUMINIO RECTANGULAR REF.204","1","2","1","28","1","1","28","1","controlador/productos/img/default.png","30000.00","39000.00","ACTIVO","2024-06-21 10:42:30","1");
INSERT INTO producto VALUES("1348","1327","PONCHERA 555 30 CM","PONCHERA 555 30 CM","1327","PONCHERA 555 30 CM","1","2","6","28","1","1","28","1","controlador/productos/img/default.png","13000.00","17500.00","ACTIVO","2024-06-21 10:44:33","1");
INSERT INTO producto VALUES("1349","1328","PONCHERA 555 28 CM","PONCHERA 555 28 CM","1328","PONCHERA 555 28 CM","1","2","29","28","1","1","28","1","controlador/productos/img/default.png","13000.00","15500.00","ACTIVO","2024-06-21 10:45:14","1");
INSERT INTO producto VALUES("1350","1329","PONCHERA 555 26 CM","PONCHERA 555 26 CM","1329","PONCHERA 555 26 CM","1","2","25","28","1","1","28","1","controlador/productos/img/default.png","10000.00","13500.00","ACTIVO","2024-06-21 10:45:45","1");
INSERT INTO producto VALUES("1351","1330","PONCHERA 555 24 CM","PONCHERA 555 24 CM","1330","PONCHERA 555 24 CM","1","2","23","28","1","1","28","1","controlador/productos/img/default.png","10000.00","12500.00","ACTIVO","2024-06-21 10:46:25","1");
INSERT INTO producto VALUES("1352","1331","PONCHERA 555 18 CM","PONCHERA 555 18 CM","1331","PONCHERA 555 18 CM","1","2","24","28","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-21 10:47:12","1");
INSERT INTO producto VALUES("1353","1332","PONCHERA 555 16 CM","PONCHERA 555 16 CM","1332","PONCHERA 555 16 CM","1","2","17","28","1","1","28","1","controlador/productos/img/default.png","3000.00","4200.00","ACTIVO","2024-06-21 10:47:44","1");
INSERT INTO producto VALUES("1354","1333","COLADOR ACERO INOXIDABLE 22 CM","COLADOR ACERO INOXIDABLE","1333","COLADOR ACERO INOXIDABLE 22 CM","1","2","17","28","1","1","28","1","controlador/productos/img/default.png","8000.00","11500.00","ACTIVO","2024-06-21 10:49:45","1");
INSERT INTO producto VALUES("1355","1334","COLADOR ACERO INOXIDABLE 26 CM","COLADOR ACERO INOXIDABLE 26 CM","1334","COLADOR ACERO INOXIDABLE 26 CM","1","2","3","28","1","1","28","1","controlador/productos/img/default.png","14000.00","17500.00","ACTIVO","2024-06-21 10:49:10","1");
INSERT INTO producto VALUES("1356","1335","PLATON #30 INDIA","PLATON #30 INDIA","1335","PLATON #30 INDIA","1","2","1","28","1","1","3","1","controlador/productos/img/default.png","14000.00","17500.00","ACTIVO","2024-06-21 10:50:49","1");
INSERT INTO producto VALUES("1357","1336","RALLADOR PARA COCO GRANDE","RALLADOR PARA COCO GRANDE","1336","RALLADOR PARA COCO GRANDE","1","2","23","18","1","1","28","1","controlador/productos/img/default.png","5000.00","6500.00","ACTIVO","2024-06-21 10:52:37","1");
INSERT INTO producto VALUES("1358","1337","RALLADOR PARA COCO MEDIANO","RALLADOR PARA COCO MEDIANO","1337","RALLADOR PARA COCO MEDIANO","1","2","23","18","1","1","28","1","controlador/productos/img/default.png","2800.00","3700.00","ACTIVO","2024-06-21 10:54:29","1");
INSERT INTO producto VALUES("1359","1338","RALLADOR PARA COCO PEQUEÑO","RALLADOR PARA COCO PEQUEÑO","1338","RALLADOR PARA COCO PEQUEÑO","1","2","16","18","1","1","28","1","controlador/productos/img/default.png","2000.00","3200.00","ACTIVO","2024-06-21 10:55:06","1");
INSERT INTO producto VALUES("1360","1340","PLANCHA ALUMINIO GRANDE ","PLANCHA ALUMINIO GRANDE ","1340","PLANCHA ALUMINIO GRANDE ","1","1","5","28","1","1","28","1","controlador/productos/img/default.png","72000.00","88000.00","ACTIVO","2024-06-21 11:22:09","1");
INSERT INTO producto VALUES("1361","1341","BANDEJA PAISA PLASTICA PEQUEÑA ","BANDEJA PAISA PLASTICA PEQUEÑA ","1341","BANDEJA PAISA PLASTICA PEQUEÑA ","1","1","9","18","1","1","28","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-21 11:26:22","1");
INSERT INTO producto VALUES("1362","1342","CHOCHA PLASTICA PEQUEÑA ","CHOCHA PLASTICA PEQUEÑA ","1342","CHOCHA PLASTICA PEQUEÑA ","1","1","51","18","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-21 11:27:14","1");
INSERT INTO producto VALUES("1363","1343","PLATO PLASTICO PROMOCION ","PLATO PLASTICO PROMOCION ","1343","PLATO PLASTICO PROMOCION ","1","1","60","18","1","1","28","1","controlador/productos/img/default.png","1200.00","1600.00","ACTIVO","2024-06-21 11:28:11","1");
INSERT INTO producto VALUES("1364","1344","PLATO PLASTICO COLPLAST ","PLATO PLASTICO COLPLAST ","1344","PLATO PLASTICO COLPLAST ","1","1","67","18","1","1","28","1","controlador/productos/img/default.png","2000.00","2600.00","ACTIVO","2024-06-21 11:28:55","1");
INSERT INTO producto VALUES("1365","1345","PLATO LLANO COLPLAST ","PLATO LLANO COLPLAST ","1345","PLATO LLANO COLPLAST ","1","1","117","18","1","1","28","1","controlador/productos/img/default.png","2000.00","2600.00","ACTIVO","2024-06-21 11:29:52","1");
INSERT INTO producto VALUES("1366","1346","JUEGO DE CUBIERTO DKASA ","JUEGO DE CUBIERTO DKASA ","1346","JUEGO DE CUBIERTO DKASA ","1","1","3","18","1","1","25","1","controlador/productos/img/default.png","70000.00","82000.00","ACTIVO","2024-06-21 11:30:51","1");
INSERT INTO producto VALUES("1367","1347","JUEGO DE CUBIERTO UNIVERSAL","JUEGO DE CUBIERTO UNIVERSAL","1347","JUEGO DE CUBIERTO UNIVERSAL","1","1","3","18","1","1","10","1","controlador/productos/img/default.png","47000.00","59000.00","ACTIVO","2024-06-21 11:31:47","1");
INSERT INTO producto VALUES("1368","1348","JUEGO DE CUBIERTO PROMOPCION ","JUEGO DE CUBIERTO PROMOPCION ","1348","JUEGO DE CUBIERTO PROMOPCION ","1","1","7","18","1","1","28","1","controlador/productos/img/default.png","29000.00","39000.00","ACTIVO","2024-06-21 11:34:10","1");
INSERT INTO producto VALUES("1369","1349","JUEGO DE UTENCILIOS INCAMETAL x6","JUEGO DE UTENCILIOS INCAMETAL x6","1349","JUEGO DE UTENCILIOS INCAMETAL x6","1","1","2","18","1","1","28","1","controlador/productos/img/default.png","36000.00","48000.00","ACTIVO","2024-06-21 11:35:12","1");
INSERT INTO producto VALUES("1370","1350","GRAMERA ELECTRONICA ","GRAMERA ELECTRONICA ","1350","GRAMERA ELECTRONICA ","1","1","8","18","1","1","28","1","controlador/productos/img/default.png","20000.00","28000.00","ACTIVO","2024-06-21 11:36:12","1");
INSERT INTO producto VALUES("1371","1351","EXPRIMIDOR ELECTRICO ","EXPRIMIDOR ELECTRICO ","1351","EXPRIMIDOR ELECTRICO ","1","1","1","18","1","1","28","1","controlador/productos/img/default.png","33000.00","45000.00","ACTIVO","2024-06-21 11:38:24","1");
INSERT INTO producto VALUES("1372","1352","PICATODO 700 ml ","PICATODO 700 ml ","1352","PICATODO 700 ml ","1","1","1","18","1","1","28","1","controlador/productos/img/default.png","72000.00","95000.00","ACTIVO","2024-06-21 11:39:03","1");
INSERT INTO producto VALUES("1373","1353","PICATODO 350 ml","PICATODO 350 ml","1353","PICATODO 350 ml","1","1","1","18","1","1","28","1","controlador/productos/img/default.png","60000.00","75000.00","ACTIVO","2024-06-21 11:39:44","1");
INSERT INTO producto VALUES("1374","1354","JARRA HERVIDORA 1.9 L INOXIDABLE","JARRA HERVIDORA  1.9 L INOXIDABLE","1354","JARRA HERVIDORA ","1","1","2","18","1","1","28","1","controlador/productos/img/default.png","95000.00","115000.00","ACTIVO","2024-06-21 11:40:54","1");
INSERT INTO producto VALUES("1375","1355","MINI WAFFLERA ","MINI WAFFLERA ","1355","MINI WAFFLERA ","1","1","2","18","1","1","28","1","controlador/productos/img/default.png","67000.00","78000.00","ACTIVO","2024-06-21 11:41:32","1");
INSERT INTO producto VALUES("1376","1356","LONCHERA ELECTRICA 1 L","LONCHERA ELECTRICA 1 L","1356","LONCHERA ELECTRICA 1 L","1","1","1","18","1","1","28","1","controlador/productos/img/default.png","45000.00","58500.00","ACTIVO","2024-06-21 11:42:07","1");
INSERT INTO producto VALUES("1377","1357","LONCHERA VAPORERA 500 ml ","LONCHERA VAPORERA 500 ml ","1357","LONCHERA VAPORERA 500 ml ","1","1","1","18","1","1","28","1","controlador/productos/img/default.png","62000.00","82000.00","ACTIVO","2024-06-21 11:42:44","1");
INSERT INTO producto VALUES("1378","1358","BASCULA DIGITAL PARA PESO CORPORAL ","BASCULA DIGITAL PARA PESO CORPORAL ","1358","BASCULA DIGITAL PARA PESO CORPORAL ","1","1","2","18","1","1","28","1","controlador/productos/img/default.png","54000.00","66000.00","ACTIVO","2024-06-21 11:43:21","1");
INSERT INTO producto VALUES("1379","1359","SANDUCHERA UNIVERSAL 2 EN 1 ","SANDUCHERA UNIVERSAL 2 EN 1 ","1359","SANDUCHERA UNIVERSAL 2 EN 1 ","1","1","3","18","1","1","10","1","controlador/productos/img/default.png","75000.00","87000.00","ACTIVO","2024-06-21 11:44:28","1");
INSERT INTO producto VALUES("1380","1360","SANDUCHERA UNIVERSAL ","SANDUCHERA UNIVERSAL ","1360","SANDUCHERA UNIVERSAL ","1","1","1","18","1","1","10","1","controlador/productos/img/default.png","63000.00","75000.00","ACTIVO","2024-06-21 11:45:04","1");
INSERT INTO producto VALUES("1381","1361","SANDUCHERA DKASA 2 EN 1","SANDUCHERA DKASA 2 EN 1","1361","SANDUCHERA DKASA 2 EN 1","1","1","1","18","1","1","25","1","controlador/productos/img/default.png","55000.00","67000.00","ACTIVO","2024-06-21 11:45:55","1");
INSERT INTO producto VALUES("1382","1362","SANDUCHERA 2 EN 1 HOME ELEMENTS ","SANDUCHERA 2 EN 1 HOME ELEMENTS ","1362","SANDUCHERA 2 EN 1 HOME ELEMENTS ","1","1","2","18","1","1","24","1","controlador/productos/img/default.png","60000.00","72000.00","ACTIVO","2024-06-21 11:46:54","1");
INSERT INTO producto VALUES("1383","1148","CUCHARA MADERA #6 ","CUCHARA MADERA #6 ","1148","CUCHARA MADERA #6 ","1","1","3","18","1","1","28","1","controlador/productos/img/default.png","2200.00","3500.00","ACTIVO","2024-06-21 11:50:29","1");
INSERT INTO producto VALUES("1384","1149","CUCHARA MADERA #5","CUCHARA MADERA #5","1149","CUCHARA MADERA #5","1","1","4","18","1","1","28","1","controlador/productos/img/default.png","2000.00","3000.00","ACTIVO","2024-06-21 11:50:56","1");
INSERT INTO producto VALUES("1385","1363","PLANCHA VAPOR CORONA ","PLANCHA VAPOR CORONA ","1363","PLANCHA VAPOR CORONA ","1","1","2","68","1","1","8","1","controlador/productos/img/default.png","38000.00","43000.00","ACTIVO","2024-06-22 13:45:57","1");
INSERT INTO producto VALUES("1386","1364","PLANCHA SECA UNIVERSAL ","PLANCHA SECA UNIVERSAL ","1364","PLANCHA SECA UNIVERSAL ","1","1","3","68","1","1","10","1","controlador/productos/img/default.png","76000.00","86000.00","ACTIVO","2024-06-21 11:53:21","1");
INSERT INTO producto VALUES("1387","1365","PLANCHA SECA KALLEY ","PLANCHA SECA KALLEY ","1365","PLANCHA SECA KALLEY ","1","1","6","68","1","1","36","1","controlador/productos/img/default.png","57000.00","69000.00","ACTIVO","2024-06-21 11:54:09","1");
INSERT INTO producto VALUES("1388","1366","PLANCHA VAPOR BLACK + DECKER ","PLANCHA VAPOR BLACK + DECKER ","1366","PLANCHA VAPOR BLACK + DECKER ","1","1","4","68","1","1","28","1","controlador/productos/img/default.png","57000.00","69000.00","ACTIVO","2024-06-21 11:54:53","1");
INSERT INTO producto VALUES("1389","1367","CRISPETERA 1200 W KALLEY ","CRISPETERA 1200 W KALLEY ","1367","CRISPETERA 1200 W KALLEY ","1","1","1","68","1","1","36","1","controlador/productos/img/default.png","100000.00","139000.00","ACTIVO","2024-06-21 11:55:46","1");
INSERT INTO producto VALUES("1390","1368","BANDEJA PEQUEÑA HOGARPLAS","BANDEJA PEQUEÑA HOGARPLAS","1368","BANDEJA PEQUEÑA HOGARPLAS","1","12","106","18","1","1","2","1","controlador/productos/img/default.png","1200.00","1800.00","ACTIVO","2024-06-21 15:25:20","1");
INSERT INTO producto VALUES("1391","1369","BANDEJA RECTANGULAR #3","BANDEJA RECTANGULAR #3","1369","BANDEJA RECTANGULAR #3","1","3","4","18","1","1","2","1","controlador/productos/img/default.png","8500.00","11500.00","ACTIVO","2024-06-21 15:26:17","1");
INSERT INTO producto VALUES("1392","1370","BANDEJA RECTANGULAR #2","BANDEJA RECTANGULAR #2","1370","BANDEJA RECTANGULAR #2","1","3","5","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:27:10","1");
INSERT INTO producto VALUES("1393","1371","PORTA CUBIERTO REF 1246","PORTA CUBIERTO REF 1246","1371","PORTA CUBIERTO REF 1246","1","6","34","18","1","1","2","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-21 15:28:57","1");
INSERT INTO producto VALUES("1394","1372","BANDEJA IDEAL 1.4L","BANDEJA IDEAL 1.4L","1372","BANDEJA IDEAL 1.4L","1","3","7","18","1","1","2","1","controlador/productos/img/default.png","2800.00","3700.00","ACTIVO","2024-06-21 15:30:48","1");
INSERT INTO producto VALUES("1395","1373","BANDEJA IDEAL 0.5L","BANDEJA IDEAL 0.5L","1373","BANDEJA IDEAL 0.5L","1","6","34","18","1","1","2","1","controlador/productos/img/default.png","1800.00","2500.00","ACTIVO","2024-06-21 15:31:27","1");
INSERT INTO producto VALUES("1396","1374","BANDEJA MULTIUSOS MUNDIVERDE","BANDEJA MULTIUSOS MUNDIVERDE","1374","BANDEJA MULTIUSOS MUNDIVERDE","1","3","6","18","1","1","2","1","controlador/productos/img/default.png","8500.00","11500.00","ACTIVO","2024-06-21 15:32:23","1");
INSERT INTO producto VALUES("1397","1375","BANDEJA IMUSA RECTANGULAR","BANDEJA IMUSA RECTANGULAR","1375","BANDEJA IMUSA RECTANGULAR","1","2","1","18","1","1","2","1","controlador/productos/img/default.png","13000.00","17500.00","ACTIVO","2024-06-21 15:33:33","1");
INSERT INTO producto VALUES("1398","1376","BANDEJA NP RECTANGULAR","BANDEJA NP RECTANGULAR","1376","BANDEJA NP RECTANGULAR","1","2","1","18","1","1","2","1","controlador/productos/img/default.png","8500.00","11500.00","ACTIVO","2024-06-21 15:34:15","1");
INSERT INTO producto VALUES("1399","1377","BANDEJA ESTAMPADA RECTANGULAR","BANDEJA ESTAMPADA RECTANGULAR","1377","BANDEJA ESTAMPADA RECTANGULAR","1","2","1","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:35:04","1");
INSERT INTO producto VALUES("1400","1378","BANDEJA GRANDE HOGARPLAS","BANDEJA GRANDE HOGARPLAS","1378","BANDEJA GRANDE HOGARPLAS","1","6","11","18","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-21 15:35:46","1");
INSERT INTO producto VALUES("1401","1379","BANDEJA MEDIANA HOGARPLAS","BANDEJA MEDIANA HOGARPLAS","1379","BANDEJA MEDIANA HOGARPLAS","1","6","31","18","1","1","2","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-21 15:36:25","1");
INSERT INTO producto VALUES("1402","1380","BANDEJA REDONDA","BANDEJA REDONDA","1380","BANDEJA REDONDA","1","3","7","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:37:36","1");
INSERT INTO producto VALUES("1403","1381","TABLA DE PICAR RIMO","BANDEJA REDONDA","1381","BANDEJA REDONDA","1","3","6","18","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-21 15:38:20","1");
INSERT INTO producto VALUES("1404","1382","EXPRIMIDOR DE NARANJA MANUAL","EXPRIMIDOR DE NARANJA MANUAL","1382","EXPRIMIDOR DE NARANJA MANUAL","1","3","8","18","1","1","2","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-21 15:39:06","1");
INSERT INTO producto VALUES("1405","1383","CUBETA DE HIELO *2","CUBETA DE HIELO *2","1383","CUBETA DE HIELO *2","1","2","4","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:39:51","1");
INSERT INTO producto VALUES("1406","1384","EXPRIMIDOR DE NARANJA MAQUINA GRANDE ","NARANJA MAQUINA GRANDE ","1384","NARANJA MAQUINA GRANDE ","1","2","4","18","1","1","2","1","controlador/productos/img/default.png","55000.00","78000.00","ACTIVO","2024-06-21 15:40:57","1");
INSERT INTO producto VALUES("1407","1385","BROCHA PARA ALIMENTO SILICONA","BROCHA PARA ALIMENTO SILICONA","1385","BROCHA PARA ALIMENTO SILICONA","1","3","4","18","1","1","2","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-21 15:41:39","1");
INSERT INTO producto VALUES("1408","1386","PELA PAPA DKASA","PELA PAPA DKASA","1386","PELA PAPA DKASA","1","3","10","18","1","1","2","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-21 15:42:24","1");
INSERT INTO producto VALUES("1409","1387","PALILLOS PARA CHUZO DELGADOS","PALILLOS PARA CHUZO DELGADOS","1387","PALILLOS PARA CHUZO DELGADOS","1","3","13","18","1","1","2","1","controlador/productos/img/default.png","3000.00","3800.00","ACTIVO","2024-06-21 15:43:30","1");
INSERT INTO producto VALUES("1410","1388","SALSERO IMUSA 36 0Z","SALSERO IMUSA 36 0Z","1388","SALSERO IMUSA 36 0Z","1","3","4","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:44:29","1");
INSERT INTO producto VALUES("1411","1389","SALSERO IMUSA 24 0Z","SALSERO IMUSA 24 0Z","1389","SALSERO IMUSA 24 0Z","1","3","15","18","1","1","2","1","controlador/productos/img/default.png","5200.00","7500.00","ACTIVO","2024-06-21 15:45:11","1");
INSERT INTO producto VALUES("1412","1390","SALSERO IMUSA 0.3L","SALSERO IMUSA 0.3L","1390","SALSERO IMUSA 0.3L","1","3","7","18","1","1","2","1","controlador/productos/img/default.png","4000.00","5500.00","ACTIVO","2024-06-21 15:45:55","1");
INSERT INTO producto VALUES("1413","1391","SALSERO IMUSA 0.2L","SALSERO IMUSA 0.2L","1391","SALSERO IMUSA 0.2L","1","3","4","18","1","1","2","1","controlador/productos/img/default.png","3500.00","4500.00","ACTIVO","2024-06-21 15:46:35","1");
INSERT INTO producto VALUES("1414","1392","SALSERO GRANDE MUNDIPLAS","SALSERO GRANDE MUNDIPLAS","1392","SALSERO GRANDE MUNDIPLAS","1","3","14","18","1","1","2","1","controlador/productos/img/default.png","3700.00","4700.00","ACTIVO","2024-06-21 15:47:30","1");
INSERT INTO producto VALUES("1415","1393","SALSERO MEDIANO MUNDIPLAS","SALSERO MEDIANO MUNDIPLAS","1393","SALSERO MEDIANO MUNDIPLAS","1","3","6","18","1","1","2","1","controlador/productos/img/default.png","2200.00","3000.00","ACTIVO","2024-06-21 15:48:21","1");
INSERT INTO producto VALUES("1416","1394","SALSERO PEQUEÑO PROMOCION","SALSERO PEQUEÑO PROMOCION","1394","SALSERO PEQUEÑO PROMOCION","1","3","25","18","1","1","2","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-21 15:49:43","1");
INSERT INTO producto VALUES("1417","1395","MACHACADOR DE AJO GRANDE PINTADO","MACHACADOR DE AJO","1395","MACHACADOR DE AJO","1","3","6","18","1","1","2","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-21 15:50:32","1");
INSERT INTO producto VALUES("1418","1396","TABLA CHURRASQUERA CON BANDEJA","TABLA CHURRASQUERA CON BANDEJA","1396","TABLA CHURRASQUERA CON BANDEJA","1","2","4","18","1","1","2","1","controlador/productos/img/default.png","20000.00","28000.00","ACTIVO","2024-06-21 15:51:17","1");
INSERT INTO producto VALUES("1419","1397","TABLA DE PICAR GRANDE MADERA","TABLA DE PICAR GRANDE MADERA","1397","TABLA DE PICAR GRANDE MADERA","1","3","14","18","1","1","2","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-22 10:11:52","1");
INSERT INTO producto VALUES("1420","1398","TABLA DE PICAR PEQUEÑA MADERA","TABLA DE PICAR PEQUEÑA MADERA","1398","TABLA DE PICAR PEQUEÑA MADERA","1","3","7","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:52:42","1");
INSERT INTO producto VALUES("1421","1399","PÀTACONERA MADFERA","PÀTACONERA MADFERA","1399","PÀTACONERA MADFERA","1","3","24","18","1","1","2","1","controlador/productos/img/default.png","7000.00","9000.00","ACTIVO","2024-06-21 15:53:18","1");
INSERT INTO producto VALUES("1422","1400","PÀTACONERA MADFERA FINA","PÀTACONERA MADFERA FINA","1400","PÀTACONERA MADFERA FINA","1","3","3","18","1","1","2","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-21 15:53:54","1");
INSERT INTO producto VALUES("1423","1401","TABLA CHURRASQUERA S/BANDEJA","PÀTACONERA MADFERA FINA","1401","PÀTACONERA MADFERA FINA","1","3","8","18","1","1","2","1","controlador/productos/img/default.png","6000.00","8500.00","ACTIVO","2024-06-21 15:54:43","1");
INSERT INTO producto VALUES("1424","1402","CORTA PANELA","CORTA PANELA","1402","CORTA PANELA","1","1","3","18","1","1","2","1","controlador/productos/img/default.png","10000.00","15000.00","ACTIVO","2024-06-21 15:55:23","1");
INSERT INTO producto VALUES("1425","1403","RODILLO DE MADERA GRANDE","RODILLO DE MADERA GRANDE","1403","RODILLO DE MADERA GRANDE","1","3","9","18","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-21 15:56:04","1");
INSERT INTO producto VALUES("1426","1404","RODILLO DE MADERA MEDIANO","RODILLO DE MADERA MEDIANO","1404","RODILLO DE MADERA MEDIANO","1","3","13","18","1","1","2","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-21 15:56:42","1");
INSERT INTO producto VALUES("1427","1405","PICA HIELO MADERA","PICA HIELO MADERA","1405","PICA HIELO MADERA","1","3","14","18","1","1","2","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-21 15:57:15","1");
INSERT INTO producto VALUES("1428","1406","CUCHARA DE MADERA # 2","CUCHARA DE MADERA # 2","1406","CUCHARA DE MADERA # 2","1","3","10","18","1","1","2","1","controlador/productos/img/default.png","1500.00","2000.00","ACTIVO","2024-06-21 15:58:12","1");
INSERT INTO producto VALUES("1429","1407","CUCHARA DE MADERA # 3","CUCHARA DE MADERA # 3","1407","CUCHARA DE MADERA # 3","1","3","4","18","1","1","2","1","controlador/productos/img/default.png","2000.00","2500.00","ACTIVO","2024-06-21 15:59:16","1");
INSERT INTO producto VALUES("1430","1408","CUCHARA DE MADERA # 4","CUCHARA DE MADERA # 4","1408","CUCHARA DE MADERA # 4","1","3","6","18","1","1","2","1","controlador/productos/img/default.png","2200.00","2700.00","ACTIVO","2024-06-21 15:59:52","1");
INSERT INTO producto VALUES("1431","1411","VAJILLA CHINA CUADRADA","VAJILLA CHINA CUADRADA","1411","VAJILLA CHINA CUADRADA","1","1","3","18","1","1","2","1","controlador/productos/img/default.png","85800.00","102000.00","ACTIVO","2024-06-21 16:04:27","1");
INSERT INTO producto VALUES("1432","1412","BALDE GIRAR 6L","BALDE GIRAR 6L","1412","BALDE GIRAR 6L","1","2","4","18","1","1","2","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-21 16:05:13","1");
INSERT INTO producto VALUES("1433","1413","JUEGO DE VASOS SECILIA *3","JUEGO DE VASOS","1413","JUEGO DE VASOS","1","2","8","19","1","1","2","1","controlador/productos/img/default.png","9000.00","12000.00","ACTIVO","2024-06-21 16:06:33","1");
INSERT INTO producto VALUES("1434","1414","JUEGO DE VASOS MIKONOS *6","JUEGO DE VASOS","1414","JUEGO DE VASOS","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-21 16:07:22","1");
INSERT INTO producto VALUES("1435","1415","JUEGO DE VASOS VERONA","JUEGO DE VASOS","1415","JUEGO DE VASOS","1","2","4","19","1","1","2","1","controlador/productos/img/default.png","12000.00","16500.00","ACTIVO","2024-06-21 16:10:03","1");
INSERT INTO producto VALUES("1436","1416","JUEGO DE VASOS SPIRAL *6","JUEGO DE VASOS","1416","JUEGO DE VASOS","1","2","3","19","1","1","2","1","controlador/productos/img/default.png","13000.00","17500.00","ACTIVO","2024-06-21 16:11:04","1");
INSERT INTO producto VALUES("1437","0606","BALDE PLAYERO NIÑO","BALDE PLAYERO NIÑO","0606","BALDE PLAYERO NIÑO","1","1","3","20","1","1","2","1","controlador/productos/img/default.png","5500.00","8500.00","ACTIVO","2024-06-22 11:05:32","1");
INSERT INTO producto VALUES("1438","0812","COPA CON OREJA","COPA CON OREJA","0812","COPA CON OREJA","1","2","8","19","1","1","2","1","controlador/productos/img/default.png","5000.00","7000.00","ACTIVO","2024-06-22 12:07:11","1");
INSERT INTO producto VALUES("1439","0813","ACUARIO PALMA","ACUARIO PALMA","0813","ACUARIO PALMA","1","2","6","19","1","1","2","1","controlador/productos/img/default.png","6000.00","9500.00","ACTIVO","2024-06-22 12:08:33","1");
INSERT INTO producto VALUES("1440","0814","ACUARIO BOMBA","ACUARIO BOMBA","0814","ACUARIO BOMBA","1","2","36","19","1","1","2","1","controlador/productos/img/default.png","4000.00","7000.00","ACTIVO","2024-06-22 12:09:34","1");
INSERT INTO producto VALUES("1441","0337","JARRA SORPLAS 2.5 L","JARRA SORPLAS 2.5 L","0337","JARRA SORPLAS 2.5 L","1","6","27","63","1","1","2","1","controlador/productos/img/default.png","4800.00","6500.00","ACTIVO","2024-06-22 12:17:39","1");
INSERT INTO producto VALUES("1442","0338","JARRA SORPLAS 4 L","JARRA SORPLAS 4 L","0338","JARRA SORPLAS 4 L","1","6","40","63","1","1","2","1","controlador/productos/img/default.png","7000.00","9500.00","ACTIVO","2024-06-22 12:19:11","1");
INSERT INTO producto VALUES("1443","1417","JUEGO DE VASOS HERRADURA *6","JUEGO DE VASOS HERRADURA *6","1417","JUEGO DE VASOS HERRADURA *6","1","2","2","19","1","1","28","1","controlador/productos/img/default.png","15000.00","19000.00","ACTIVO","2024-06-22 14:11:14","1");
INSERT INTO producto VALUES("1444","1418","JUEGO DE VASOS CARIBE","JUEGO DE VASOS CARIBE","1418","JUEGO DE VASOS CARIBE","1","2","1","19","1","1","28","1","controlador/productos/img/default.png","10000.00","13000.00","ACTIVO","2024-06-22 14:12:20","1");
INSERT INTO producto VALUES("1445","1419","VASO NIKONO ESTAMPADO","VASO NIKONO ESTAMPADO","1419","VASO NIKONO ESTAMPADO","1","2","7","19","1","1","28","1","controlador/productos/img/default.png","3000.00","3700.00","ACTIVO","2024-06-22 14:13:31","1");
INSERT INTO producto VALUES("1446","1420","VASO SIENA LISO","VASO SIENA LISO","1420","VASO SIENA LISO","1","3","42","19","1","1","28","1","controlador/productos/img/default.png","1600.00","2000.00","ACTIVO","2024-06-22 14:14:25","1");
INSERT INTO producto VALUES("1447","1421","VASO BERLIN","VASO BERLIN","1421","VASO BERLIN","1","6","34","19","1","1","28","1","controlador/productos/img/default.png","5500.00","7500.00","ACTIVO","2024-06-22 14:15:28","1");
INSERT INTO producto VALUES("1448","1422","VASO SIENA ESTAMPADO","VASO SIENA ESTAMPADO","1422","VASO SIENA ESTAMPADO","1","6","73","19","1","1","28","1","controlador/productos/img/default.png","1600.00","2000.00","ACTIVO","2024-06-22 14:16:21","1");
INSERT INTO producto VALUES("1449","1423","VASO CERVECERO CORTO","VASO CERVECERO CORTO","1423","VASO CERVECERO CORTO","1","6","34","19","1","1","28","1","controlador/productos/img/default.png","3200.00","4500.00","ACTIVO","2024-06-22 14:17:42","1");
INSERT INTO producto VALUES("1450","1424","VASO WISKY GRANDE","VASO WISKY GRANDE","1424","VASO WISKY GRANDE","1","3","21","19","1","1","28","1","controlador/productos/img/default.png","3800.00","4800.00","ACTIVO","2024-06-22 14:18:39","1");
INSERT INTO producto VALUES("1451","1425","COPA DE AGUA ARAGON","COPA DE AGUA ARAGON","1425","COPA DE AGUA ARAGON","1","6","59","19","1","1","28","1","controlador/productos/img/default.png","3000.00","4000.00","ACTIVO","2024-06-22 14:19:29","1");
INSERT INTO producto VALUES("1452","1426","COPA MARGARITA","COPA MARGARITA","1426","COPA MARGARITA","1","3","18","19","1","1","28","1","controlador/productos/img/default.png","3800.00","4800.00","ACTIVO","2024-06-22 14:20:21","1");
INSERT INTO producto VALUES("1453","1427","COPA DE HELADO","COPA DE HELADO","1427","COPA DE HELADO","1","3","9","19","1","1","28","1","controlador/productos/img/default.png","2300.00","3500.00","ACTIVO","2024-06-22 14:21:07","1");
INSERT INTO producto VALUES("1454","1428","JARRA CERVECERA HAMBURGO","JARRA CERVECERA HAMBURGO","1428","JARRA CERVECERA HAMBURGO","1","6","2","19","1","1","28","1","controlador/productos/img/default.png","5800.00","7500.00","ACTIVO","2024-06-22 14:22:08","1");
INSERT INTO producto VALUES("1455","1429","JARRA CRISTAL JUGUERA JENOVA","JARRA CRISTAL JUGUERA JENOVA","1429","JARRA CRISTAL JUGUERA JENOVA","1","2","7","19","1","1","28","1","controlador/productos/img/default.png","9000.00","12500.00","ACTIVO","2024-06-22 14:24:36","1");
INSERT INTO producto VALUES("1456","1430","JARRA CRISTAL JUGUERA AZUL","JARRA CRISTAL JUGUERA AZUL","1430","JARRA CRISTAL JUGUERA AZUL","1","2","3","19","1","1","28","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-22 14:29:32","1");
INSERT INTO producto VALUES("1457","1431","JARRA CRISTAL JUGUERA BAR","JARRA CRISTAL JUGUERA BAR","1431","JARRA CRISTAL JUGUERA BAR","1","","6","19","1","1","28","1","controlador/productos/img/default.png","14000.00","18500.00","ACTIVO","2024-06-22 14:30:37","1");
INSERT INTO producto VALUES("1458","1432","JARRA CRISTAL JUGUERA TROPICANA","JARRA CRISTAL JUGUERA TROPICANA","1432","JARRA CRISTAL JUGUERA TROPICANA","1","2","6","19","1","1","28","1","controlador/productos/img/default.png","15000.00","19000.00","ACTIVO","2024-06-22 14:34:08","1");
INSERT INTO producto VALUES("1459","1433","VINAGRERA CRISTAL CUADRADA","VINAGRERA CRISTAL CUADRADA","1433","VINAGRERA CRISTAL CUADRADA","1","1","4","19","1","1","28","1","controlador/productos/img/default.png","10000.00","14500.00","ACTIVO","2024-06-22 14:35:01","1");
INSERT INTO producto VALUES("1460","1434","VINAGRERA CRISTAL REDONDA","VINAGRERA CRISTAL REDONDA","1434","VINAGRERA CRISTAL REDONDA","1","1","2","19","1","1","28","1","controlador/productos/img/default.png","10000.00","14500.00","ACTIVO","2024-06-22 14:35:36","1");
INSERT INTO producto VALUES("1461","1435","VINAGRERA CERAMICA","VINAGRERA CERAMICA","1435","VINAGRERA CERAMICA","1","1","5","19","1","1","28","1","controlador/productos/img/default.png","5000.00","8500.00","ACTIVO","2024-06-22 14:36:24","1");
INSERT INTO producto VALUES("1462","1436","HIELERA CRISTAL","HIELERA CRISTAL","1436","HIELERA CRISTAL","1","1","3","19","1","1","28","1","controlador/productos/img/default.png","15000.00","19500.00","ACTIVO","2024-06-22 14:37:13","1");
INSERT INTO producto VALUES("1463","1437","ENSALADERA CRISTAL","ENSALADERA CRISTAL","1437","ENSALADERA CRISTAL","1","1","3","19","1","1","28","1","controlador/productos/img/default.png","8000.00","11000.00","ACTIVO","2024-06-22 14:38:01","1");
INSERT INTO producto VALUES("1464","1438","SOLITARIO CRISTAL","SOLITARIO CRISTAL","1438","SOLITARIO CRISTAL","1","1","18","19","1","1","28","1","controlador/productos/img/default.png","3000.00","4500.00","ACTIVO","2024-06-22 14:38:43","1");
INSERT INTO producto VALUES("1465","1439","FRASCO VIDRIO C/TAPA 2L","FRASCO VIDRIO C/TAPA","1439","FRASCO VIDRIO C/TAPA","1","1","1","19","1","1","28","1","controlador/productos/img/default.png","15000.00","19500.00","ACTIVO","2024-06-22 14:39:39","1");
INSERT INTO producto VALUES("1466","1440","JARRON MEDIANO DIAMANTE","JARRON MEDIANO DIAMANTE","1440","JARRON MEDIANO DIAMANTE","1","1","3","19","1","1","28","1","controlador/productos/img/default.png","8000.00","11500.00","ACTIVO","2024-06-22 14:40:28","1");
INSERT INTO producto VALUES("1467","1441","FLORERO #3 FL3","FLORERO #3 FL3","1441","FLORERO #3 FL3","1","1","4","19","1","1","28","1","controlador/productos/img/default.png","12000.00","16500.00","ACTIVO","2024-06-22 14:42:12","1");
INSERT INTO producto VALUES("1468","1442","FLORERO FLR3","FLORERO FLR3","1442","FLORERO FLR3","1","1","5","19","1","1","28","1","controlador/productos/img/default.png","12000.00","16000.00","ACTIVO","2024-06-22 14:43:34","1");
INSERT INTO producto VALUES("1469","1443","HILO CHINO *12","HILO CHINO *12","1443","HILO CHINO *12","1","6","49","69","1","1","28","1","controlador/productos/img/default.png","1000.00","1500.00","ACTIVO","2024-06-22 14:52:14","1");
INSERT INTO producto VALUES("1470","1444","HILO CHINO GRANDE","HILO CHINO GRANDE","1444","HILO CHINO GRANDE","1","20","278","69","1","1","28","1","controlador/productos/img/default.png","600.00","800.00","ACTIVO","2024-06-22 14:53:07","1");
INSERT INTO producto VALUES("1471","1445","ELASTICO 5*8","ELASTICO","1445","ELASTICO","1","3","9","69","1","1","28","1","controlador/productos/img/default.png","5200.00","7500.00","ACTIVO","2024-06-22 14:54:15","1");
INSERT INTO producto VALUES("1472","1446","ELASTICO 5*3","ELASTICO","1446","ELASTICO","1","3","6","69","1","1","28","1","controlador/productos/img/default.png","3800.00","5500.00","ACTIVO","2024-06-22 14:54:53","1");
INSERT INTO producto VALUES("1473","1447","ELASTICO 2*8","ELASTICO","1447","ELASTICO","1","3","2","69","1","1","28","1","controlador/productos/img/default.png","3200.00","4500.00","ACTIVO","2024-06-22 14:55:28","1");
INSERT INTO producto VALUES("1474","1448","ELASTICO 1*8","ELASTICO","1448","ELASTICO","1","3","18","69","1","1","28","1","controlador/productos/img/default.png","2100.00","3200.00","ACTIVO","2024-06-22 14:56:10","1");
INSERT INTO producto VALUES("1475","1449","ELASTICO POR METRO","ELASTICO POR METRO","1449","ELASTICO POR METRO","1","10MT","60MT","69","3","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-22 14:57:19","1");
INSERT INTO producto VALUES("1476","1450","MONEDERO SEÑORA","MONEDERO SEÑORA","1450","MONEDERO SEÑORA","1","3","16","69","1","1","28","1","controlador/productos/img/default.png","3500.00","5500.00","ACTIVO","2024-06-22 14:58:06","1");
INSERT INTO producto VALUES("1477","1451","CUCHILLA DE OJA","CUCHILLA DE OJA","1451","CUCHILLA DE OJA","1","3","28","69","1","1","28","1","controlador/productos/img/default.png","1100.00","1500.00","ACTIVO","2024-06-22 14:59:09","1");
INSERT INTO producto VALUES("1478","1452","CUCHILLA DORCO *5","CUCHILLA DORCO *5","1452","CUCHILLA DORCO *5","1","6","4","69","1","1","28","1","controlador/productos/img/default.png","2100.00","3000.00","ACTIVO","2024-06-22 15:06:27","1");
INSERT INTO producto VALUES("1479","1453","AGUJA DE CARTON","AGUJA DE CARTON","1453","AGUJA DE CARTON","1","6","21","69","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-22 15:13:21","1");
INSERT INTO producto VALUES("1480","1454","AGUJA DE CARTON FINA ","AGUJA DE CARTON","1454","AGUJA DE CARTON","1","6","2","69","1","1","28","1","controlador/productos/img/default.png","1400.00","2000.00","ACTIVO","2024-06-22 15:14:08","1");
INSERT INTO producto VALUES("1481","1455","METRO MEDISTERIA","METRO MEDISTERIA","1455","METRO MEDISTERIA","1","3","5","69","1","1","28","1","controlador/productos/img/default.png","700.00","1000.00","ACTIVO","2024-06-22 15:19:41","1");
INSERT INTO producto VALUES("1482","1456","ATERI GRANDE ","ATERI GRANDE ","1456","ATERI GRANDE ","1","3","22","20","1","1","28","1","controlador/productos/img/default.png","9000.00","11000.00","ACTIVO","2024-06-22 15:20:41","1");
INSERT INTO producto VALUES("1483","1457","ATERI PEQUEÑO","ATERI PEQUEÑO","1457","ATERI PEQUEÑO","1","3","4","20","1","1","28","1","controlador/productos/img/default.png","5000.00","7500.00","ACTIVO","2024-06-22 15:21:54","1");
INSERT INTO producto VALUES("1484","1458","JUEGO DE CARTA ECONOMICA","JUEGO DE CARTA","1458","JUEGO DE CARTA","1","3","8","20","1","1","28","1","controlador/productos/img/default.png","3000.00","5500.00","ACTIVO","2024-06-22 15:23:02","1");
INSERT INTO producto VALUES("1485","1459","JUEGO DE CARTA KEM","JUEGO DE CARTA KEM","1459","JUEGO DE CARTA KEM","1","3","13","20","1","1","28","1","controlador/productos/img/default.png","11000.00","16000.00","ACTIVO","2024-06-22 15:23:49","1");
INSERT INTO producto VALUES("1486","1460","JUEGO DE CARTA ROYAL 2056","JUEGO DE CARTA ROYAL 2056","1460","JUEGO DE CARTA ROYAL 2056","1","3","6","20","1","1","28","1","controlador/productos/img/default.png","9000.00","12500.00","ACTIVO","2024-06-22 15:24:41","1");
INSERT INTO producto VALUES("1487","1461","VILLETE DIDACTICO","VILLETE DIDACTICO","1461","VILLETE DIDACTICO","1","3","21","20","1","1","28","1","controlador/productos/img/default.png","1000.00","1500.00","ACTIVO","2024-06-22 15:25:42","1");
INSERT INTO producto VALUES("1488","1462","CEPILLO DE PEINAR PUNTA/BLA","CEPILLO DE PEINAR PUNTA/BLA","1462","CEPILLO DE PEINAR PUNTA/BLA","1","3","4","69","1","1","28","1","controlador/productos/img/default.png","2500.00","3500.00","ACTIVO","2024-06-22 15:40:43","1");
INSERT INTO producto VALUES("1489","1463","CEPILLO MANGO MADERA","CEPILLO MANGO MADERA","1463","CEPILLO MANGO MADERA","1","3","5","69","1","1","28","1","controlador/productos/img/default.png","3500.00","5500.00","ACTIVO","2024-06-22 15:40:56","1");
INSERT INTO producto VALUES("1490","1464","CEPILLO MILITAR","CEPILLO MILITAR","1464","CEPILLO MILITAR","1","12","133","69","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-22 15:29:59","1");
INSERT INTO producto VALUES("1491","1465","PEINILLA PEQUEÑA","PEINILLA PEQUEÑA","1465","PEINILLA PEQUEÑA","1","20","290","69","1","1","28","1","controlador/productos/img/default.png","130.00","200.00","ACTIVO","2024-06-22 15:30:56","1");
INSERT INTO producto VALUES("1492","1466","PEINILLA GRANDE","PEINILLA GRANDE","1466","PEINILLA GRANDE","1","20","105","69","1","1","28","1","controlador/productos/img/default.png","500.00","700.00","ACTIVO","2024-06-22 15:31:40","1");
INSERT INTO producto VALUES("1493","1467","PEINILLA MOJARRA","PEINILLA MOJARRA","1467","PEINILLA MOJARRA","1","20","50","69","1","1","28","1","controlador/productos/img/default.png","350.00","500.00","ACTIVO","2024-06-22 15:32:20","1");
INSERT INTO producto VALUES("1494","1468","PEINILLA DIENTE GRANDE","PEINILLA DIENTE GRANDE","1468","PEINILLA DIENTE GRANDE","1","3","8","69","1","1","28","1","controlador/productos/img/default.png","1600.00","2000.00","ACTIVO","2024-06-22 15:33:22","1");
INSERT INTO producto VALUES("1495","1469","PEINE PARA PIOJO","PEINE PARA PIOJO","1469","PEINE PARA PIOJO","1","12","110","69","1","1","28","1","controlador/productos/img/default.png","300.00","500.00","ACTIVO","2024-06-22 15:34:17","1");
INSERT INTO producto VALUES("1496","1470","NEVERA PLASTICA 22L","NEVERA PLASTICA 22L","1470","NEVERA PLASTICA 22L","1","1","2","55","1","1","28","1","controlador/productos/img/default.png","73000.00","95000.00","ACTIVO","2024-06-22 15:35:44","1");
INSERT INTO producto VALUES("1497","1471","NEVERA PLASTICA 32L","NEVERA PLASTICA 32L","1471","NEVERA PLASTICA 32L","1","1","2","55","1","1","28","1","controlador/productos/img/default.png","100000.00","135000.00","ACTIVO","2024-06-22 15:36:25","1");
INSERT INTO producto VALUES("1498","1472","REPÒSTRERO HERMETICO C/TAPA RIMO","REPÒSTRERO HERMETICO C/TAPA ","1472","REPÒSTRERO HERMETICO C/TAPA ","1","2","6","62","1","1","28","1","controlador/productos/img/default.png","8500.00","12000.00","ACTIVO","2024-06-22 15:38:21","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO proveedor VALUES("8","2024-05-23","","ACTIVO","29","","1","1");
INSERT INTO proveedor VALUES("9","2024-05-23","","ACTIVO","30","","1","1");
INSERT INTO proveedor VALUES("10","2024-05-23","","ACTIVO","31","","1","1");
INSERT INTO proveedor VALUES("11","2024-05-23","300000000","ACTIVO","32","Responsable de iva","1","1");
INSERT INTO proveedor VALUES("12","2024-05-23","300000000","ACTIVO","33","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("13","2024-05-23","300000000","ACTIVO","34","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("14","2024-05-23","300000000","ACTIVO","35","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("15","2024-05-23","300000000","ACTIVO","36","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("16","2024-05-23","300000000","ACTIVO","37","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("17","2024-05-23","300000000","ACTIVO","38","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("18","2024-05-23","300000000","ACTIVO","39","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("19","2024-05-23","300000000","ACTIVO","40","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("20","2024-05-23","300000000","ACTIVO","41","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("21","2024-05-23","300000000","ACTIVO","42","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("22","2024-05-23","300000000","ACTIVO","43","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("23","2024-05-23","300000000","ACTIVO","44","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("24","2024-05-23","300000000","ACTIVO","45","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("25","2024-05-23","300000000","ACTIVO","46","REGIMEN COMUN","1","1");
INSERT INTO proveedor VALUES("26","2024-06-19","3000000000","ACTIVO","47","NO","1","1");



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

INSERT INTO rol VALUES("1","Administrador","2022-07-13","ACTIVO","1");
INSERT INTO rol VALUES("2","Empleado","2022-09-23","ACTIVO","1");
INSERT INTO rol VALUES("3","Test","2022-09-23","ACTIVO","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tipo_comprobante VALUES("1","FV","FACTURA DE VENTA","ACTIVO","2023-08-23 09:00:05","1");
INSERT INTO tipo_comprobante VALUES("2","FC","FACTURA DE COMPRA","ACTIVO","2023-08-23 09:08:41","1");
INSERT INTO tipo_comprobante VALUES("3","RC","Recibo de caja","ACTIVO","2023-09-06 14:17:58","1");
INSERT INTO tipo_comprobante VALUES("4","CE","Comprobante de egreso","ACTIVO","2023-08-23 10:13:07","1");
INSERT INTO tipo_comprobante VALUES("5","CN","Consignacion Bancaria","ACTIVO","2023-09-15 13:22:20","1");
INSERT INTO tipo_comprobante VALUES("6","NC","Nota Credito","ACTIVO","2023-09-15 13:22:53","1");
INSERT INTO tipo_comprobante VALUES("7","ND","Nota Debito","ACTIVO","2023-09-15 13:23:03","1");



CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `idempresa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `tipo_gasto_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tipo_gasto VALUES("2","PAGO SERVICIOS","2024-05-31 11:30:41","INACTIVO","1");
INSERT INTO tipo_gasto VALUES("3","SERVICIO DE ENERGIA","2023-05-23 11:19:34","ACTIVO","1");
INSERT INTO tipo_gasto VALUES("4","COMIDAS","2024-05-21 12:47:06","ACTIVO","1");
INSERT INTO tipo_gasto VALUES("5","ARRIENDO","2024-05-31 11:29:25","ACTIVO","1");
INSERT INTO tipo_gasto VALUES("6","ASEO","2024-05-31 11:29:38","ACTIVO","1");
INSERT INTO tipo_gasto VALUES("7","NOMINA ","2024-05-31 11:29:52","ACTIVO","1");
INSERT INTO tipo_gasto VALUES("8","agua","2024-05-31 11:30:34","ACTIVO","1");
INSERT INTO tipo_gasto VALUES("9","gastos diarios ","2024-05-31 11:31:56","ACTIVO","1");



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

INSERT INTO tipo_impuestos VALUES("1","GRAVADO","PRODUCTO CON IVA","ACTIVO","2023-11-26 14:21:37","1");
INSERT INTO tipo_impuestos VALUES("2","EXONERADO","NO APLICA IVA","ACTIVO","2023-11-26 14:23:36","1");



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

INSERT INTO tipo_producto VALUES("1","PRODUCTO","ACTIVO","2022-07-13 15:56:42","1");
INSERT INTO tipo_producto VALUES("2","CONSUMO","ACTIVO","2022-07-13 15:56:49","1");
INSERT INTO tipo_producto VALUES("3","COMBO","ACTIVO","2022-07-13 15:56:57","1");
INSERT INTO tipo_producto VALUES("4","SERVICIO","ACTIVO","2023-12-27 18:59:45","1");



CREATE TABLE `tipo_regimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(512) DEFAULT NULL,
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tipo_regimen VALUES("1","Simplificado","ACTIVO","2023-05-08 16:49:07");
INSERT INTO tipo_regimen VALUES("2","Comun","ACTIVO","2023-05-08 16:49:13");
INSERT INTO tipo_regimen VALUES("3","Otro","ACTIVO","2023-05-08 16:49:21");



CREATE TABLE `tipo_tercero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `tipo_tercero_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO tipo_tercero VALUES("1","PROVEEDOR","1");
INSERT INTO tipo_tercero VALUES("2","CLIENTE","1");
INSERT INTO tipo_tercero VALUES("3","Administrador","1");
INSERT INTO tipo_tercero VALUES("4","EMPRESA","1");
INSERT INTO tipo_tercero VALUES("5","EMPLEADO","1");



CREATE TABLE `tipodeducciones` (
  `IdTipoDeducciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de deduccion',
  `DescTipoDeducciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de deduccion',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de deduccion',
  PRIMARY KEY (`IdTipoDeducciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tipohe` (
  `IdTipoHE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de hora extra',
  `NomTipoHE` varchar(80) NOT NULL COMMENT 'Nombre del tipo de hora extra',
  `Multiplicador` double NOT NULL COMMENT 'Por cuanto se multiplica el valor de hora extra',
  PRIMARY KEY (`IdTipoHE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tipoprestaciones` (
  `IdTipoPrestaciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de prestacion',
  `DescTipoPrestaciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de prestacion',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de prestacion',
  PRIMARY KEY (`IdTipoPrestaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tiposalario` (
  `IdTipoSalario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo del salario del empleado',
  `DescTipoSalario` varchar(60) NOT NULL COMMENT 'Descripcion del tipo de salario',
  PRIMARY KEY (`IdTipoSalario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO unidad VALUES("1","UNIDAD","UN","2022-07-13","ACTIVO","1");
INSERT INTO unidad VALUES("2","KILOGRAMO","KG","2022-07-13","ACTIVO","1");
INSERT INTO unidad VALUES("3","metro","mt","2022-07-13","ACTIVO","1");
INSERT INTO unidad VALUES("4","MILIGRAMO","ML","2024-05-21","ACTIVO","1");



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

INSERT INTO usuario VALUES("1","admin","$2y$10$4tkbAmX7RYZ2uojzRw98UucWqabgX1iU1guG2c9/4EQFN15hDjOUS","ingjerson2014@gmail.com","","ACTIVO","1","controlador/usuario/img/IMG205202418492.jpg","1","1","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO venta VALUES("1","10","1","1","TICKET","FV","","CONTADO","2024-05-21","0.00","92000.00","REGISTRADA","0.00","0.00","2024-05-21","0","1","1");
INSERT INTO venta VALUES("2","10","1","1","COTIZACION","FV","","CONTADO","2024-05-22","0.00","181000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("3","10","1","1","FACTURA","FV","","CONTADO","2024-05-22","0.00","0.00","REGISTRADA","19.00","0.00","2024-05-22","0","1","1");
INSERT INTO venta VALUES("4","10","1","1","TICKET","FV","","CONTADO","2024-05-22","0.00","212500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("5","10","1","1","COTIZACION","FV","","CONTADO","2024-05-23","0.00","1062500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("6","10","1","1","COTIZACION","FV","","CONTADO","2024-05-23","0.00","960000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("7","10","1","1","COTIZACION","FV","","CONTADO","2024-05-23","0.00","960000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("8","10","1","1","COTIZACION","FV","","CONTADO","2024-05-31","0.00","9499.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("9","10","1","1","TICKET","FV","","CONTADO","2024-05-31","0.00","9000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("10","10","1","1","COTIZACION","FV","","CONTADO","2024-05-31","0.00","9214.03","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("11","10","1","1","COTIZACION","FV","","CONTADO","2024-05-31","0.00","9024.05","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("12","10","1","1","COTIZACION","FV","","CONTADO","2024-05-31","0.00","9000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("13","10","1","1","COTIZACION","FV","","CONTADO","2024-05-31","0.00","9000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("14","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","9499.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("15","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","9499.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("16","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","78000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("17","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","240000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("18","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","120000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("19","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","240000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("20","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","240000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("21","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","240000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("22","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","240000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("23","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","120000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("24","10","1","1","COTIZACION","FV","","CONTADO","2024-06-01","0.00","312000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("25","10","1","1","COTIZACION","FV","","CONTADO","2024-06-02","0.00","46000.00","REGISTRADA","0.00","0.00","2024-06-02","0","1","1");
INSERT INTO venta VALUES("26","10","1","1","COTIZACION","FV","","CONTADO","2024-06-02","0.00","50000.00","ANULADA","0.00","0.00","2024-06-02","0","1","1");
INSERT INTO venta VALUES("27","10","1","1","TICKET","FV","","CONTADO","2024-06-02","0.00","53000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("28","10","1","1","TICKET","FV","","CONTADO","2024-06-02","0.00","540000.00","ANULADA","0.00","0.00","2024-06-02","0","1","1");
INSERT INTO venta VALUES("29","10","1","1","TICKET","FV","","CONTADO","2024-06-02","0.00","90000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("30","10","1","1","TICKET","FV","","CONTADO","2024-06-04","0.00","222000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("31","10","1","1","TICKET","FV","","CONTADO","2024-06-04","0.00","25000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("32","10","1","1","TICKET","FV","","CONTADO","2024-06-05","0.00","29000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("33","10","1","1","TICKET","FV","","CONTADO","2024-06-05","0.00","26000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("34","10","1","1","TICKET","FV","","CONTADO","2024-06-05","0.00","110000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("35","10","1","1","TICKET","FV","","CONTADO","2024-06-05","0.00","60000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("36","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","70000.00","REGISTRADA","0.00","0.00","2024-06-06","0","1","1");
INSERT INTO venta VALUES("37","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","23999.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("38","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","29000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("39","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","47000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("40","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","146000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("41","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","42000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("42","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","300000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("43","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","52000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("44","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","52000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("45","10","1","1","TICKET","FV","","CONTADO","2024-06-06","0.00","48000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("46","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","35000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("47","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","11500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("48","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("49","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("50","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","78000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("51","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","51000.00","ANULADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("52","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("53","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("54","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("55","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","65000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("56","10","1","1","TICKET","FV","","CONTADO","2024-06-07","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("57","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","38000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("58","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","40000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("59","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","51000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("60","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","11000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("61","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","60000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("62","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","25000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("63","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","36000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("64","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","21000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("65","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","40000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("66","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","45000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("67","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("68","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","95000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("69","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","42000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("70","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("71","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("72","10","1","1","TICKET","FV","","CONTADO","2024-06-08","0.00","16000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("73","10","1","1","TICKET","FV","","CONTADO","2024-06-09","0.00","500000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("74","10","1","1","TICKET","FV","","CONTADO","2024-06-09","0.00","70000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("75","10","1","1","TICKET","FV","","CONTADO","2024-06-09","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("76","10","1","1","TICKET","FV","","CONTADO","2024-06-09","0.00","40000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("77","10","1","1","TICKET","FV","","CONTADO","2024-06-09","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("78","10","1","1","TICKET","FV","","CONTADO","2024-06-10","0.00","22000.00","REGISTRADA","0.00","0.00","2024-06-10","0","1","1");
INSERT INTO venta VALUES("79","10","1","1","TICKET","FV","","CONTADO","2024-06-10","0.00","300000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("80","10","1","1","TICKET","FV","","CONTADO","2024-06-10","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("81","10","1","1","TICKET","FV","","CONTADO","2024-06-10","0.00","55000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("82","10","1","1","TICKET","FV","","CONTADO","2024-06-10","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("83","10","1","1","TICKET","FV","","CONTADO","2024-06-10","0.00","18500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("84","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("85","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("86","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","13000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("87","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","45000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("88","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("89","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("90","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","82000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("91","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","30000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("92","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","150000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("93","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("94","10","1","1","TICKET","FV","","CONTADO","2024-06-11","0.00","38000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("95","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","52000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("96","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("97","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","100000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("98","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("99","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","19000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("100","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","34000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("101","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","16000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("102","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","23000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("103","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","11500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("104","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","14000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("105","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","87000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("106","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("107","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("108","10","1","1","TICKET","FV","","CONTADO","2024-06-12","0.00","260000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("109","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","7000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("110","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","13000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("111","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","5500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("112","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","55000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("113","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","82000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("114","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("115","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","37000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("116","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("117","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","35000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("118","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("119","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("120","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","92000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("121","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","178000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("122","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","4000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("123","10","1","1","TICKET","FV","","CONTADO","2024-06-13","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("124","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("125","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("126","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("127","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","75000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("128","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","60000.00","ANULADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("129","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("130","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("131","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("132","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("133","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("134","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("135","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","300000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("136","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("137","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","23000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("138","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","46000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("139","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","85000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("140","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("141","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","82000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("142","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","148000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("143","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("144","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","10000.00","ANULADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("145","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","14000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("146","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","32000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("147","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","25000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("148","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","35000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("149","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("150","10","1","1","TICKET","FV","","CONTADO","2024-06-14","0.00","36000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("151","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("152","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("153","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("154","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","8500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("155","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","1238500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("156","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("157","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("158","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","13000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("159","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("160","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","11500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("161","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","280000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("162","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","25000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("163","10","1","1","TICKET","FV","","CONTADO","2024-06-15","0.00","62000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("164","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","178000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("165","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("166","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","120000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("167","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","13600.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("168","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","11000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("169","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","57000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("170","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","32000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("171","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","15999.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("172","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","8500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("173","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","5500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("174","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("175","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","40000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("176","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("177","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("178","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","13000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("179","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","51500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("180","10","1","1","TICKET","FV","","CONTADO","2024-06-16","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("181","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("182","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","113000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("183","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","8500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("184","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("185","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","28000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("186","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("187","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","52000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("188","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","9500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("189","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","70000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("190","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("191","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","8000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("192","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","84700.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("193","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","4000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("194","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("195","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","35000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("196","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","12000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("197","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("198","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("199","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","56000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("200","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","6000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("201","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","11500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("202","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","90000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("203","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","52000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("204","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","47000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("205","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","5500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("206","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","38000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("207","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","70000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("208","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","7000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("209","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","7000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("210","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","68000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("211","10","1","1","TICKET","FV","","CONTADO","2024-06-17","0.00","45000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("212","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","85000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("213","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","10000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("214","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("215","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("216","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","6000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("217","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("218","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","80000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("219","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","8000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("220","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","2500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("221","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","25000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("222","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","98000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("223","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","99000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("224","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","13500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("225","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","26000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("226","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","25000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("227","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","32000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("228","10","1","1","TICKET","FV","","CONTADO","2024-06-18","0.00","36000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("229","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","55000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("230","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","129500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("231","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","170000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("232","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("233","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("234","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","11000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("235","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","61000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("236","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","38000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("237","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","5500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("238","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","21000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("239","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("240","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","2500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("241","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","6000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("242","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","27000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("243","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","135000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("244","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","85000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("245","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("246","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","82000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("247","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","24500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("248","10","1","1","TICKET","FV","","CONTADO","2024-06-19","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("249","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","14000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("250","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","14000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("251","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("252","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("253","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","17000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("254","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","35000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("255","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","2700.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("256","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("257","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","16000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("258","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","14000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("259","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","48000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("260","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","272800.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("261","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","47000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("262","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","12500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("263","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","7000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("264","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","6500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("265","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","41700.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("266","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","3000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("267","10","1","1","TICKET","FV","","CONTADO","2024-06-20","0.00","42500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("268","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("269","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("270","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","20000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("271","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","8000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("272","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","2500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("273","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("274","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","18000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("275","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","100000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("276","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","22000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("277","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","8000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("278","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("279","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","80000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("280","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","52000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("281","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("282","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("283","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","3000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("284","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","5000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("285","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","2000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("286","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","3000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("287","10","1","1","TICKET","FV","","CONTADO","2024-06-21","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("288","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","265000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("289","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","15000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("290","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","2500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("291","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","39000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("292","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","665500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("293","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","6800.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("294","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","13000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("295","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","150000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("296","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","50000.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");
INSERT INTO venta VALUES("297","10","1","1","TICKET","FV","","CONTADO","2024-06-22","0.00","276500.00","REGISTRADA","0.00","0.00","0000-00-00","0","1","1");

