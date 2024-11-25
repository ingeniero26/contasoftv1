<?php 
 include '../../model/modelo_quotes.php';

 $MCT = new Modelo_Quotes();
 $finicio = htmlspecialchars($_POST['finicio'],ENT_QUOTES,'UTF-8');
 $ffin = htmlspecialchars($_POST['ffin'],ENT_QUOTES,'UTF-8');
//   $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
//   $idcaja = htmlspecialchars($_POST['idcaja'],ENT_QUOTES,'UTF-8');
 $consulta =$MCT->list_quotes($finicio,$ffin);
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