<?php 
require '../../modelo/modelo_productos.php';

$MU = new Modelo_Productos();
$producto_id = htmlspecialchars($_POST['producto_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MU->Modificar_Estatus_Producto($producto_id,$estatus);
echo $consulta;





 ?>