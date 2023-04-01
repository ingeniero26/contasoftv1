<?php 

 include '../../modelo/modelo_productos.php';

 $MP = new Modelo_Productos();
  $codigo = htmlspecialchars($_POST['codigo'],ENT_QUOTES,'UTF-8');
 $nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
 $presentacion = htmlspecialchars($_POST['presentacion'],ENT_QUOTES,'UTF-8');
 
  $idbodega = htmlspecialchars($_POST['idbodega'],ENT_QUOTES,'UTF-8');
  $cant_minima = htmlspecialchars($_POST['cant_minima'],ENT_QUOTES,'UTF-8');
  $cant_inicial = htmlspecialchars($_POST['cant_inicial'],ENT_QUOTES,'UTF-8');
 $idcategoria = htmlspecialchars($_POST['idcategoria'],ENT_QUOTES,'UTF-8');
 $idunidad = htmlspecialchars($_POST['idunidad'],ENT_QUOTES,'UTF-8');
 $tipo_producto = htmlspecialchars($_POST['tipo_producto'],ENT_QUOTES,'UTF-8');
 $id_marca = htmlspecialchars($_POST['id_marca'],ENT_QUOTES,'UTF-8');
 $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'],ENT_QUOTES,'UTF-8');
 $precio_compra = htmlspecialchars($_POST['precio_compra'],ENT_QUOTES,'UTF-8');
 $precio_venta = htmlspecialchars($_POST['precio_venta'],ENT_QUOTES,'UTF-8');
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');

 if(is_array($_FILES) && count($_FILES)>0) {
 	if(move_uploaded_file($_FILES['foto']['tmp_name'],"img/".$nombrearchivo)) {
 		$ruta ='controlador/productos/img/'.$nombrearchivo;
 		$consulta = $MP->Registrar_Producto($codigo,$nombre,$presentacion,
            $idbodega,$cant_minima,$cant_inicial, $idcategoria,$idunidad,
			$tipo_producto,$id_marca, $ruta,$precio_compra, $precio_venta,$idempresa);
 		echo $consulta;
 	} else {
 		echo 0;
 	}
 }else {
 	$ruta ='controlador/productos/img/default.png';
 		$consulta = $MP->Registrar_Producto($codigo,$nombre,$presentacion,
            $idbodega,$cant_minima,$cant_inicial,
            $idcategoria,$idunidad,$tipo_producto,$id_marca, $ruta, $precio_compra,$precio_venta,$idempresa);
 		echo $consulta;
 }





 ?>