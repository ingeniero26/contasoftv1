<?php 
include '../../modelo/modelo_tipo_comprobante.php';

$MCT = new Modelo_Tipo_Comprobante();
$abreviatura = htmlspecialchars($_POST['abreviatura'],ENT_QUOTES,'UTF-8');
$descripcion = htmlspecialchars($_POST['descripcion'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Tipo_Comprobante($abreviatura,$descripcion, $idempresa);
echo $consulta;





 ?>