<?php 
 require '../../modelo/modelo_empresa.php';
 $MU = new Modelo_Empresa();

$NIT = htmlspecialchars($_POST['NIT'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$representante = htmlspecialchars($_POST['representante'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Empresa($NIT,$nombre,$representante, $direccion,$telefono,$correo);
echo $consulta;





 ?>