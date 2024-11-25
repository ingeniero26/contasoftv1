<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">

            <div class="ibox-body">
                <div class="row">
                <div class="col-3">
                        <label for=""><b>Fecha Salida </b></label>
                        <input type="date" class="form-control" id="txt_fecha">
                    </div>
                    <div class="col-6">
                        <label for=""><b>Bodega</b> </label>
                        <select class="js-example-basic-single" name="state"
                         style="width: 100%;" id="cmb_bodega_ingreso">

                        </select> <br> <br>
                    </div>
                    <div class="col-3">
                        <label for=""><b>Tipo Salida</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="tipo_salida">
                            <option value="devolucion">Devolución</option>
                            <option value="transferencia">Auto Consumo</option>
                            <option value="donacion">Donación</option>
                            <option value="Otro">Otro</option>
                        </select> <br> <br>
                    </div>
                    <div class="col-12">
                        <label for=""><b>Motivo</b></label>
                        <input type="text" class="form-control" id="txt_motivo">
                    </div>
                   

                    <!-- <div class="col-6">
                        <label for=""><b>Tipo Salida</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_concepto">

                        </select> <br> <br>
                    </div> -->


                    <div class="col-lg-12">
                        <h1 class="text-center">DATOS DEL PRODUCTO</h1>
                    </div>

                    <div class="col-4">
                        <label for=""><b>Producto</b> </label>
                        <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_producto">

                        </select> <br> <br>
                    </div>
                    <div class="col-2">
                        <label for=""><b>Precio</b></label>
                        <input type="number" onkeypress="return filterfloat(event,this);" min="1" class="form-control" id="txt_precio">
                    </div>
                    <div class="col-2">
                        <label for=""><b>Cantidad</b></label>
                        <input type="number" class="form-control" onkeypress="return event.charCode >= 48" min="1" id="txt_cantidad">
                    </div><br>



                    <div class="col-2">
                        <label>&nbsp;</label><br>
                        <button class="btn btn-success" onclick="Agregar_Producto_Detalle_Salida()"><i class="fa fa-plus"></i>Agregar</button>
                    </div>
                    <div class="col-12" style="text-align: center;">
                        <button class="btn btn-primary btn-lg " onclick="Registrar_Salida()">Registrar Salida</button>
                    </div>
                    <div class="col-12" style="text-align:left;">
                        <h4 for=""><b>Detalle de ingreso</b></h4>
                    </div>
                    <div class="col-12 table-responsive">
                        <table id="detalle_ingreso" class="table  table-responsive">
                            <thead>
                                <th>ID</th>
                                <th>PRODUCTO</th>
                                <th>CANTIDAD</th>
                                <th>PRECIO</th>
                                <th>SUB TOTAL</th>
                               
                                <th>ACCI&Oacute;N</th>
                            </thead>
                            <tbody id="tb_detalle_ingreso">
                            </tbody>

                        </table>

                    </div>


<!-- 

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
                    </div> -->
                </div>



            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../js/salidas.js?rev=<?php echo time(); ?>"></script>
<script>
    $(document).ready(function() {


        $('.js-example-basic-single').select2();

        listar_combo_concepto();
        listar_combo_producto();
        listar_combo_bodega();

    });
    $('#cmb_tipo_comprobante').on('select2:select', function(e) {
        let tipo = document.getElementById('cmb_tipo_comprobante').value;
        if (tipo == "FACTURA") {
            document.getElementById('txt_impuesto').disabled = false;
        } else {
            document.getElementById('txt_impuesto').disabled = true;
        }
    });
</script>