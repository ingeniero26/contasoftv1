<?php 
 include '../../modelo/modelo_ingreso.php';

 $MCT = new Modelo_Ingreso();
 $finicio = htmlspecialchars($_POST['finicio'],ENT_QUOTES,'UTF-8');
 $ffin = htmlspecialchars($_POST['ffin'],ENT_QUOTES,'UTF-8');
   $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MCT->listar_ingreso($finicio,$ffin,$idempresa);
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