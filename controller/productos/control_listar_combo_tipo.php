<?php 
require '../../modelo/modelo_productos.php';

$MCT = new Modelo_Productos();
$consulta =$MCT->listar_combo_tipo();
echo json_encode($consulta);




 ?>