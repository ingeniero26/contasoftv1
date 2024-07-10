<?php 



require_once __DIR__ . '/vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();
$sql ="SELECT
    `venta`.`venta_id`    , `venta`.`venta_tipocomprobante`
    , `venta`.`venta_serie`    , `venta`.`venta_numcomprobante`
    , `venta`.`tipo_pago`    , `venta`.`venta_fecha`
    , `venta`.`venta_impuesto`    , `venta`.`venta_total`
    , `venta`.`venta_estatus`    , `venta`.`venta_porcentaje`
    , `venta`.`venta_total_dcto`    , `venta`.`cliente_id`, venta.`fecha_vencimiento`
    
    , CONCAT_WS(' ', `persona`.`persona_nombre`   , `persona`.`persona_apepat`   , `persona`.`persona_apemat` ) AS cliente
    , `persona`.`persona_nrodocumento`,`persona`.`persona_direccion`,`persona`.`persona_telefono`
    , usuario.`usuario_nombre`
    , empresa.Nit, empresa.nombre, empresa.Representante, empresa.Direccion,empresa.Telefono,empresa.Correo, empresa.Logo
    FROM
    `venta`
    INNER JOIN `cliente` 
        ON (`venta`.`cliente_id` = `cliente`.`idcliente`)
    INNER JOIN `persona` 
        ON (`cliente`.`persona_id` = `persona`.`persona_id`)
        INNER JOIN usuario ON venta.`usuario_id` = usuario.`usuario_id`
        INNER JOIN empresa ON empresa.ID = venta.idempresa
    WHERE venta.`venta_id`='".$_GET['codigo']."'";
    $resultado = $conexion->query($sql);
     while($row1 = $resultado->fetch_assoc()){


$html ='<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Reporte Ventas</title>
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
      <h1 style="color: black; font-size: 5em">'.$row1['venta_tipocomprobante'].' DE VENTA </h1><br>
      <h2 style="color: black; font-size: 5em">'.$row1['tipo_pago'].'</h2><br>
       <h3 style="color: black; font-size: 5em">'.$row1['venta_serie'].'-'.$row1['venta_id'].' </h3><br>
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
        <div><span style="color:black; font-size: 2em;"><b>F. Venta</b>:'.$row1['venta_fecha'].'</span></div>
          <div><span style="color:black; font-size: 2em;"><b>F. Vence</b>:'.$row1['fecha_vencimiento'].'</span></div>
        
      </div>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service" style="color: black; font-size: 5.5em;">ITEM</th>
            <th class="desc" style="color: black; font-size: 5em;">Descripciòn</th>
            <th style="color: black; font-size: 5em;">Precio</th>
            <th style="color: black; font-size: 5em;">Cantidad</th>
            <th style="color: black; font-size: 5em;">Subtotal</th>
            <th style="color: black; font-size: 5em;">Dcto</th>
          </tr>
        </thead>
        <tbody>';
        $sql2 = "        SELECT    `producto`.`producto_nombre`
    , `detalle_venta`.`dv_cantidad`    , `detalle_venta`.`dv_precio`, `detalle_venta`.`dv_descuento`,
     `detalle_venta`.`dv_cantidad` *  `detalle_venta`.`dv_precio` AS subtotal
     FROM
    `detalle_venta`
    INNER JOIN `producto`      ON (`detalle_venta`.`producto_id` = `producto`.`producto_id`)
         where   `detalle_venta`.`venta_id`='".$row1['venta_id']."'";
         $contador =0;
          $resultado2 = $conexion->query($sql2);
     while($row2 = $resultado2->fetch_assoc()){
      $contador++;
        $html.='
          <tr>
            <td class="service" style="color: black; font-size: 5em;">'.$contador.'</td>
            <td class="desc" style="color: black; font-size: 5em;">'.$row2['producto_nombre'].'</td>
            <td class="unit" style="color: black; font-size: 5em;">'.$row2['dv_precio'].'</td>
            <td class="qty" style="color: black; font-size: 5em;">'.$row2['dv_cantidad'].'</td>
            <td class="total" style="color: black; font-size: 5em;">'.round($row2['subtotal'],2).'</td>
            <td class="qty" style="color: black; font-size: 5em;">'.$row2['dv_descuento'].'</td>
            </tr>';
          }
          if($row1['venta_tipocomprobante']=="FACTURA") {
             $html.='
            
           
           

           <tr>
            <td colspan="4" style="background:#fff; font-size: 5em;">IVA '.($row1['venta_porcentaje']*100).' %</td>
             <td class="grand total" style="background:#fff; font-size: 4em;">'.$row1['venta_impuesto'].'</td>
          </tr>
          <tr>
            <td colspan="2" class="grand total" style="color: black; font-size: 5em;"> <b>TOTAL</></td>
            <td colspan="4" class="grand total" style="color: black; font-size: 5em;">'.$row1['venta_total'].'</td>
          </tr>
          ';
          }else {
            $html.=' <tr>
            <td colspan="4" class="grand total" style="color: black; font-size: 5em;"> <b>TOTAL</b></td>
            <td colspan="1" class="" style="color: black; font-size: 5em;">'.round($row1['venta_total'],2).'</td>
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