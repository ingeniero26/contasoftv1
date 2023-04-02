<?php 

class Modelo_Marcas{

	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_marcas($idempresa){
		$sql = "SELECT  `id`  , `descripcion`  , `fregistro`  , `estatus`
  			  , `idempresa` FROM
  			  `marcas`
  			  WHERE marcas.`idempresa` ='$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}


	function Registrar_Marca_Producto($descripcion,$idempresa) {
		$sql = "call  SP_REGISTRAR_MARCAS('$descripcion','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}




		function Modificar_Estatus_Bodega($id,$estatus){
		$sql = "call SP_MODIFICAR_ESTATUS_BODEGA('$id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
		}

			function listar_combo_marcas($idempresa) {
				$sql = "SELECT id, descripcion
                FROM marcas
                WHERE marcas.`idempresa` = '$idempresa'
                AND marcas.`estatus` ='ACTIVO'";
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



 ?>