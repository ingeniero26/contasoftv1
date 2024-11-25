<?php 
class Modelo_Cargos {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_cargos(){
		$sql = "SELECT
			    `cargos`.`IdCargos`	   , `cargos`.`DescCargos` 
			    , `cargos`.`IdDpto`    , `dpto`.`IdDpto`
			    , `dpto`.`DescDpto` 
			    , `cargos`.`fregistro`
			    , `cargos`.`estatus`
			FROM
			    `cargos`    INNER JOIN `dpto`  ON (`cargos`.`IdDpto` = `dpto`.`IdDpto`);";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
	
	function listar_combo_dpto() {
		$sql = " SELECT `IdDpto`, `DescDpto` FROM dpto
        WHERE dpto.`estatus` = 'ACTIVO'";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Cargo($descripcion,$depto) {
		$sql = "call  SP_REGISTRAR_CARGO('$descripcion','$depto')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Cargo($IdCargos,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_CARGO('$IdCargos','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}



 ?>