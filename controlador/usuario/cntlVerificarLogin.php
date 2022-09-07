<?php 

include_once '../../modelo/modelo_usuario.php';
$MU = new Modelo_Usuario();
$usuario = htmlspecialchars($_POST['usuario'],ENT_QUOTES,'UTF-8');
$password =  htmlspecialchars($_POST['password'],ENT_QUOTES,'UTF-8');

$consulta =$MU->VerificarUsuario($usuario,$password);
$data =json_encode($consulta);

if(count($consulta)>0) {
	echo $data;
} else {
	echo 0;
}


 ?>