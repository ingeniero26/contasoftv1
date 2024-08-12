<?php 


class Modelo_Iva {
 private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	   public function listar_combo_iva($idempresa) {
     $sql = "SELECT  id, tarifa
         FROM iva  
         WHERE iva.idEmpresa = '$idempresa'
         AND iva.estado = 'ACTIVO' ";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }


		

	

}