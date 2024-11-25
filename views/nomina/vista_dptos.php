<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO DEPTARTAMENTOS DE LA EMPRESA</div>
                <div class="ibox-tools">
                   <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_deptos" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Descripcion </th>
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
                            <th>Descripcion</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Departamentos de la empresa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="">Descripción</label>
           <input type="text" id="txt_desc" class="form-control" placeholder="Descripción">
        </div>

       

      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Depto()">Grabar</button>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Edición de Departamentos de la empresa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="text" name="" id="txt_iddepto" hidden="">
        <div class="col-lg-12">
            <label for="">Descripción</label>
           <input type="text" id="txt_desc_actual_editar" hidden="" placeholder="Descripción">
           <input type="text" id="txt_nuevo_editar" class="form-control" placeholder="Descripción">
        </div>

       

      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-warning" onclick="Modificar_Depto()">Editar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>





<script type="text/javascript" src="../js/deptos.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
  listar_deptos();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_unidad').trigger('focus')
  })
});

 

</script>