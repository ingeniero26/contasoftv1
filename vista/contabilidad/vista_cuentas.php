<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO CUENTAS CONTABLES</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_categoria" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Categorias</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="">Nombre Categoria</label>
        <input type="text" id="txt_nombre_categoria" class="form-control" placeholder="Nombre categoria">
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Categoria()">Grabar</button>
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