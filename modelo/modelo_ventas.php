<?php 

class Modelo_Ventas {
		function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_ventas($finicio,$ffin,$idempresa,$idcaja){
		$sql = "SELECT     `venta`.`venta_id`    , `venta`.`cliente_id`
    , `venta`.`bodega_id`    , `bodega`.`nombre_bodega`
    , `venta`.`usuario_id`    , `usuario`.`usuario_nombre`
    , `venta`.`venta_tipocomprobante`    , `venta`.`venta_serie`
    , `venta`.`venta_numcomprobante`    , `venta`.`tipo_pago`
    , `venta`.`venta_fecha`    , `venta`.`venta_impuesto`
    , `venta`.`venta_total`    , `venta`.`venta_estatus`
    , `venta`.`venta_porcentaje`    , `venta`.`venta_total_dcto`
    , venta.fecha_vencimiento
    , CONCAT_WS(' ',`persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS cliente
    , venta.`idcaja` , caja.`caja`
   
    FROM
    `bodega`, 
    `venta`
    INNER JOIN `usuario`         ON (`venta`.`usuario_id` = `usuario`.`usuario_id`)
    INNER JOIN `cliente`         ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
    INNER JOIN `persona`         ON (`cliente`.`persona_id` = `persona`.`persona_id`)
    INNER JOIN caja           ON (venta.`idcaja` = caja.`id`)
         WHERE `venta`.`venta_fecha` BETWEEN '$finicio' 
         AND '$ffin' AND `venta`.`idempresa` ='$idempresa' AND  caja.`id` = '$idcaja'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
	function listar_combo_cliente($idempresa) {
		$sql = "SELECT	CONCAT_WS(' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS cliente	 , `persona`.`persona_nrodocumento`
  		  ,`cliente`.`idcliente`	FROM    `cliente`
         INNER JOIN `persona`    ON (`cliente`.`persona_id` = `persona`.`persona_id`)
         WHERE cliente.`idempresa` = '$idempresa' AND
     `cliente`.`cliente_estatus` ='ACTIVO'";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}


		function listar_combo_caja($idempresa) {
		$sql = "SELECT id,caja FROM caja
		WHERE caja.`estatus` = 'ACTIVO'
		 AND caja.`idempresa` = 1";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Venta($idcliente, $idbodega, $idusuario,$tipo_comprobante,$serie_comprobante, $tipo_pago,$impuesto ,$total,$estado,$porcentaje,$decto,$fecha_vc,$idempresa,$idcaja) {
		$sql = "call  SP_REGISTRAR_VENTA('$idcliente','$idbodega',  '$idusuario','$tipo_comprobante','$serie_comprobante','$tipo_pago','$impuesto','$total','$estado','$porcentaje','$decto','$fecha_vc','$idempresa','$idcaja')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Venta_Detalle($id,$array_producto,$array_cantidad,$array_precio,$array_dcto) {
		$sql = "call  SP_REGISTRAR_VENTA_DETALLE('$id','$array_producto','$array_cantidad','$array_precio','$array_dcto')";
			if($consulta = $this->conexion->conexion->query($sql)){
					return 1;
				} else {
					return 0;
				}
				$this->conexion->cerrar();
		}

	 function Anular_Venta($idventa) {
	 	$sql = "call  SP_ANULAR_VENTA('$idventa')";
			if($consulta = $this->conexion->conexion->query($sql)){
					return 1;
				} else {
					return 0;
				}
				$this->conexion->cerrar();

  		 }
	 
}













 ?>