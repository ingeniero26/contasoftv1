<?php 
require '../../modelo/modelo_cuentas_clientes.php';

$MB = new Modelo_Cuentas_Clientes();
$venta_id = htmlspecialchars($_POST['venta_id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MB->Modificar_Estatus_Venta($venta_id,$estatus);
echo $consulta;





 ?>