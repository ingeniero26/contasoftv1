<?php 
require '../../modelo/modelo_usuario.php';

$MR = new Modelo_Usuario();
$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');
$email_nuevo = htmlspecialchars($_POST['email_nuevo'],ENT_QUOTES,'UTF-8');
$idrol = htmlspecialchars($_POST['idrol'],ENT_QUOTES,'UTF-8');
$idpersona = htmlspecialchars($_POST['idpersona'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MR->Modificar_Usuario($idusuario,$email_nuevo, $idrol, $idpersona,
 $estatus);
echo $consulta;





 ?>