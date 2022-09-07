<?php 
require '../../modelo/modelo_cuentas_clientes.php';

$MCC = new Modelo_Cuentas_Clientes();
$idventa = htmlspecialchars($_POST['idventa'],ENT_QUOTES,'UTF-8');
$no_cuota = htmlspecialchars($_POST['no_cuota'],ENT_QUOTES,'UTF-8');
$no_comprobante = htmlspecialchars($_POST['no_comprobante'],ENT_QUOTES,'UTF-8');
$fecha_pago = htmlspecialchars($_POST['fecha_pago'],ENT_QUOTES,'UTF-8');
$valor_abono = htmlspecialchars($_POST['valor_abono'],ENT_QUOTES,'UTF-8');

$consulta =$MCC->Registrar_Abono_Cliente($idventa,$no_cuota,$no_comprobante, $fecha_pago, $valor_abono);
echo $consulta;





 ?>