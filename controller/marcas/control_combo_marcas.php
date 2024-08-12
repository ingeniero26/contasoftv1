<?php 
require '../../modelo/modelo_marcas.php';

$MCT = new Modelo_Marcas();
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_marcas($idempresa);
echo json_encode($consulta);




 ?>