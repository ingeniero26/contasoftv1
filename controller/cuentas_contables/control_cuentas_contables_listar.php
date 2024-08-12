<?php 
 include '../../modelo/modelo_cuentas_contables.php';

 $MCT = new Modelo_Cuentas_Contable();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MCT->listar_cuentas_contables($idempresa);
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