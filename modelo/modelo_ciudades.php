<?php 


class Modelo_Ciudades {
		private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_ciudades($id_departamento){
		$sql = "SELECT     `ciudades`.`id`
    , `ciudades`.`nombre_ciudad`
    , ciudades.`estatus`
    , `ciudades`.`idDepto`
    , `departamentos`.`nombre_depto`
	FROM
    `sistema_pos_v2`.`ciudades`
    INNER JOIN `sistema_pos_v2`.`departamentos` 
        ON (`ciudades`.`idDepto` = `departamentos`.`id`)
        WHERE ciudades.`idDepto` = '$id_departamento'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}


		function listar_combo_ciudades(){
			$sql = "SELECT  id,nombre_ciudad FROM ciudades where ciudades.estatus ='ACTIVO' ";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
				}
				return $arreglo;
				$this->conexion->cerrar();
			}
		}

		function Registrar_Ciudades($ciudad,$id_departamento,$idempresa) {
			$sql = "call  SP_REGISTRAR_CIUDADES('$ciudad','$id_departamento','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
			}
		}

}