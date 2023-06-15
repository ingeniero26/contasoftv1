<?php 
require '../../modelo/modelo_proveedor.php';

$MCT = new Modelo_Proveedor();
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_tipo_tercero_cliente($idempresa);
echo json_encode($consulta);




 ?>