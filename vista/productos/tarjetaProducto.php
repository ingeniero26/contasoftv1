<div class="container">
    <div class="row">

    <div class="col-md-12">
    <h1  class="text-center">LISTADO DE PRODUCTOS</h1>
    </div>
   
    <?php 
		foreach ($objProductos->listar_productos_categoria_tienda(1,$_POST['idCategoria']) as $producto) { ?>
           <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="text-left"><?php echo $producto['producto_nombre']; ?></h3>
                    </div>
                    <div class="panel-body">
                        <img src="<?php  echo $producto['producto_foto']; ?>" alt="" class="img-fluid">
                        <p><?php   echo $producto['producto_precioventa']; ?> </p>
                        <a href="productos.php?categoria_id=<?php  echo $producto['producto_id'];?>" class="btn btn-primary">Leer Mas</a>
                    </div>                    
                </div>
            </div>
 	<?php 
	    }
    ?>
</div>