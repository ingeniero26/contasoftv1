<?php

class Modelo_Salidas
{
    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_salidas($finicio, $ffin, $idempresa)
    {
        $sql = " SELECT  s.id,s.idConcepto,c.descripcion,
   s.fecha,s.idBodega, b.nombre_bodega,s.idusuario,
   u.usuario_nombre,s.idEmpresa,s.created_at,
   ds.idproducto, p.producto_codigo,p.producto_nombre,
   ds.cantidad,ds.estatus
      
	 FROM salida s
   INNER JOIN concepto c ON s.idConcepto= c.id
   INNER JOIN bodega b ON s.idBodega = b.id
   INNER JOIN usuario u ON s.idusuario = u.usuario_id
   INNER JOIN empresa e ON s.idEmpresa = e.ID
   LEFT  OUTER JOIN detalle_salida ds ON s.id = ds.idsalida
   INNER JOIN producto p ON ds.idproducto = p.producto_id
     WHERE s.fecha BETWEEN '$finicio' AND  '$ffin' AND s.`idEmpresa` = '$idempresa'";
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
    , `proveedor`.`proveedor_razon_social`,
	  `persona`.`persona_nrodocumento`,
	  persona.persona_nombre,persona.persona_apepat
		FROM
    `proveedor`
    INNER JOIN `persona`
	  ON (`proveedor`.`persona_id` = `persona`.`persona_id`)
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
