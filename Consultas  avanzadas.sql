SELECT     `ciudades`.`id`
			, `ciudades`.`nombre_ciudad`
			, ciudades.`estatus`
			, `ciudades`.`idDepto`
			, ciudades.idempresa
			, `departamentos`.`nombre_depto`
				FROM `ciudades`
				INNER JOIN `departamentos`
			ON (`ciudades`.`idDepto` =
			 `departamentos`.`id`)
			 
			 SELECT * FROM ciudades
			 
			 
			 
			 
			 
	CREATE  PROCEDURE `prc_obtenerNroBoleta` () 
	 NO SQL select serie_boleta,
		IFNULL(LPAD(max(c.nro_correlativo_venta)+1,8,'0'),'00000001') nro_venta 
from empresa c$$	

select  p.codigo_producto,
		p.descripcion_producto,
        sum(vd.cantidad) as cantidad,
        sum(Round(vd.total_venta,2)) as total_venta
from venta_detalle vd inner join productos p on vd.codigo_producto = p.codigo_producto
group by p.codigo_producto,
		p.descripcion_producto
order by  sum(Round(vd.total_venta,2)) DESC
limit 10;


SELECT p.producto_codigo,p.producto_nombre,
p.producto_descripcion,
  SUM(dv.dv_cantidad) AS cantidad,
SUM(ROUND(v.venta_total,2)) AS total_venta
 FROM detalle_venta dv
INNER JOIN venta v ON dv.venta_id = v.venta_id
INNER JOIN producto p ON dv.producto_id = p.producto_id
GROUP BY p.producto_codigo, p.producto_descripcion
ORDER BY SUM(ROUND(v.venta_total,2)) desc
 
SELECT
 p.producto_codigo,
p.producto_nombre,p.producto_descripcion
INNER JOIN venta v ON 
 FROM producto p











	 
			 
			 
			 
