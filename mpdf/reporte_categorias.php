<?php
// Require composer autoload
require_once __DIR__ . './vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>REPORTE CATEGORIAS</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo1.jpeg">
      </div>
      <h1>REPORTE DE CATEGORIAS DEL SISTEMA</h1>
      
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
	$consulta = "SELECT  * FROM categoria WHERE `categoria_estatus` = 'ACTIVO'";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['categoria_nombre'].'</td>
            <td class="unit">'.$filas['categoria_fregistro'].'</td>
            <td class="unit">'.$filas['categoria_estatus'].'</td>'
            
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