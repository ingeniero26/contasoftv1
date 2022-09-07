<?php 
require '../../modelo/modelo_cliente.php';

$MCT = new Modelo_Cliente();
$idcliente = htmlspecialchars($_POST['idcliente'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Modificar_Estatus_Cliente($idcliente,$estatus);
echo $consulta;





 ?>