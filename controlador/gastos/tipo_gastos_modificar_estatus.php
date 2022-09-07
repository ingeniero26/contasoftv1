<?php 
 include '../../modelo/modelo_tipo_gastos.php';

 $MCT = new Modelo_Tipo_Gastos();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Modificar_Estatus_Tipo_Pago($id,$estatus);
echo $consulta;





 ?>