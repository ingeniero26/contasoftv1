<?php 
 include '../../modelo/modelo_arl.php';

 $MCT = new Modelo_Arl();
 $consulta =$MCT->listar_arl();
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