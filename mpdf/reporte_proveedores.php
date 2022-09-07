<?php
// Require composer autoload
require_once __DIR__ . './vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>REPORTE PROVEEDORES</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="logo.png">
      </div>
      <h1>LISTADO DE PROVEEDORES</h1>
      
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">#</th>
            <th class="desc">PROVEEDOR</th>
             <th class="desc">CONTACTO</th>
              <th class="desc">DOCUMENTO</th>
            <th>TELEFONO</th>
             <th class="desc">DIRECCION</th>
            <th>ESTATUS</th>
            
          </tr>
        </thead>
        <tbody>';

     /*   $conexion = new mysqli('localhost','root','','sistema_pos');
	if(mysqli_connect_errno()) {
		echo "conexion fallida",mysqli_connect_errno();
		exit();
	}*/
	$consulta = "SELECT
    `proveedor`.`proveedor_id`
    , `proveedor`.`proveedor_razon_social` AS proveedor
    , CONCAT_WS(' ',`persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS contacto
    , `persona`.`persona_nrodocumento`
    , `persona`.`persona_telefono`
    , `persona`.`persona_direccion`
    , `persona`.`persona_estatus`
FROM
    `proveedor`
    INNER JOIN `persona` 
        ON (`proveedor`.`persona_id` = `persona`.`persona_id`);";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['proveedor'].'</td>
            <td class="unit">'.$filas['contacto'].'</td>
             <td class="desc">'.$filas['persona_nrodocumento'].'</td>
            <td class="unit">'.$filas['persona_telefono'].'</td>
            <td class="unit">'.$filas['persona_direccion'].'</td>

            <td class="qty">'.$filas['persona_estatus'].'</td>';
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