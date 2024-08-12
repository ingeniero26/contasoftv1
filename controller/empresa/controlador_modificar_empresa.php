<?php 
require '../../modelo/modelo_empresa.php';

$MCT = new Modelo_Empresa();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$NIT_actual = htmlspecialchars($_POST['NIT_actual'],ENT_QUOTES,'UTF-8');
$NIT_nuevo = htmlspecialchars($_POST['NIT_nuevo'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$representante = htmlspecialchars($_POST['representante'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Empresa($idempresa,$NIT_actual,$NIT_nuevo,$nombre,
$representante,$direccion,$telefono,$ciudad,$correo, $estatus);
echo $consulta;





 ?>