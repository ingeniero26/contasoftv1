<?php 
include '../../modelo/modelo_tipo_impuestos.php';

$MCT = new Modelo_Tipo_Impuestos();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$codigo_actual = htmlspecialchars($_POST['codigo_actual'],ENT_QUOTES,'UTF-8');
$codigo_nuevo = htmlspecialchars($_POST['codigo_nuevo'],ENT_QUOTES,'UTF-8');
$tarifa = htmlspecialchars($_POST['tarifa'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$idTipoImpuesto = htmlspecialchars($_POST['idTipoImpuesto'],ENT_QUOTES,'UTF-8');

$consulta =$MCT->Modificar_Tipo_Iva($id,$codigo_actual,$codigo_nuevo,
 $tarifa,$nombre,$idTipoImpuesto);
echo $consulta;





 ?>