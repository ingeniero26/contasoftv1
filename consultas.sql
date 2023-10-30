/*ventas por categorias*/
SELECT
  CAST(SUM(  `venta`.`venta_total`) AS DECIMAL(8,2)) AS venta
    , c.`categoria_nombre`
FROM
    `detalle_venta`
    INNER JOIN `venta`  ON (`detalle_venta`.`venta_id` = `venta`.`venta_id`)
    , `producto`  INNER JOIN `categoria` c   ON (`producto`.`id_categoria` = c.`categoria_id`) 
      GROUP BY c.`categoria_nombre`
    LIMIT 10;


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
    IFNULL(CONCAT('S./ ', FORMAT(totalCompras, 2)), 0) AS totalCompras,
    IFNULL(CONCAT('S./ ', FORMAT(totalVentas, 2)), 0) AS totalVentas,
    /*IFNULL(CONCAT('S./ ', FORMAT(ganancias, 2)), 0) AS ganancias,*/
    IFNULL(productosPocoStock, 0) AS productosPocoStock,
    IFNULL(CONCAT('S./ ', FORMAT(ventasHoy, 2)), 0) AS ventasHoy;


END