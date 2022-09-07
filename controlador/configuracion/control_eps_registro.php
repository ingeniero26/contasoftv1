<?php 
require '../../modelo/modelo_eps.php';

$MCT = new Modelo_Eps();
$nit = htmlspecialchars($_POST['nit'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Registrar_Eps($nit,$nombre,$ciudad,$direccion,$telefono,$correo);
echo $consulta;





 ?>