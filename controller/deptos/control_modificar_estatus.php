<?php 
 include '../../modelo/modelo_deptos.php';

 $MEP = new Modelo_Deptos();
$IdDpto = htmlspecialchars($_POST['IdDpto'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Modificar_Estatus_Depto($IdDpto,$estatus);
echo $consulta;





 ?>