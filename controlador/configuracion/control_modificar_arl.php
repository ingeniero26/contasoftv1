<?php 
require '../../modelo/modelo_arl.php';

$MCT = new Modelo_Arl();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');

$nit_actual = htmlspecialchars($_POST['nit_actual'],ENT_QUOTES,'UTF-8');
$nit_nueva = htmlspecialchars($_POST['nit_nueva'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$email = htmlspecialchars($_POST['email'],ENT_QUOTES,'UTF-8');


$consulta =$MCT->Modificar_Arl($id,$nit_actual,$nit_nueva, $nombre,$ciudad,
$direccion,$telefono,$email);
echo $consulta;





 ?>