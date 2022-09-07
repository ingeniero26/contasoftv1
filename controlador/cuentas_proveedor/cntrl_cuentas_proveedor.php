<?php 
require '../../modelo/modelo_cuentasxproveedor.php';

$MME = new Modelo_Cuentas_Proveedor();
$consulta =$MME->listar_cuentas_x_proveedor();
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