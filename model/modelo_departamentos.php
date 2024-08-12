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
		$sql = "SELECT * FROM departamentos";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
	function Registrar_Departamento($nombre_departamento) {
		$sql = "call  SP_REGISTRAR_DEPARTAMENTO('$nombre_departamento')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Departamento($id,$departamento_actual,$departamento_nueva, $estatus){ 
			$sql = "call  SP_MODIFICAR_DEPARTAMENTO('$id','$departamento_actual','$departamento_nueva','$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}

	}

	function listar_combo_departamentos() {
		$sql = "  SELECT id,nombre_depto
 			FROM departamentos
			 WHERE 
 			departamentos.`estatus` ='ACTIVO'";
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