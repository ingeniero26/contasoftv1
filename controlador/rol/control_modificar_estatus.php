<?php 
require '../../modelo/modelo_rol.php';

$MR = new Modelo_Rol();
$rol_id = htmlspecialchars($_POST['rol_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MR->Modificar_Estatus_Rol($rol_id,$estatus);
echo $consulta;





 ?>