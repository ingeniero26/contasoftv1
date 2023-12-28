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
                        
                         <label for=""><b>Seleccione una Bodega</b></label>
                          <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_bodega">
                            
                             </select> <br> <br>
                    </div>
                       <div class="col-5">
                        
                         <label for=""><b>Seleccione una Categoria</b></label>
                          <select class="js-example-basic-single" 
                          name="state" style="width: 100%;" id="cmb_categoria_producto">
                            
                             </select> <br> <br>
                    </div>
                      <div class="col-2">
                        <label for="">&nbsp;</label><br>
                        <button class="btn btn-success" style="width:100%" onclick="listar_productos()"><i class="fa fa-search"></i>Buscar</button>
                    </div><br>
                </div>
                <table id="tabla_productos" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Código Producto</th>
                            <th style="text-align:center;">Nombre </th>
                            <th>Referencia</th>
                            <th>Bodega</th>
                            <th>Marca</th>
                             <th>Impuesto(%IVA)</th>
                            <th>Cantidad Minima</th>
                            <th>Stock</th>
                            <th>Categoria</th>
                            <th>Medida</th>
                            <th>Tipo</th>
                           
                            <th>Compra</th>
                            <th>Venta</th>
                            <th>Ganancia</th>
                            <th>Foto</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle"><b> Registro de Productos</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
              <div class="col-lg-12">
                <label for=""><b>Codigo Producto</b> </label>
               <input type="text" id="txt_codigo" class="form-control" placeholder="">
            </div>
        <div class="col-lg-12">
            <label for=""><b>Descripción</b> </label>
           <input type="text" id="txt_nombre_producto" class="form-control" placeholder="">
        </div>

        <div class="col-lg-6">
          <label for=""><b>Referencia</b></label>
          <input type="text" id="txt_presentacion_producto" class="form-control">
        </div>
     

      <div class="col-lg-6">
            <label for=""><b>Bodega</b> </label>
                <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_bodega_producto"> 
                       
            </select> <br> <br>
        </div>

        <div class="col-lg-4">
          <label for=""><b>Cantidad Minima</b></label>
          <input type="text" id="txt_cant_minima" class="form-control">
        </div>
         <div class="col-lg-4">
          <label for=""><b>Stock Inicial</b></label>
          <input type="text" id="txt_cant_inicial" class="form-control">
        </div>
         <div class="col-lg-4">
      	   <label for=""><b>Categoria</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_categoria"> 
           
             </select> <br> <br>
      	</div>
      	  <div class="col-lg-4">
      	     <label for=""><b>Unidad</b> </label>
              <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_unidad"> 
           
             </select> <br> <br>
      	</div>
         <div class="col-lg-4">
             <label for=""><b>Tipo</b> </label>
              <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo"> 
           
             </select> <br> <br>
        </div>
        <div class="col-lg-4">
             <label for=""><b>Marca</b> </label>
              <select class="js-example-basic-single" 
              name="state" style="width: 100%;" id="cmb_marca"> 
           
             </select> <br> <br>
        </div>
           <div class="col-lg-4">
                <label for=""><b>Seleccione % iva</b></label>
                <select class="js-example-basic-single" 
                name="state" style="width: 100%;" id="cmb_iva_producto">
                            
                </select> <br> <br>
            </div>
         <div class="col-lg-6">
          <label for=""><b>Precio Compra</b></label>
          <input type="number" id="txt_precio_compra" class="form-control"  onkeypress="return soloNumeros(event)">
        </div>

         <div class="col-lg-6">
          <label for=""><b>Precio Venta</b></label>
          <input type="number" id="txt_precio_venta" class="form-control"  onkeypress="return soloNumeros(event)">
        </div>

      	<div class="col-lg-6">
	     	<label for="">Subir Imagen</label>
	     	<input type="file" id="imagen" accept="imagen/*">
	     </div>
    

	      
		</div>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Producto()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>

<!--modal editar-->

<!-- Modal registro -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Productos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        
         
     
           <div class="col-lg-12">
             <input type="text" id="txt_idproducto"  hidden="">
                <label for=""><b>Codigo Producto</b> </label>
               <input type="text" id="txt_codigo_actual_editar" hidden="" placeholder="">
               <input type="text" id="txt_codigo_nuevo_editar" class="form-control" placeholder="">
            </div>

            <div class="col-lg-12">
                 <label for=""><b>Descripción</b> </label>
                 <input type="text" id="txt_nombre_actual_editar" hidden="" placeholder="">
                 <input type="text" id="txt_nombre_nuevo_editar" class="form-control" placeholder="">
            </div>
           
     

        <div class="col-lg-6">
          <label for=""><b>Referencia</b></label>
          <input type="text"  class="form-control" 
          id="txt_presentacion_producto_editar">
        </div>

       
        <div class="col-lg-4">
          <label for=""><b>Cantidad Minima</b></label>
          <input type="text" id="txt_cant_minima_editar" class="form-control">
        </div>
   

         <div class="col-lg-4">
           <label for=""><b>Categoria</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" 
            id="cmb_categoria_editar"> 
           
             </select> <br> 
        </div>
          <div class="col-lg-4">
             <label for=""><b>Unidad</b> </label>
              <select class="js-example-basic-single" name="state" style="width: 100%;" 
              id="cmb_unidad_editar"> 
           
             </select> <br> 
           </div>
           <div class="col-lg-6">
              <label for=""><b>Precio compra</b></label>
              <input type="number" id="txt_precio_compra_editar" class="form-control"  onkeypress="return soloNumeros(event)">
            </div>
            <div class="col-lg-6">
             <label for=""><b>Tipo</b> </label>
              <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_editar"> 
           
             </select> <br> <br>
        </div>
           <div class="col-lg-6">
              <label for=""><b>Precio venta</b></label>
              <input type="number" id="txt_precio_venta_editar" class="form-control"  onkeypress="return soloNumeros(event)">
            </div>
           
            
              <div class="col-lg-6">
                <label for="">Subir Imagen</label>
                <input type="file" id="imagen_editar" accept="imagen/*">
               </div>

               <div class="col-lg-2">
                <label for="">&nbsp;</label><br>
                 <button class="btn btn-success" onclick="Editar_Foto_Producto()">Actualizar</button>
               </div>
        <form method="POST" action="#"  enctype="multipart/form-data" onsubmit="return false">
        </form>
    </div>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-danger" onclick="Modificar_Producto()">Editar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>






<script type="text/javascript" src="../js/productos.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
 listar_productos();
 listar_combo_categoria();
 listar_combo_unidad();
 listar_combo_bodega();
 listar_combo_tipo();
 listar_combo_marcas();
 listar_combo_iva();
 });
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_codigo').trigger('focus')
  })



document.getElementById("imagen").addEventListener("change", () => {
     var fileName = document.getElementById("imagen").value; 
     var idxDot = fileName.lastIndexOf(".") + 1; 
     var extFile = fileName.substr(idxDot, fileName.length).toLowerCase(); 
     if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){ 
      //TO DO 
     }else{ 
      Swal.fire("MENSAJE DE ADVERTENCIA","DEBE SELECCIONAR SOLO IMAGENES","warning");
       document.getElementById("imagen").value="";
     } 
    });


document.getElementById("imagen_editar").addEventListener("change", () => {
     var fileName = document.getElementById("imagen_editar").value; 
     var idxDot = fileName.lastIndexOf(".") + 1; 
     var extFile = fileName.substr(idxDot, fileName.length).toLowerCase(); 
     if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){ 
      //TO DO 
     }else{ 
      Swal.fire("MENSAJE DE ADVERTENCIA","DEBE SELECCIONAR SOLO IMAGENES","warning");
       document.getElementById("imagen_editar").value="";
     } 
    });


 

</script>