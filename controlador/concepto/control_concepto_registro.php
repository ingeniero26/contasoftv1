<?php 
require '../../modelo/modelo_concepto.php';

$MCT = new Modelo_Concepto();
$concepto = htmlspecialchars($_POST['concepto'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Concepto($concepto,$idempresa);
echo $consulta;





 ?>