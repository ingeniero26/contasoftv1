<?php
include '../../modelo/modelo_tipo_impuestos.php';

$MCT = new Modelo_Tipo_Impuestos();
$codigo = htmlspecialchars($_POST['codigo'], ENT_QUOTES, 'UTF-8');
$tarifa = htmlspecialchars($_POST['tarifa'], ENT_QUOTES, 'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'], ENT_QUOTES, 'UTF-8');
$consulta = $MCT->Registrar_Tipo_Impuesto($codigo, $tarifa, $nombre, $idempresa);
echo $consulta;
