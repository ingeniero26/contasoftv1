
 

 <div class="col-md-12">
    <div class="box box-warning box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">CUENTAS POR COBRAR



              </h3>

            
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
             <table id="tabla_cuentas_cliente" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Factura</th>
                    <th>Cliente </th>
                    <th>Documento</th>
                     <th>Tipo</th>
                    <th>Credito</th>
                    <th>Estado</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                   <th>#</th>
                    <th>Factura</th>
                    <th>Cliente </th>
                    <th>Documento</th>
                     <th>Tipo</th>
                    <th>Credito</th>
                    <th>Estado</th>
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
              <h4 class="modal-title">Registro de Abonos  de Clientes </h4>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col-lg-12">
                 
                    <label for="nombre"><b>Seleccione la venta:</b></label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_venta">
                  </select> <br> <br>
                </div>

                  <div class="col-lg-4">
                    <label for=""><b>No Cuota:</b></label>
                    <input type="text" id="txt_no_cuota" name="" class="form-control" placeholder="No cuota"><br>
                </div>

              

                <div class="col-lg-4">
                    <label for=""><b>Fecha Pago:</b></label>
                    <input type="date" id="txt_fechaPago" name="" class="form-control" placeholder="fecha pago"><br><br>
                </div>
             
                <div class="col-lg-4">
                    <label for=""><b>Valor Abono:</b></label>
                    <input type="text" id="txt_valor_abono" name="" class="form-control" placeholder="Digite el valor del Abono"><br>
                </div>
               

            </div>
           </div>
            <div class="modal-footer">
            <button class="btn btn-primary" onclick="Registrar_Abono_Cliente()">Registrar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
  </div>
</form>








<script type="text/javascript" src="../js/cuentas_x_cobrar.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
           ListarCuenta_Cliente();
          listar_combo_venta();
         //    listar_combo_especialidad();
            $('.js-example-basic-single').select2();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_nombre").focus();
              })
          } );

        /*valida email*/


   
    </script>