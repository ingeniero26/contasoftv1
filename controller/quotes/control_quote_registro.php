<?php 
require '../../model/modelo_quotes.php';

$MCP = new Modelo_Quotes();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$idcliente = htmlspecialchars($_POST['idcliente'],ENT_QUOTES,'UTF-8');
$idbodega = htmlspecialchars($_POST['idbodega'],ENT_QUOTES,'UTF-8');
$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');
$id_tipo_comprobante = htmlspecialchars($_POST['id_tipo_comprobante'],ENT_QUOTES,'UTF-8');

$quote_no = htmlspecialchars($_POST['quote_no'],ENT_QUOTES,'UTF-8');
$fecha_vc = htmlspecialchars($_POST['fecha_vc'],ENT_QUOTES,'UTF-8');
$impuesto = htmlspecialchars($_POST['impuesto'],ENT_QUOTES,'UTF-8');
$total = htmlspecialchars($_POST['total'],ENT_QUOTES,'UTF-8');
$porcentaje = htmlspecialchars($_POST['porcentaje'],ENT_QUOTES,'UTF-8');
$decto = htmlspecialchars($_POST['decto'],ENT_QUOTES,'UTF-8');




$consulta =$MCP->Registrar_Quote( $idempresa,$idcliente, $idbodega, 
$idusuario,$id_tipo_comprobante,
$quote_no,$fecha_vc,$impuesto ,$total,$porcentaje,$decto);
echo $consulta;





 ?>