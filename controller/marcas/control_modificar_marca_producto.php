<?php 
require '../../modelo/modelo_marcas.php';

$MCT = new Modelo_Marcas();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$desc_actual = htmlspecialchars($_POST['desc_actual'],ENT_QUOTES,'UTF-8');
$desc_nueva = htmlspecialchars($_POST['desc_nueva'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Marcas($id,$desc_actual,$desc_nueva, $estatus);
echo $consulta;





 ?>