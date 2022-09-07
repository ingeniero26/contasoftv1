<?php 
 include '../../modelo/modelo_reportes_venta_cliente.php';

 $MP = new Modelo_Productos();
  $id_bodega = htmlspecialchars($_POST['id_bodega'],ENT_QUOTES,'UTF-8');
    $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 $consulta =$MP->listar_ventas_x_clientes($id_bodega,$idempresa);
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