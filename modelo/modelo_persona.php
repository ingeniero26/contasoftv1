<?php 
class Modelo_Persona {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_persona($idempresa){
		$sql = "SELECT
		`persona`.`persona_id`
		, CONCAT_WS(' ',`persona_nombre`  , `persona_apepat`  , `persona_apemat`) AS tercero
		, `persona`.`persona_nombre`
		, `persona`.`persona_apepat`
		, `persona`.`persona_apemat`
		, `persona`.`tipo_contribuyente`
		, `persona`.`persona_nrodocumento`
		, `persona`.`persona_tipodocumento`
		, `persona`.`persona_sexo`
		, `persona`.`persona_telefono`
		, `persona`.`persona_direccion`
	   
		, `persona`.`persona_correo`
		, `persona`.`persona_fregistro`
		, `persona`.`persona_estatus`
		, `persona`.`idempresa`
		, persona.`id_tipo_tercero`
		, `tipo_tercero`.`tipo`
	FROM
		`persona`
		INNER JOIN `tipo_tercero` ON (persona.`id_tipo_tercero` = `tipo_tercero`.`id`)
   
        WHERE persona.`idempresa` = '$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Persona($nombre,$apepat,$apemat,$tipo_cont,$numero,$tipo_doc,$sexo,$telefono,
$direccion,$correo,$idempresa) {
		$sql = "call  SP_REGISTRAR_PERSONA('$nombre','$apepat','$apemat','$tipo_cont','$numero','$tipo_doc','$sexo','$telefono','$direccion','$correo','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Persona($id_persona,$nombre,$apepat,$apemat,
     $numero_actual,$numero_nuevo,$tipo_doc,$sexo, $telefono,$direccion, $correo, $estatus) {
		$sql = "call  SP_MODIFICAR_PERSONA('$id_persona','$nombre','$apepat','$apemat',
		'$numero_actual','$numero_nuevo','$tipo_doc','$sexo','$telefono','$direccion', '$correo' , '$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}


	function Modificar_Estatus_Persona($persona_id,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_PERSONA('$persona_id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}









 ?>