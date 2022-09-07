<?php 
require '../../modelo/modelo_ingreso.php';

$MCP = new Modelo_Ingreso();
$idcompra = htmlspecialchars($_POST['idcompra'],ENT_QUOTES,'UTF-8');

$consulta =$MCP->Anular_Compra($idcompra);
echo $consulta;


 ?>