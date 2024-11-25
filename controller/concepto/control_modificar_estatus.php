<?php 
require '../../model/modelo_concepto.php';

$MU = new Modelo_Concepto();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MU->Modificar_Estatus_Concepto($id,$estatus);
echo $consulta;





 ?>