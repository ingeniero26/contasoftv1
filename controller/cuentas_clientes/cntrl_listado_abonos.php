<?php 
require '../../modelo/modelo_cuentas_clientes.php';

$MME = new Modelo_Cuentas_Clientes();
$consulta =$MME->listar_abonos_clientes();
if($consulta) {
	echo json_encode($consulta);
} else {
	echo '{
		"sEcho":1,
		"iTotalRecords":"0",
		"iTotalDisplayRecords":"0",
		"aaData":[]
	}';
}



 ?>