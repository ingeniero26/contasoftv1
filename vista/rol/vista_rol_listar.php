<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO ROL</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_rol" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Rol</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="">Nombre Rol</label>
        <input type="text" id="txt_nombre_rol" class="form-control" placeholder="Nombre rol">
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Rol()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>

<!-- Modal registro -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<input type="text" id="txt_idrol" hidden="">
        <div class="col-lg-12">
           <label for=""><b>Nombre Rol</b></label>
           <input type="text" id="txt_nombre_rol_actual" hidden="" placeholder="Nombre rol">
           <input type="text" id="txt_nombre_rol_nuevo" class="form-control" placeholder="Nombre rol"> <br>
        </div>
        

          <div class="col-lg-12">
             <label for="estatus"><b>Estatus:</b></label>
             <select class="form-control select2_demo_1 " name="state" style="width: 100%;" id="cmb_estatus_editar">
             <option value="ACTIVO">ACTIVO</option>
              <option value="INACTIVO">INACTIVO</option>
             </select> <br> <br>
           </div>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Modificar_Rol()">Editar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>












<script type="text/javascript" src="../js/rol.js"></script>
<script>
$(document).ready(function() {
      listar_rol();
});

	$('.js-example-basic-single').select2();
	$('#modal_registro').on('shown.bs.modal', function () {
	  $('#txt_nombre_rol').trigger('focus')
	})
</script>