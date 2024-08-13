
 

 <div class="col-md-12">
    <div class="box box-warning box-solid">
        <div class="box-header with-border">
            <h3 class="box-title">Abono Clientes </h3>

            
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

                <!-- <div class="col-lg-2"> 
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>-->
               
              </div>
             <table id="tabla_abono_proveedor" class="display responsive nowrap table-bordered" style="width:100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Proveedor</th>
                    <th>Tipo </th>
                    <th>Factura Compra</th>
                    <th>Fecha Pago</th>
                     <th>Cuotas</th>
                    <th>Abonos</th>
                    <th>Credito</th>
                    <th>Saldo</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>#</th>
                    <th>Proveedor</th>
                    <th>Tipo </th>
                    <th>Factura Compra</th>
                    <th>Fecha Pago</th>
                     <th>Cuotas</th>
                    <th>Abonos</th>
                    <th>Credito</th>
                    <th>Saldo</th>
                    <th>Acci&oacute;n</th>
                  </tr>
                </tfoot>
                </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>









<script type="text/javascript" src="../js/abonos_proveedor2.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
         Listar_Abono_Proveedor();
        //  listar_combo_compra();
         //    listar_combo_especialidad();
            $('.js-example-basic-single').select2();
              $("#modal_registro").on('shown.bs.modal',function(){
              $("#txt_nombre").focus();
              })
          } );

        /*valida email*/


   
    </script>