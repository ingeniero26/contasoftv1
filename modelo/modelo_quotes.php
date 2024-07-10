<?php

class Modelo_Quotes
{
    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function list_quotes($finicio, $ffin)
    {
        $sql = "SELECT q.id, 
                q.empresa_id,
                q.cliente_id,
                concat_ws(' ',`persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) as cliente,
                q.bodega_id,
                b.nombre_bodega,
                q.usuario_id,
                u.usuario_nombre,quote_no,
                q.tipo, q.fecha_quote, q.fecha_vencimiento,
                q.impuesto,q.total,q.estatus,
                q.porcentaje,q.total_dcto,q.fregistro
                FROM quotes q
                INNER JOIN usuario u
                ON q.usuario_id = u.usuario_id
                INNER JOIN bodega b ON
                q.bodega_id = b.id
                INNER JOIN empresa e ON
                q.empresa_id = e.ID
                INNER  JOIN cliente c on
                q.cliente_id  = c.idcliente
                INNER JOIN `persona` 
                        ON (`c`.`persona_id`
                        = `persona`.`persona_id`)
                        WHERE `q`.fecha_quote between '$finicio' AND '$ffin' ";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }
    public function listar_combo_cliente($idempresa)
    {
        $sql = "SELECT	CONCAT_WS(' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS cliente	 , `persona`.`persona_nrodocumento`
  		  ,`cliente`.`idcliente`	FROM    `cliente`
         INNER JOIN `persona`    ON (`cliente`.`persona_id` = `persona`.`persona_id`)
         WHERE cliente.`idempresa` = '$idempresa' AND
     `cliente`.`cliente_estatus` ='ACTIVO'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_combo_caja($idempresa)
    {
        $sql = "SELECT id,caja FROM caja
		WHERE caja.`estatus` = 'ACTIVO'
		 AND caja.`idempresa` = 1";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Venta($idcliente, $idbodega, 
	$idusuario, $tipo_comprobante, 
	$serie_comprobante, $tipo_pago, 
	$impuesto, $total, $estado, $porcentaje,
	 $decto, $fecha_vc,$dias_pago,
	 $idempresa, $idcaja)
    {
        $sql = "call  SP_REGISTRAR_VENTA('$idcliente','$idbodega', 
		 '$idusuario','$tipo_comprobante','$serie_comprobante',
		 '$tipo_pago','$impuesto','$total',
		 '$estado','$porcentaje','$decto',
		 '$fecha_vc','$dias_pago','$idempresa','$idcaja')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Venta_Detalle($id, $array_producto, $array_cantidad, $array_precio, $array_dcto)
    {
        $sql = "call  SP_REGISTRAR_VENTA_DETALLE('$id','$array_producto','$array_cantidad','$array_precio','$array_dcto')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        $this->conexion->cerrar();
    }

    public function Anular_Venta($idventa)
    {
        $sql = "call  SP_ANULAR_VENTA('$idventa')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            return 1;
        } else {
            return 0;
        }
        $this->conexion->cerrar();

    }

}
