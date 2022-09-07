<?php 
require '../../modelo/modelo_categoria.php';

$MCT = new Modelo_Categoria();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$categoria_actual = htmlspecialchars($_POST['categoria_actual'],ENT_QUOTES,'UTF-8');
$categoria_nueva = htmlspecialchars($_POST['categoria_nueva'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Categoria($id,$categoria_actual,$categoria_nueva, $estatus);
echo $consulta;





 ?>