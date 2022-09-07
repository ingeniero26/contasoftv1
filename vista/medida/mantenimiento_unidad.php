<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO UNIDAD DE MEDIDA DE PRODUCTOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_unidad" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre </th>
                            <th>Abreviatura</th>
                            <th>Fecha Registro</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Abreviatura</th>
                            <th>Fecha Registro</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </tfoot>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Unidades</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="">Nombre Unidad</label>
           <input type="text" id="txt_nombre_unidad" class="form-control" placeholder="Nombre medida">
        </div>

        <div class="col-lg-12">
          <label for="">Abreviatura</label>
          <input type="text" id="txt_abreviatura_unidad" class="form-control">
        </div>

      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Unidad()">Grabar</button>
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
            <input type="text" id="txt_idunidad" hidden="">
            <div class="col-lg-12">
               <label for="">Nombre Categoria</label>
              <input type="text" id="txt_nombre_actual_unidad" hidden="" placeholder="Nombre rol">
              <input type="text" id="txt_nombre_nuevo_unidad" class="form-control" placeholder="Nombre rol">
            </div>

            <div class="col lg-12">
               <label for="">Abreviatura</label>
              <input type="text" id="txt_abreviatura_unidad_editar" class="form-control">
            </div>

          </div>
          <div class="col-lg-6">
             <label for="estatus">Estatus:</label>
                  <select class="form-control select2_demo_1 " name="state" style="width: 100%;" id="cmb_estatus">
                  <option value="ACTIVO">ACTIVO</option>
                  <option value="INACTIVO">INACTIVO</option>
                </select> <br> <br>
          </div>
        </div>
       
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-primary" onclick="Modificar_Unidad()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>





<script type="text/javascript" src="../js/unidad_medida.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
  listar_unidad_medida();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_unidad').trigger('focus')
  })
});

 

</script>