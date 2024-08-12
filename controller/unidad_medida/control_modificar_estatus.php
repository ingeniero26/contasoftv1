<?php 
require '../../modelo/modelo_unidad_medida.php';

$MUM = new Unidad_Medida();
$unidad_id = htmlspecialchars($_POST['unidad_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MUM->Modificar_Estatus_Unidad($unidad_id,$estatus);
echo $consulta;





 ?>