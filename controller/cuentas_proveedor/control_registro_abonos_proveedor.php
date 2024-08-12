<?php 
require '../../modelo/modelo_cuentasxproveedor.php';

$MCP = new Modelo_Cuentas_Proveedor();
$idcompra = htmlspecialchars($_POST['idcompra'],ENT_QUOTES,'UTF-8');
$no_cuota = htmlspecialchars($_POST['no_cuota'],ENT_QUOTES,'UTF-8');
$fecha_pago = htmlspecialchars($_POST['fecha_pago'],ENT_QUOTES,'UTF-8');
$valor_abono = htmlspecialchars($_POST['valor_abono'],ENT_QUOTES,'UTF-8');

$consulta =$MCP->Registrar_Abono($idcompra,$no_cuota, $fecha_pago, $valor_abono);
echo $consulta;





 ?>