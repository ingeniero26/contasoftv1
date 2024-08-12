<?php

class Modelo_Empresa
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_empresa($idempresa)
    {
        $sql = "	SELECT
		`e`.`ID`, `e`.`Nit`
		, `e`.`nombre`, `e`.`Representante`
		, e.`idCiudad`, ciudades.`nombre_ciudad`
		, `e`.`Direccion`, `e`.`Telefono`
		, `e`.`Correo`, `e`.`Logo`
		,  e.Industria
		, `e`.`id_tipo_regimen`, `tipo_regimen`.`descripcion`
		, `e`.`fregistro`, `e`.`estatus`
		FROM
		empresa e
		INNER JOIN `tipo_regimen` ON (`e`.`id_tipo_regimen` = `tipo_regimen`.`id`)
		INNER JOIN ciudades on (e.`idCiudad` = ciudades.`id`)
		 WHERE e.`ID` = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Foto_Empresa($idempresa, $ruta)
    {
        $sql = "call  SP_MODIFICAR_FOTO_EMPRESA('$idempresa','$ruta')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    function listar_combo_tipo_regimen()
    {
        $sql = "SELECT id,descripcion
    FROM tipo_regimen
    WHERE tipo_regimen.`estatus` ='ACTIVO'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    function Modificar_EmpresaModificar_Empresa(
        $idempresa,
        $NIT_actual,
        $NIT_nuevo,
        $nombre,
        $representante,
        $direccion,
        $telefono,
        $ciudad,
        $correo,
        $estatus
    ) {
        $sql = "call  SP_MODIFICAR_EMPRESA('$idempresa','$NIT_actual',
    '$NIT_nuevo','$nombre','$representante','$direccion','$telefono','$ciudad',
    '$correo','$estatus')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return    $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }
}
