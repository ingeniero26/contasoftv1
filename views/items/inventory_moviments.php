<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">MOVIMIENTO DE PRODUCTOS</div>
                <!-- <div class="ibox-tools">
          <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
        </div> -->
            </div>
            <div class="ibox-body">
                <div class="row">
                    <div class="col-5">

                        <label for=""><b>Seleccione una Bodega</b></label>
                        <select class="js-example-basic-single"
                            name="state" style="width: 100%;" id="cmb_bodega_inventory">

                        </select> <br> <br>
                    </div>

                    <div class="col-2">
                        <label for="">&nbsp;</label><br>
                        <button class="btn btn-success" style="width:100%" onclick="listar_inventory()"><i class="fa fa-search"></i>Buscar</button>
                    </div><br>
                </div>
                <table id="tb_productos" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <!-- <th>Código Interno</th> -->
                            <th style="text-align:center;">Nombre </th>
                            <th style="text-align:center;">Tipo Movimiento </th>
                            <th>Bodega</th>
                            <th>Cantidad</th>
                            <th>Stock Actual</th>
                            <th>Descripción</th>
                            <th>Fecha</th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="../js/inventory_movements.js"></script>
<script>
    $(document).ready(function() {


        $('.js-example-basic-single').select2();
        listar_inventory();

        listar_combo_bodega();

    });
    $('#modal_registro').on('shown.bs.modal', function() {
        $('#txt_codigo').trigger('focus')
    })
</script>