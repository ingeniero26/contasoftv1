<?php 
 include '../../modelo/modelo_productos.php';

 $MP = new Modelo_Productos();
$id_producto = htmlspecialchars($_POST['id_producto'],ENT_QUOTES,'UTF-8');
$codigo_actual = htmlspecialchars($_POST['codigo_actual'],ENT_QUOTES,'UTF-8');
$codigo_nuevo = htmlspecialchars($_POST['codigo_nuevo'],ENT_QUOTES,'UTF-8');
$nombre_actual = htmlspecialchars($_POST['nombre_actual'],ENT_QUOTES,'UTF-8');
$nombre_nuevo = htmlspecialchars($_POST['nombre_nuevo'],ENT_QUOTES,'UTF-8');
$presentacion_editar = htmlspecialchars($_POST['presentacion_editar'],ENT_QUOTES,'UTF-8');
$cant_minima = htmlspecialchars($_POST['cant_minima'],ENT_QUOTES,'UTF-8');
$idcategoria = htmlspecialchars($_POST['idcategoria'],ENT_QUOTES,'UTF-8');
$idunidad = htmlspecialchars($_POST['idunidad'],ENT_QUOTES,'UTF-8');
$idtipo_producto = htmlspecialchars($_POST['idtipo_producto'],ENT_QUOTES,'UTF-8');
$precio_compra = htmlspecialchars($_POST['precio_compra'],ENT_QUOTES,'UTF-8');
$precio_venta = htmlspecialchars($_POST['precio_venta'],ENT_QUOTES,'UTF-8');



$consulta =$MP->Modificar_Producto($id_producto,$codigo_actual,
 $codigo_nuevo,$nombre_actual,$nombre_nuevo,$presentacion_editar,
 $cant_minima,
    $idcategoria, $idunidad, $idtipo_producto, $precio_compra,  $precio_venta);
echo $consulta;





 ?>