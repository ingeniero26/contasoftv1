<?php

class Modelo_Tipo_Comprobante
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_tipo_comprobante($idempresa)
    {
        $sql = " SELECT
        tp.id,
        tp.abreviatura,
        tp.descripcion,
        tp.estatus,
        tp.fregistro,
        tp.idEmpresa
         FROM tipo_comprobante tp
         WHERE   tp.estatus ='ACTIVO' and tp.idEmpresa = '$idempresa'
         ORDER BY tp.abreviatura asc";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Tipo_Producto($tipo_producto, $idempresa)
    {
        $sql = "call  SP_REGISTRAR_TIPO_PRODUCTO('$tipo_producto','$idempresa')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Tipo_Producto($id, $tipo_actual, $tipo_nueva, $estatus)
    {
        $sql = "call  SP_MODIFICAR_TIPO_PRODUCTO('$id','$tipo_actual','$tipo_nueva','$estatus')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Estatus_Categoria($id, $estatus)
    {
        $sql = "call SP_MODIFICAR_ESTATUS_TIPO_PRODUCTO('$id','$estatus')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            //$id_retornado = mysqli_insert_ind($this->conexion->conexion);
            return 1;

        } else {
            return 0;
        }
    }
}
