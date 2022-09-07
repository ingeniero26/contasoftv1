<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">MANTENIMIENTO EMPLEADOS</div>
                <div class="ibox-tools">
                   <button class="btn btn-primary" style="width: 100%" onclick="AbrirModalRegistro()"><i class="fa fa-plus">Nuevo Registro</i></button>
                </div>
            </div>
            <div class="ibox-body">
                <table id="tabla_empleados" class="display table-bordered table-responsive" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Documento</th>
                            <th>Nombre</th>
                            <th>Direccón</th>
                            <th>Telefono</th>
                            <th>Célular</th>
                            <th>Correo</th>
                            <th>Fecha Nac</th>
                           
                            <th>ARL</th>
                            <th>EPS</th>
                            <th>PENSIÓN</th>
                            <th>Ingreso</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                           <th>#</th>
                            <th>Documento</th>
                            <th>Nombre</th>
                            <th>Direccón</th>
                            <th>Telefono</th>
                            <th>Célular</th>
                            <th>Correo</th>
                            <th>Fecha Nac</th>
                            <th>ARL</th>
                            <th>EPS</th>
                            <th>PENSIÓN</th>
                            <th>Ingreso</th>
                            <th>Estatus</th>
                            <th>Acci&oacute;n</th>
                        </tr>
                    </tfoot>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Registro de Empleados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">

      		<div class="col-lg-6">
	      	   <label for=""><b>Número Documento</b> </label>
	           <input type="number" id="txt_numero" class="form-control" placeholder=" " onkeypress="return soloNumeros(event)">
	      	</div>


      		<div class="col-lg-6">
      	   <label for=""><b>Nombre y Apellidos</b> </label>
           <input type="text" id="txt_nombre" class="form-control" placeholder="Nombre" onkeypress="return sololetras(event)">
      	</div>
      		

      	<div class="col-lg-6">
      	   <label for=""><b>Dirección</b> </label>
           <input type="text" id="txt_direccion" class="form-control" placeholder="dir ">
      	</div>

      	<div class="col-lg-6">
      	   <label for=""><b>Teléfono</b> </label>
           <input type="text" id="txt_telefono" class="form-control" placeholder="tel " onkeypress="return soloNumeros(event)">
      	</div>

      	<div class="col-lg-6">
      	   <label for=""><b>Celular</b> </label>
           <input type="text" id="txt_cel" class="form-control" placeholder="tel " onkeypress="return soloNumeros(event)">
      	</div>

      	<div class="col-lg-6">
      	   <label for=""><b>Correo</b> </label>
           <input type="text" id="txt_correo" class="form-control" placeholder="tel " ">
      	</div>

        <div class="col-lg-6">
           <label for=""><b>Fecha Nacimiento</b> </label>
           <input type="date" id="txtfnac" class="form-control" >
        </div>

      	 <div class="col-lg-6">
      	   <label for=""><b>ARL</b> </label>
            <select class="js-example-basic-single" name="state"
                         style="width: 100%;" id="cmb_arl">
            >
             </select> <br> 
      	</div>

      	 <div class="col-lg-6">
      	   <label for=""><b>EPS</b> </label>
            <select class="js-example-basic-single" name="state"
                         style="width: 100%;" id="cmb_eps">
            >
             </select> <br> 
      	</div>
      	 <div class="col-lg-6">
      	   <label for=""><b>PENSION</b> </label>
            <select class="js-example-basic-single" name="state"
                         style="width: 100%;" id="cmb_pension">
            >
             </select> <br> 
      	</div>
         <div class="col-lg-12" style="text-align: center;">
                  <b>DATOS DEL USUARIO</b><br>
                </div>
                  <div class="col-lg-4">
                    <label for="">Usuario:</label>
                    <input type="text" id="txt_usu" name="" class="form-control" placeholder="Digite usuario"><br>
                </div>
                 <div class="col-lg-4">
                    <label for="">Contraseña:</label>
                    <input type="password" id="txt_contra" name="" class="form-control" placeholder="Digite Clave"><br>
                </div>

                <div class="col-lg-4">
                    <label for="">Rol:</label>
                    <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_rol">
                   </select> <br>
                </div>

      	
      	</div>
      	
       
      </div>
      <div class="modal-footer">
      	 <button type="button" class="btn btn-primary" onclick="Registrar_Empleado()">Grabar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
       
      </div>
    </div>
  </div>
</div>




<script type="text/javascript" src="../js/empleados.js"></script>
<script>
$(document).ready(function() {
       $('.js-example-basic-single').select2();
    listar_empleados();
   
      listar_combo_arl();
      listar_combo_eps();
      listar_combo_pension();
      listar_combo_rol();
});


	$('#modal_registro').on('shown.bs.modal', function () {
	  $('#txt_nombre_rol').trigger('focus')
	})
</script>