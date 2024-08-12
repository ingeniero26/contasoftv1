<?php

class Modelo_Tipo_Gastos {
    private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_tipo_pagos($idempresa){
		$sql = "SELECT
        `id`
        , `descripcion`
        , `fregistro`
        , `estatus`
        , `idempresa`
        FROM
        `tipo_gasto`
        WHERE tipo_gasto.`idempresa` = '$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

    function Registrar_Tipo_Pago($tipo_gasto,$idempresa) {
        $sql = "call  SP_REGISTRAR_TIPO_GASTO('$tipo_gasto','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
    }

    function Modificar_Estatus_Tipo_Pago($id,$estatus) {
        $sql = "UPDATE tipo_gasto set 
        estatus = '$estatus' where id = '$id'";
          if ($consulta = $this->conexion->conexion->query($sql)) {
              //$id_retornado = mysqli_insert_ind($this->conexion->conexion);
              return 1;
              
          }else{
              return 0;
          }
    }
}