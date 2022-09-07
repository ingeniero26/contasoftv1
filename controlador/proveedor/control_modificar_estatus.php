<?php 
require '../../modelo/modelo_proveedor.php';

$MPV = new Modelo_Proveedor();
$proveedor_id = htmlspecialchars($_POST['proveedor_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MPV->Modificar_Estatus_Proveedor($proveedor_id,$estatus);
echo $consulta;





 ?>