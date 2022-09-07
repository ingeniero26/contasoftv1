<?php 
 include '../../modelo/modelo_empleados.php';

 $MEP = new Modelo_Empleado();
 $consulta =$MEP->listar_empleado();
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