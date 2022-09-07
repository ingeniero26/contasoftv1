<?php 
 include '../../modelo/modelo_empleados.php';

 $MEP = new Modelo_Empleado();
 $numero = htmlspecialchars($_POST['numero'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'],ENT_QUOTES,'UTF-8');
$celular = htmlspecialchars($_POST['celular'],ENT_QUOTES,'UTF-8');
$correo = htmlspecialchars($_POST['correo'],ENT_QUOTES,'UTF-8');
$fnac = htmlspecialchars($_POST['fnac'],ENT_QUOTES,'UTF-8');
$idarl = htmlspecialchars($_POST['idarl'],ENT_QUOTES,'UTF-8');
$ideps = htmlspecialchars($_POST['ideps'],ENT_QUOTES,'UTF-8');
$idpension = htmlspecialchars($_POST['idpension'],ENT_QUOTES,'UTF-8');
$usu = htmlspecialchars($_POST['usu'],ENT_QUOTES,'UTF-8');
$contra =  password_hash($_POST['contra'], PASSWORD_DEFAULT,['cost'=>10]);
$rol = htmlspecialchars($_POST['rol'],ENT_QUOTES,'UTF-8');


$consulta =$MEP->RegistrarEmpleado($numero,$nombre,$direccion,
	$telefono,$celular,$correo,$fnac,$idarl,$ideps,$idpension, $usu,$contra,$rol);
echo $consulta;


?>

