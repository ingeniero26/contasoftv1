<?php 
 include '../../modelo/modelo_marcas.php';

 $MEP = new Modelo_Marcas();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Modificar_Estatus_Marcas($id,$estatus);
echo $consulta;





 ?>