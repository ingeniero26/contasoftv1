<?php
include '../../modelo/modelo_tipo_comprobante.php';

$MCT = new Modelo_Tipo_Comprobante();
$idempresa = htmlspecialchars($_POST['idempresa'], ENT_QUOTES, 'UTF-8');
$consulta = $MCT->listar_tipo_comprobante($idempresa);
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
