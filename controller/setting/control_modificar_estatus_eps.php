<?php 
require '../../modelo/modelo_eps.php';

$MEP= new Modelo_Eps();
$IdEPS = htmlspecialchars($_POST['IdEPS'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Modificar_Estatus_Eps($IdEPS,$estatus);
echo $consulta;





 ?>