<?php

class Modelo_Salidas
{
    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }
    public function listar_salidas()
    {
        $sql = "SELECT
        s.id AS salida_id,
        s.fecha,
        s.id_usuario,
        u.usuario_nombre AS nombre_usuario,
        s.id_bodega,
        b.nombre_bodega AS nombre_bodega,
        s.tipo_salida,
        s.motivo,
        ds.id AS detalle_salida_id,
        ds.id_producto,
        p.producto_codigo,
        p.producto_nombre AS nombre_producto,
        ds.cantidad,
        ds.precio_unitario,
        (ds.cantidad * ds.precio_unitario) AS total
    FROM
        salida s
    INNER JOIN
        detalle_salida ds ON s.id = ds.id_salida
    INNER JOIN
        usuario u ON s.id_usuario = u.usuario_id
    INNER JOIN
        bodega b ON s.id_bodega = b.id
    INNER JOIN
        producto p ON ds.id_producto = p.producto_id
        ORDER BY
		  s.fecha DESC, s.id DESC  ";
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
