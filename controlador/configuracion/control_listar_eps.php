<?php 
 include '../../modelo/modelo_eps.php';

 $MCT = new Modelo_Eps();
 $consulta =$MCT->listar_eps();
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