<?php 

class Modelo_Concepto{
		private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_concepto($idempresa){
		$sql = " SELECT c.id, c.descripcion,
			c.estatus,
			c.fregistro,
				c.idempresa
				FROM concepto c
				WHERE c.idempresa = '$idempresa'
				ORDER BY c.fregistro ASC ";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Concepto($concepto,$idempresa) {
		$sql = "call  SP_REGISTRAR_CONCEPTO('$concepto','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Concepto($id,$descripcion_actual,$descripcion_nueva, $estatus) {
		$sql = "call  SP_MODIFICAR_CONCEPTO('$id','$descripcion_actual','$descripcion_nueva','$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Concepto($id,$estatus) {
		$sql = "call SP_ESTATUS_CONCEPTO('$id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}











 ?>