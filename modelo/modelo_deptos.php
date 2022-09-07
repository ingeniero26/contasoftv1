<?php 

class Modelo_Deptos {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_deptos(){
		$sql = "SELECT * FROM dpto";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Deptos($descripcion) {
		$sql = "call  SP_REGISTRAR_DEPTO('$descripcion')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Depto($IdDpto,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_DEPTO('$IdDpto','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function Modificar_Depto($id,$desc_actual,$desc_nueva) {
			$sql = "call  SP_MODIFICAR_DEPTO('$id','$desc_actual','$desc_nueva')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}


}










 ?>