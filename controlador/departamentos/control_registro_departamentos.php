<?php 
require '../../modelo/modelo_departamentos.php';

$MCT = new Modelo_Deptos();
$nombre_departamento = htmlspecialchars($_POST['nombre_departamento'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Registrar_Departamento($nombre_departamento);
echo $consulta;





 ?>