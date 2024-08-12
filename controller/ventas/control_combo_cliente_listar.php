<?php 
require '../../modelo/modelo_ventas.php';

$MCT = new Modelo_Ventas();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_cliente($idempresa);
echo json_encode($consulta);




 ?>