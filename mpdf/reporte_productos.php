<?php
// Require composer autoload
require_once __DIR__ . './vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>REPORTE PRODUCTOS</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo1.jpeg">
      </div>
      <h1>REPORTE DE PRODUCTOS DEL SISTEMA</h1>
      
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">#</th>
            <th class="desc">Codigo</th>
            <th class="desc">Nombre</th>
            <th class="desc">Ref/Marca</th>
            <th class="desc">Bodega</th>
            <th class="desc">Stock</th>
            <th class="desc">Categoria</th>
            <th class="desc">Medida</th>
            <th class="desc">Precio</th>
            <th>ESTATUS</th>
            
          </tr>
        </thead>
        <tbody>';

     /*   $conexion = new mysqli('localhost','root','','sistema_pos');
	if(mysqli_connect_errno()) {
		echo "conexion fallida",mysqli_connect_errno();
		exit();
	}*/
	$consulta = "SELECT     `producto`.`producto_id`    , `producto`.`producto_codigo`
    , `producto`.`producto_nombre`    , `producto`.`producto_presentacion`
    , `bodega`.`nombre_bodega`    , `producto`.`producto_stock`
    , `categoria`.`categoria_nombre`    , `unidad`.`unidad_nombre`
    , `producto`.`producto_precioventa`
    , `producto`.`producto_estatus`
FROM
    `producto`
    INNER JOIN `bodega` 
        ON (`producto`.`id_bodega` = `bodega`.`id`)
    INNER JOIN `categoria` 
        ON (`producto`.`id_categoria` = `categoria`.`categoria_id`)
    INNER JOIN `unidad` 
        ON (`producto`.`id_unidad` = `unidad`.`unidad_id`);";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['producto_codigo'].'</td>
             <td class="desc">'.$filas['producto_nombre'].'</td>
            <td class="unit">'.$filas['producto_presentacion'].'</td>
            <td class="unit">'.$filas['nombre_bodega'].'</td>
            <td class="unit">'.$filas['producto_stock'].'</td>
             <td class="unit">'.$filas['categoria_nombre'].'</td>
             <td class="unit">'.$filas['unidad_nombre'].'</td>
             <td class="unit">'.$filas['producto_precioventa'].'</td>
             <td class="unit">'.$filas['producto_estatus'].'</td>'
            ;
        }
            
          $html.='</tr>   
         </tbody>
      </table>
    
    </main>
    <footer>
      CATEGORIAS de la EMPRESA.
    </footer>
  </body>
</html>';





$mpdf = new \Mpdf\Mpdf();

$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html);
$mpdf->allow_charset_conversion=true;
$mpdf->charset_in='UTF-8';

// Output a PDF file directly to the browser
$mpdf->Output();