<?php 

 class Modelo_Cuentas_Clientes {
 	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}

	function listar_cuentas_x_cobrar($idempresa){
		$sql = "SELECT DISTINCT
    `venta`.`venta_id` AS factura_venta
    , `venta`.`cliente_id`
    , CONCAT_WS ( ' ',`persona`.`persona_nombre`, `persona`.`persona_apepat`  , `persona`.`persona_apemat`) AS cliente
    , `persona`.`persona_nrodocumento`
    , `persona`.`persona_telefono`
    , `persona`.`persona_direccion`
    , `venta`.`venta_tipocomprobante`  AS tipo
    , `venta`.`venta_serie`
    , `venta`.`venta_numcomprobante`  AS noComprobante
    , `venta`.`tipo_pago`
   
    , `venta`.`venta_total` AS credito
    , `venta`.`venta_estatus`
FROM
    `venta`
    INNER JOIN `cliente` 
        ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
    INNER JOIN `persona` 
        ON (`cliente`.`persona_id` = `persona`.`persona_id`)
        WHERE venta.`tipo_pago` ='CREDITO' OR `venta`.`tipo_pago` ='CREDICONTADO' AND `venta`.`venta_estatus` ='POR_COBRAR'  AND `venta`.`idempresa` = '$idempresa'
        GROUP BY `cliente`.`idcliente`
        ORDER BY  persona.`persona_nombre`";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function listar_combo_venta() {
		$sql = " SELECT
    `venta`.`venta_id` ,
    CONCAT_WS(' ','FechaVenta: ', venta.`venta_fecha`
    , `venta`.`cliente_id`    , `persona`.`persona_nombre`  
      , `persona`.`persona_apepat`    , `persona`.`persona_apemat`     , `persona`.`persona_nrodocumento`) AS cliente
     FROM
    `cliente`
    INNER JOIN `persona`          ON (`cliente`.`persona_id` = `persona`.`persona_id`)
    INNER JOIN `venta`         ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
        WHERE venta.`tipo_pago`='CREDITO'  OR  venta.`tipo_pago` ='CREDICONTADO'";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

function Registrar_Abono_Cliente($idventa,$no_cuota,$no_comprobante, $fecha_pago, $valor_abono) {
		$sql = "call  SP_REGISTRAR_ABONO_CLIENTE('$idventa','$no_cuota','$no_comprobante','$fecha_pago','$valor_abono')";
			if($consulta = $this->conexion->conexion->query($sql)){
					return 1;
				} else {
					return 0;
				}
				$this->conexion->cerrar();

  		 }

 function listar_abonos_clientes() {
 	$sql = "SELECT    `cuentas_x_cobrar`.`id`
      , `venta`.`venta_tipocomprobante` AS comprobante
    , `venta`.`venta_numcomprobante` AS numero
    , `cuentas_x_cobrar`.`idventa`, `cuentas_x_cobrar`.`no_comprobante`
    , COUNT(`cuentas_x_cobrar`.`cuotas_abono`) AS cuotas
    , SUM( `cuentas_x_cobrar`.`valor` ) AS abonos
    , `cuentas_x_cobrar`.`fecha` AS fechaPago
    , `venta`.`venta_total` AS credito
    , `venta`.`venta_total` - SUM( `cuentas_x_cobrar`.`valor` ) AS saldo
    , venta.`venta_estatus`,venta.`venta_id`
    	
    FROM     `cuentas_x_cobrar`
    INNER JOIN `venta`    ON (`cuentas_x_cobrar`.`idventa` = `venta`.`venta_id`)
    GROUP BY `idventa`";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
 }




function Modificar_Estatus_Venta($venta_id,$estatus) {
	$sql = "call SP_MODIFICAR_ESTATUS_VENTA('$venta_id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
}

 }


 ?>