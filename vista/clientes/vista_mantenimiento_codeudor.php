<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-primary">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO DE CODEUDORES</div>
                <div class="ibox-tools">
                   <button class="btn btn-success" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <div class="row">
                       <div class="col-5">
                        
                         <label for=""><b>Seleccione un Cliente</b></label>
                         <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_cliente"> 
                       
                       </select> <br> <br>
                    </div>
                     
                      <div class="col-2">
                        <label for="">&nbsp;</label><br>
                        <button class="btn btn-success" style="width:100%" onclick="listar_codeudor()"><i class="fa fa-search"></i>Buscar</button>
                    </div><br>
                </div>
                <table id="tabla_codeudor" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codeudor</th>
                            <th style="text-align:center;">Documento </th>
                            <th>Tipo</th>
                            <th>Direcciòn</th>
                            <th>Telefono</th>
                            <th>Celular</th>
                            <th>Correo</th>
                            <th>Referencia 1</th>
                            <th>Referencia 2</th>
                            <th>Tel Ref 1</th>
                            <th>Tel Ref 2</th>
                            <th>Dir Ref 1</th>
                            <th>Dir Ref 2</th>
                            
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
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><b>Registro de Codeudores</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
              <div class="col-lg-12">
                <label for=""><b>Nombres</b> </label>
               <input type="text" id="txt_nombre" class="form-control" placeholder="">
            </div>
        <div class="col-lg-6">
            <label for=""><b>Apellido Paterno</b> </label>
           <input type="text" id="txt_apellido_paterno" class="form-control" placeholder="">
        </div>

        <div class="col-lg-6">
          <label for=""><b>Apellido Materno</b></label>
          <input type="text" id="txt_apellido_materno" class="form-control">
        </div>
     
       
      	<div class="col-lg-6">
      	   <label for=""><b>Tipo Documento</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipodocumento">
             <option value="CEDULA">CEDULA</option>
              <option value="TI">TI</option>
              <option value="PASAPORTE">PASAPORTE</option>
             </select> <br> <br>
      	</div>
        <div class="col-lg-6">
      	   <label for=""><b>Número Documento</b> </label>
           <input type="number" id="txt_numero" class="form-control" placeholder=" " onkeypress="return soloNumeros(event)">
      	</div>
        <div class="col-lg-6">
      	   <label for=""><b>Dirección</b> </label>
           <input type="text" id="txt_direccion" class="form-control" placeholder="dirección ">
      	</div>
        <div class="col-lg-6">
      	   <label for=""><b>Teléfono</b> </label>
           <input type="text" id="txt_telefono" class="form-control" placeholder="teléfono " onkeypress="return soloNumeros(event)">
      	</div>
        <div class="col-lg-6">
      	   <label for=""><b>Celular</b> </label>
           <input type="text" id="txt_Celular" class="form-control" placeholder="teléfono " onkeypress="return soloNumeros(event)">
      	</div>
        <div class="col-lg-6">
           <label for=""><b>Correo</b> </label>
           <input type="text" id="txt_correo" class="form-control" placeholder="correo ">
        </div>

        <div class="col-lg-6">
           <label for=""><b>Referencia 1</b> </label>
           <input type="text" id="txt_nombre_ref1" class="form-control" placeholder="Referencia 1 ">
        </div>
        <div class="col-lg-6">
           <label for=""><b>Referencia 2</b> </label>
           <input type="text" id="txt_nombre_ref2" class="form-control" placeholder="Referencia 2 ">
        </div>

        <div class="col-lg-6">
           <label for=""><b>Telefono Ref 1</b> </label>
           <input type="text" id="txt_tel_ref1" class="form-control" placeholder="Teléfono 1 ">
        </div>
        <div class="col-lg-6">
           <label for=""><b>Telefono Ref 2</b> </label>
           <input type="text" id="txt_tel_ref2" class="form-control" placeholder="Teléfono 2 ">
        </div>

        <div class="col-lg-6">
           <label for=""><b>Dirección Ref 1</b> </label>
           <input type="text" id="txt_dir_ref1" class="form-control" placeholder="Direccion 1 ">
        </div>
        <div class="col-lg-6">
           <label for=""><b>Dirección Ref 2</b> </label>
           <input type="text" id="txt_dir_ref2" class="form-control" placeholder="Direccion 2 ">
        </div>


      	<div class="col-lg-6">
	     	<label for="">Subir Anexos</label>
	     	<input type="file" id="imagen" accept="imagen/*">
	     </div>
    

	      
		</div>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Codeudor()">Grabar</button>
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






<script type="text/javascript" src="../js/codeudor.js"></script>
<script>
$(document).ready(function() {
   
  $('.js-example-basic-single').select2();
 listar_combo_cliente();
 listar_codeudor();
//  listar_combo_unidad();
//  listar_combo_bodega();
//  listar_combo_tipo();
 });
 $('#modal_registro').on('shown.bs.modal', function () {
    $('#txt_codigo').trigger('focus')
  })



document.getElementById("imagen").addEventListener("change", () => {
     var fileName = document.getElementById("imagen").value; 
     var idxDot = fileName.lastIndexOf(".") + 1; 
     var extFile = fileName.substr(idxDot, fileName.length).toLowerCase(); 
     if (extFile=="pdf" || extFile==".docx"){ 
      //TO DO 
     }else{ 
      Swal.fire("MENSAJE DE ADVERTENCIA","DEBE SELECCIONAR SOLO ARCHIVOS","warning");
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