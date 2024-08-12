<?php 
 include '../../modelo/modelo_cargos.php';

 $MEP = new Modelo_Cargos();
 $consulta =$MEP->listar_cargos();
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