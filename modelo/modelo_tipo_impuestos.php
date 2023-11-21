<?php

class Modelo_Tipo_Impuestos
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_tipo_impuestos($idempresa)
    {
        $sql = "SELECT  i.id,i.codigo,i.tarifa,i.nombre,
        i.estado,i.fregistro,i.idEmpresa

         FROM iva i
         WHERE i.idEmpresa = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Tipo_Impuesto($codigo, $tarifa, $nombre, $idempresa)
    {
        $sql = "call  sp_agregar_iva('$codigo','$tarifa','$nombre','$idempresa')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Categoria($id, $categoria_actual, $categoria_nueva, $estatus)
    {
        $sql = "call  SP_MODIFICAR_CATEGORIA('$id','$categoria_actual','$categoria_nueva','$estatus')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Estatus_Impuesto($id, $estatus)
    {
        $sql = "call sp_modificar_estado_iva('$id','$estatus')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            //$id_retornado = mysqli_insert_ind($this->conexion->conexion);
            return 1;

        } else {
            return 0;
        }
    }

    public function listar_categoria_tienda()
    {
        $sql = "SELECT `categoria_id`, `categoria_nombre`, `categoria_fregistro`, `categoria_estatus`, `idempresa`
    			FROM `categoria`";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
}
