<?php
include '../../modelo/modelo_persona.php';

$MP = new Modelo_Persona();
$idempresa = htmlspecialchars($_POST['idempresa'], ENT_QUOTES, 'UTF-8');
$idtipo_tercero = htmlspecialchars($_POST['idtipo_tercero'], ENT_QUOTES, 'UTF-8');
$consulta = $MP->listar_persona($idempresa, $idtipo_tercero);
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
