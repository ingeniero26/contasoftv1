<?php 
require '../../modelo/modelo_unidad_medida.php';

$MUM = new Unidad_Medida();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$unidad_actual = htmlspecialchars($_POST['unidad_actual'],ENT_QUOTES,'UTF-8');
$unidad_nueva = htmlspecialchars($_POST['unidad_nueva'],ENT_QUOTES,'UTF-8');
$abreviatura = htmlspecialchars($_POST['abreviatura'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MUM->Modificar_Unidad($id,$unidad_actual,$unidad_nueva, $abreviatura, $estatus);
echo $consulta;





 ?>