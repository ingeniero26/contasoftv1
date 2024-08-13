<?php 

class Modelo_Arl {

    private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function list_document_type($idempresa){
		$sql = "SELECT  dt.id,
                dt.company_id,dt.`name`, dt.abbreviation,
                dt.`status`,dt.created_by,u.usuario_nombre,
                dt.created_at
                FROM document_type dt 
                LEFT OUTER JOIN usuario u ON  
                u.usuario_id = dt.created_by
                WHERE dt.company_id = '$idempresa'
                ORDER BY dt.`name` ASC";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Arl($IdARL,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_ARL('$IdARL','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function Registrar_Arl($nit,$nombre,$ciudad,$direccion,$telefono,$correo,$idempresa) {
		$sql = "call  SP_REGISTRAR_ARL('$nit','$nombre','$ciudad','$direccion','$telefono','$correo','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}
	function Modificar_Arl($id,$nit_actual,$nit_nueva, $nombre,$ciudad,
$direccion,$telefono,$email) {
		$sql = "call  SP_MODIFICAR_ARL('$id','$nit_actual','$nit_nueva','$nombre',
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