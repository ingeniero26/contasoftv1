<?php 
 include '../../modelo/modelo_secciones.php';

 $MEP = new Modelo_Secciones();
 $consulta =$MEP->listar_secciones();
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