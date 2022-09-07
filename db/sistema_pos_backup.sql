

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO arl VALUES("1","800198456","ARL Sura","Cartagena","Calle 49A No. 63-55","4444578","arl@gmail.com","2021-09-14 09:06:26","ACTIVO");
INSERT INTO arl VALUES("2","911198456","POSITIVA","CALI","CALLE 35","3587777","correo@GMAIL.COM","2021-09-14 08:29:34","ACTIVO");



CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO bodega VALUES("1","Principal","2021-10-25 15:47:58","ACTIVO","1");
INSERT INTO bodega VALUES("3","Cartagena","2022-01-21 10:46:49","ACTIVO","");



CREATE TABLE `cargos` (
  `IdCargos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de los cargos que existen',
  `DescCargos` varchar(60) NOT NULL COMMENT 'Descripcion de los cargos que existen',
  `IdDpto` int(11) NOT NULL COMMENT 'Id del departamento o area como FK',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdCargos`),
  KEY `FK_IdDpto` (`IdDpto`),
  CONSTRAINT `FK_IdDpto` FOREIGN KEY (`IdDpto`) REFERENCES `dpto` (`IdDpto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO cargos VALUES("1","Jefe de Ventas","1","2021-09-19 20:21:07","ACTIVO");
INSERT INTO cargos VALUES("2","Presidente","4","2021-09-30 20:43:14","ACTIVO");
INSERT INTO cargos VALUES("3","Programador","4","2021-10-01 15:56:53","ACTIVO");



CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoria_fregistro` date DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO categoria VALUES("1","Licores","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("2","Aseo Personal","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("3","Aseo Hogar 2","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("4","Ferreteria","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("5","Ninos","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("6","Interior Masculino","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("7","Interior Femenino","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("8","Frutas y Verduras","2021-08-31","ACTIVO","2");
INSERT INTO categoria VALUES("9","Granos","2021-08-31","ACTIVO","2");
INSERT INTO categoria VALUES("10","Electrodomesticos","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("11","Farmacia","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("12","Panaderia","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("13","Belleza Mujer","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("14","Jugos Naturales","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("15","Deporte","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("16","Literatura","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("17","Arte","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("18","Lacteos","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("19","Seguridad Personal","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("20","Charcuteria","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("21","Carniceria","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("22","Salsas","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("23","Lacteos","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("24","Carniceria","2021-08-31","ACTIVO","");
INSERT INTO categoria VALUES("25","Tecnologia","2021-08-31","ACTIVO","1");
INSERT INTO categoria VALUES("26","Hogar","2021-09-03","ACTIVO","");
INSERT INTO categoria VALUES("27","Ropa para damas","2021-10-26","ACTIVO","1");
INSERT INTO categoria VALUES("28","Papeleria","2021-11-13","ACTIVO","1");
INSERT INTO categoria VALUES("29","Dulceria","2021-11-13","ACTIVO","1");
INSERT INTO categoria VALUES("30","Servicios","2021-11-20","ACTIVO","1");
INSERT INTO categoria VALUES("31","Dulces","2022-02-03","ACTIVO","1");



CREATE TABLE `categoriaarl` (
  `IdCategoriaARL` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la categoria de ARL',
  `DescCategoriaARL` varchar(60) NOT NULL COMMENT 'Descripcion de la categoria de ARL',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje que cubre el ARL por categoria',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaciones o comentarios de la categoria de riesgo',
  PRIMARY KEY (`IdCategoriaARL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_id` int(11) NOT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `id_perdosa` (`persona_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cliente VALUES("1","2021-11-13","ACTIVO","17","1");
INSERT INTO cliente VALUES("2","2022-02-03","ACTIVO","18","1");



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




CREATE TABLE `concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO concepto VALUES("1","Salida por Defecto","2021-09-24 11:06:13","ACTIVO");



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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE `cuentas_x_proveedor` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `noCuota` double DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `valorAbono` double DEFAULT NULL,
  `idCompra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCuenta`),
  KEY `idCompra` (`idCompra`),
  CONSTRAINT `cuentas_x_proveedor_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`compra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO detalle_venta VALUES("1","1","1","1.00","400.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("2","2","2","1.00","500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("3","3","3","2.00","500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("4","4","4","4.00","500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("5","5","4","4.00","500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("6","6","5","1.00","15000.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("7","7","4","2.00","500.00","0.00","INGRESADA");
INSERT INTO detalle_venta VALUES("8","8","5","6.00","15000.00","1800.00","INGRESADA");
INSERT INTO detalle_venta VALUES("9","9","1","1.00","400.00","0.00","INGRESADA");



CREATE TABLE `dpto` (
  `IdDpto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del area al que pertenece',
  `DescDpto` varchar(60) NOT NULL COMMENT 'Descripcion del departamento donde labora',
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  PRIMARY KEY (`IdDpto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO dpto VALUES("1","Ventas","2021-09-19 20:20:00","ACTIVO");
INSERT INTO dpto VALUES("2","Contabilidad","2021-09-19 20:20:04","ACTIVO");
INSERT INTO dpto VALUES("3","facturacion","2021-09-30 14:21:49","ACTIVO");
INSERT INTO dpto VALUES("4","Recursos Humanos","2021-09-30 14:58:33","ACTIVO");



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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO empleados VALUES("1","107081375","JERSON BATISTA","EL CENTRO","3014788","3254777","INGJERSON@GMAIL.COM","1986-06-05","1","1","1","2021-09-29 14:13:17","ACTIVO","1");



CREATE TABLE `empresa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Representante` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Correo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO empresa VALUES("1","1070813756","JERSON BATISTA","EL CARMEN DE BOLIVAR","3002158777","INFO@GMAIL.COM","controlador/empresa/img/IMG24102021184629.jpg","2021-10-24 18:46:29","ACTIVO");
INSERT INTO empresa VALUES("2","102477777","KAREN VEGA","CARTAGENA","2321321321","INFO1@GMAIL.COM","","2021-10-24 19:56:19","ACTIVO");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO eps VALUES("1","801198451","Famisanar","Bogota","Calle 78 No. 13 A - 07","3078069","nose@gmail.com","2021-09-12 21:05:35","ACTIVO");
INSERT INTO eps VALUES("2","911198456","SANITAS","ciudad","direccion","telefono","correo","2021-09-12 21:36:35","ACTIVO");
INSERT INTO eps VALUES("3","911198457","MUTUAL SER","MEDELLIN","centro","343434","info@gmail.com","2021-09-14 10:17:06","ACTIVO");



CREATE TABLE `gastos` (
  `idGasto` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo_gasto` int(11) NOT NULL,
  `nombre` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idGasto`),
  KEY `idtipo_gasto` (`idtipo_gasto`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`idtipo_gasto`) REFERENCES `tipo_gasto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO pension VALUES("1","901199451","COLFONDOS","CARTAGENA","CALLE 85 C","324444","NOSE@GMAIL.COM","2021-09-13 08:41:40","ACTIVO");
INSERT INTO pension VALUES("2","902199452","PORVENIR","ciudad","direccion","telefono","correo","2021-09-13 09:23:55","ACTIVO");



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
  PRIMARY KEY (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO persona VALUES("1","jerson","batista","vega","1070813753","CEDULA","MASCULINO","3254777","el carmen","prueba@gmail.com","2021-08-26","ACTIVO");
INSERT INTO persona VALUES("4","Daniela","Meza","Rocha","1212121","CEDULA","FEMENINO","123132132132","BOGOTA","prueba4444444@gmail.com","2021-09-03","ACTIVO");
INSERT INTO persona VALUES("5","YELENIS","VEGA","GEURRA","800177119","CEDULA","MASCULINO","30000000","BOGOTA","prueba@gmail.com","2021-09-03","ACTIVO");
INSERT INTO persona VALUES("6","PROVEEDOR","CORVEETA","CORVEETA","8909009431","NIT","MASCULINO","30000000","BOGOTA","prueba4444444@gmail.com","2021-09-03","ACTIVO");
INSERT INTO persona VALUES("7","YELENIS","hernandez","VEGA","1047378360","CEDULA","FEMENINO","36241111","BOGOTA","prueba@gmail.com","2021-09-21","ACTIVO");
INSERT INTO persona VALUES("8","KAREN","hernandez","VEGA","1047378369","CEDULA","FEMENINO","30178999","BOGOTA","prueba@gmail.com","2021-09-28","ACTIVO");
INSERT INTO persona VALUES("9","FEDERICO","VEGA","GEURRA","543534345","NIT","MASCULINO","5646546","KRA 23","prueba@gmail.com","2021-10-29","ACTIVO");
INSERT INTO persona VALUES("10","RADAMEL","FALCAO","GARCIA","13213215465","CEDULA","MASCULINO","321321321","EL CARMEN DE BOLIVAR","prueba@gmail.com","2021-10-29","ACTIVO");
INSERT INTO persona VALUES("11","Juan","GUERRA","DDD","54545","CEDULA","MASCULINO","565","YTYT","prueba@gmail.com","2021-10-29","ACTIVO");
INSERT INTO persona VALUES("12","PROVEEDOR","BATISTA","VEGA","453453453453","CEDULA","MASCULINO","30178999","EL CARMEN DE BOLIVAR","prueba12121@gmail.com","2021-10-29","ACTIVO");
INSERT INTO persona VALUES("13","Daniela","Rocha","Meza","1002343563","CEDULA","FEMENINO","3014561359","calle 33 #49-50","","2021-11-07","ACTIVO");
INSERT INTO persona VALUES("14","LAURA","ACOSTA","REYES","1002442958","CEDULA","FEMENINO","3208976219","EL CENTRO","","2021-11-09","ACTIVO");
INSERT INTO persona VALUES("15","CLIENTE","POR MOSTRADOR","DE PRUEBA","00000001","CEDULA","MASCULINO","30000000","EL CARMEN DE BOLIVAR","","2021-11-11","ACTIVO");
INSERT INTO persona VALUES("16","PROVEEDOR ","DE ","MOSTRADOR","00001","NIT","MASCULINO","30000000","EL CARMEN DE BOLIVAR","","2021-11-13","ACTIVO");
INSERT INTO persona VALUES("17","CLIENTE","DE ","MOSTRADOR","000001","CEDULA","MASCULINO","123132132132","EL CARMEN DE BOLIVAR","prueba@gmail.com","2021-11-13","ACTIVO");
INSERT INTO persona VALUES("18","KAREN","VEGA","RAMIREZ","4555656565","CEDULA","FEMENINO","65567567","YRY","KAREN123@GMAIL.COM","2022-02-03","ACTIVO");



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




CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producto_presentacion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `producto_serie` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cant_minima` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_stock` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `producto_foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producto_precioventa` decimal(10,2) DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `id_unidad` (`id_unidad`),
  KEY `producto_ibfk_1` (`id_categoria`),
  KEY `id_bodega` (`id_bodega`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`unidad_id`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`),
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO producto VALUES("1","01","Galletas Muu","01","1","5465465","1","4","29","6","controlador/productos/img/default.png","400.00","ACTIVO","2022-02-04 09:12:25","1");
INSERT INTO producto VALUES("2","002","Sobre de manila carta","002","1","2455","1","2","28","6","controlador/productos/img/default.png","500.00","ACTIVO","2022-02-04 09:12:28","1");
INSERT INTO producto VALUES("3","003","SERVICIO DE INTERNET","003","1","4545","003","38","30","6","controlador/productos/img/default.png","500.00","ACTIVO","2022-02-04 09:12:37","1");
INSERT INTO producto VALUES("4","004","IMPRESIONES","004","1","54555","1","490","30","6","controlador/productos/img/default.png","500.00","ACTIVO","2022-02-04 09:12:42","1");
INSERT INTO producto VALUES("5","005","TUTORIAS","005","1","455","1","13","30","6","controlador/productos/img/default.png","15000.00","ACTIVO","2022-02-04 09:12:39","1");
INSERT INTO producto VALUES("6","4454545454545","GALLETA mu roja azucarada","56565","1","0001","2","0","29","6","controlador/productos/img/default.png","2300.00","ACTIVO","2022-02-04 10:37:43","1");



CREATE TABLE `proveedor` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_fregistro` date DEFAULT NULL,
  `proveedor_num_contacto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `proveedor_razon_social` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `persona_id` (`persona_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO proveedor VALUES("1","2021-11-13","3201111","ACTIVO","16","MOSTRADOR","1");



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




CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_fregistro` date DEFAULT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`rol_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO rol VALUES("1","Administrador","2021-08-31","ACTIVO","1");
INSERT INTO rol VALUES("2","Vendedor","2021-08-17","ACTIVO","1");
INSERT INTO rol VALUES("3","Invitado","2021-10-21","ACTIVO","2");
INSERT INTO rol VALUES("4","PRUEBA","2021-10-26","ACTIVO","1");
INSERT INTO rol VALUES("5","Gerente de Inventario","2021-10-26","ACTIVO","1");



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




CREATE TABLE `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fregistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estatus` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE `tipodeducciones` (
  `IdTipoDeducciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de deduccion',
  `DescTipoDeducciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de deduccion',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de deduccion',
  PRIMARY KEY (`IdTipoDeducciones`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO tipodeducciones VALUES("1","Aportes Salud","");
INSERT INTO tipodeducciones VALUES("2","Aportes Pensiones","");
INSERT INTO tipodeducciones VALUES("3","Aportes Fondo Solidario","");
INSERT INTO tipodeducciones VALUES("4","Otros","");
INSERT INTO tipodeducciones VALUES("5","Embargos judiciales","Los embargos ordenados por autoridad judicial
 competente contra los empleados, deben ser descontados de la nómina 
 por la empresa y consignarlos en la cuenta que el juez haya ordenado");



CREATE TABLE `tipohe` (
  `IdTipoHE` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de hora extra',
  `NomTipoHE` varchar(80) NOT NULL COMMENT 'Nombre del tipo de hora extra',
  `Multiplicador` double NOT NULL COMMENT 'Por cuanto se multiplica el valor de hora extra',
  PRIMARY KEY (`IdTipoHE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `tipoprestaciones` (
  `IdTipoPrestaciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo de prestacion',
  `DescTipoPrestaciones` varchar(80) NOT NULL COMMENT 'Descripcion del tipo de prestacion',
  `Porcentaje` double NOT NULL COMMENT 'Porcentaje',
  `Observaciones` text DEFAULT NULL COMMENT 'Observaiones del tipo de prestacion',
  PRIMARY KEY (`IdTipoPrestaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO tipoprestaciones VALUES("1","Cesantias","8.33","");
INSERT INTO tipoprestaciones VALUES("2","Int./Cesancias","1","");
INSERT INTO tipoprestaciones VALUES("3","Vacaciones","4.16","");
INSERT INTO tipoprestaciones VALUES("4","Prima","8.33","");
INSERT INTO tipoprestaciones VALUES("5","Subsidios","5","");



CREATE TABLE `tiposalario` (
  `IdTipoSalario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del tipo del salario del empleado',
  `DescTipoSalario` varchar(60) NOT NULL COMMENT 'Descripcion del tipo de salario',
  PRIMARY KEY (`IdTipoSalario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO unidad VALUES("1","Gramos","GR","2021-08-31","ACTIVO","1");
INSERT INTO unidad VALUES("2","Kilogramo","KG","2021-08-31","ACTIVO","1");
INSERT INTO unidad VALUES("3","Litro","LT","2021-08-31","ACTIVO","1");
INSERT INTO unidad VALUES("4","Metro","MT","2021-08-31","ACTIVO","2");
INSERT INTO unidad VALUES("5","Onza","ON","2021-08-31","ACTIVO","2");
INSERT INTO unidad VALUES("6","Unidad","UN","2021-08-31","ACTIVO","2");
INSERT INTO unidad VALUES("7","Por Metros","UN","2021-10-26","ACTIVO","1");



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
  PRIMARY KEY (`usuario_id`) USING BTREE,
  UNIQUE KEY `usuario_nombre_2` (`usuario_nombre`),
  UNIQUE KEY `usuario_nombre_3` (`usuario_nombre`),
  KEY `persona_id` (`persona_id`),
  KEY `usuario_ibfk_1` (`rol_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`),
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO usuario VALUES("1","admin","$2y$10$fT0BNUP3Solt7M2BMx8Iwu6aFF8OHVQ3vb5PUoWHqac2Y4ZUcO.F.","ingjerson2014@gmail.com","0","ACTIVO","1","controlador/usuario/img/IMG1792021201135.jpg","1","1");



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
  PRIMARY KEY (`venta_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `bodega_id` (`bodega_id`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO venta VALUES("1","1","1","1","FACTURA","FV","001","CONTADO","2021-11-13","0.00","400.00","REGISTRADA","0.00","0.00","2021-11-13","1");
INSERT INTO venta VALUES("2","1","1","1","FACTURA","FV","002","CONTADO","2021-11-13","0.00","500.00","REGISTRADA","0.00","0.00","2021-11-13","1");
INSERT INTO venta VALUES("3","1","1","1","TICKET","FV","0001","CONTADO","2021-11-20","0.00","1000.00","REGISTRADA","0.00","0.00","2021-11-20","1");
INSERT INTO venta VALUES("4","1","1","1","TICKET","FV","0001","CONTADO","2021-11-22","0.00","2000.00","REGISTRADA","0.00","0.00","2021-11-22","1");
INSERT INTO venta VALUES("5","1","1","1","TICKET","FV","0002","CONTADO","2021-11-22","0.00","2000.00","REGISTRADA","0.00","0.00","2021-11-22","1");
INSERT INTO venta VALUES("6","1","1","1","TICKET","FV","0003","CONTADO","2021-11-22","0.00","15000.00","REGISTRADA","0.00","0.00","2021-11-22","1");
INSERT INTO venta VALUES("7","1","1","1","COTIZACION","FV","0012","CONTADO","2021-12-07","0.00","1000.00","REGISTRADA","0.00","0.00","2021-12-07","1");
INSERT INTO venta VALUES("8","1","1","1","FACTURA","FV","546546565","CONTADO","2022-01-08","16758.00","104958.00","REGISTRADA","0.19","1800.00","2022-01-08","1");
INSERT INTO venta VALUES("9","1","1","1","COTIZACION","FV","232323","CONTADO","2022-02-03","0.00","400.00","REGISTRADA","0.00","0.00","2022-02-03","1");

