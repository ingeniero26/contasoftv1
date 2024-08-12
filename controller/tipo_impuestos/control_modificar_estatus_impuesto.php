<?php
include '../../modelo/modelo_tipo_impuestos.php';

$MCT = new Modelo_Tipo_Impuestos();
$id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');

$consulta = $MCT->Modificar_Estatus_Impuesto($id, $estatus);
echo $consulta;
