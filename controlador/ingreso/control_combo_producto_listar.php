<?php 
require '../../modelo/modelo_ingreso.php';

$MCT = new Modelo_Ingreso();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_producto($idempresa);
echo json_encode($consulta);




 ?>