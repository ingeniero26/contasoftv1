<?php 
 include '../../modelo/modelo_departamentos.php';

 $MCT = new Modelo_Deptos();

 $consulta =$MCT->listar_deptos();
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