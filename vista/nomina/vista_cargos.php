
 

 <div class="col-md-12">
    <div class="box box-warning box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">MANTENIMIENTO CARGO EMPLEADOS </h3>

            
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group">
                <div class="col-lg-10">
                  <div class="input-group">
                   <input type="text" class="global_filter form-control" id="global_filter" placeholder="Buscar  ">
                   <span class="input-group-addon"><i class="fa fa-search"></i></span>
                 </div> <br><br>
                </div>

                 <div class="col-lg-2"> 
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
               
              </div>
             <table id="tabla_cargos" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Cargo</th>
                    <th>Descripcion</th>
                    <th>Fecha Registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>#</th>
                    <th>Cargo</th>
                    <th>Descripcion</th>
                     <th>Fecha Registro</th>
                    <th>Estatus</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </tfoot>
                </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
 <form  autocomplete="false" onsubmit="return false">
  <div class="modal fade" id="modal_registro" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Registro de Cargos </h4>
            </div>
            <div class="modal-body">
              <div class="row">

              	   <div class="col-lg-8">
                    <label for=""><b>Descripción Cargo:</b></label>
                    <input type="text" id="txt_descripcion" name="" class="form-control" placeholder="Descripción"><br>
                  </div>
                <div class="col-lg-8">
                 
                    <label for="nombre"><b>Seleccione el departamento:</b></label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_depto">
                  </select> <br> <br>
                </div>
               

            </div>
           </div>
            <div class="modal-footer">
            <button class="btn btn-primary" onclick="Registrar_Cargo()">Registrar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>
</form>


 <form  autocomplete="false" onsubmit="return false">
  <div class="modal fade" id="modal_editar" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Edición de Cargos </h4>
            </div>
            <div class="modal-body">
              <div class="row">

                   <div class="col-lg-8">
                    <input type="text" name="" id="txt_idcargos">
                    <label for=""><b>Descripción Cargo:</b></label>
                    <input type="text" id="txt_descripcion_actual" name="" class="form-control" placeholder="Descripción">
                    <input type="text" id="txt_descripcion_nueva" name="" class="form-control" placeholder="Descripción">
                    <br>
                  </div>
                <div class="col-lg-8">
                 
                    <label for="nombre"><b>Seleccione el departamento:</b></label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_depto_editar">
                  </select> <br> <br>
                </div>
               

            </div>
           </div>
            <div class="modal-footer">
            <button class="btn btn-primary" onclick="Registrar_Cargo()">Registrar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>
</form>








<script type="text/javascript" src="../js/cargos.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
        Listar_Cargos();
         listar_combo_depto();
         //    listar_combo_especialidad();
            $('.js-example-basic-single').select2();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_nombre").focus();
              })
          } );

        /*valida email*/


   
    </script>