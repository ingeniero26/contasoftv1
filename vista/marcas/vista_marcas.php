<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO MARCAS DE PRODUCTOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_marca" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Marca</th>
                            <th>Fecha Registro</th>
                            <th>Estatus</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Marcas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="">Descripción </label>
        <input type="text" id="txt_marca" class="form-control" placeholder="Nombre rol">
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Marca()">Grabar</button>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Categorias</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-6">
            <input type="text" id="txt_idmarca" hidden="">
              <label for="">Nombre Marca</label>
              <input type="text" id="txt_nombre_actual_marca" hidden="" placeholder="Nombre rol">
              <input type="text" id="txt_nombre_nuevo_marca" class="form-control" placeholder="Marca">
          </div>
          <div class="col-lg-6">
             <label for="estatus">Estatus:</label>
                  <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_estatus">
                  <option value="ACTIVO">ACTIVO</option>
                  <option value="INACTIVO">INACTIVO</option>
                </select> <br> <br>
          </div>
        </div>
       
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-primary" onclick="Modificar_Marca()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>





<script type="text/javascript" src="../js/marcas.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
 listar_marcas();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});

 

</script>