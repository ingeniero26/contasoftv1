var t_empresa;
function listar_empresa() {
    var idempresa = $("#txt_idempresa").val();
    t_empresa = $("#tabla_empresa").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controller/empresa/controlador_empresa_listar.php",
            data: {
                idempresa: idempresa
            }
        },

        "order": [[1, 'asc']],
        "columns": [
            { "defaultContent": "" },
           
            { "data": "Nit" },
            { "data": "nombre" },
            { "data": "Representante" },
            { "data": "descripcion" },
            { "data": "Industria" },
            { "data": "nombre_ciudad" },
            { "data": "Direccion" },
            { "data": "Telefono" },
            { "data": "Correo" },
            {
                "data": "Logo",
                render: function (data, type, row) {
                    return '<img src="../' + data + '" class="img-circle" style="width:28px">';
                }
            },
            { "data": "fregistro" },
            {
                "data": "estatus",
                render: function (data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "estatus",
                render: function (data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button> <button style='font-size:13px;' type='button' class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;&nbsp;";
                    } else {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
                    }
                }
            },

        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[1]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'center');
        },
        "language": idioma_espanol,
        select: true
    });
    t_empresa.on('draw.dt', function () {
        var PageInfo = $('#tabla_empresa').DataTable().page.info();
        t_empresa.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_empresa').on('click', '.editar', function () {
    var data = t_empresa.row($(this).parents('tr')).data();

    if (t_empresa.row(this).child.isShown()) {
        var data = t_empresa.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_idempresa").val(data.ID);
    $("#txt_NIT_actual").val(data.Nit);
    $("#txt_NIT_nuevo").val(data.Nit);
    $("#txt_nombre").val(data.nombre);
    $("#txt_representante").val(data.Representante);
    $("#txt_direccion").val(data.Direccion);
    $("#txt_telefono").val(data.Telefono);
    $("#txt_correo").val(data.Correo);
    $("#cmb_ciudad_empresa").val(data.idCiudad).trigger("change");
    $("#cmb_tipo_regimen").val(data.id_tipo_regimen).trigger("change");
    $("#txt_industria").val(data.Industria);
});


// desactivar usuario
$('#tabla_empresa').on('click', '.activar', function () {
    var data = t_empresa.row($(this).parents('tr')).data();
    if (t_empresa.row(this).child.isShown()) {
        var data = t_empresa.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de activar el usuario?',
        text: "Una vez desactivado el usuario  podrá ingresar al sistema",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.usuario_id, 'ACTIVO');
        }
    })
})
// function activar usuario
$('#tabla_empresa').on('click', '.desactivar', function () {
    var data = t_empresa.row($(this).parents('tr')).data();
    if (t_empresa.row(this).child.isShown()) {
        var data = t_empresa.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar el usuario?',
        text: "Una vez desactivado el usuario no podrá ingresar al sistema",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.usuario_id, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(usuario_id, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controller/usuario/control_modificar_estatus.php",
        type: 'POST',
        data: {
            usuario_id: usuario_id,
            estatus: estatus,
        }
    }).done(function (resp) {
        alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "Usuario " + mensaje + " exitosamente",
                "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_empresa.ajax.reload();

                });
        }

    })
}





function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}

/*combo regimen*/
function listar_combo_tipo_regimen() {
    var idempresa = $("#txt_idempresa").val();
    $.ajax({
        url: "../controller/configuracion/control_combo_tipo_regimen.php",
        type: 'GET',
        // data:{
        //    idempresa:idempresa
        // }
    }).done(function (resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "<option value=''>Seleccione...</option>";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_tipo_regimen').html(cadena);
            // $('#cmb_ciudad_empresa').html(cadena);
            //  $('#cmb_categoria_producto').html(cadena);
        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_tipo_regimen').html(cadena);
            // $('#cmb_ciudad_empresa').html(cadena);
            //  $('#cmb_categoria_producto').html(cadena);
        }
    })
}




function Editar_Foto_Empresa() {

    var idempresa = $('#txt_idempresa').val();
    var archivo = $('#imagen_editar').val();
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "IMG" + f.getDate() + "" + (f.getMonth() + 1) + "" + f.getFullYear() + "" +
        f.getHours() + "" + f.getMinutes() + "" + f.getSeconds() + "." + extension;

    var formData = new FormData();
    var foto = $("#imagen_editar")[0].files[0];
    if (archivo.length == 0) {
        return Swal.fire('Mensaje de error', 'Debe seleccionar un archivo', 'warning'
        );
    }

    formData.append('idempresa', idempresa);
    formData.append('foto', foto);
    formData.append('nombrearchivo', nombrearchivo);

    $.ajax({
        url: '../controller/empresa/controlador_empresa_editar_foto.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (resp) {
            alert(resp);
            if (resp != 0) {
                if (resp == 1) {
                    t_empresa.ajax.reload();
                    $('#modal_registro').modal('hide');
                    Swal.fire("Mensaje  de confirmaciòn", "Foto Actualizada exitosamente", "success");
                }
            }

        }

    });
    return false;
}


function Modificar_Empresa() {
    var idempresa = $('#txt_idempresa').val();
    var NIT_actual = $('#txt_NIT_actual').val();
    var NIT_nuevo = $('#txt_NIT_nuevo').val();
    var nombre = $('#txt_nombre').val();
    var representante = $('#txt_representante').val();
    var direccion = $('#txt_direccion').val();
    var telefono = $('#txt_telefono').val();
    var correo = $('#txt_correo').val();
    var ciudad = $('#cmb_ciudad_empresa').val();
    var estatus = $('#cmb_estatus_editar').val();
    if (NIT_actual.length == 0) {
        return Swal.fire('Mensaje de error', 'Debe digitar los campos vacios', 'warning');
    }
    $.ajax({
        url: '../controller/empresa/controlador_modificar_empresa.php',
        type: 'POST',
        data: {
            idempresa: idempresa,
            NIT_actual: NIT_actual,
            NIT_nuevo: NIT_nuevo,
            nombre: nombre,
            representante: representante,
            direccion: direccion,
            telefono: telefono,
            ciudad:ciudad,
            correo: correo,
             estatus: estatus
        }
    }).done(function (resp) {

        if (resp > 0) {
            if (resp == 1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Empresa editado exitosamente",
                    "success")
                    .then((value) => {
                        listar_empresa();
                        // LimpiarCampos();
                        t_empresa.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'NIT ya existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Empresa no Editado', 'warning');
        }
    })
}