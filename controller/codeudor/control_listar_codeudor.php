<?php 
 include '../../modelo/modelo_codeudor.php';

 $MP = new Modelo_Codeudor();
  $id_cliente = htmlspecialchars($_POST['id_cliente'],ENT_QUOTES,'UTF-8');

// $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MP->listar_codeudor($id_cliente);
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