<?php 
 include '../../modelo/modelo_cuentas_contables.php';

 $MCT = new Modelo_Cuentas_Contable();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Modificar_Estatus_Cuenta($id,$estatus);
echo $consulta;





 ?>