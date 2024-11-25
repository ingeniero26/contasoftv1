<?php

class Modelo__Reportes {
    private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_ventas_x_clientes($id_bodega,$idempresa){
		$sql = "SELECT
    `p`.`producto_id`    , `p`.`producto_codigo`
    , `p`.`producto_nombre`    , `p`.`producto_presentacion`
    , `p`.`id_bodega`
    , `b`.`nombre_bodega`      ,`p`.`cant_minima`  
    ,    `p`.`producto_stock`    , `p`.`id_categoria`    , `c`.`categoria_nombre`
    , `p`.`id_unidad`    , `u`.`unidad_nombre`
    , `p`.`producto_foto`    , `p`.`producto_precioventa`
    , `p`.`producto_estatus`,p.`idempresa`
FROM
    `producto` AS `p`
    INNER JOIN `bodega` AS `b`     ON (`p`.`id_bodega` = `b`.`id`)
    INNER JOIN `categoria` AS `c`  ON (`p`.`id_categoria` = `c`.`categoria_id`)
    INNER JOIN `unidad` AS `u`     ON (`p`.`id_unidad` = `u`.`unidad_id`)
    INNER JOIN empresa AS em ON p.`idempresa` = em.`ID`
       WHERE b.`id` = '$id_bodega'  AND p.`idempresa` = '$idempresa';";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
}