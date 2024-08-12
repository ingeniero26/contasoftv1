<?php 
include '../../modelo/modelo_tipo_impuestos.php';

$MCT = new Modelo_Tipo_Impuestos();
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_tipo_iva($idempresa);
echo json_encode($consulta);




 ?>