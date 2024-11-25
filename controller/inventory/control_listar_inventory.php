<?php
include '../../model/modelo_inventory.php';

$MP = new Modelo_Inventory();
$id_bodega = htmlspecialchars($_POST['id_bodega'], ENT_QUOTES, 'UTF-8');
//$id_categoria = htmlspecialchars($_POST['id_categoria'], ENT_QUOTES, 'UTF-8');

//$idempresa = htmlspecialchars($_POST['idempresa'], ENT_QUOTES, 'UTF-8');
$consulta = $MP->listar_inventory($id_bodega);
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
