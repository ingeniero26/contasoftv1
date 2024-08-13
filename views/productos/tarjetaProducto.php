<div class="container">
    <div class="row">

    <div class="col-md-12">
    <h1  class="text-center">LISTADO DE PRODUCTOS</h1>
    </div>
   
    <?php 
		foreach ($objProductos->listar_productos_categoria_tienda(1,$_POST['idCategoria']) as $producto) { ?>
           <div class="row">
           
               
            <div class="card" style="width:400px">
                <div class="view overlay">
                    <div class="panel-heading">
                        <h3 class="text-center">Nombre: <?php echo $producto['producto_nombre']; ?></h3>
                    </div>
                    <div class="card-body">
                        <img src="<?php  echo $producto['producto_foto']; ?>" alt="" class="card-img-top" style="width:100%">
                        <h4>Precio: <?php   echo $producto['producto_precioventa']; ?> </h4>
                        <a href="productos.php?categoria_id=<?php  echo $producto['producto_id'];?>" class="btn btn-success">Leer Mas</a>
                    </div>                    
                </div>
            </div>
          
           </div>
           
 	<?php 
	    }
    ?>
</div>