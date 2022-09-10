<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO DE CIUDADES</div>
                <div class="ibox-tools">
                   <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <div class="row">
                       <div class="col-5">
                        
                         <label for=""><b>Seleccione un Departamento</b></label>
                          <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_departamento">
                            
                             </select> <br> <br>
                    </div>
                     
                      <div class="col-2">
                        <label for="">&nbsp;</label><br>
                        <button class="btn btn-success" style="width:100%" onclick="listar_ciudades()"><i class="fa fa-search"></i>Buscar</button>
                    </div><br>
                </div>
                <table id="tabla_ciudades" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Ciudad</th>
                            <th style="text-align:center;">Departamento </th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Ciudades</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
              <div class="col-lg-6">
                <label for=""><b>Nombre Ciudad</b> </label>
               <input type="text" id="txt_ciudad" class="form-control" placeholder="">
            </div>
      


      <div class="col-lg-6">
            <label for=""><b>Departamento</b> </label>
                <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_departamento_registro"> 
                       
            </select> <br> <br>
        </div>

      
		</div>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Ciudades()">Grabar</button>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Ciudades</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
              <div class="col-lg-6">
                <input type="text" id="txt_idciudad">
                <label for=""><b>Nombre Ciudad</b> </label>
               <input type="text" id="txt_ciudad_actual" class="form-control" placeholder="">
               <input type="text" id="txt_ciudad_nueva" class="form-control" placeholder="">

            </div>
      
      <div class="col-lg-6">
            <label for=""><b>Departamento</b> </label>
                <select class="js-example-basic-single" name="state"
                 style="width: 100%;" id="cmb_departamento_editar"> 
                       
            </select> <br> <br>
        </div>

      
		</div>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Ciudades()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>
<!-- Modal registro -->







<script type="text/javascript" src="../js/ciudades.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
 listar_ciudades();
 listar_combo_departamentos();

 });
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_codigo').trigger('focus')
  })




</script>