<?php 
require '../../modelo/modelo_ciudades.php';

$MCT = new Modelo_Ciudades();
$ciudad = htmlspecialchars($_POST['ciudad'],ENT_QUOTES,'UTF-8');
$id_departamento = htmlspecialchars($_POST['id_departamento'],ENT_QUOTES,'UTF-8');
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Ciudades($ciudad,$id_departamento,$idempresa);
echo $consulta;





 ?>