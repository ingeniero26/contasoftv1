modificaciones version instalada almacen
agregar campo fecha vencimiento a las facturas de compras
reporte de compras, agregamos campo descto
reporte de ventas
modificacion procedimiento almacenado

CREACION TABLA CARGOS
INGRESO DE DATOS
MODIFICACION DE ESTATUS


/* diseñando informes de ventas*/
informe 
grafico
se debe actualizar un procedimiento de la bd

requisitos de instalacion
1.SERVIDOR LOCAL(XAMMP 7)
2.INSTALAR Y CONFIGURAR BASE DE DATOS
3. INSTALAR EL PROGRAMA




SELECT
	p.producto_codigo, 
	p.producto_nombre, 
	SUM(dv.dv_cantidad) AS cantidad, 
	sum(Round(v.venta_total,2)) as total_venta
FROM
	detalle_venta AS dv
	INNER JOIN 	producto AS p	ON 
		dv.producto_id = p.producto_id
	INNER JOIN	venta AS v	ON 
		dv.venta_id = v.venta_id
		GROUP BY  p.producto_codigo, 
	p.producto_nombre
	order by  sum(Round(v.venta_total,2)) desc
	limit 10








	/*actualizacion correo cliente

	CREATE  PROCEDURE `SP_REGISTRAR_CLIENTE`(IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50),
 IN `APEMAT` VARCHAR(50), IN `NRO_DOCUMENTO` VARCHAR(50), IN `TIPO_DOC` VARCHAR(50), IN `SEXO` VARCHAR(15), IN `TELEFONO` VARCHAR(50),
  IN `DIRECCION` VARCHAR(50), IN `CORREO` VARCHAR(100), IN `IDEMPRESA` INT)
BEGIN
DECLARE  cantidad INT;
SET @cantidad:=( SELECT COUNT(*) FROM persona WHERE persona_nrodocumento =NRO_DOCUMENTO);
IF @cantidad = 0 THEN
INSERT INTO `persona`(`persona_nombre`,`persona_apepat`,`persona_apemat`,
`persona_nrodocumento`,`persona_tipodocumento`,`persona_sexo`,`persona_telefono`,`persona_direccion`,`persona_correo`,  `persona_fregistro`,
`persona_estatus`)VALUES (NOMBRE,APEPAT,APEMAT,NRO_DOCUMENTO,TIPO_DOC,SEXO,TELEFONO,DIRECCION,CORREO,CURDATE(),'ACTIVO');
INSERT INTO cliente(`cliente_fregistro`,`cliente_estatus`,`persona_id`, idempresa) VALUES (CURDATE(),'ACTIVO',LAST_INSERT_ID(),IDEMPRESA);
SELECT 1;
ELSE 
SELECT 2;
END IF;
END



EDITAR PERSONA







CREATE  PROCEDURE `SP_MODIFICAR_PERSONA`(IN `IDPERSONA` INT, IN `NOMBRE` VARCHAR(50), IN `APEPAT` VARCHAR(50),
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
END



/* ELIMINACION DEL GASTO */
cambios en  comprobantes contables
se quita la bodega y se agrega la caja



se puede agregar y editar el costo del producto

CAMBIOS EN LA FACTURA DE COMPRA Y VENTA (SE PUEDE MEJORAR)



modificacion tabla terceros
agregando departamentos y ciudades
combo ciudades


MOSTRAR LAS CATEGORIAS DE LOS PRODUCTOS






















