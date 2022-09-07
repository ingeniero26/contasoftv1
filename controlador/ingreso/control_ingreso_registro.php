<?php 
require '../../modelo/modelo_ingreso.php';

$MCP = new Modelo_Ingreso();
$idproveedor = htmlspecialchars($_POST['idproveedor'],ENT_QUOTES,'UTF-8');
$idbodega = htmlspecialchars($_POST['idbodega'],ENT_QUOTES,'UTF-8');
$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');

$tipo_comprobante = htmlspecialchars($_POST['tipo_comprobante'],ENT_QUOTES,'UTF-8');
$serie_comprobante = htmlspecialchars($_POST['serie_comprobante'],ENT_QUOTES,'UTF-8');
$num_comprobante = htmlspecialchars($_POST['num_comprobante'],ENT_QUOTES,'UTF-8');

$tipo_pago = htmlspecialchars($_POST['tipo_pago'],ENT_QUOTES,'UTF-8');
$fecha_compra = htmlspecialchars($_POST['fecha_compra'],ENT_QUOTES,'UTF-8');
$impuesto = htmlspecialchars($_POST['impuesto'],ENT_QUOTES,'UTF-8');
$total = htmlspecialchars($_POST['total'],ENT_QUOTES,'UTF-8');
$estado = htmlspecialchars($_POST['estado'],ENT_QUOTES,'UTF-8');

$porcentaje = htmlspecialchars($_POST['porcentaje'],ENT_QUOTES,'UTF-8');

$decto = htmlspecialchars($_POST['decto'],ENT_QUOTES,'UTF-8');
$fecha_vencimiento = htmlspecialchars($_POST['fecha_vencimiento'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');

$consulta =$MCP->Registrar_Compra($idproveedor, $idbodega, $idusuario,$tipo_comprobante,$serie_comprobante,  $num_comprobante , $tipo_pago,$fecha_compra,$impuesto ,$total,$estado,$porcentaje,$decto,$fecha_vencimiento,$idempresa);
echo $consulta;





 ?>