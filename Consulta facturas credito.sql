SELECT CONCAT_WS(' ',`p`.`persona_nombre`,
 `p`.`persona_apepat`, `p`.`persona_apemat`) AS cliente,
 p.persona_nrodocumento,
v.fecha_vencimiento,
CURRENT_DATE  AS fecha_actual,
v.venta_total,v.`venta_id` AS factura,
IF(DATEDIFF(CURRENT_DATE,fecha_vencimiento) > 0 , 'Si', 'No') AS vencida
 FROM venta v
 INNER JOIN cliente c ON v.cliente_id =  c.idcliente
 INNER JOIN persona p ON c.persona_id = p.persona_id
 WHERE v.tipo_pago = 'CREDITO'
 ORDER BY  v.`fecha_vencimiento` DESC