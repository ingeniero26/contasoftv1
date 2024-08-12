<?php 
require '../../modelo/modelo_cuentas_clientes.php';

$MME = new Modelo_Cuentas_Clientes();
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
$consulta =$MME->listar_cuentas_x_cobrar($idempresa);
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