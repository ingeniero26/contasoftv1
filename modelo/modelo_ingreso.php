<?php

class Modelo_Ingreso
{
    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_ingreso($finicio, $ffin, $idempresa)
    {
        $sql = "SELECT     `compra`.`compra_id`
    , `compra`.`proveedor_id`    ,`compra`.`id_bodega`
    ,`bodega`.`nombre_bodega`    , `compra`.`usuario_id`
    , `compra`.`compra_tipo_comprobante`    , `compra`.`compra_serie_comprobante`
    , `compra`.`compra_num_comprobante`    , `compra`.`compra_tipo_pago`
    , `compra`.`compra_fecha`    , `compra`.`compra_impuesto`
    , `compra`.`compra_total`    , `compra`.`compra_estatus`
    , `usuario`.`usuario_nombre`
    , CONCAT_WS(' ', `persona`.`persona_nombre`  , `persona`.`persona_apepat` , `persona`.`persona_apemat` ) AS proveedor,
    compra.compra_total_decto, compra.fecha_vencimiento

   FROM
    `compra`
    INNER JOIN `usuario`     ON (`compra`.`usuario_id` = `usuario`.`usuario_id`)
    INNER JOIN `proveedor`   ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
    INNER JOIN `persona`     ON (`proveedor`.`persona_id` = `persona`.`persona_id`)
     INNER JOIN `bodega`  ON  `compra`.`id_bodega`  = `bodega`.`id`
     WHERE compra.compra_fecha BETWEEN '$finicio' AND  '$ffin' AND compra.`idempresa` = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
    public function listar_combo_proveedor($idempresa)
    {
        $sql = "SELECT     `proveedor`.`proveedor_id`
    , `proveedor`.`proveedor_razon_social`    , `persona`.`persona_nrodocumento`
		FROM
    `proveedor`
    INNER JOIN `persona`    ON (`proveedor`.`persona_id` = `persona`.`persona_id`)
        WHERE proveedor.`idempresa` = '$idempresa' AND    `proveedor_estatus` = 'ACTIVO' ";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_combo_producto($idempresa)
    {
        $sql = "SELECT `producto_id`,`producto_nombre`,
	`producto_stock`,`producto_precioventa`, producto.producto_foto, producto.producto_codigo
	FROM `producto`
	WHERE  producto.`idempresa` = '$idempresa' AND    `producto`.`producto_estatus` ='ACTIVO'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
    public function Registrar_Compra($idproveedor, $idbodega, $idusuario, $tipo_comprobante, $serie_comprobante, $num_comprobante, $tipo_pago, $fecha_compra, $impuesto, $total, $estado, $porcentaje, $decto, $fecha_vencimiento, $idempresa)
    {
        $sql = "call  SP_REGISTRAR_COMPRA('$idproveedor','$idbodega',  '$idusuario','$tipo_comprobante','$serie_comprobante'
		,'$num_comprobante','$tipo_pago','$fecha_compra','$impuesto','$total','$estado','$porcentaje','$decto','$fecha_vencimiento','$idempresa')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Compra_Detalle($id, $array_producto, $array_cantidad, $array_precio, $array_dcto)
    {
        $sql = "call  SP_REGISTRAR_COMPRA_DETALLE('$id','$array_producto','$array_cantidad','$array_precio','$array_dcto')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        $this->conexion->cerrar();
    }
    public function Anular_Compra($idcompra)
    {
        $sql = "call  SP_ANULAR_COMPRA('$idcompra')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        $this->conexion->cerrar();

    }

}
