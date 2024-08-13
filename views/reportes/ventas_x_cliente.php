<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO DE PRODUCTOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <div class="row">
                       <div class="col-5">
                        
                         <label for=""><b>Seleccione un Cliente</b></label>
                          <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_venta_cliente">
                            
                             </select> <br> <br>
                    </div>
                      <div class="col-2">
                        <label for="">&nbsp;</label><br>
                        <button class="btn btn-success" style="width:100%" onclick="listar_productos()"><i class="fa fa-search"></i>Buscar</button>
                    </div><br>
                </div>
                <table id="tabla_venta_x_cliente" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Código Producto</th>
                            <th style="text-align:center;">Nombre </th>
                            <th>Referencia</th>
                           
                            <th>Bodega</th>
                            <th>Cantidad Minima</th>
                            <th>Stock</th>
                            <th>Categoria</th>
                            <th>Medida</th>
                            <th>Foto</th>
                            <th>Precio</th>
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


<!--modal editar-->

<!-- Modal registro -->






<script type="text/javascript" src="../js/ventas_x_cliente.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
 //listar_ventas_clientes();
 listar_combo_cliente();

 });
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_codigo').trigger('focus')
  })








 

</script>