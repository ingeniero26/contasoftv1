<?php 
 include '../../modelo/modelo_unidad_medida.php';

 $MUM = new Unidad_Medida();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MUM->listar_unidad_medida($idempresa);
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