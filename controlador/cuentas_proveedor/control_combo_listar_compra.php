<?php 
require '../../modelo/modelo_cuentasxproveedor.php';

$MCP = new Modelo_Cuentas_Proveedor();
$consulta =$MCP->listar_combo_compra();
echo json_encode($consulta);




 ?>