<?php 
 include '../../modelo/modelo_bodegas.php';

 $MB = new Modelo_Bodegas();
  $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MB->listar_bodegas($idempresa);
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