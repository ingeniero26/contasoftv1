SELECT p.`producto_codigo`,
	p.`producto_nombre`,
	SUM(vd.`dv_cantidad`) AS cantidad,
	SUM(ROUND(vt.`venta_total`,2)) AS total_venta

FROM `detalle_venta` vd 
INNER JOIN	producto p ON vd.`producto_id` = p.`producto_id`
INNER JOIN     venta vt ON vd.`venta_id` = vt.`venta_id`

	GROUP BY p.producto_codigo,
        p.`producto_nombre`
ORDER BY  SUM(ROUND(vt.`venta_total`,2)) DESC
LIMIT 20