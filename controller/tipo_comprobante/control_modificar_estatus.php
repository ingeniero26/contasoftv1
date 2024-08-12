<?php
include '../../modelo/modelo_tipo_comprobante.php';

$MCT = new Modelo_Tipo_Comprobante();
$id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

$consulta = $MCT->Modificar_Estatus_Tipo_Comprobante($id, $estatus);
echo $consulta;
