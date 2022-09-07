<?php 

class Modelo_Empresa {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}

	

	function listar_empresa($idempresa) {
		$sql = "SELECT
			    `ID`
			    , `Nit`
			    , nombre
			    , `Representante`
			    , `Direccion`
			    , `Telefono`
			    ,`Correo`
			    , `Logo`
			    , `fregistro`
			    , `estatus`
			FROM
			    `empresa` WHERE empresa.`ID` ='$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Foto_Empresa($idempresa,$ruta) {
		$sql = "call  SP_MODIFICAR_FOTO_EMPRESA('$idempresa','$ruta')";
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