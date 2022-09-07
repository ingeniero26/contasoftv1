<?php 

 class Modelo_Cuentas_Proveedor {

 	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}

	function listar_cuentas_x_proveedor(){
		$sql = "SELECT DISTINCT pv.`persona_id`,pv.`proveedor_razon_social` AS proveedor ,
			 pv.`proveedor_num_contacto` ,
			 CONCAT_WS(' ',  p.`persona_nombre`, p.`persona_apepat`, p.`persona_apemat`) AS contacto,
			 p.`persona_nrodocumento` AS documento,p.`persona_direccion`,p.`persona_telefono`, fc.`compra_total` AS credito,
			  fc.`compra_tipo_comprobante`, fc.`compra_num_comprobante` AS NoFactura, fc.`compra_estatus`
			  FROM proveedor pv
			INNER JOIN `compra` fc ON pv.`proveedor_id` =fc.`proveedor_id`
			INNER JOIN  persona p ON pv.`persona_id` = p.persona_id
			WHERE fc.`compra_tipo_pago`='CREDITO' AND fc.`compra_estatus`='POR_PAGAR'
			GROUP BY pv.`proveedor_id`
			ORDER BY pv.`proveedor_razon_social`";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function listar_combo_compra() {
		$sql = " SELECT     	`compra`.`compra_id`
      ,CONCAT_WS(' ','FechaCompra: ' , `compra`.`compra_fecha` 
   	, `compra`.`proveedor_id`, '.  no factura: ' ,compra.`compra_num_comprobante` , `proveedor`.`proveedor_razon_social`) AS proveedor     
	FROM
   	 `compra`
    	INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
         WHERE compra.compra_tipo_pago='CREDITO'  OR `compra`.`compra_tipo_pago` ='CREDICONTADO'
    ";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}


 function listar_abonos() {
 	$sql = "SELECT
    `cuentas_x_proveedor`.`idCuenta`
    , `proveedor`.`proveedor_razon_social` 
    ,`compra`.`compra_tipo_comprobante`
    ,   compra.`compra_num_comprobante` AS nofactura
    , `cuentas_x_proveedor`.`noCuota`
    , `cuentas_x_proveedor`.`fecha_pago`
     , `compra`.`compra_total` AS credito
    ,SUM( `cuentas_x_proveedor`.`valorAbono`) AS totalAbonos
    , `cuentas_x_proveedor`.`idCompra`
   
    ,    `compra`.`compra_total` - SUM(`cuentas_x_proveedor`.`valorAbono`) AS saldo
FROM
    `sistema_pos`.`cuentas_x_proveedor`
    INNER JOIN `sistema_pos`.`compra` 
        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)
    INNER JOIN `sistema_pos`.`proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
        GROUP BY idCompra";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
 }




	function Registrar_Abono($idcompra,$no_cuota, $fecha_pago, $valor_abono) {
		$sql = "call  SP_REGISTRAR_ABONO('$idcompra','$no_cuota','$fecha_pago','$valor_abono')";
			if($consulta = $this->conexion->conexion->query($sql)){
					return 1;
				} else {
					return 0;
				}
				$this->conexion->cerrar();

  		 }
	}

 








 ?>