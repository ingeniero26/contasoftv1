<?php 
require '../../modelo/modelo_categoria.php';

$MCT = new Modelo_Categoria();
$categoria = htmlspecialchars($_POST['categoria'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Categria($categoria,$idempresa);
echo $consulta;





 ?>