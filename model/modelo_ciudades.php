<?php

class Modelo_Ciudades
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_ciudades($id_departamento, $idempresa)
    {
        $sql = "SELECT     `ciudades`.`id`
			, `ciudades`.`nombre_ciudad`
			, ciudades.`estatus`
			, `ciudades`.`idDepto`
			, ciudades.idempresa
			, `departamentos`.`nombre_depto`
				FROM `ciudades`
				INNER JOIN `departamentos`
			ON (`ciudades`.`idDepto` =
			 `departamentos`.`id`)
					WHERE ciudades.`idDepto` = '$id_departamento'
					AND ciudades.idempresa = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_combo_ciudades()
    {
        $sql = "SELECT  id,nombre_ciudad FROM ciudades where ciudades.estatus ='ACTIVO' ";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Ciudades($ciudad, $id_departamento, $idempresa)
    {
        $sql = "call  SP_REGISTRAR_CIUDADES('$ciudad','$id_departamento','$idempresa')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

}