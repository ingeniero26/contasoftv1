<?php
    require('../../modelo/modelo_productos.php');
    $accion = "";
    if(isset($_REQUEST['accion'])){
        $accion = $_REQUEST['accion'];
    }

    switch ($accion) {
        case 'listarXcategoria':
            $objProductos = new Modelo_Productos();
            include("../../vista/productos/tarjetaProducto.php");
            break;
        case 'cargar':
            echo "Estamos en la accion de cargar categorias";
            break;
        case 'nuevo': case "editar":
            echo "Estamos en la accion de $accion categorias";
            break;
        case 'guardar':
            echo "Estamos en la accion de guardar categorias";
            break;
        case 'eliminar':
            echo "Estamos en la accion de eliminar categorias";
            break;
        case 'otra':
            echo "Estamos en la accion de otra categorias";
            break;
        default:
            # code...
            break;
    }
