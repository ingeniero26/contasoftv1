<div class="row">
    <div class="col-lg-3 col-md-4">
        <div class="ibox">
            <div class="ibox-body text-center">
                <form method="POST" action="#" enctype="multipart/form-data" onsubmit="return false">
                    <div class="m-t-20">
                        <img class="img-circle" id="txt_image_profile" />
                    </div>
                    <h5 class="font-strong m-b-10 m-t-10" id="txt_persona_profile"></h5>
                    <div class="m-b-20 text-muted" id="txt_rol_profile"></div>
                    <div class="profile-social m-b-20">
                        <input type="file" id="imagen_profile" accept="image/*" class="form-control-file">
                    </div>
                    <div>
                        <button class="btn btn-info btn-rounded m-b-10" onclick="Editar_Foto_Profile()"><i
                                class="fa fa-plus"></i> Actualizar</button>

                    </div>
                </form>
            </div>
        </div>

    </div>
    <div class="col-lg-9 col-md-8">
        <div class="ibox">
            <div class="ibox-body">
                <ul class="nav nav-tabs tabs-line">

                    <li class="nav-item ">
                        <a class="nav-link active" href="#tab-2" data-toggle="tab"><i class="ti-settings"></i> Datos
                            Personales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab-3" data-toggle="tab"><i class="ti-announcement"></i> Actualizar
                            Contraseña</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-2">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for="">Nombre</label>
                                <input type="text" id="txt_nombres_profile" class="form-control">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Apellido Paterno</label>
                                <input type="text" id="txt_apepat_profile" class="form-control">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Apellido Materno</label>
                                <input type="text" id="txt_apemat_profile" class="form-control">
                            </div>

                            <div class="col-lg-6">
                                <label for="">Documento</label>
                                <input type="text" id="txt_nrodocumento_profile" class="form-control">
                            </div>
                            <div class="col-lg-6">
                                <label for="">Tipo Documento</label>
                                <select class="js-example-basic-single" name="state" style="width: 100%;"
                                    id="cmb_tipodocumento_profile">
                                    <option value="CEDULA">CEDULA</option>
                                    <option value="NIT">NIT</option>
                                    <option value="PASAPORTE">PASAPORTE</option>
                                    <option value="TI">TI</option>
                                </select> <br> <br>
                            </div>

                            <!-- <div class="col-lg-6">
                                              <label for="">Sexo</label>
                                              <select class="js-example-basic-single" name="state" style="width: 100%;" id="cmb_sexo_profile" >
                                             <option value="MASCULINO">MASCULINO</option>
                                             <option value="FEMENINO">FEMENINO</option>
                                            
                                              </select> <br> <br>
                                          </div> -->
                            <!-- <div class="col-lg-6">
                                <label for="">Teléfono</label>
                                <input type="text" id="txt_telefono_profile" class="form-control"
                                    onkeypress="return soloNumeros(event)">
                            </div>
                            <div class="col-lg-12">
                                <label for="">Dirección</label>
                                <input type="text" id="txt_direccion_profile" class="form-control"> <br>
                            </div>
                            <div class="col-lg-12" style="text-align: center;">
                                <button class="btn btn-success" onclick="Datos_Actualizar()">Actualizar</button>
                            </div> -->
                        </div>

                    </div>

                    <div class="tab-pane fade" id="tab-3">
                        <div class="row">
                            <div class="col-lg-12">
                                <label for=""><b>Clave Actual</b></label>
                                <input type="password" id="txt_conactual_escrita_profile" class="form-control">
                                <input type="password" id="txt_conactual_profile" hidden="">
                            </div>
                            <div class="col-lg-12">
                                <label for=""><b>Clave Nueva</b></label>
                                <input type="password" id="txt_connueva_profile" class="form-control">
                            </div>
                            <div class="col-lg-12">
                                <label for=""><b>Confirmar Clave</b> </label>
                                <input type="password" id="txt_repcontra_profile" class="form-control"> <br>
                            </div>
                            <div class="col-lg-12">
                                <button class="btn btn-success" onclick="Editar_Contrasena()">Actualizar Clave</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/usuario.js?rev=<?php echo time();?>"></script>
<script>
TraerDatosPerfil();
$(document).ready(function() {

    $('.js-example-basic-single').select2();
});
document.getElementById("imagen_profile").addEventListener("change", () => {
    var fileName = document.getElementById("imagen_profile").value;
    var idxDot = fileName.lastIndexOf(".") + 1;
    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
    if (extFile == "jpg" || extFile == "jpeg" || extFile == "png") {
        //TO DO 
    } else {
        Swal.fire("MENSAJE DE ADVERTENCIA", "DEBE SELECCIONAR SOLO IMAGENES", "warning");
        document.getElementById("imagen_profile").value = "";
    }
});
</script>