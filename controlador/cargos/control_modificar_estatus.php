<?php 
 include '../../modelo/modelo_cargos.php';

 $MEP = new Modelo_Cargos();
$IdCargos = htmlspecialchars($_POST['IdCargos'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Modificar_Estatus_Cargo($IdCargos,$estatus);
echo $consulta;





 ?>