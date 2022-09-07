<?php 
 include '../../modelo/modelo_pension.php';

 $MCT = new Modelo_Pension();
 $consulta =$MCT->listar_pension();
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