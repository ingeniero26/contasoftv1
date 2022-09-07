<?php 
 include '../../modelo/modelo_ciudades.php';

 $MP = new Modelo_Ciudades();
  $id_departamento = htmlspecialchars($_POST['id_departamento'],ENT_QUOTES,'UTF-8');
  
 $consulta =$MP->listar_ciudades($id_departamento);
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