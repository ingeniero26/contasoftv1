<?php 
require '../../modelo/modelo_bodegas.php';

$MCT = new Modelo_Bodegas();
$nombre_bodega = htmlspecialchars($_POST['nombre_bodega'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Bodega($nombre_bodega,$idempresa);
echo $consulta;





 ?>