<?php 
require '../../modelo/modelo_pagos.php';

$MPV = new Modelo_Gastos();
$idtipo_gasto = htmlspecialchars($_POST['idtipo_gasto'],ENT_QUOTES,'UTF-8');
$fecha_gasto = htmlspecialchars($_POST['fecha_gasto'],ENT_QUOTES,'UTF-8');
$valor = htmlspecialchars($_POST['valor'],ENT_QUOTES,'UTF-8');
$recibo = htmlspecialchars($_POST['recibo'],ENT_QUOTES,'UTF-8');
$idcaja = htmlspecialchars($_POST['idcaja'],ENT_QUOTES,'UTF-8');
$observaciones = htmlspecialchars($_POST['observaciones'],ENT_QUOTES,'UTF-8');
$estado = htmlspecialchars($_POST['estado'],ENT_QUOTES,'UTF-8');
$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');

$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MPV->Registrar_Gastos($idtipo_gasto,$fecha_gasto,$valor,
$recibo,$idcaja,$observaciones,$estado,$idusuario,$idempresa);
echo $consulta;





 ?>