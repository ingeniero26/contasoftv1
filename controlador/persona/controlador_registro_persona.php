<?php 
require '../../modelo/modelo_persona.php';

$MP = new Modelo_Persona();
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$apepat = htmlspecialchars($_POST['apepat'],ENT_QUOTES,'UTF-8');
$apemat = htmlspecialchars($_POST['apemat'],ENT_QUOTES,'UTF-8');
$tipo_cont = htmlspecialchars($_POST['tipo_cont'],ENT_QUOTES,'UTF-8');
$numero = htmlspecialchars($_POST['numero'],ENT_QUOTES,'UTF-8');
$tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
$sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');

$consulta =$MP->Registrar_Persona($nombre,$apepat,$apemat,$tipo_cont,$numero,$tipo_doc,$sexo,$telefono,
$direccion,$correo,$idempresa);
echo $consulta;





 ?>