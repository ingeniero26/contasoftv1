<?php 
require '../../modelo/modelo_productos.php';

$MCT = new Modelo_Productos();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_categoria($idempresa);
echo json_encode($consulta);




 ?>