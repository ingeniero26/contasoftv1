<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO DEPARTAMENTOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_deptos" class="table table-striped table-sm table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Registro</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de ARL</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row"> 
            <div class="col-lg-6">
                <label for=""><b>Departamento</b></label>
                <input type="text" id="txt_nombre" 
                class="form-control" placeholder="NOMBRE">
            </div>
    
      </div> 
      
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Departamento()">Grabar</button>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Editar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row"> 
       
       <input type="text" id="txt_iddepartamento" hidden>
       
            <div class="col-lg-6">
                <label for=""><b>Departamento</b></label>
                <input type="text" id="txt_nombre_actual" 
                class="form-control" placeholder="NOMBRE" hidden>
                <input type="text" id="txt_nombre_nuevo" 
                class="form-control" placeholder="NOMBRE">
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
         <button type="button" class="btn btn-primary" onclick="Modificar_Departamento()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>




<script type="text/javascript" src="../js/departamentos.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
  listar_departamentos();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});

 

</script>