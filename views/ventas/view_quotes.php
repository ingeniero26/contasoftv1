<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">COTIZACIÓN </div>
                <div class="ibox-tools">
                    <h5>DATOS DEL TERCERO</h5>
                </div>
            </div>
            <div class="ibox-body">
                <div class="row">
                    <div class="col-4">
                        <label for=""><b>Tercero</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_cliente">

                        </select> <br> <br>
                    </div>
                    <div class="col-2">
                        <button  class="btn btn-primary mt-4"
                        onclick="AbrirModalRegistro()">Nuevo</button>
                    </div>

                    <div class="col-3">
                        <label for=""><b>Bodega</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_bodega_ingreso">

                        </select> <br> <br>
                    </div>
                    <div class="col-3">
                        <label for=""><b>Comprobante</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_comprobante">

                        </select> <br> <br>
                    </div>


                    <div class="col-3">
                        <label for=""><b>No Cotización</b></label>
                        <input type="text" class="form-control" id="txt_quote_no">
                    </div>
                    <div class="col-3">
                        <label for=""><b>Fecha Vencimiento </b></label>
                        <input type="date" class="form-control" id="txt_fecha_vc">
                    </div>
                    <div class="col-3">
                        <label for=""><b>% IVA (19% - 0.19)</b></label>
                        <input type="text" class="form-control" id="txt_impuesto">
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
                        <input type="number" onkeypress="return filterfloat(event,this);" min="1" class="form-control" id="txt_precio">
                    </div>
                    <!-- <div class="col-2">
                        <label for=""><b>Precio 2</b></label>
                        <input type="number" onkeypress="return filterfloat(event,this);" min="1" class="form-control"
                        id="txt_precio2" >
                    </div> -->
                    <div class="col-3">
                        <label for=""><b>Cantidad</b></label>
                        <input type="number" class="form-control" onkeypress="return event.charCode >= 48" min="1" id="txt_cantidad">
                    </div><br>
                    <div class="col-3">
                        <label for=""><b>% Descuento</b></label>
                        <input type="text" class="form-control" id="txt_descto">
                    </div><br>

                    <div class="col-2">
                        <label>&nbsp;</label><br>
                        <button class="btn btn-success" onclick="Agregar_Producto_Detalle_Venta()"><i class="fa fa-plus"></i>Agregar</button>
                    </div>


                    <div class="col-2">
                        <label>&nbsp;</label><br>
                        <label><b>Foto Producto</b></label>
                        <img id="txt_foto_producto" width="80px" />

                    </div>

                    <div class="col-12" style="text-align: center;">
                        <button class="btn btn-primary btn-lg " onclick="Registrar_Venta()">Registrar Cotización</button>
                    </div>
                    <div class="col-12" style="text-align:left;">
                        <h4 for=""><b>Detalle de Cotizacion</b></h4>
                    </div>
                    <div class="col-12 table-responsive">
                        <table id="detalle_venta" class="table  table-responsive">
                            <thead>
                                <th>ID</th>
                                <th>ITEM</th>
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

<!--nuevo cliiente modal-->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Registro de Clientes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <label for=""><b>Nombre</b> </label>
                        <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre" onkeypress="return sololetras(event)">
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Apellido Paterno</b> </label>
                        <input type="text" id="txt_apepat" class="form-control" placeholder="Apellido" onkeypress="return sololetras(event)">
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Apellido Materno</b> </label>
                        <input type="text" id="txt_apemat" class="form-control" placeholder="" onkeypress="return sololetras(event)"> <br>
                    </div>

                    <div class="col-lg-6">
                        <label for=""><b>Número Documento</b> </label>
                        <input type="number" id="txt_numero" class="form-control" placeholder=" " onkeypress="return soloNumeros(event)">
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Tipo Documento</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipodocumento">
                            <option value="CEDULA">CEDULA</option>
                            <option value="NIT">NIT</option>
                            <option value="PASAPORTE">PASAPORTE</option>
                            <option value="TI">TI</option>
                        </select> <br> <br>
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Tipo Contribuyente</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_contribuyente">
                            <option value="Persona Natural">Natural</option>
                            <option value="Persona Juridica">Jurídica</option>
                        </select>
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Tipo</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_tercero_cliente">

                        </select>
                    </div>

                    <!--	<div class="col-lg-6">
      	   <label for=""><b>Sexo</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_sexo">
             <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>

             </select> <br> <br>
      	</div>-->
                    <div class="col-lg-6">
                        <label for=""><b>Ciudad</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_ciudad_ingreso">
                        </select> <br> <br>
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Teléfono</b> </label>
                        <input type="text" id="txt_telefono" class="form-control" placeholder="teléfono " onkeypress="return soloNumeros(event)">
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Dirección</b> </label>
                        <input type="text" id="txt_direccion" class="form-control" placeholder="dirección ">
                    </div>
                    <div class="col-lg-6">
                        <label for=""><b>Correo</b> </label>
                        <input type="text" id="txt_correo" class="form-control" placeholder="correo ">
                    </div>

                    <div class="col-lg-12"><br>
                        <div class="alert alert-danger alert-bordered" style="display: none;"></div>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="Registrar_Cliente()">Grabar</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../js/cliente.js"></script>
<script type="text/javascript" src="../js/proveedor.js?rev=<?php echo time(); ?>"></script>
<script type="text/javascript" src="../js/quotes.js?rev=<?php echo time(); ?>"></script>

<script>
    $(document).ready(function() {


        $('.js-example-basic-single').select2();

        listar_combo_cliente();
        listar_combo_producto();
        listar_combo_bodega();
        listar_combo_comprobante();

        listar_combo_ciudad();
        listar_combo_tipo_cliente();

    });

    $('#cmb_producto').on('select2:select', function(e) {
        let id = document.getElementById('cmb_producto').value;
        //alert(arreglo_stock[id] + " -" +arreglo_precio[id]);
        document.getElementById('txt_stock').value = arreglo_stock[id];
        document.getElementById('txt_precio').value = arreglo_precio[id];
        document.getElementById('txt_foto_producto').src = '../' + arreglo_img[id];

    });

    // $('#cmb_tipo_comprobante').on('select2:select', function (e) {
    //   let tipo = document.getElementById('cmb_tipo_comprobante').value;
    //   if(tipo=="COTIZACION") {
    //     document.getElementById('txt_impuesto').disabled=false;
    //   } else {
    //     document.getElementById('txt_impuesto').disabled=true;
    //   }
    // });


    $('#cmb_tipo_pago').on('select2:select', function(e) {
        let tipo_pago = document.getElementById('cmb_tipo_pago').value;
        if (tipo_pago == "CREDITO") {
            document.getElementById('cmb_dias').disabled = false;
        } else {
            document.getElementById('cmb_dias').disabled = true;
        }
    });
</script>