<?php
// Require composer autoload
require_once __DIR__ . './vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>REPORTE CLIENTES</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo1.jpeg">
      </div>
      <h1>REPORTE DE CLIENTES DEL SISTEMA</h1>
      
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">#</th>
            <th class="desc">Nombre</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Tipo Documento</th>
            <th>Numero</th>
            <th>Direccion</th>
            <th>Telefono</th>
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
    `cliente`.`idcliente`
    , `persona`.`persona_nombre`    , `persona`.`persona_apepat`
    , `persona`.`persona_apemat`    , `persona`.`persona_nrodocumento`
    , `persona`.`persona_tipodocumento`    , `persona`.`persona_sexo`
    , `persona`.`persona_telefono`
    , `persona`.`persona_direccion`
    , `persona`.`persona_fregistro`
    , `persona`.`persona_estatus`
FROM
    `cliente`
    INNER JOIN `persona` 
        ON (`cliente`.`persona_id` = `persona`.`persona_id`)
        WHERE `cliente`.`cliente_estatus` = 'ACTIVO'";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['persona_nombre'].'</td>
            <td class="unit">'.$filas['persona_apepat'].'</td>
            <td class="unit">'.$filas['persona_apemat'].'</td>
             <td class="unit">'.$filas['persona_tipodocumento'].'</td>
            <td class="unit">'.$filas['persona_nrodocumento'].'</td>
            <td class="unit">'.$filas['persona_telefono'].'</td>
            <td class="unit">'.$filas['persona_direccion'].'</td>
            <td class="qty">'.$filas['persona_estatus'].'</td>'
            ;
        }
            
          $html.='</tr>   
         </tbody>
      </table>
    
    </main>
    <footer>
      CLIENTES de la EMPRESA.
    </footer>
  </body>
</html>';





$mpdf = new \Mpdf\Mpdf();

$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html);

// Output a PDF file directly to the browser
$mpdf->Output();