<?php 
require '../../modelo/modelo_marcas.php';

$MCT = new Modelo_Marcas();
$descripcion = htmlspecialchars($_POST['descripcion'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Marca_Producto($descripcion,$idempresa);
echo $consulta;





 ?>