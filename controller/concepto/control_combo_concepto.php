<?php 
require '../../model/modelo_concepto.php';

$MCT = new Modelo_Concepto();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_concepto($idempresa);
echo json_encode($consulta);




 ?>