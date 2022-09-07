<?php
// Require composer autoload
require_once __DIR__ . './vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>REPORTE USUARIOS</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="logo.png">
      </div>
      <h1>REPORTE DE USUARIOS DEL SISTEMA</h1>
      
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">#</th>
            <th class="desc">USUARIO</th>
            <th>ROL</th>
            <th>ESTATUS</th>
            
          </tr>
        </thead>
        <tbody>';

     /*   $conexion = new mysqli('localhost','root','','sistema_pos');
	if(mysqli_connect_errno()) {
		echo "conexion fallida",mysqli_connect_errno();
		exit();
	}*/
	$consulta = "SELECT   `usuario`.`usuario_nombre`     , `rol`.`rol_nombre`
    , `usuario`.`usuario_estatus`    FROM     `usuario`
    INNER JOIN `sistema_pos`.`rol` 
        ON (`usuario`.`rol_id` = `rol`.`rol_id`);";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['usuario_nombre'].'</td>
            <td class="unit">'.$filas['rol_nombre'].'</td>
            <td class="qty">'.$filas['usuario_estatus'].'</td>';
        }
            
          $html.='</tr>   
         </tbody>
      </table>
    
    </main>
    <footer>
      Usuarios del SISTEMA.
    </footer>
  </body>
</html>';





$mpdf = new \Mpdf\Mpdf();

$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html);

// Output a PDF file directly to the browser
$mpdf->Output();