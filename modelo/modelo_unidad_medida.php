<?php 


class Unidad_Medida {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_unidad_medida($idempresa){
		$sql = "SELECT    `unidad_id`    , `unidad_nombre`
    , `unidad_abreviatura`    , `unidad_fregistro`
    , `unidad_estatus`    , `idempresa`
   FROM
    `unidad`
    WHERE `unidad`.`idempresa` ='$idempresa' AND `unidad`.`unidad_estatus` ='ACTIVO'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}


	function Registrar_Unidad($unidad,$abreviatura,$idempresa) {
		$sql = "call  SP_REGISTRAR_UNIDAD('$unidad','$abreviatura','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Unidad ($id,$unidad_actual,$unidad_nueva, $abreviatura ,$estatus){
		$sql = "call  SP_MODIFICAR_UNIDAD('$id','$unidad_actual','$unidad_nueva','$abreviatura', '$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Unidad($unidad_id,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_UNIDAD('$unidad_id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}


 







 ?>