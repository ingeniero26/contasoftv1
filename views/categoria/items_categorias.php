<?php

foreach ($objCategorias->listar_categoria_tienda() as $categoria) { 
    ?>
    <button class="btn btn-primary" onclick="cargarProductosCategoria('<?php  echo $categoria['categoria_id'];?>')">
        Ver: <?php echo $categoria['categoria_nombre']; ?>
    </button>   
<?php 
}

?>