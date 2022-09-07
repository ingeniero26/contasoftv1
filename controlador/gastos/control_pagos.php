<?php 
 include '../../modelo/modelo_pagos.php';

 $MCT = new Modelo_Gastos();
 $finicio = htmlspecialchars($_POST['finicio'],ENT_QUOTES,'UTF-8');
 $ffin = htmlspecialchars($_POST['ffin'],ENT_QUOTES,'UTF-8');
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MCT->listar_gastos($finicio,$ffin,$idempresa);
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