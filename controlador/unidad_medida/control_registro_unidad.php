<?php 
require '../../modelo/modelo_unidad_medida.php';

$MUM = new Unidad_Medida();
$unidad = htmlspecialchars($_POST['unidad'],ENT_QUOTES,'UTF-8');
$abreviatura = htmlspecialchars($_POST['abreviatura'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');

$consulta =$MUM->Registrar_Unidad($unidad,$abreviatura,$idempresa);
echo $consulta;





 ?>