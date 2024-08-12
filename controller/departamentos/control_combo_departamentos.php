<?php 
require '../../modelo/modelo_departamentos.php';

$MCT = new Modelo_Deptos();
$consulta =$MCT->listar_combo_departamentos();
echo json_encode($consulta);




 ?>