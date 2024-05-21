<?php

require_once __DIR__ . '/vendor/autoload.php';
require_once '../conexion_global/r_conexion.php';

$mpdf = new \Mpdf\Mpdf();
$sql = "SELECT
     `compra`.`compra_id`
    , `compra`.`compra_tipo_comprobante`
    , `compra`.`compra_serie_comprobante`
    , `compra`.`compra_num_comprobante`
    , `compra`.`compra_fecha`
    , `compra`.`compra_total`
    , `compra`.`compra_impuesto`
    , `compra`.`compra_porcentaje`
    , `compra`.`compra_total_decto`

    ,`compra`.`compra_tipo_pago`
    , `compra`.`fecha_vencimiento`
    , `proveedor`.`proveedor_razon_social`
    , `proveedor`.`proveedor_num_contacto`
    , `persona`.`persona_nrodocumento`,
     empresa.Nit, empresa.Representante,
	  empresa.Direccion,empresa.Telefono,
	  empresa.Correo, empresa.Logo

    FROM
    `compra`
     INNER JOIN empresa ON empresa.ID = compra.idempresa
    INNER JOIN `proveedor`  ON (`compra`.`proveedor_id` = `proveedor`.`proveedor_id`)
    INNER JOIN `persona`     ON (`proveedor`.`persona_id` = `persona`.`persona_id`)
    WHERE compra.`compra_id`='" . $_GET['codigo'] . "'";
$resultado = $conexion->query($sql);
while ($row1 = $resultado->fetch_assoc()) {

    $html = '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Reporte Compras</title>
    <link rel="stylesheet" href="style.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
     <table style="border-collapse;" border="1">
     	<thead>
     	<tr>
     	<th width="20%" style="border-top:0px; border-left:0px; border-bottom:0px border-right:0px;"><img src=' . $row1['Logo'] . '></th>
     	<th width="50%" style="border-top:0px; border-left:0px; border-bottom:0px border-right:0px; text-align:left;">
      <b>' . $row1['Representante'] . '</b><br>
      <b>Dirección:' . $row1['Direccion'] . '</b><br>
      <b>cel:' . $row1['Telefono'] . '</b><br>
      <b>Correo:' . $row1['Correo'] . '</b><br>
      </th>
     	<th width="30%" style="text-align:center;">
      <span>NIT: ' . $row1['Nit'] . '</span>
      <h1>' . $row1['compra_tipo_comprobante'] . ' DE COMPRA </h1><br>
       <h2>' . $row1['compra_tipo_pago'] . '</h2><br>
       <h3>' . $row1['compra_serie_comprobante'] . '-' . $row1['compra_num_comprobante'] . ' </h3><br>
      </th>
     	</tr>
     	</thead>
     </table>

      <div id="project">
        <div><span style="color:black; font-size:16px;"><b>Proveedor</b>:' . $row1['proveedor_razon_social'] . ' </span> </div>
         <div><span style="color:black; font-size:16px;"><b>Documento</b>:' . $row1['persona_nrodocumento'] . ' </span> </div>
        <div><span style="color:black; font-size:16px;"><b>Número  Contacto</b>:' . $row1['proveedor_num_contacto'] . ' </span></div>
        <div><span style="color:black; font-size:16px;"><b>Fecha Compra</b>:' . $row1['compra_fecha'] . '</span></div>
         <div><span style="color:black; font-size:16px;"><b>Fecha Vencimiento</b>:' . $row1['fecha_vencimiento'] . '</span></div>

      </div>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">ITEM</th>
            <th class="desc">DESCRIPCIÓN</th>
            <th>PRECIO</th>
            <th>CANTIDAD</th>
            <th>SUBTOTAL</th>
            <th>DCTO</th>


          </tr>
        </thead>
        <tbody>';
    $sql2 = "SELECT    `producto`.`producto_nombre`
    , `detalle_compra`.`dc_cantidad`    , `detalle_compra`.`dc_precio`, `detalle_compra`.`dc_descto`,
     `detalle_compra`.`dc_cantidad` *  `detalle_compra`.`dc_precio` AS subtotal
     FROM
    `detalle_compra`
    INNER JOIN `producto`      ON (`detalle_compra`.`id_producto` = `producto`.`producto_id`)
         where   `detalle_compra`.`id_compra`='" . $row1['compra_id'] . "'";
    $contador = 0;
    $resultado2 = $conexion->query($sql2);
    while ($row2 = $resultado2->fetch_assoc()) {
        $contador++;
        $html .= '
          <tr>
            <td class="service">' . $contador . '</td>
            <td class="desc">' . $row2['producto_nombre'] . '</td>
            <td class="unit">' . $row2['dc_precio'] . '</td>
            <td class="qty">' . $row2['dc_cantidad'] . '</td>
            <td class="total">' . round($row2['subtotal'], 2) . '</td>
             <td class="qty">' . $row2['dc_descto'] . '</td>
            </tr>';
    }
    if ($row1['compra_tipo_comprobante'] == "FACTURA") {
        $html .= '



           <tr>
            <td colspan="4" style="background:#fff;">IVA ' . ($row1['compra_porcentaje'] * 100) . ' %</td>
             <td class="grand total" style="background:#fff;">' . $row1['compra_impuesto'] . '</td>
          </tr>
          <tr>
            <td colspan="2" class="grand total"> <b>TOTAL</></td>
            <td colspan="4" class="grand total">' . $row1['compra_total'] . '</td>
          </tr>
          ';
    } else {
        $html .= ' <tr>
            <td colspan="4" class="grand total"> <b>TOTAL COMPRA</b></td>
            <td  colspan="4"  class="grand total" style="background:#000;>' . $row1['compra_total'] . '</td>
          </tr>';
    }

    $html .= '

        </tbody>
      </table>

    </main>
    <footer>
    GRACIAS POR SU COMPRA.
    </footer>
  </body>
</html>';
}
$css = file_get_contents('css/style.css');
$mpdf->WriteHTML($css, 1);
$mpdf->WriteHTML($html);
$mpdf->Output();
