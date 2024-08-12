<?php 
 include '../../modelo/modelo_tipo_gastos.php';

 $MCT = new Modelo_Tipo_Gastos();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MCT->listar_tipo_pagos($idempresa);
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