<?php
require '../../modelo/modelo_cuentas_contables.php';

$MCT = new Modelo_Cuentas_Contable();
$id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
$codigo_actual = htmlspecialchars($_POST['codigo_actual'], ENT_QUOTES, 'UTF-8');
$codigo_nuevo = htmlspecialchars($_POST['codigo_nuevo'], ENT_QUOTES, 'UTF-8');
$nit_cuenta = htmlspecialchars($_POST['nit_cuenta'], ENT_QUOTES, 'UTF-8');
$cuenta_nombre = htmlspecialchars($_POST['cuenta_nombre'], ENT_QUOTES, 'UTF-8');
$cuenta_tipo = htmlspecialchars($_POST['cuenta_tipo'], ENT_QUOTES, 'UTF-8');
$cuenta_banco = htmlspecialchars($_POST['cuenta_banco'], ENT_QUOTES, 'UTF-8');
$cuenta_base = htmlspecialchars($_POST['cuenta_base'], ENT_QUOTES, 'UTF-8');
$cuenta_centro = htmlspecialchars($_POST['cuenta_centro'], ENT_QUOTES, 'UTF-8');
$cta_nit = htmlspecialchars($_POST['cta_nit'], ENT_QUOTES, 'UTF-8');
$anticipo_cuenta = htmlspecialchars($_POST['anticipo_cuenta'], ENT_QUOTES, 'UTF-8');
$categoria_cuenta = htmlspecialchars($_POST['categoria_cuenta'], ENT_QUOTES, 'UTF-8');
$clase_cuenta = htmlspecialchars($_POST['clase_cuenta'], ENT_QUOTES, 'UTF-8');
$nivel_cuenta = htmlspecialchars($_POST['nivel_cuenta'], ENT_QUOTES, 'UTF-8');

$consulta = $MCT->Modificar_Cuenta_Contable($id, $codigo_actual,
    $codigo_nuevo, $nit_cuenta, $cuenta_nombre,$cuenta_tipo, $cuenta_banco,
    $cuenta_base, $cuenta_centro, $cta_nit, $anticipo_cuenta, $categoria_cuenta, $clase_cuenta,
    $nivel_cuenta
);
echo $consulta;
