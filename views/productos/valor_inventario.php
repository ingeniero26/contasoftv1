<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">VALOR INVENTARIO</div>
                <div class="ibox-tools">
                   <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_valor_producto" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Código</th>
                            <th>Nombre </th>
                            <th>Estatus</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>Valor Total</th>
                            
                           
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  
                </table>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript" src="../js/productos.js"></script>
<script>
	
$(document).ready(function() {
   


  $('.js-example-basic-single').select2();
  listar_valor_inventario();
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_nombre_unidad').trigger('focus')
  })
});

 

</script>