<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">VENTA DE PRODUCTOS </div>
                <div class="ibox-tools">
                  <h1>DATOS DEL CLIENTE</h1>
                </div>
            </div>
            <div class="ibox-body">
            	<div class="row">
            	   <div class="col-6">
                       <label for=""><b>Cliente</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_cliente">

                         </select> <br> <br>
                    </div>

                    <div class="col-3">
                       <label for=""><b>Bodega</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_bodega_ingreso">

                         </select> <br> <br>
                    </div>

                     <div class="col-3">
                       <label for=""><b>Caja</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_caja_venta">

                         </select> <br> <br>
                    </div>

                    <div class="col-3">
                        <label for=""><b>% IVA (19% - 0.19)</b></label>
                        <input type="text" class="form-control" id="txt_impuesto" disabled>
                    </div>
                      <div class="col-3">
                       <label for=""><b>Tipo Comprobante</b> </label>
                        <select class="js-example-basic-single" name="state"
                        style="width: 100%;" id="cmb_tipo_comprobante">
                        <option value="COTIZACION">COTIZACION</option>
                        <option value="FACTURA">FACTURA</option>
                        <option value="BOLETA">BOLETA</option>
                        <option value="TICKET">TICKET</option>

                         </select> <br> <br>
                    </div>
                       <div class="col-3">
                       <label for=""><b>Forma Pago</b> </label>
                        <select class="js-example-basic-single" name="state"
                        style="width: 100%;" id="cmb_tipo_pago">
                        <option value="CONTADO">CONTADO</option>
                        <option value="CREDITO">CREDITO</option>
                        <option value="CREDICONTADO">CREDICONTADO</option>
                        <option value="TARJETA">TARJETA</option>
                        <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                        <option value="CHEQUE">CHEQUE</option>
                         </select> <br> <br>
                    </div>
                     <div class="col-3">
                       <label for=""><b>Estado</b> </label>
                        <select class="js-example-basic-single" name="state"
                        style="width: 100%;" id="cmb_estado">
                       <option value="REGISTRADA">REGISTRADA</option>

                        <option value="POR_COBRAR">POR_COBRAR</option>


                         </select> <br> <br>
                    </div>

                     <div class="col-3">
                        <label for=""><b>Serie Factura</b></label>
                        <input type="text" class="form-control" id="txt_serie" value="FV" readonly="">
                    </div>

                     <div class="col-3">
                        <label for=""><b>Fecha Vencimiento Factura </b></label>
                        <input type="date" class="form-control" id="txt_fecha_vc">
                    </div>
                     <div class="col-lg-12">
                        <h1 class="text-center">DATOS DEL PRODUCTO</h1>
                    </div>
                       <div class="col-6">
                       <label for=""><b>Producto</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_producto">

                         </select> <br> <br>
                    </div>
                     <div class="col-2">
                        <label for=""><b>Stock Actual</b></label>
                        <input type="number" onkeypress="return filterfloat(event,this);" min="1" class="form-control" id="txt_stock" disabled="">
                    </div>
                     <div class="col-2">
                        <label for=""><b>Precio Venta</b></label>
                        <input type="number" onkeypress="return filterfloat(event,this);" min="1" class="form-control"
                        id="txt_precio" >
                    </div>
                    <!-- <div class="col-2">
                        <label for=""><b>Precio 2</b></label>
                        <input type="number" onkeypress="return filterfloat(event,this);" min="1" class="form-control"
                        id="txt_precio2" >
                    </div> -->
                     <div class="col-3">
                        <label for=""><b>Cantidad</b></label>
                        <input type="number"  class="form-control"
                        onkeypress="return event.charCode >= 48" min="1" id="txt_cantidad">
                    </div><br>
                     <div class="col-3">
                        <label for=""><b>% Descuento</b></label>
                        <input type="text"  class="form-control"  id="txt_descto">
                    </div><br>

                    <div class="col-2">
                        <label>&nbsp;</label><br>
                        <button class="btn btn-success" onclick="Agregar_Producto_Detalle_Venta()"><i class="fa fa-plus"></i>Agregar</button>
                    </div>


                        <div class="col-2">
                            <label>&nbsp;</label><br>
                            <label><b>Foto Producto</b></label>
                             <img  id="txt_foto_producto" width="80px" />

                        </div>

                    <div class="col-12" style="text-align: center;">
                        <button class="btn btn-primary btn-lg " onclick="Registrar_Venta()">Registrar Venta</button>
                    </div>
                    <div class="col-12" style="text-align:left;">
                        <h4 for=""><b>Detalle de venta</b></h4>
                    </div>
                    <div class="col-12 table-responsive">
                        <table id="detalle_venta" class="table  table-responsive">
                            <thead>
                                <th>ID</th>
                                <th>PRODUCTO</th>
                                <th>CANTIDAD</th>
                                <th>PRECIO</th>
                                <th>SUB TOTAL</th>
                                <th>DESCUENTO</th>
                                <th>IVA</th>
                                <th>ACCI&Oacute;N</th>
                            </thead>
                            <tbody id="tb_detalle_venta">
                            </tbody>

                        </table>

                    </div>

                        <div class="col-12" style="text-align: right;">
                            <label for="" id="lbl_subtotal"></label>
                        </div>
                         <div class="col-12" style="text-align: right;">
                            <label for="" id="lbl_decto"></label>
                        </div>
                        <div class="col-12" style="text-align: right;">
                            <label for="" id="lbl_impuesto"></label>
                        </div>
                         <div class="col-12" style="text-align: right;">
                            <label for="" id="lbl_totalneto"></label>
                        </div>
            	</div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../js/ventas.js?rev=<?php echo time(); ?>"></script>
<script>
$(document).ready(function() {


  $('.js-example-basic-single').select2();

 listar_combo_cliente();
 listar_combo_producto();
 listar_combo_bodega();
 listar_combo_caja();


});

$('#cmb_producto').on('select2:select', function (e) {
  let id = document.getElementById('cmb_producto').value;
  //alert(arreglo_stock[id] + " -" +arreglo_precio[id]);
   document.getElementById('txt_stock').value=arreglo_stock[id];
  document.getElementById('txt_precio').value=arreglo_precio[id];
  document.getElementById('txt_foto_producto').src='../'+arreglo_img[id];

});

$('#cmb_tipo_comprobante').on('select2:select', function (e) {
  let tipo = document.getElementById('cmb_tipo_comprobante').value;
  if(tipo=="FACTURA") {
    document.getElementById('txt_impuesto').disabled=false;
  } else {
    document.getElementById('txt_impuesto').disabled=true;
  }
});




</script>