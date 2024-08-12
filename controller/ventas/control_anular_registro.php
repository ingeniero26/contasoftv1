<?php 
require '../../modelo/modelo_ventas.php';

$MCT = new Modelo_Ventas();
$idventa = htmlspecialchars($_POST['idventa'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Anular_Venta($idventa);
echo $consulta;


 ?>