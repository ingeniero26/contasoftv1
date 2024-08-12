<?php 
include '../../modelo/modelo_cuentas_contables.php';

$MCT = new Modelo_Cuentas_Contable();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$cod_cuenta = htmlspecialchars($_POST['cod_cuenta'],ENT_QUOTES,'UTF-8');
$cuenta_nit = htmlspecialchars($_POST['cuenta_nit'],ENT_QUOTES,'UTF-8');
$nombre_cuenta = htmlspecialchars($_POST['nombre_cuenta'],ENT_QUOTES,'UTF-8');
$tipo_cuenta = htmlspecialchars($_POST['tipo_cuenta'],ENT_QUOTES,'UTF-8');
$usa_banco = htmlspecialchars($_POST['usa_banco'],ENT_QUOTES,'UTF-8');
$usa_base = htmlspecialchars($_POST['usa_base'],ENT_QUOTES,'UTF-8');
$usa_centro = htmlspecialchars($_POST['usa_centro'],ENT_QUOTES,'UTF-8');
$usa_nit = htmlspecialchars($_POST['usa_nit'],ENT_QUOTES,'UTF-8');
$usa_anticipo = htmlspecialchars($_POST['usa_anticipo'],ENT_QUOTES,'UTF-8');
$categoria = htmlspecialchars($_POST['categoria'],ENT_QUOTES,'UTF-8');
$clase = htmlspecialchars($_POST['clase'],ENT_QUOTES,'UTF-8');
$nivel = htmlspecialchars($_POST['nivel'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Registrar_Cuenta_Contable($idempresa,$cod_cuenta,$cuenta_nit,$nombre_cuenta,
$tipo_cuenta,$usa_banco,$usa_base,$usa_centro,$usa_nit,$usa_anticipo,
$categoria,$clase,$nivel);
echo $consulta;





 ?>