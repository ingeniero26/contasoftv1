<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO EMPRESA</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_empresa" class="display table-bordered table-responsive" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NIT</th>
                            <th>Nombre</th>
                            <th>Representante</th>
                            <th>Règimen</th>
                            <th>Ciudad</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Email</th>
                            <th>Imagen</th>
                            <th>Registro</th>
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
<!--

 Modal registro -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
        <input type="text" id="txt_idempresa" >
      	<div class="col-lg-6">

      	   <label for=""><b>Nit</b> </label>
           <input type="text" id="txt_NIT" class="form-control" placeholder="nit" > <br>
      	</div>
        <div class="col-lg-6">

           <label for=""><b>Nombre</b> </label>
           <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre empresa" > <br>
        </div>

      	<div class="col-lg-6">
      	   <label for=""><b>Representante</b> </label>
           <input type="text" id="txt_representante" class="form-control" placeholder="" >
      	</div>
         <div class="col-lg-6">
      	   <label for="correo">Direccion:</label>
           <input type="text" id="txt_direccion" name="" class="form-control" placeholder="">

      	</div>
     	<div class="col-lg-6">
           <label for=""><b>Telefono</b> </label>
           <input type="text" id="txt_telefono" class="form-control" placeholder="" >
        </div>
        <div class="col-lg-6">
           <label for=""><b>Correo</b> </label>
           <input type="text" id="txt_correo" class="form-control" placeholder="" >
           <label for="" id="emailOk" style="color:red;"></label>
            <input type="text" id="validar_email" hidden="">
        </div>
        <div class="col-lg-6">
            <label for=""><b>Ciudad</b> </label>
                <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_ciudad_empresa">
                </select> <br> <br>
          </div>
          <div class="col-lg-6">
      	   <label for=""><b>Tipo Regimen</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_regimen">

             </select>
      	</div>

	   <div class="col-lg-10">
        <label for="">Subir Imagen</label>
        <input type="file" id="imagen_editar" accept="imagen/*">
       </div>

       <div class="col-lg-2">
        <label for="">&nbsp;</label><br>
         <button class="btn btn-success" onclick="Editar_Foto_Empresa()">Actualizar</button>
       </div>



      	</div>

       </form>
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-warning" onclick="Modificar_Empresa()">Modificar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

      </div>
    </div>
  </div>
</div>

<!-- Modal registro -->



<script type="text/javascript" src="../js/empresa.js?rev=<?php echo time(); ?>"></script>
<script type="text/javascript" src="../js/cliente.js"></script>
<script>
$(document).ready(function() {
  listar_empresa();
  listar_combo_ciudad();
  listar_combo_tipo_regimen();
  $('.js-example-basic-single').select2();
});


	 // listar_persona_combo();
	//  listar_combo_rol();
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