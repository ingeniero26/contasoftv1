<?php 
require '../../modelo/modelo_persona.php';

$MPE = new Modelo_Persona();
$persona_id = htmlspecialchars($_POST['persona_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MPE->Modificar_Estatus_Persona($persona_id,$estatus);
echo $consulta;





 ?>