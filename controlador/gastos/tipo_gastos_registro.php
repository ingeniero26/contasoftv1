<?php 
require '../../modelo/modelo_tipo_gastos.php';

$MCT = new Modelo_Tipo_Gastos();
$tipo_gasto = htmlspecialchars($_POST['tipo_gasto'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Registrar_Tipo_Pago($tipo_gasto,$idempresa);
echo $consulta;





 ?>