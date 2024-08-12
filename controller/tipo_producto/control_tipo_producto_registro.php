<?php 
require '../../modelo/modelo_tipo_producto.php';

$MCT = new Modelo_Tipo_Producto();
$tipo_producto = htmlspecialchars($_POST['tipo_producto'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Tipo_Producto($tipo_producto,$idempresa);
echo $consulta;





 ?>