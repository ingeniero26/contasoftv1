SELECT * FROM producto
/*contar productos*/
SELECT COUNT(producto_id) AS total_productos
FROM producto

SELECT * FROM cliente
SELECT COUNT(idcliente) AS total_clientes
FROM cliente


SELECT * FROM proveedor
SELECT COUNT(proveedor_id) AS total_proveedores
FROM proveedor

SELECT * FROM venta

SELECT SUM(`venta_total`) AS total_sales
FROM venta
WHERE YEAR(`venta_fecha`) = 2023











