



<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" >

    <title>Portafolio</title>
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
          <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
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
     <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/slider01.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/slider02.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/slider03.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
   </div>
 </div>


<div class="container">
  <h1 class="text-center">CATEGORIAS </h1>
	<div class="row">
	<?php 
			include 'conexion_global/r_conexion.php';
			$sql = "SELECT  `categoria_id`, categoria_nombre,
      categoria_estatus
      FROM  categoria
      WHERE categoria.`categoria_estatus` ='ACTIVO'";
			$res = $conexion->query($sql);
			while($row = $res->fetch_assoc())
				 {
				 	?>


					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="text-left"><?php echo $row['categoria_nombre']; ?></h3>
							</div>
							<div class="panel-body">
              <a href="productos.php?categoria_id=<?php  echo $row['categoria_id'];?>" class="btn btn-primary">Leer Mas</a>
							</div>
							
						</div>
					</div>


				 	<?php 
				 }
	 ?>
</div>
</div>
</div>
   
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
    
  </body>
</html>