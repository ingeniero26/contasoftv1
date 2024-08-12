<?php 
require '../../modelo/modelo_ciudades.php';
$MC = new Modelo_Ciudades();
$consulta =$MC->listar_combo_ciudades();
echo json_encode($consulta);




 ?>