<?php
require '../../modelo/modelo_empresa.php';
$MC = new Modelo_Empresa();
$consulta = $MC->listar_combo_tipo_regimen();
echo json_encode($consulta);
