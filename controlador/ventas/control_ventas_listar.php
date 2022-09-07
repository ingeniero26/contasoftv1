<?php 
 include '../../modelo/modelo_ventas.php';

 $MCT = new Modelo_Ventas();
 $finicio = htmlspecialchars($_POST['finicio'],ENT_QUOTES,'UTF-8');
 $ffin = htmlspecialchars($_POST['ffin'],ENT_QUOTES,'UTF-8');
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
  $idcaja = htmlspecialchars($_POST['idcaja'],ENT_QUOTES,'UTF-8');
 $consulta =$MCT->listar_ventas($finicio,$ffin,$idempresa,$idcaja);
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