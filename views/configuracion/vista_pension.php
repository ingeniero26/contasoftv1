<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO PENSION</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_pension" class="display table-bordered" style="width:100%">
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de PENSIÓN</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="row"> 
       <div class="col-lg-6">
        <label for=""><b>NIT</b></label>
           <input type="text" id="txt_nit" 
          class="form-control" placeholder="NIT PENSIÓN">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Nombre</b></label>
           <input type="text" id="txt_nombre_pension" 
          class="form-control" placeholder="NOMBRE PENSIÓN">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Ciudad</b></label>
           <input type="text" id="txt_ciudad_pension" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Dirección</b></label>
           <input type="text" id="txt_direccion_pension" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Teléfono</b></label>
           <input type="text" id="txt_tel_pension" 
          class="form-control" placeholder="">
       </div>
       
       <div class="col-lg-6">
        <label for=""><b>Correo</b></label>
           <input type="text" id="txt_correo_pension" 
          class="form-control" placeholder="">
       </div>
       
      </div> 
      
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Pension()">Grabar</button>
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
            <input type="text" id="txt_idcategoria" hidden="">
              <label for="">Nombre Categoria</label>
              <input type="text" id="txt_nombre_actual_categoria" hidden="" placeholder="Nombre rol">
              <input type="text" id="txt_nombre_nuevo_categoria" class="form-control" placeholder="Nombre rol">
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
         <button type="button" class="btn btn-primary" onclick="Modificar_Categoria()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>





<script type="text/javascript" src="../js/pension.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
listar_pension();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});

 

</script>