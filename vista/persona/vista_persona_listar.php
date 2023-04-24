<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO TERCEROS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_persona" class="display table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th style="text-align: center;">Nombre</th>
                            <th>Tipo Contribuyente</th>
                            <th>Número</th>
                            <th>Tipo Documento</th>
                            <th>Tercero</th> 
                            <th style="text-align: center;">Sexo</th>
                            <th>Telefono</th>
                            <th>Direccion</th>
                            <th>Correo</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Tercero</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-lg-12">
      	   <label for=""><b>Nombre</b> </label>
           <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre" onkeypress="return sololetras(event)">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Apellido Paterno</b> </label>
           <input type="text" id="txt_apepat" class="form-control" placeholder="Apellido" onkeypress="return sololetras(event)">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Apellido Materno</b> </label>
           <input type="text" id="txt_apemat" class="form-control" placeholder="" onkeypress="return sololetras(event)"> <br>
      	</div>
        <div class="col-lg-12">
      	   <label for=""><b>Tipo Contribuyente</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipo_contribuyente">
             <option value="Persona Natural">Natural</option>
              <option value="Persona Juridica">Jurídica</option>
             </select>
      	</div>

      	<div class="col-lg-6">
      	   <label for=""><b>Número Documento</b> </label>
           <input type="number" id="txt_numero" class="form-control" placeholder=" " onkeypress="return soloNumeros(event)">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Tipo Documento</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipodocumento">
             <option value="CEDULA">CEDULA</option>
              <option value="NIT">NIT</option>
              <option value="PASAPORTE">PASAPORTE</option>
              <option value="TI">TI</option>
             </select> <br> <br>
      	</div>

      	
      	<div class="col-lg-6">
      	   <label for=""><b>Sexo</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_sexo">
             <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>
              
             </select> <br> <br>
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Teléfono</b> </label>
           <input type="text" id="txt_telefono" class="form-control" placeholder="tel " onkeypress="return soloNumeros(event)">
      	</div>
      	<div class="col-lg-12">
      	   <label for=""><b>Dirección</b> </label>
           <input type="text" id="txt_direccion" class="form-control" placeholder="dir ">
      	</div>
        <div class="col-lg-12">
      	   <label for=""><b>Email</b> </label>
           <input type="text" id="txt_correo" class="form-control" placeholder="Correo Electrónico">
      	</div>
      
     


      	<div class="col-lg-12"><br>
      		<div class="alert alert-danger alert-bordered" style="display: none;"></div>
      	</div>
      	</div>
      	
       
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Persona()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>

<!-- Modal editar -->
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Persona</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-lg-12">
      		<input type="text" id="txt_idpersona" hidden="">
      	    <label for=""><b>Nombre</b> </label>
            <input type="text" id="txt_nombre_editar" class="form-control" placeholder="Nombre ">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Apellido Paterno</b> </label>
           <input type="text" id="txt_apepat_editar" class="form-control" placeholder="Apellido ">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Apellido Materno</b> </label>
           <input type="text" id="txt_apemat_editar" class="form-control" placeholder="">
      	</div>

      	<div class="col-lg-6">
      	   <label for=""><b>Número</b> </label>
           <input type="text" id="txt_numero_actual_editar" hidden="" placeholder=" ">
           <input type="text" id="txt_numero_nuevo_editar" class="form-control" placeholder=" ">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Tipo Documento</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_tipodocumento_editar">
             <option value="CEDULA">CEDULA</option>
              <option value="NIT">NIT</option>
              <option value="PASAPORTE">PASAPORTE</option>
              <option value="TI">TI</option>
             </select> <br> <br>
      	</div>

      	
      	<div class="col-lg-6">
      	   <label for=""><b>Sexo</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_sexo_editar">
             <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>
              
             </select> <br> <br>
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Teléfono</b> </label>
           <input type="number" id="txt_telefono_editar" class="form-control" placeholder="dir ">
      	</div>
      	<div class="col-lg-6">
      	   <label for=""><b>Dirección</b> </label>
           <input type="text" id="txt_direccion_editar" class="form-control" placeholder="tel ">
      	</div>
        <div class="col-lg-6">
           <label for=""><b>Correo</b> </label>
           <input type="text" id="txt_correo_editar" class="form-control" placeholder="tel ">
        </div>
      	</div>
      		<div class="col-lg-6">
      	   <label for=""><b>Estatus</b> </label>
            <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_estatus_editar">
             <option value="ACTIVO">ACTIVO</option>
              <option value="INACTIVO">INACTIVO</option>
              
             </select> <br> <br>
      	</div>
       
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-warning" onclick="Modificar_Persona()">Editar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>


<script type="text/javascript" src="../js/persona.js"></script>
<script>
$(document).ready(function() {
  $('.js-example-basic-single').select2();
     listar_persona();
     listar_combo_departamentos();

       $("#cmb_ciudad_persona").change(function() {
           var iddepartamento =$("#cmb_ciudad_persona").val();
            listar_combo_ciudades(iddepartamento);
          });

     
});


	$('#modal_registro').on('shown.bs.modal', function () {
	  $('#txt_nombre_rol').trigger('focus')
	})
</script>