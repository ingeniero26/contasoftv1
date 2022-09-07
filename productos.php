
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" >
</head>
<body>
<div class="container-fluid">
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">JKSYSTEMAS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="home.php">Inicio <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Nosotros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Categorias</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="">Productos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="">Pedidos</a>
        </li>
      </ul>
 
    </div>
  </nav><br><br>
    
   <div class="container">
    <div class="row">

    <div class="col-md-12">
    <h1  class="text-center">LISTADO DE PRODUCTOS</h1>
    </div>
   
    <?php 
			include 'conexion_global/r_conexion.php';
            $categoria = $_GET['categoria_id'];
			$sql = "SELECT  *  FROM  producto WHERE id_categoria = $categoria";
			$res = $conexion->query($sql);
			while($row = $res->fetch_assoc())
				 {
				 	?>


					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="text-left"><?php echo $row['producto_nombre']; ?></h3>
							</div>
							<div class="panel-body">
                                <img src="<?php  echo $row['producto_foto']; ?>" alt="" class="img-fluid">
                                <p><?php   echo $row['producto_precioventa']; ?> </p>
                             <a href="productos.php?categoria_id=<?php  echo $row['producto_id'];?>" class="btn btn-primary">Leer Mas</a>
							</div>
							
						</div>
					</div>


				 	<?php 
				 }
	 ?>
</div>

</div>















<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</body>
</html>