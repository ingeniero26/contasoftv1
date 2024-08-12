<?php 
require '../../modelo/modelo_concepto.php';

$MCT = new Modelo_Concepto();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$descripcion_actual = htmlspecialchars($_POST['descripcion_actual'],ENT_QUOTES,'UTF-8');
$descripcion_nueva = htmlspecialchars($_POST['descripcion_nueva'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Concepto($id,$descripcion_actual,$descripcion_nueva, $estatus);
echo $consulta;





 ?>