<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO CUENTAS CONTABLES</div>

            </div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_cuentas_contables" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codigo</th>
                            <th>Concepto Nit</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Bancos</th>
                            <th>Base</th>
                            <th>Centro</th>
                            <th>Usa Nit</th>
                            <th>Usa Anticipo</th>
                            <th>Categoria</th>
                            <th>Clase</th>
                            <th>Nivel</th>
                            <th>Fecha Registro</th>
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



<!-- Modal registro -->
<div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Cuentas Contables </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-6">
          <label for="">Código Cuenta</label>
          <input type="text" id="txt_codigo" class="form-control" placeholder="Codigo">
        </div>
        <div class="col-6">
          <label for="">Concepto NIT</label>
          <input type="text" id="txt_cnit" class="form-control" placeholder="Concepto">
        </div>
        <div class="col-6">
          <label for="">Nombre</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-6">
        <label for=""><b>Usa Bancos</b> </label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_estado">
                  <option value="1">Si</option>

                    <option value="0">No</option>
            </select> <br> <br>
          <label for="">Tipo</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Bancos</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Usa Base</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Usa Centros</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Usa Nit</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Anticipo</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Clase</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Nivel</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Usa Depòsito</label>
          <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre">
        </div>
        </div>

      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Cuenta()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

      </div>
    </div>
  </div>
</div>

<!--modal editar-->







<script type="text/javascript" src="../js/cuentas_contables.js"></script>
<script>
$(document).ready(function() {

  $('.js-example-basic-single').select2();
  listar_cuentas_contables();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});



</script>
