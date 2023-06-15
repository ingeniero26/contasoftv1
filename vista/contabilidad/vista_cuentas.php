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
          <input type="text" id="txt_nit_cuenta" class="form-control" placeholder="Concepto">
        </div>
        <div class="col-6">
          <label for="">Nombre</label>
          <input type="text" id="txt_nombre_cuenta" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-6">
        <label for="">Tipo</label>
          <input type="text" id="txt_tipo" class="form-control" placeholder="Tipo">
        </div>
        <div class="col-6">
        <label for=""><b>Usa Bancos</b> </label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_banco">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>

        </div>
        <div class="col-lg-6">
          <label for="">Usa Base</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_base">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
          <label for="">Usa Centro</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_centro">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
        <label for="">Usa Nit</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_nit">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
        <label for="">Usa Anticipo</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_anticipo">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
          <label for="">Categoria</label>
          <input type="text" id="txt_categoria" class="form-control" placeholder="Categoria">
        </div>
        <div class="col-lg-6">
          <label for="">Clase</label>
          <input type="text" id="txt_clase" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Nivel</label>
          <input type="text" id="txt_nivel" class="form-control" placeholder="Nombre">
        </div>
        <!-- <div class="col-lg-6">
        <label for="">Usa Deposito</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_deposito">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div> -->
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
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
          <input type="text" id="txt_idcuenta" hidden>
          <label for="">Código Cuenta</label>
          <input type="text" id="txt_codigo_actual_editar" class="form-control" placeholder="Codigo" hidden>
          <input type="text" id="txt_codigo_nuevo_editar" class="form-control" placeholder="Codigo">
        </div>
        <div class="col-6">
          <label for="">Concepto NIT</label>
          <input type="text" id="txt_nit_cuenta_editar" class="form-control" placeholder="Concepto">
        </div>
        <div class="col-6">
          <label for="">Nombre</label>
          <input type="text" id="txt_nombre_cuenta_editar" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-6">
        <label for="">Tipo</label>
          <input type="text" id="txt_tipo_editar" class="form-control" placeholder="Tipo">
        </div>
        <div class="col-6">
        <label for=""><b>Usa Bancos</b> </label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_banco_editar">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>

        </div>
        <div class="col-lg-6">
          <label for="">Usa Base</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_base_editar">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
          <label for="">Usa Centro</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_centro_editar">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
        <label for="">Usa Nit</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_nit_editar">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
        <label for="">Usa Anticipo</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_anticipo_editar">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div>
        <div class="col-lg-6">
          <label for="">Categoria</label>
          <input type="text" id="txt_categoria_editar" class="form-control" placeholder="Categoria">
        </div>
        <div class="col-lg-6">
          <label for="">Clase</label>
          <input type="text" id="txt_clase_editar" class="form-control" placeholder="Nombre">
        </div>
        <div class="col-lg-6">
          <label for="">Nivel</label>
          <input type="text" id="txt_nivel_editar" class="form-control" placeholder="Nombre">
        </div>
        <!-- <div class="col-lg-6">
        <label for="">Usa Deposito</label>
          <select class="js-example-basic-single" name="state"
              style="width: 100%;" id="cmb_usa_deposito">
                  <option value="1">Si</option>
                  <option value="0">No</option>
            </select> <br> <br>
        </div> -->
        </div>

      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-warning" onclick="Modificar_Cuenta()">Modificar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

      </div>
    </div>
  </div>
</div>

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
