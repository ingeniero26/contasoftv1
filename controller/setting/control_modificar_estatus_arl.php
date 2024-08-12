<?php 
require '../../modelo/modelo_arl.php';

$MAR = new Modelo_Arl();
$IdARL = htmlspecialchars($_POST['IdARL'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MAR->Modificar_Estatus_Arl($IdARL,$estatus);
echo $consulta;





 ?>