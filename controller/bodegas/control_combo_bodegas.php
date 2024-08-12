<?php 
require '../../modelo/modelo_bodegas.php';

$MCT = new Modelo_Bodegas();
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_bodegas($idempresa);
echo json_encode($consulta);




 ?>