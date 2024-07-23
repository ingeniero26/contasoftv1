SELECT
    `venta`.`venta_id`    , `venta`.`venta_tipocomprobante`
    , `venta`.`venta_serie`    , `venta`.`venta_numcomprobante`
    , `venta`.`tipo_pago`    , `venta`.`venta_fecha`
    , `venta`.`venta_impuesto`    , `venta`.`venta_total`
    , `venta`.`venta_estatus`    , `venta`.`venta_porcentaje`
    , `venta`.`venta_total_dcto`    , `venta`.`cliente_id`, venta.`fecha_vencimiento`
    
    , CONCAT_WS(' ', `persona`.`persona_nombre`   , `persona`.`persona_apepat`   , `persona`.`persona_apemat` ) AS cliente
    , `persona`.`persona_nrodocumento`,`persona`.`persona_direccion`,`persona`.`persona_telefono`
    , usuario.`usuario_nombre`
    , empresa.Nit, empresa.nombre, empresa.Representante, empresa.Direccion,empresa.Telefono,empresa.Correo, empresa.Logo
    FROM
    `venta`
    INNER JOIN `cliente` 
        ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
    INNER JOIN `persona` 
        ON (`cliente`.`persona_id` = `persona`.`persona_id`)
        INNER JOIN usuario ON venta.`usuario_id` = usuario.`usuario_id`
        INNER JOIN empresa ON empresa.ID = venta.idempresa
        
        
      SELECT    `producto`.`producto_nombre`
    , `detalle_venta`.`dv_cantidad` 
	 , `detalle_venta`.`dv_precio`,
	  `detalle_venta`.`dv_descuento`,
     `detalle_venta`.`dv_cantidad` *  
	  `detalle_venta`.`dv_precio` AS subtotal
     FROM
    `detalle_venta`
    INNER JOIN `producto`  
	 ON (`detalle_venta`.`producto_id` = `producto`.`producto_id`)   
        
   SELECT producto.producto_codigo, `producto`.`producto_nombre`,
	producto.producto_descripcion,
	qd.cantidad,
   qd.precio,qd.descuento,
   qd.cantidad * qd.precio AS subtotal
	FROM quotation_detail qd
   INNER JOIN producto ON 
   qd.producto_id = producto.producto_id
   
   
   
   SELECT c.id, c.descripcion,
   c.estatus,
   c.fregistro,
	 c.idempresa
	 FROM concepto c
	 WHERE c.estatus = 'ACTIVO'
	 AND c.idempresa = 1
	 ORDER BY c.fregistro ASC 
	 
	 UPDATE concepto SET 
 	estatus = ESTATUS 
	where id = IDCONCEPTO
	
	
	
	
	
	SELECT
		`e`.`ID`, `e`.`Nit`
		, `e`.`nombre`, `e`.`Representante`
		, e.`idCiudad`, ciudades.`nombre_ciudad`
		, `e`.`Direccion`, `e`.`Telefono`
		, `e`.`Correo`, `e`.`Logo`
		,  e.Industria
		, `e`.`id_tipo_regimen`, `tipo_regimen`.`descripcion`
		, `e`.`fregistro`, `e`.`estatus`
		FROM
		empresa e
		INNER JOIN `tipo_regimen` ON (`e`.`id_tipo_regimen` = `tipo_regimen`.`id`)
		INNER JOIN ciudades on (e.`idCiudad` = ciudades.`id`)
   
   SELECT * FROM salida
   
   SELECT  s.id,s.idConcepto,c.descripcion,
   s.fecha,s.idBodega, b.nombre_bodega,s.idusuario,
   u.usuario_nombre,s.idEmpresa,s.created_at,
   ds.idproducto, p.producto_codigo,p.producto_nombre,
   ds.cantidad,ds.estatus
      
	 FROM salida s
   INNER JOIN concepto c ON s.idConcepto= c.id
   INNER JOIN bodega b ON s.idBodega = b.id
   INNER JOIN usuario u ON s.idusuario = u.usuario_id
   INNER JOIN empresa e ON s.idEmpresa = e.ID
   LEFT  OUTER JOIN detalle_salida ds ON s.id = ds.idsalida
   INNER JOIN producto p ON ds.idproducto = p.producto_id
   
   
        
        
        