<?php
include '../../modelo/modelo_tipo_comprobante.php';

$MCT = new Modelo_Tipo_Comprobante();
$id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
$tipo_actual = htmlspecialchars($_POST['tipo_actual'], ENT_QUOTES, 'UTF-8');
$tipo_nueva = htmlspecialchars($_POST['tipo_nueva'], ENT_QUOTES, 'UTF-8');
$descripcion = htmlspecialchars($_POST['descripcion'], ENT_QUOTES, 'UTF-8');
// $estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta = $MUM->Modificar_Tipo_Comprobante($id, $tipo_actual, $tipo_nueva,
    $descripcion);
echo $consulta;
