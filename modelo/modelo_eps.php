<?php 

class Modelo_Eps {


	  private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_eps(){
		$sql = "SELECT  `IdEPS`    , `NitEPS`
		    , `NomEPS` , `CiudadEPS`
		    , `DirEPS`	 , `TelEPS`
		    , `EmailEps`, `fregistro`
		    , `estatus`
		   FROM
		    `eps`;";
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

	function Registrar_Eps($nit,$nombre,$ciudad,$direccion,$telefono,$correo) {
		$sql = "call  SP_REGISTRAR_EPS('$nit','$nombre','$ciudad','$direccion','$telefono','$correo')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	 function Modificar_Eps($id,$nit_actual,$nit_nueva, $nombre,$ciudad,
			$direccion,$telefono,$email) {
	 	$sql = "call  SP_MODIFICAR_EPS('$id','$nit_actual','$nit_nueva','$nombre',
		'$ciudad','$direccion','$telefono','$email')";
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