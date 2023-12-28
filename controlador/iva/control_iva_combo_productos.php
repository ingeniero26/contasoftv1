<?php 
require '../../modelo/modelo_iva.php';

$MCT = new Modelo_Iva();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_iva($idempresa);
echo json_encode($consulta);




 ?>