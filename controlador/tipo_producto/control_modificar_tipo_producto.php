<?php 
 include '../../modelo/modelo_tipo_producto.php';

 $MCT = new Modelo_Tipo_Producto();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$tipo_actual = htmlspecialchars($_POST['tipo_actual'],ENT_QUOTES,'UTF-8');
$tipo_nueva = htmlspecialchars($_POST['tipo_nueva'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Tipo_Producto($id,$tipo_actual,$tipo_nueva, $estatus);
echo $consulta;





 ?>