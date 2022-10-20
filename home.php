



<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" >
    <link href="plantilla/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <title>Portafolio</title>
  </head>
  <body onload="listarCategorias()">
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
        <li class="nav-item">
          <a class="nav-link" href=""><i class="fa fa-shopping-cart"></i></a>
        </li>        
      </ul>
    </div>
  </nav>
  <div style="width:100%; background:linear-gradient(230deg,#cecece,#2d2d2d);">
    <div class="row">
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner w-100" style="height:230px;">
          <div class="carousel-item active">
            <img src="img/slider01.jpg" class="d-block" alt="..."/>
          </div>
          <div class="carousel-item">
            <img src="img/slider02.jpg" class="d-block" alt="...">
          </div>
          <div class="carousel-item">
            <img src="img/slider03.jpg" class="d-block" alt="...">
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
    <div class="col-12" id="listCategorias">

    </div>

  </div>
  <div class="row">
    <div class="col-12" id="marcoPrincipal">

    </div>
  </div>
</div>
</div>
   
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
    <script src="js/categorias_tienda.js"></script>
  </body>
</html>