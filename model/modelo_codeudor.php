<?php 

class Modelo_Codeudor {
		private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_codeudor($id_cliente){
		$sql = "SELECT
        `codeudor`.`id`
        , CONCAT_WS(' ', `codeudor`.`nombres`  , `codeudor`.`apellido_paterno`  , `codeudor`.`apellido_materno` )  AS codeudor
        , `codeudor`.`tipo_doc`
        , `codeudor`.`documento`
        , `codeudor`.`direccion`
        , `codeudor`.`telefono`
        , `codeudor`.`celular`
        , `codeudor`.`correo`
        , `codeudor`.`nombre_ref1`
        , `codeudor`.`nombre_ref2`
        , `codeudor`.`tel_ref1`
        , `codeudor`.`tel_ref2`
        , `codeudor`.`dir_ref1`
        , `codeudor`.`dir_ref2`
        , `codeudor`.`id_cliente`
        , `codeudor`.`fregistro`
        , `codeudor`.`estatus`
    FROM
        `codeudor`
        INNER JOIN `cliente` 
            ON (`codeudor`.`id_cliente` = `cliente`.`idcliente`)
            WHERE codeudor.`id_cliente` = '$id_cliente' ";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
}