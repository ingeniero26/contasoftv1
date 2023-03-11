<?php

class Modelo_Cuentas_Contable
{
    private $conexion;


    function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }


    function listar_cuentas_contables($idempresa)
    {
        $sql = "SELECT
        `id`
        , `idEmpresa`
        , `codigo`
        , `concepto_nit`
        , `nombre`
        , `tipo`
        , `usa_bancos`
        , `usa_base`
        , `usa_centros`
        , `usa_nit`
        , `usa_anticipo`
        , `categoria`
        , `clase`
        , `nivel`
        , `fregistro`
        , `estatus`
    FROM
        `cuentas`
        WHERE cuentas.`idEmpresa` = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;
            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
}
