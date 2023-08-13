<?php
include '../../modelo/modelo_centro_costos.php';

$MCT = new Modelo_Centro_Costos();
$idempresa = htmlspecialchars($_POST['idempresa'], ENT_QUOTES, 'UTF-8');
$consulta = $MCT->listar_centro_costos($idempresa);
if ($consulta) {
    echo json_encode($consulta);
} else {
    echo '{
		"sEcho":1,
		"iTotalRecords":"0",
		"iTotalDisplayRecords":"0",
		"aaData":[]
	}';
}
