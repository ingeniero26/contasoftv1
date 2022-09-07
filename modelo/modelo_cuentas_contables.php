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
        $sql = "SELECT      `cuentas`.`id`        , `cuentas`.`codigo`
        , `cuentas`.`nombre`        , `cuentas`.`tipo`
        , `cuentas`.`usa_base`        , `cuentas`.`bancos_caja`
        , `cuentas`.`usa_nit`        , `cuentas`.`categoria`
        , `cuentas`.`clase`        , `cuentas`.`id_empresa`
        , `cuentas`.`estatus`        , `cuentas`.`fregistro`
        FROM         `cuentas`
        INNER JOIN `empresa`         ON (`cuentas`.`id_empresa` = `empresa`.`ID`)
            WHERE empresa.`ID` = '$idempresa'";
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
