<?php 
require '../../modelo/modelo_ciudades.php';
$MC = new Modelo_Ciudades();
$iddepartamento = htmlspecialchars($_POST['iddepartamento'],ENT_QUOTES,'UTF-8');
$consulta =$MC->listar_combo_ciudades($iddepartamento);
echo json_encode($consulta);




 ?>