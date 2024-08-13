<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO VENTA DE PRODUCTOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="cargar_contenido('contenido_principal','ventas/vista_ventas.php')"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <div class="row">
                    <div class="col-3">
                    <label for=""><b>Fecha Inicio</b></label>
                        <input type="date" id="txt_finicio" class="form-control">
                        </div>
                    <div class="col-3">
                        <label for=""><b>Fecha Fin</b></label>
                        <input type="date" id="txt_ffin" class="form-control">
                    </div><br>
                    <div class="col-3">
                        <label for=""><b>Caja</b></label>
                         <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_caja">

                         </select> <br> <br>
                    </div><br>
                    <div class="col-2">
                        <label for="">&nbsp;</label><br>
                        <button class="btn btn-success" style="width:100%" onclick="listar_ventas()"><i class="fa fa-search"></i>Buscar</button>
                    </div>
                </div> <br>


                <table id="tabla_ventas" class="display table-bordered"
                style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Usuario</th>
                            <th>Caja</th>
                            <th>Cliente</th>
                            <th>Bodega</th>
                            <th>Tipo</th>
                            <th>Serie</th>

                            <th>Pago</th>
                            <th>Fecha</th>
                            <th>Dcto</th>
                            <th>IVA</th>
                            <th>Total</th>
                            <th>Fecha Vencimiento</th>
                            <th>Dias</th>
                            <th>Estado</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>

                </table>


            </div>
        </div>
    </div>
</div>



<script type="text/javascript" src="../js/ventas.js?rev=<?php echo time(); ?>"></script>
<script>
$(document).ready(function() {

  $('.js-example-basic-single').select2();


  var f = new Date();
  var anio = f.getFullYear();
  var mes = f.getMonth() +1;
  var d = f.getDate();
  if(d < 10) {
    d ='0' +d;
  }

if(mes < 10 ) {
    mes = '0' +mes;
}
 document.getElementById('txt_finicio').value=anio +"-"+mes +"-"+d;
 document.getElementById('txt_ffin').value=anio +"-"+mes +"-"+d;
   listar_ventas();
   listar_combo_caja();

 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});



</script>