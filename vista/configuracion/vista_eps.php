<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO EPS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_eps" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nit</th>
                            <th>Nombre</th>
                            <th>Ciudad</th>
                            <th>Dirección</th>
                            <th>Telefono</th>
                            <th>Email</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Nit</th>
                            <th>Nombre</th>
                            <th>Ciudad</th>
                            <th>Dirección</th>
                            <th>Telefono</th>
                            <th>Email</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de EPS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row"> 
       <div class="col-lg-6">
        <label for=""><b>NIT</b></label>
           <input type="text" id="txt_nit" 
          class="form-control" placeholder="NIT EPS">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Nombre</b></label>
           <input type="text" id="txt_nombre_eps" 
          class="form-control" placeholder="NOMBRE EPS">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Ciudad</b></label>
           <input type="text" id="txt_ciudad_eps" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Dirección</b></label>
           <input type="text" id="txt_direccion_eps" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Teléfono</b></label>
           <input type="text" id="txt_tel_eps" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Correo</b></label>
           <input type="text" id="txt_correo_eps" 
          class="form-control" placeholder="">
       </div>
       
      </div> 
      
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Eps()">Grabar</button>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de EPS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row"> 
       <div class="col-lg-6">
        <input type="text" name="" id="txt_ideps" hidden="">
        <label for=""><b>NIT</b></label>
           <input type="text" id="txt_nit_actual" 
         hidden="" placeholder="NIT EPS">
           <input type="text" id="txt_nit_nuevo" 
          class="form-control" placeholder="NIT EPS">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Nombre</b></label>
           <input type="text" id="txt_nombre_eps_editar" 
          class="form-control" placeholder="NOMBRE EPS">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Ciudad</b></label>
           <input type="text" id="txt_ciudad_eps_editar" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Dirección</b></label>
           <input type="text" id="txt_direccion_eps_editar" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Teléfono</b></label>
           <input type="text" id="txt_tel_eps_editar" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Correo</b></label>
           <input type="text" id="txt_correo_eps_editar" 
          class="form-control" placeholder="">
       </div>
       
      </div> 
      
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-warning" onclick="Modificar_Eps()">Editar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>







<script type="text/javascript" src="../js/eps.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
listar_eps();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});

 

</script>