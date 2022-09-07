<?php 
require '../../modelo/modelo_bodegas.php';

$MB = new Modelo_Bodegas();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MB->Modificar_Estatus_Bodega($id,$estatus);
echo $consulta;





 ?>