<?php 
require '../../modelo/modelo_cliente.php';

$MCT = new Modelo_Cliente();
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$apepat = htmlspecialchars($_POST['apepat'],ENT_QUOTES,'UTF-8');
$apemat = htmlspecialchars($_POST['apemat'],ENT_QUOTES,'UTF-8');
$numero = htmlspecialchars($_POST['numero'],ENT_QUOTES,'UTF-8');
$tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
$tipo_contribuyente = htmlspecialchars($_POST['tipo_contribuyente'],ENT_QUOTES,'UTF-8');
//$sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');
 $idciudad = htmlspecialchars($_POST['idciudad'],ENT_QUOTES,'UTF-8');
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Cliente($nombre,$apepat,$apemat,$numero,$tipo_doc,$tipo_contribuyente, $telefono,$direccion,
    $correo,$idciudad,$idempresa);
echo $consulta;





 ?>