<?php 
require '../../modelo/modelo_cuentas_clientes.php';

$MCC = new Modelo_Cuentas_Clientes();
$consulta =$MCC->listar_combo_venta();
echo json_encode($consulta);




 ?>