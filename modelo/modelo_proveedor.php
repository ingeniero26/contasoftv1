<?php 

class Modelo_Proveedor {
	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_proveedor($idempresa){
		$sql = " SELECT     `persona`.`persona_id`
		, CONCAT_WS(' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS proveedor
		, `persona`.`persona_nrodocumento`    , `persona`.`persona_tipodocumento`
		, `persona`.`persona_sexo`    , `persona`.`persona_telefono`
		, persona.`tipo_contribuyente`
		, `persona`.`persona_direccion` ,persona.persona_correo   , `proveedor`.`proveedor_id`
		,proveedor.proveedor_num_contacto    , `proveedor`.`proveedor_fregistro`
		, `proveedor`.`proveedor_estatus`    ,	proveedor.proveedor_razon_social
			  ,proveedor.`idempresa`, proveedor.`idciudad`, ciudades.`nombre_ciudad`
		FROM     `proveedor`
		INNER JOIN `persona` ON (`proveedor`.`persona_id` = `persona`.`persona_id`)
		INNER JOIN ciudades ON proveedor.`idciudad` =  ciudades.`id`
		INNER JOIN empresa ON   proveedor.`idempresa` = empresa.`ID`
        WHERE proveedor.`idempresa` ='$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
	function Registrar_Proveedor($nombre,$apepat,$apemat,$numero,$tipo_doc,
	$tipo_contribuyente,$sexo,$telefono,$direccion,$correo,
	 $razon_social,$num_contacto,$idciudad,$idempresa,$id_tipo_tercero) {
		$sql = "call  SP_REGISTRAR_PROVEEDOR2('$nombre','$apepat','$apemat','$numero','$tipo_doc',
		'$tipo_contribuyente','$sexo','$telefono','$direccion','$correo',
		  '$razon_social','$num_contacto','$idciudad', '$idempresa','$id_tipo_tercero')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Proveedor($proveedor_id,$estatus){
		$sql = "call SP_MODIFICAR_ESTATUS_PROVEEDOR('$proveedor_id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function listar_combo_tipo_tercero($idempresa) {
		$sql = " SELECT  id,tipo FROM tipo_tercero
		WHERE tipo_tercero.`tipo` ='PROVEEDOR'
		AND  tipo_tercero.`idempresa` = '$idempresa'
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
}





 ?>