<?php 

class Modelo_Pension {


	  private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_pension($idempresa){
		$sql = "SELECT
		`IdPension`
		, `NitPension`
		, `NomPension`
		, `CiudadPension`
		, `DirPension`
		, `TelPension`
		, `EmailPension`
		, `fregistro`
		, `estatus`
		, `idempresa`
	FROM
		`pension`
		WHERE pension.`idempresa` = '$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

function Modificar_Estatus_Eps($IdEPS,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_EPS('$IdEPS','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function Registrar_Pension($nit,$nombre,$ciudad,$direccion,$telefono,$correo) {
		$sql = "call  SP_REGISTRAR_PENSION('$nit','$nombre','$ciudad','$direccion','$telefono','$correo')";
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