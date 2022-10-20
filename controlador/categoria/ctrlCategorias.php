<?php
    require('../../modelo/modelo_categoria.php');
    $accion = "";
    if(isset($_REQUEST['accion'])){
        $accion = $_REQUEST['accion'];
    }

    switch ($accion) {
        case 'listar':
            $objCategorias = new Modelo_Categoria();
            include("../../vista/categoria/items_categorias.php");
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
