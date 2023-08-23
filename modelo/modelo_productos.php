<?php

class Modelo_Productos
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }

    public function listar_productos($id_bodega, $id_categoria, $idempresa)
    {
        $sql = "SELECT
		`p`.`producto_id`    , `p`.`producto_codigo`
		, `p`.`producto_nombre`    , `p`.`producto_presentacion`
		, `p`.`id_bodega`    , `b`.`nombre_bodega`
		, `p`.`cant_minima`    , `p`.`producto_stock`
		, `p`.`id_categoria`    , `c`.`categoria_nombre`
		, `p`.`id_unidad`    , `u`.`unidad_nombre`
		, `p`.`idTipoProducto`    , `tp`.`tipo_producto`
		, `p`.`id_marca`    , `m`.`descripcion`
		, `p`.`producto_foto`    , `p`.`compra`
		, `p`.`producto_precioventa` , `p`.`producto_estatus`
		, `p`.`fregistro`    , `p`.`idempresa`
		,   p.producto_precioventa - p.`compra` AS ganancia
	FROM
		`producto` AS `p`
		 INNER JOIN `bodega` AS `b`    ON (`p`.`id_bodega` = `b`.`id`)
		INNER JOIN `categoria` AS `c`    ON (`p`.`id_categoria` = `c`.`categoria_id`)
		INNER JOIN `unidad` AS `u`       ON (`p`.`id_unidad` = `u`.`unidad_id`)
		INNER JOIN `tipo_producto` AS `tp`     ON (`p`.`idTipoProducto` = `tp`.`id`)
		INNER JOIN `marcas` AS `m`       ON (`p`.`id_marca` = `m`.`id`)
       WHERE b.`id` = '$id_bodega'  AND p.`id_categoria` = '$id_categoria' AND p.`idempresa` = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_assoc($consulta)) {
                $arreglo["data"][] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_combo_categoria($idempresa)
    {
        $sql = "SELECT `categoria_id`, `categoria_nombre` FROM categoria
     WHERE categoria.`idempresa` = '$idempresa' AND categoria.`categoria_estatus` ='ACTIVO'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_combo_unidad($idempresa)
    {
        $sql = "   SELECT unidad_id, unidad_nombre FROM unidad
    WHERE unidad.`unidad_estatus` ='ACTIVO' AND unidad.`idempresa`  = '$idempresa'";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_combo_tipo()
    {
        $sql = "   SELECT  id,`tipo_producto` FROM `tipo_producto`
    WHERE `tipo_producto`.`estatus`='ACTIVO'
    ";
        $arreglo = array();
        if ($consulta = $this->conexion->conexion->query($sql)) {
            while ($consulta_vu = mysqli_fetch_array($consulta)) {
                $arreglo[] = $consulta_vu;

            }
            return $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Registrar_Producto($codigo, $nombre, $presentacion, $idbodega, $cant_minima, $cant_inicial,
        $idcategoria, $idunidad, $tipo_producto, $id_marca, $ruta, $precio_compra, $precio_venta, $idempresa) {
        $sql = "call  SP_REGISTRAR_PRODUCTO('$codigo','$nombre','$presentacion',  '$idbodega','$cant_minima',
		'$cant_inicial', '$idcategoria','$idunidad','$tipo_producto', '$id_marca', '$ruta','$precio_compra','$precio_venta','$idempresa')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Estatus_Producto($producto_id, $estatus)
    {
        $sql = "call SP_MODIFICAR_ESTATUS_PRODUCTO('$producto_id','$estatus')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            //$id_retornado = mysqli_insert_ind($this->conexion->conexion);
            return 1;

        } else {
            return 0;
        }
    }

    public function Editar_Foto_Producto($idproducto, $ruta)
    {
        $sql = "call  SP_MODIFICAR_FOTO_PRODUCTO('$idproducto','$ruta')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function Modificar_Producto($id_producto, $codigo_actual,
        $codigo_nuevo, $nombre_actual, $nombre_nuevo,
        $presentacion_editar, $cant_minima,
        $idcategoria, $idunidad, $idtipo_producto, $precio_compra, $precio_venta) {
        $sql = "call  SP_MODIFICAR_PRODUCTO2('$id_producto','$codigo_actual',
		 '$codigo_nuevo',
		 '$nombre_actual','$nombre_nuevo','$presentacion_editar','$cant_minima',
		 '$idcategoria','$idunidad', '$idtipo_producto', '$precio_compra',  '$precio_venta')";
        if ($consulta = $this->conexion->conexion->query($sql)) {
            if ($row = mysqli_fetch_array($consulta)) {
                return $id = trim($row[0]);
            }
            $arreglo;
            $this->conexion->cerrar();
        }
    }

    public function listar_productos_categoria_tienda($id_bodega, $id_categoria)
    {
        $sql = "SELECT
			`p`.`producto_id`    , `p`.`producto_codigo`
			, `p`.`producto_nombre`    , `p`.`producto_presentacion`
			, `p`.`id_bodega`
			, `b`.`nombre_bodega`      ,`p`.`cant_minima`
			,    `p`.`producto_stock`    , `p`.`id_categoria`    , `c`.`categoria_nombre`
			, `p`.`id_unidad`    , `u`.`unidad_nombre`
			, `p`.`producto_foto`    , p.compra,`p`.`producto_precioventa`, p.producto_precio_mayor,
			  p.producto_precioventa - p.`compra`  AS ganancia,p.idTipoProducto,
			tp.id, tp.tipo_producto
			, `p`.`producto_estatus`,p.`idempresa`
			FROM
			`producto` AS `p`
			INNER JOIN `bodega` AS `b`     ON (`p`.`id_bodega` = `b`.`id`)
			INNER JOIN `categoria` AS `c`  ON (`p`.`id_categoria` = `c`.`categoria_id`)
			INNER JOIN `unidad` AS `u`     ON (`p`.`id_unidad` = `u`.`unidad_id`)
			INNER JOIN tipo_producto tp ON (p.`idTipoProducto` = tp.`id`)
			INNER JOIN empresa AS em ON p.`idempresa` = em.`ID`
       		WHERE b.`id` = '$id_bodega'  AND p.`id_categoria` = '$id_categoria' ";
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
