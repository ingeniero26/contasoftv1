
CREATE  PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN CODIGO VARCHAR(100),IN NOMBRE VARCHAR(100), 
IN PRESENTACION VARCHAR(250),IN IDBODEGA INT, IN IDCATEGORIA VARCHAR(100),IN IDUNIDAD INT, IN RUTA VARCHAR(255), IN PRECIO_VENTA INT)
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_codigo =CODIGO or producto_nombre =NOMBRE);
IF @CANTIDAD =0 THEN
INSERT INTO `producto` (`producto_codigo`,`producto_nombre`,`producto_presentacion`,`id_bodega`,
	producto_stock,
`id_categoria`, `id_unidad`, `producto_foto`, `producto_precioventa`, 
`producto_estatus`) VALUES(CODIGO,NOMBRE,PRESENTACION,IDBODEGA, 0,IDCATEGORIA,IDUNIDAD,RUTA,PRECIO_VENTA,'ACTIVO');
SELECT 1;
ELSE 
SELECT 2;
END IF;
END

CREATE PROCEDURE TraerDatosWidgets(IN INICIO DATE,IN FIN DATE)

SELECT  
SUM(venta.`venta_total`)
FROM venta
WHERE venta.`venta_fecha` BETWEEN INICIO AND FIN

CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_EMPLEADO`(IN IDEMP INT,
    IN ESTATUS VARCHAR(20))
UPDATE empleados set 
estatus = ESTATUS 
where IdEmp = IDEMP


CREATE  PROCEDURE `SP_MODIFICAR_CARGO`(IN IDCARGO INT,
    IN ESTATUS VARCHAR(20))
UPDATE cargos set 
estatus = ESTATUS 
where IdCargos = IDCARGO






CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_DEPTO`(IN IDDEPTO INT,
    IN ESTATUS VARCHAR(20))
UPDATE dpto set 
estatus = ESTATUS 
where IdDpto = IDDEPTO



     SELECT
    `cuentas_x_proveedor`.`idCuenta`
    , `cuentas_x_proveedor`.`noCuota`
    , `cuentas_x_proveedor`.`fecha_pago`
    ,SUM( `cuentas_x_proveedor`.`valorAbono`) AS totalAbonos
    , `cuentas_x_proveedor`.`idCompra`,
    `compra`.`compra_tipo_comprobante`,
    compra.`compra_num_comprobante` AS factura
    , `compra`.`compra_total` AS credito
    , `proveedor`.`proveedor_razon_social` AS proveedor
    ,    `compra`.`compra_total` - SUM(`cuentas_x_proveedor`.`valorAbono`) AS saldo
FROM
    `sistema_pos`.`cuentas_x_proveedor`
    INNER JOIN `sistema_pos`.`compra` 
        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)
    INNER JOIN `sistema_pos`.`proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
        GROUP BY idCompra
        



CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_CATEGORIA`(IN IDCATEGORIA INT,
    IN ESTATUS VARCHAR(20))
UPDATE categoria set 
categoria_estatus = ESTATUS 
where id = IDCATEGORIA

CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_UNIDAD`(IN IDUNIDAD INT,
    IN ESTATUS VARCHAR(20))
UPDATE unidad set 
unidad_estatus = ESTATUS 
where unidad_id = IDUNIDAD

CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_PERSONA`(IN IDPERSONA INT,
    IN ESTATUS VARCHAR(20))
UPDATE persona set 
persona_estatus = ESTATUS 
where upersona_id = IDPERSONA




CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_ROL`(IN IDROL INT,
    IN ESTATUS VARCHAR(20))
UPDATE rol set 
rol_estatus = ESTATUS 
where rol_id = IDROL

CREATE  PROCEDURE `SP_MODIFICAR_ESTATUS_EPS`(IN ID INT,
    IN ESTATUS_EPS VARCHAR(20))
UPDATE eps set 
estatus = ESTATUS_EPS 
where IdEPS = ID





CREATE  PROCEDURE `SP_REGISTRAR_COMPRA`(IN `IDPROVEEDOR` INT, IN `IDUSUARIO` INT, 
IN `TIPO_COMPROBANTE` VARCHAR(50), IN `SERIE_COMPROBANTE` VARCHAR(50),
 IN `NUM_COMPROBANTE` VARCHAR(50), IN  `FECHA_COMPRA` DATE, IN `TIPO_PAGO` VARCHAR(50),
  IN `IMPUESTO` 
 DECIMAL(10,2), IN `TOTAL` DECIMAL(10,2), IN `ESTADO` VARCHAR(50), 
 IN `PORCENTAJE` DECIMAL(10,2), IN `PORC_DCTO` DECIMAL(10,2))
BEGIN
 INSERT INTO compra(proveedor_id,usuario_id,compra_tipo_comprobante,
 compra_serie_comprobante,compra_num_comprobante,compra_fecha ,
 compra_tipo_pago,
 compra_impuesto,compra_total,compra_estatus,compra_porcentaje,compra_porc_dcto) VALUES 
 (IDPROVEEDOR,IDUSUARIO,TIPO_COMPROBANTE,SERIE_COMPROBANTE,NUM_COMPROBANTE,
    FECHA_COMPRA, TIPO_PAGO,
   IMPUESTO,TOTAL,ESTADO,PORCENTAJE,PORC_DCTO
 );
 SELECT LAST_INSERT_ID();
 END




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
    , CONCAT_WS(' ', `persona`.`persona_nombre`  , `persona`.`persona_apepat` , `persona`.`persona_apemat` ) AS proveedor
    
FROM
    `sistema_pos`.`compra`
    INNER JOIN `sistema_pos`.`usuario` 
        ON (`compra`.`usuario_id` = `usuario`.`usuario_id`)
    INNER JOIN `sistema_pos`.`proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
    INNER JOIN `sistema_pos`.`persona` 
        ON (`proveedor`.`persona_id` = `persona`.`persona_id`)
     INNER JOIN `bodega`  ON  `compra`.`id_bodega`  = `bodega`.`id`   
        WHERE compra.compra_fecha BETWEEN '2021-08-31' AND '2021-08-31'






        SELECT DISTINCT pv.*, fc.`compra_num_comprobante` AS Factura, fc.`compra_total` AS credito  FROM proveedor pv
INNER JOIN compra fc ON pv.proveedor_id =fc.`proveedor_id`
 WHERE fc.compra_tipo_pago='CREDITO' AND fc.`compra_estatus`='POR_PAGAR'
  GROUP BY pv.proveedor_id
 ORDER BY pv.`proveedor_razon_social`


 /* listado de  compras a credito */
 SELECT
    `compra`.`compra_id`
    , `compra`.`proveedor_id`
    , `proveedor`.`proveedor_razon_social`
    , `compra`.`compra_tipo_comprobante`
    , `compra`.`compra_serie_comprobante`
    , `compra`.`compra_num_comprobante`
    , `compra`.`compra_tipo_pago`
    , `compra`.`compra_fecha`
    , `compra`.`compra_impuesto`
    , `compra`.`compra_total`
    , `compra`.`compra_estatus`
    , `compra`.`compra_porcentaje`
    , `compra`.`compra_total_decto`
FROM
    `compra`
    INNER JOIN `proveedor` 
    ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
    WHERE compra.compra_tipo_pago='CREDITO' AND compra.`compra_estatus`='POR_PAGAR'
    GROUP BY `proveedor`.`proveedor_id`
    ORDER BY proveedor.`proveedor_razon_social`



    /*abonos a proveedores */
    SELECT
    `compra`.`compra_id`
    , `compra`.`proveedor_id`
    , `proveedor`.`proveedor_razon_social`
    , `compra`.`compra_num_comprobante`
    , `cuentas_x_proveedor`.`idCuenta`
    , `cuentas_x_proveedor`.`noCuota`
    , `cuentas_x_proveedor`.`fecha_pago`
    , `cuentas_x_proveedor`.`valorAbono`
    , `compra`.`compra_total` 
    , `compra`.`compra_total` -`cuentas_x_proveedor`.`valorAbono` AS saldo
FROM
    `cuentas_x_proveedor`
    INNER JOIN `compra` 
        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)
    INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`);



        /* mejorando consultas*/  SELECT
    `compra`.`compra_id`
    , `compra`.`proveedor_id`
    , `proveedor`.`proveedor_razon_social` AS proveedor
    , `compra`.`compra_num_comprobante` AS factura
    , `cuentas_x_proveedor`.`idCuenta`
    , `cuentas_x_proveedor`.`noCuota`
    , `cuentas_x_proveedor`.`fecha_pago`
    , SUM(`cuentas_x_proveedor`.`valorAbono`) AS abonos
    , `compra`.`compra_total` 
    , `compra`.`compra_total` -  SUM(`cuentas_x_proveedor`.`valorAbono`)  AS saldo
FROM
    `cuentas_x_proveedor`
    INNER JOIN `compra` 
        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)
    INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`);




        /*UTILIDAD PARA ANULAR COMPRA */
        CREATE PROCEDURE SP_ANULAR_COMPRA(IN IDCOMPRA INT)
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


END






SELECT COUNT(*) FROM `compra` WHERE `compra_estatus`='INGRESADA' AND  `compra_id` =2
SELECT COUNT(*) FROM `detalle_compra` WHERE `detalle_compra`.`dc_estatus`='INGRESADA' AND  `id_compra` =1

SELECT `id_producto` FROM `detalle_compra` 
    WHERE  `detalle_compra`.`dc_estatus` ='INGRESADA' AND  `id_compra` =2  LIMIT 1
    
    
    SELECT `detalle_compra_id` FROM `detalle_compra` WHERE `detalle_compra`.`dc_estatus`='INGRESADA' 
    AND  `id_compra` =2  LIMIT 1
    
    SELECT `producto_stock` FROM producto WHERE `producto_id` = 1
    
    SELECT `detalle_compra`.`dc_cantidad` FROM `detalle_compra` 
    WHERE `detalle_compra`.`dc_estatus` ='INGRESADA' AND  `id_compra` =2  LIMIT 1






    SELECT
    `compra`.`compra_id`
    ,CONCAT_WS(' ', `compra`.`compra_fecha` ,'. proveedor: ' 
   , `compra`.`proveedor_id`, compra.`compra_num_comprobante`, `proveedor`.`proveedor_razon_social`) AS compra 
    
FROM
    `compra`
    INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
         WHERE compra.compra_tipo_pago='CREDITO' 
         AND compra.`compra_estatus`='POR_PAGAR'





CREATE  PROCEDURE `SP_REGISTRAR_EPS`(IN NIT_EPS BIGINT(20),
    IN NOMBRE_EPS VARCHAR(100), IN CIUDAD_EPS  VARCHAR(100),
IN DIRECCION VARCHAR(100), IN TELEFONO_EPS VARCHAR(100),
IN CORREO_EPS VARCHAR(200) )
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM eps WHERE eps.`NitEPS`=NIT_EPS);
IF @CANTIDAD = 0 THEN
INSERT INTO arl (`NitEPS`, `NomEPS`,`CiudadEPS`,`DirEPS`,`TelEPS`,`EmailEps`,
 `estatus`)
VALUES (NIT_EPS,NOMBRE_EPS, CIUDAD_EPS,DIRECCION,TELEFONO_EPS ,CORREO_EPS  ,'ACTIVO');
SELECT 1;
ELSE
SELECT 2;
END IF;
END


CREATE  PROCEDURE `SP_REGISTRAR_PENSION`(IN NIT_Pension BIGINT(20),
    IN NOMBRE_Pension VARCHAR(100), IN CIUDAD_Pension  VARCHAR(100),
IN DIRECCION VARCHAR(100), IN TELEFONO_Pension VARCHAR(100),
IN CORREO_Pension VARCHAR(200) )
BEGIN 
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM pension WHERE eps.`NitPension`=NIT_EPS);
IF @CANTIDAD = 0 THEN
INSERT INTO arl (`NitEPS`, `NomEPS`,`CiudadEPS`,`DirEPS`,`TelEPS`,`EmailEps`,
 `estatus`)
VALUES (NIT_EPS,NOMBRE_EPS, CIUDAD_EPS,DIRECCION,TELEFONO_EPS ,CORREO_EPS  ,'ACTIVO');
SELECT 1;
ELSE
SELECT 2;
END IF;
END


CREATE PROCEDURE SP_LISTAR_VENTA(IN FINICIO DATE, IN FFIN DATE)

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
    , CONCAT_WS(' ',`persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS cliente
   
FROM
    `bodega`, 
    `venta`
    INNER JOIN `usuario` 
        ON (`venta`.`usuario_id` = `usuario`.`usuario_id`)
    INNER JOIN `cliente` 
        ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
    INNER JOIN `persona` 
        ON (`cliente`.`persona_id` = `persona`.`persona_id`)
        WHERE `venta`.`venta_fecha` BETWEEN FINICIO AND FFIN


        SELECT
    `cliente`.`idcliente`
    ,CONCAT_WS (' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS cliente
    , `cliente`.`cliente_estatus`
FROM
    `cliente`
    INNER JOIN `persona` 
        ON (`cliente`.`persona_id` = `persona`.`persona_id`)
        WHERE `cliente`.`cliente_estatus` ='ACTIVO'




        /*modificaciones*/
        
CREATE  PROCEDURE `SP_MODIFICAR_ARL`(IN ID int, 
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
    NitARL=NIT_NUEVO
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
END




CREATE  PROCEDURE `SP_MODIFICAR_EPS`(IN ID int, 
    IN NIT_ACTUAL VARCHAR(250), IN NIT_NUEVO VARCHAR(250),
     IN NOMBRE VARCHAR(100), IN CIUDAD VARCHAR(100), IN DIRECCION VARCHAR(200),
     IN TELEFONO VARCHAR(100),IN CORREO VARCHAR(100))
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
    NitEPS=NIT_NUEVO
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
END
      

      
CREATE  PROCEDURE `SP_REGISTRAR_EMPLEADO`(IN DOCUMENTO VARCHAR(50), IN NOMBRE VARCHAR(150),
IN DIRECCION VARCHAR(200), IN MOVIL CHAR(50), IN CELULAR CHAR(50),IN CORREO VARCHAR(100)
IN FECHANAC DATE, IN IDARL INT, IN IDEPS INT, IN IDPENSION INT)
BEGIN

DECLARE CANTIDADME INT;

    SET @CANTIDADME:=(SELECT COUNT(*) FROM empleados WHERE CCEmp =DOCUMENTO
    OR EmailEmp =CORREO);
    IF @CANTIDADME = 0 THEN
        
        INSERT INTO empleados(`CCEmp`,`NomEmp`,`DirEmp`,`TelEmp`,
        `CelEmp`, `EmailEmp`, `fecha_nacimiento`,`IdARL`,`IdEPS`,
        `IdPension`,`estatus`)
        VALUES(DOCUMENTO,NOMBRE,DIRECCION,MOVIL,CELULAR, CORREO, FECHANAC,IDARL,IDEPS,
        IDPENSION,'ACTIVO');
        SELECT 1;
    ELSE
    SELECT 2;
  
  
END IF;

END




/*REGISTRO DE VENTAS

*/
CREATE  PROCEDURE `SP_REGISTRAR_VENTA`(IN `IDCLIENTE` INT, IN `IDBODEGA` INT, IN `IDUSUARIO` INT, 
IN `TIPO_COMPROBANTE` VARCHAR(50), IN `SERIE_COMPROBANTE` VARCHAR(50),
 IN `NUM_COMPROBANTE` VARCHAR(50), IN `TIPO_PAGO` VARCHAR(50), 
 IN `IMPUESTO` DECIMAL(10,2),
  IN `TOTAL` DECIMAL(10,2), IN `ESTADO` VARCHAR(50), 
  IN `PORCENTAJE` DECIMAL(10,2), IN `DCTO_TOTAL` DECIMAL(10,2))
BEGIN
 INSERT INTO venta(`cliente_id`,`bodega_id`, usuario_id,`venta_tipocomprobante`,
 `venta_serie`,`venta_numcomprobante`, tipo_pago,`venta_fecha` ,
 `venta_impuesto`,`venta_total`,venta_estatus,venta_porcentaje,venta_total_dcto) VALUES 
 (IDCLIENTE,IDBODEGA,IDUSUARIO,TIPO_COMPROBANTE,SERIE_COMPROBANTE,NUM_COMPROBANTE,
     TIPO_PAGO,CURDATE(), IMPUESTO,TOTAL,ESTADO,PORCENTAJE,DCTO_TOTAL
 );
 SELECT LAST_INSERT_ID();
 END
 




CREATE  PROCEDURE `SP_ANULAR_VENTA`(IN `IDVENTA` INT)
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
    
      SET @CANTIDAD:= @CANTIDAD + 1;
    
  END WHILE;


END





SELECT DISTINCT pv.*  FROM proveedor pv
INNER JOIN `compra` fc ON pv.`proveedor_id` =fc.`proveedor_id`
WHERE fc.`compra_tipo_pago`='CREDITO' AND fc.`compra_estatus`='POR_PAGAR'
GROUP BY pv.`proveedor_id`
ORDER BY pv.`proveedor_razon_social`


 /* factura d compra credito */
 SELECT DISTINCT pv.`persona_id`,pv.`proveedor_razon_social` AS proveedor ,
 pv.`proveedor_num_contacto` ,
 CONCAT_WS(' ',  p.`persona_nombre`, p.`persona_apepat`, p.`persona_apemat`) AS contacto,
 p.`persona_nrodocumento` AS documento,p.`persona_direccion`,p.`persona_telefono`, fc.`compra_total` AS credito,
  fc.`compra_tipo_comprobante`, fc.`compra_num_comprobante` AS NoFactura
  FROM proveedor pv
INNER JOIN `compra` fc ON pv.`proveedor_id` =fc.`proveedor_id`
INNER JOIN  persona p ON pv.`persona_id` = p.persona_id
WHERE fc.`compra_tipo_pago`='CREDITO' AND fc.`compra_estatus`='POR_PAGAR'
GROUP BY pv.`proveedor_id`
ORDER BY pv.`proveedor_razon_social`



SELECT
    `cuentas_x_proveedor`.`idCuenta`
    , `cuentas_x_proveedor`.`noCuota`
    , `cuentas_x_proveedor`.`fecha_pago`
    , `cuentas_x_proveedor`.`valorAbono`
    , `cuentas_x_proveedor`.`idCompra`
    , `compra`.`compra_num_comprobante` AS facturaCompra
    , `compra`.`proveedor_id`
    , `proveedor`.`proveedor_razon_social` AS proveedor
FROM 
    `cuentas_x_proveedor`
    INNER JOIN `compra` 
        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)
    INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`);
        
        SELECT SUM(valorAbono) AS total FROM `cuentas_x_proveedor`
         WHERE `idCompra`='1'
         
         
         
         
         SELECT         `compra`.`compra_id`
      ,CONCAT_WS(' ','FechaCompra: ' , `compra`.`compra_fecha` 
    , `compra`.`proveedor_id`, '.  no factura: ' ,compra.`compra_num_comprobante` , `proveedor`.`proveedor_razon_social`) AS proveedor     
    FROM
     `compra`
        INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
         WHERE compra.compra_tipo_pago='CREDITO'  OR `compra`.`compra_tipo_pago` ='CREDICONTADO'




   
        SELECT      `compra`.`compra_id`
      ,CONCAT_WS(' ','FechaCompra: ' , `compra`.`compra_fecha` 
    , `compra`.`proveedor_id`, '.  no factura: ' ,compra.`compra_num_comprobante` , `proveedor`.`proveedor_razon_social`) AS proveedor     
    FROM
     `compra`
        INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
         WHERE compra.compra_tipo_pago='CREDITO'  OR `compra`.`compra_tipo_pago` ='CREDICONTADO'
       


SELECT
    `venta`.`venta_id` ,
    CONCAT_WS(' ','FechaVenta: ', venta.`venta_fecha`
    , `venta`.`cliente_id`    , `persona`.`persona_nombre`  
      , `persona`.`persona_apepat`    , `persona`.`persona_apemat`     , `persona`.`persona_nrodocumento`) AS cliente
FROM
    `cliente`
    INNER JOIN `persona`          ON (`cliente`.`persona_id` = `persona`.`persona_id`)
    INNER JOIN `venta`         ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
        WHERE venta.`tipo_pago`='CREDITO'  OR  venta.`tipo_pago` ='CREDICONTADO'




        /* procedimientos nuevos */

        CREATE PROCEDURE TraerDatosWidgets(IN INICIO DATE,IN FIN DATE)

SELECT  
IFNULL(SUM(venta.`venta_total`),0),
(SELECT IFNULL(SUM( `compra`.`compra_total`), 0)
 FROM `compra` WHERE `compra_fecha`
BETWEEN INICIO AND FIN),
(SELECT COUNT(*) FROM venta WHERE venta.`venta_fecha` BETWEEN INICIO AND FIN),
(SELECT COUNT(*) FROM compra WHERE compra.`compra_fecha` BETWEEN INICIO AND FIN)
FROM venta
WHERE venta.`venta_fecha` BETWEEN INICIO AND FIN



CREATE PROCEDURE TraerDatosGraficoWidgets(IN INICIO DATE,IN FIN DATE)
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
         
          ORDER BY  `dv_cantidad` DESC LIMIT 5 



          CREATE PROCEDURE TraerDatosGrafico_Compras_Widgets(IN INICIO DATE,IN FIN DATE)

SELECT `producto`.`producto_nombre`,
    SUM( `detalle_compra`.`dc_cantidad`)  
FROM
  `detalle_compra`
  INNER JOIN `producto` 
  ON (`detalle_compra`.`id_producto` = `producto`.`producto_id`)
    INNER JOIN `compra` 
   ON (`detalle_compra`.`id_compra` = `compra`.`compra_id`)
    WHERE `compra`.`compra_fecha` BETWEEN INICIO AND FIN
    GROUP BY  `detalle_compra`.`id_producto`
     ORDER BY  `dc_cantidad` DESC LIMIT 5 