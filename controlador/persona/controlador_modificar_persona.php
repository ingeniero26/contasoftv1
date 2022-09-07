<?php 
require '../../modelo/modelo_persona.php';

$MP = new Modelo_Persona();
$id_persona = htmlspecialchars($_POST['id_persona'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$apepat = htmlspecialchars($_POST['apepat'],ENT_QUOTES,'UTF-8');
$apemat = htmlspecialchars($_POST['apemat'],ENT_QUOTES,'UTF-8');
$numero_actual = htmlspecialchars($_POST['numero_actual'],ENT_QUOTES,'UTF-8');
$numero_nuevo = htmlspecialchars($_POST['numero_nuevo'],ENT_QUOTES,'UTF-8');
$tipo_doc = htmlspecialchars($_POST['tipo_doc'],ENT_QUOTES,'UTF-8');
$sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MP->Modificar_Persona($id_persona,$nombre,$apepat,$apemat,
 $numero_actual,$numero_nuevo,$tipo_doc,$sexo,$telefono ,$direccion, $correo, $estatus);
echo $consulta;





 ?>