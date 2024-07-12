<?php 



require_once __DIR__ . '/vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();
$sql =" SELECT q.id, 
   q.empresa_id,e.Nit,
   e.nombre,
   e.Representante,
   e.Telefono,
   e.Correo,
   e.Direccion,
   e.Logo,
   q.cliente_id,
   concat_ws(' ',`persona`.`persona_nombre` , `persona`.`persona_apepat`,
    `persona`.`persona_apemat`) as cliente,
    `persona`.persona_nrodocumento,
    `persona`.persona_telefono,
   q.bodega_id,
   b.nombre_bodega,
   q.usuario_id,
   u.usuario_nombre,q.tipo_comprobante_id,
	tc.descripcion,
	q.quote_no,
   q.fecha_quote, q.fecha_vencimiento,
   q.impuesto,q.total,q.estatus,
   q.porcentaje,q.total_dcto
   FROM quotes q
   INNER JOIN usuario u
   ON q.usuario_id = u.usuario_id
   INNER JOIN bodega b ON
   q.bodega_id = b.id
   INNER JOIN empresa e ON
   q.empresa_id = e.ID
   INNER  JOIN cliente c on
   q.cliente_id  = c.idcliente
   INNER JOIN `persona` 
   ON (`c`.`persona_id`
   = `persona`.`persona_id`)
   INNER JOIN tipo_comprobante tc on
   q.tipo_comprobante_id  =  tc.id
    WHERE q.`id`='".$_GET['codigo']."'";
    $resultado = $conexion->query($sql);
     while($row1 = $resultado->fetch_assoc()){


$html ='<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Reporte Cotización</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
     <table style="border-collapse;" border="1">
     	<thead>
     	<tr> 
     	<th width="10%" style="border-top:0px; border-left:0px; border-bottom:0px border-right:0px;"><img src='.$row1['Logo'].'></th>
     	<th width="60%" style="border-top:0px; border-left:0px; border-bottom:0px border-right:0px; text-align:left; font-size: 5.5em; color: black">
   
       <b>'.$row1['nombre'].'</b><br>
      <b >Dirección:'.$row1['Direccion'].'</b><br>
      <b>cel:'.$row1['Telefono'].'</b><br>
      <b>Correo:'.$row1['Correo'].'</b><br>
      </th>
     	<th width="30%" style="text-align:center;">
      <span style="color: black; font-size: 5em">NIT: '.$row1['Nit'].'</span>
      <h1 style="color: black; font-size: 5em">'.$row1['descripcion'].' DE VENTA </h1><br>
    
       <h3 style="color: black; font-size: 5em">'.$row1['quote_no'].' </h3><br>
      </th>
     	</tr>
     	</thead>
     </table>
      
      <div id="project">

       <div><span style="color:black; font-size: 2em;"><b>Atendido Por</b>:'.$row1['usuario_nombre'].' </span> </div>
        <div><span style="color:black; font-size: 2em;"><b>---------------------------</b>: </span> </div>
        <div><span style="color:black; font-size: 2em;"><b>Cliente</b>:'.$row1['cliente'].' </span> </div>
         <div><span style="color:black; font-size: 2em;"><b>CC/NIT</b>:'.$row1['persona_nrodocumento'].' </span> </div>
        <div><span style="color:black; font-size: 2em;"><b>Cel:</b>:'.$row1['persona_telefono'].' </span></div>
        <div><span style="color:black; font-size: 2em;"><b>F. Venta</b>:'.$row1['fecha_quote'].'</span></div>
          <div><span style="color:black; font-size: 2em;"><b>F. Vence</b>:'.$row1['fecha_vencimiento'].'</span></div>
        
      </div>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service" style="color: black; font-size: 5.5em;">#</th>
            <th class="desc" style="color: black; font-size: 5em;">Item</th>
            <th style="color: black; font-size: 5em;">Precio</th>
            <th style="color: black; font-size: 5em;">Cantidad</th>
            <th style="color: black; font-size: 5em;">Subtotal</th>
            <th style="color: black; font-size: 5em;">Dcto</th>
          </tr>
        </thead>
        <tbody>';
        $sql2 = "SELECT `producto`.`producto_nombre`,qd.cantidad,
        qd.precio,qd.descuento,
        qd.cantidad * qd.precio AS subtotal
        FROM quotation_detail qd
        INNER JOIN producto ON 
        qd.producto_id = producto.producto_id
         where   `qd`.`quote_id`='".$row1['id']."'";
         $contador =0;
          $resultado2 = $conexion->query($sql2);
     while($row2 = $resultado2->fetch_assoc()){
      $contador++;
        $html.='
          <tr>
            <td class="service" style="color: black; font-size: 5em;">'.$contador.'</td>
            <td class="desc" style="color: black; font-size: 5em;">'.$row2['producto_nombre'].'</td>
            <td class="unit" style="color: black; font-size: 5em;">'.$row2['precio'].'</td>
            <td class="qty" style="color: black; font-size: 5em;">'.$row2['cantidad'].'</td>
            <td class="total" style="color: black; font-size: 5em;">'.round($row2['subtotal'],2).'</td>
            <td class="qty" style="color: black; font-size: 5em;">'.$row2['descuento'].'</td>
            </tr>';
          }
          if($row1['descripcion']=="Cotizacion") {
             $html.='
            
           <tr>
            <td colspan="4" style="background:#fff; font-size: 5em;">IVA '.($row1['porcentaje']*100).' %</td>
             <td class="grand total" style="background:#fff; font-size: 4em;">'.$row1['impuesto'].'</td>
          </tr>
          <tr>
            <td colspan="2" class="grand total" style="color: black; font-size: 5em;"> <b>TOTAL</></td>
            <td colspan="4" class="grand total" style="color: black; font-size: 5em;">'.$row1['total'].'</td>
          </tr>
          ';
          }else {
            $html.=' <tr>
            <td colspan="4" class="grand total" style="color: black; font-size: 5em;"> <b>TOTAL</b></td>
            <td colspan="1" class="" style="color: black; font-size: 5em;">'.round($row1['total'],2).'</td>
          </tr>';
          }

            $html.='
        
        </tbody>
      </table>
     
    </main>
    <footer style="color: black">
    GRACIAS POR SU COMPRA.
    </footer>
  </body>
</html>';
}
$css = file_get_contents('css/style.css');
$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8', 'format' => [120, 210]]);
$mpdf->WriteHTML($css,1);
$mpdf->WriteHTML($html);
$mpdf->Output();