<?php
// Require composer autoload
require_once __DIR__ . '/vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>REPORTE MARCAS</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo1.jpeg">
      </div>
      <h1>REPORTE DE MARCAS DEL SISTEMA</h1>
      
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">#</th>
            <th class="desc">Nombre</th>
            <th>Fecha Registro</th>
            <th>ESTATUS</th>
            
          </tr>
        </thead>
        <tbody>';

     /*   $conexion = new mysqli('localhost','root','','sistema_pos');
	if(mysqli_connect_errno()) {
		echo "conexion fallida",mysqli_connect_errno();
		exit();
	}*/
	$consulta = "SELECT * FROM marcas 
WHERE marcas.estatus = 'ACTIVO'";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['descripcion'].'</td>
          
            <td class="unit">'.$filas['fregistro'].'</td>
            <td class="unit">'.$filas['estatus'].'</td>'
            
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

// Output a PDF file directly to the browser
$mpdf->Output();