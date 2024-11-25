<?php

class Modelo_Inventory
{
    private $conexion;

    public function __construct()
    {
        require_once 'modelo_conexion.php';
        $this->conexion = new conexion();
        $this->conexion->conectar();
    }


    function listar_inventory($id_bodega)
    {
        $sql = "SELECT 
            im.id,
            im.product_id,
            p.producto_nombre,
            
            im.movement_type,
            im.quantity,
            i.`stock`,
            im.movement_date,
            im.description,
            b.`nombre_bodega`
        FROM 
            inventory_movements im
        JOIN 
            inventories i ON im.product_id = i.product_id
        JOIN 
            bodega b ON i.bodega_id = b.id
        JOIN 
            producto p ON im.product_id = p.`producto_id`
        WHERE 
            b.id = '$id_bodega' 
        ORDER BY 
            im.movement_date DESC;";
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
