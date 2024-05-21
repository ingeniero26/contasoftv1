<?php
require '../../modelo/modelo_usuario.php';

$MU = new Modelo_Usuario();
$idusuario = htmlspecialchars($_POST['idusuario'], ENT_QUOTES, 'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
$apepat = htmlspecialchars($_POST['apepat'], ENT_QUOTES, 'UTF-8');
$apemat = htmlspecialchars($_POST['apemat'], ENT_QUOTES, 'UTF-8');
$nrodocumento = htmlspecialchars($_POST['nrodocumento'], ENT_QUOTES, 'UTF-8');
$tipo_documento = htmlspecialchars($_POST['tipo_documento'], ENT_QUOTES, 'UTF-8');
// $sexo = htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8');
$telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
$direccion = htmlspecialchars($_POST['direccion'], ENT_QUOTES, 'UTF-8');

$consulta = $MU->Actualizar_Datos_Profile($idusuario, $nombre, $apepat, $apemat, $nrodocumento, $tipo_documento, $telefono, $direccion);
echo $consulta;
