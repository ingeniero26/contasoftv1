<?php 

class Modelo_Rol{
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_rol($idempresa){
		$sql = "SELECT     `rol`.`rol_id`    , `rol`.`rol_nombre`
       , `rol`.`rol_fregistro`    , `rol`.`rol_estatus`
       , `rol`.`idempresa` FROM
      `rol`
       INNER JOIN `empresa` 
        ON (`rol`.`idempresa` = `empresa`.`ID`)
        WHERE rol.`idempresa` = '$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Rol($rol,$idempresa) {
		$sql = "call  SP_REGISTRAR_ROL('$rol','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Rol($id,$rol_actual,$rol_nuevo, $estatus) {
		$sql = "call  SP_MODIFICAR_ROL('$id','$rol_actual','$rol_nuevo','$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Rol($rol_id,$estatus) {
			$sql = "call SP_MODIFICAR_ESTATUS_ROL('$rol_id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}


 ?>