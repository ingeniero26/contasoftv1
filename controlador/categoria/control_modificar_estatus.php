<?php 
require '../../modelo/modelo_categoria.php';

$MU = new Modelo_Categoria();
$categoria_id = htmlspecialchars($_POST['categoria_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MU->Modificar_Estatus_Categoria($categoria_id,$estatus);
echo $consulta;





 ?>