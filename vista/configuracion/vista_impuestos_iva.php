<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO TIPO DE IMPUESTOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_impuestos" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codigo</th>
                            <th>Tarifa</th>
                            <th>Descripcion</th>
                             <th>Tipo Impuesto</th>
                            <th>Estado</th>
                            <th>Fecha Registro</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>

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
        <h5 class="modal-title" id="exampleModalLongTitle"><b>Registro de Impuestos</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <label for=""><b>Codigo</b></label>
                <input type="text" id="txt_codigo"
                class="form-control" placeholder="Codigo">
            </div>
            <div class="col-md-12">
                <label for="">Tarifa</label>
                <input type="text" id="txt_tarifa"
                class="form-control" placeholder="Tarifa">
            </div>
            <div class="col-md-12">
                <label for="">Descripción</label>
                <input type="text" id="txt_descripcion"
                class="form-control" placeholder="Descripcion">
            </div>
               <div class="col-8">
                        
                         <label for=""><b>Seleccione un Tipo Impuesto</b></label>
                          <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_tipo_iva_producto">
                            
                             </select> <br> <br>
                    </div>

        </div>

      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Tipo_Impuesto()">Grabar</button>
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
      
            <input type="text" id="txt_idimpuesto" hidden>

           <div class="col-md-12">
                <label for=""><b>Codigo</b></label>
                <input type="text" id="txt_codigo_actual_editar"

                class="form-control" placeholder="Codigo" hidden>
                  <input type="text" id="txt_codigo_nuevo_editar"
                
                class="form-control" placeholder="Codigo">
            </div>
            <div class="col-md-12">
                <label for="">Tarifa</label>
                <input type="text" id="txt_tarifa_editar"
                class="form-control" placeholder="Tarifa">
            </div>
            <div class="col-md-12">
                <label for="">Descripción</label>
                <input type="text" id="txt_descripcion_editar"
                class="form-control" placeholder="Descripcion">
            </div>
               <div class="col-8">
                        
                         <label for=""><b>Seleccione un Tipo Impuesto</b></label>
                          <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_tipo_iva_producto_editar">
                            
                             </select> <br> <br>
                    </div>
        

      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-warning" onclick="Modificar_Tipo_Iva()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

      </div>
    </div>
  </div>
</div>





<script type="text/javascript" src="../js/tipo_impuestos.js"></script>
<script>
$(document).ready(function() {

  $('.js-example-basic-single').select2();
  listar_tipo_impuestos();
  listar_combo_tipo_iva();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_categoria').trigger('focus')
  })
});



</script>
