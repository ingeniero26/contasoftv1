<?php 
require '../../modelo/modelo_pagos.php';

$MCT = new Modelo_Gastos();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_tipo_pagos($idempresa);
echo json_encode($consulta);




 ?>