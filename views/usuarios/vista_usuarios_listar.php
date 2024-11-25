<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO USUARIOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_usuario" class="display table-bordered table-responsive" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Usuario</th>
                            <th>Persona</th>
                            <th>Rol</th>
                            <th>Email</th>
                            <th>Caja</th>
                            <th>Imagen</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Usuarios</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <form method="POST" action="#"  enctype="multipart/form-data" onsubmit="return false">
      	<div class="row">
      		<div class="col-lg-8">
      	   <label for=""><b>Usuario</b> </label>
           <input type="text" id="txt_usu" class="form-control" placeholder="Usuario" > <br> 
      	</div>

      	<div class="col-lg-6">
      	   <label for=""><b>Contraseña</b> </label>
           <input type="password" id="txt_pass" class="form-control" placeholder="Clave" >
      	</div>
         <div class="col-lg-6">
      	   <label for="correo">Correo:</label>
           <input type="text" id="txt_email" name="" class="form-control" placeholder="Digite su correo">
           <label for="" id="emailOk" style="color:red;"></label>
            <input type="text" id="validar_email" hidden="">
      	</div>
     	
      	 <div class="col-lg-6">
      	   <label for=""><b>Rol</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_rol"> 
           
             </select> <br> <br>
      	</div>
     
	     <div class="col-lg-6">
	     	<label for="">Subir Imagen</label>
	     	<input type="file" id="imagen" accept="imagen/*">
	     </div>

	 
	      <div class="col-lg-6">
      	   <label for=""><b>Persona</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_persona"> 
           
             </select> <br> <br>
      	</div>      		
      	</div>
      	
       </form>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Usuario()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>

<!-- Modal registro -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar de Usuarios</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <form action="#" method="POST" enctype="multipart/form-data" onsubmit="return false">
        <div class="row">
          <div class="col-lg-6">
            <input type="text" id="txt_idusuario" hidden="">
           <label for=""><b>Usuario</b> </label>
           <input type="text" id="txt_usu_actual_editar"   class="form-control" disabled="" > <br>
         <br> 
        </div>

     
         <div class="col-lg-6">
           <label for="correo">Correo:</label>
           <input type="text" id="txt_email_nuevo_editar"  class="form-control" placeholder="Digite su correo">
           <label for="" id="emailOk" style="color:red;"></label>
            <input type="text" id="validar_email_editar" hidden="">
        </div>
      
         <div class="col-lg-3">
           <label for=""><b>Rol</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_rol_editar"> 
           
             </select> <br> <br>
        </div>

          <div class="col-lg-3">
           <label for=""><b>Estatus</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_estatus_editar">
             <option value="ACTIVO">ACTIVO</option>
              <option value="INACTIVO">INACTIVO</option>
              
             </select> <br> <br>
        </div>

         <div class="col-lg-6">
           <label for=""><b>Persona</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_persona_editar">  
             </select> <br> <br>
        </div>
     
       <div class="col-lg-10">
        <label for="">Subir Imagen</label>
        <input type="file" id="imagen_editar" accept="imagen/*">
       </div>

       <div class="col-lg-2">
        <label for="">&nbsp;</label><br>
         <button class="btn btn-success" onclick="Editar_Foto()">Actualizar</button>
       </div>
          
        </div>
        
    </form>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-primary" onclick="Modificar_Usuario()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>




<script type="text/javascript" src="../js/usuario.js?rev=<?php echo time();?>"></script>
<script>
$(document).ready(function() {
  listar_usuario();
  $('.js-example-basic-single').select2();
});


	  listar_persona_combo();
	  listar_combo_rol();
	$('#modal_registro').on('shown.bs.modal', function () {
	  $('#txt_usu').trigger('focus')
	});
 
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



  /*correo valido*/
     document.getElementById('txt_email').addEventListener('input',function(){
        campo=event.target;
          emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
          if(emailRegex.test(campo.value)) {
            $(this).css("border","");
            $("#emailOk").html("");
            $("#validar_email").val("correcto");
          }  else {
            $(this).css("border","1px solid red");
             $("#emailOk").html("Email Incorrecto");
              $("#validar_email").val("incorrecto");
          }
       })

});
</script>