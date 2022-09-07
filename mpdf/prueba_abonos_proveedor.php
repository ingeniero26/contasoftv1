<?php
// Require composer autoload
require_once __DIR__ . './vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$html='<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>REPORTE ABONOS</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="img/logo1.jpeg">
      </div>
      <h1>REPORTE ABONOS PROVEEDOR</h1>
      
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">#</th>
            <th class="desc">NOMBRE</th>
            <th>TIPO</th>
            <th>FACTURA</th>
            <th>FECHA PAGO</th>
            <th>CUOTA</th>
            <th>CREDITO</th>
            <th>TOTAL ABONOS</th>
            <th>SALDO</th>
            
          </tr>
        </thead>
        <tbody>';

     /*   $conexion = new mysqli('localhost','root','','sistema_pos');
	if(mysqli_connect_errno()) {
		echo "conexion fallida",mysqli_connect_errno();
		exit();
	}*/
	$consulta = "SELECT
    `cuentas_x_proveedor`.`idCuenta`
    , `proveedor`.`proveedor_razon_social` AS proveedor
    ,`compra`.`compra_tipo_comprobante`
    ,   compra.`compra_num_comprobante` AS nofactura
    ,COUNT( `cuentas_x_proveedor`.`noCuota`) AS cuotas
    , `cuentas_x_proveedor`.`fecha_pago`
     , `compra`.`compra_total` AS credito
    ,SUM( `cuentas_x_proveedor`.`valorAbono`) AS totalAbonos
    , `cuentas_x_proveedor`.`idCompra`
   
    ,    `compra`.`compra_total` - SUM(`cuentas_x_proveedor`.`valorAbono`) AS saldo
FROM
  `cuentas_x_proveedor`
    INNER JOIN `compra` 
        ON (`cuentas_x_proveedor`.`idCompra` = `compra`.`compra_id`)
    INNER JOIN `proveedor` 
        ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
        GROUP BY idCompra
        ";
        $resultado = $conexion->query($consulta);
        $contador = 0;
        while($filas = $resultado ->fetch_assoc()) {
        	$contador++;
        
          $html.='<tr>
            <td class="service">'.$contador.'</td>
            <td class="desc">'.$filas['proveedor'].'</td>
            <td class="unit">'.$filas['compra_tipo_comprobante'].'</td>
            <td class="unit">'.$filas['nofactura'].'</td>
             <td class="unit">'.$filas['fecha_pago'].'</td>
            <td class="unit">'.$filas['cuotas'].'</td>
            <td class="unit">'.$filas['credito'].'</td>
            <td class="unit">'.$filas['totalAbonos'].'</td>
            <td class="qty">'.$filas['saldo'].'</td>'
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