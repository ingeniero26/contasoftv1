<?php

class Modelo_Cuentas_Contable
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_cuentas_contables($idempresa)
    {
        $sql = "SELECT
        `id`        , `idEmpresa`
        , `codigo`        , `concepto_nit`
        , `nombre`        , `tipo`
        , `usa_bancos`        , `usa_base`
        , `usa_centros`        , `usa_nit`
        , `usa_anticipo`        , `categoria`
        , `clase`        , `nivel`
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
    public function Registrar_Cuenta_Contable($idempresa, $cod_cuenta, $cuenta_nit, $nombre_cuenta,
        $tipo_cuenta, $usa_banco, $usa_base, $usa_centro, $usa_nit, $usa_anticipo,
        $categoria, $clase, $nivel, ) {
        $sql = "call  SP_REGISTRAR_CUENTA_CONTABLE('$idempresa','$cod_cuenta','$cuenta_nit',
            '$nombre_cuenta','$tipo_cuenta','$usa_banco','$usa_base',
            '$usa_centro','$usa_nit','$usa_anticipo','$categoria','$clase','$nivel')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }

    }

    public function Modificar_Cuenta_Contable($id, $codigo_actual,
        $codigo_nuevo, $nit_cuenta, $cuenta_nombre,$cuenta_tipo, $cuenta_banco,
        $cuenta_base, $cuenta_centro, $cta_nit, $anticipo_cuenta,
         $categoria_cuenta, $clase_cuenta,
        $nivel_cuenta
    ) {
        $sql = "call  SP_MODIFICAR_CUENTA_CONTABLE('$id',
        '$codigo_actual','$codigo_nuevo','$nit_cuenta','$cuenta_nombre','$cuenta_tipo',
        '$cuenta_banco','$cuenta_base','$cuenta_centro','$cta_nit',
        '$anticipo_cuenta','$categoria_cuenta','$clase_cuenta','$nivel_cuenta')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }
}
