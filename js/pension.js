var t_pension;


function listar_pension() {
    var idempresa =$("#txt_idempresa").val();
    t_pension = $("#tabla_pension").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/configuracion/control_listar_pension.php",
            data : {
                idempresa:idempresa
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "NitPension" },
            { "data": "NomPension" },
            { "data": "CiudadPension" },
            { "data": "DirPension" },
            { "data": "TelPension" },
            { "data": "EmailPension" },
            {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },

            {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button>";
                    } else {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
                    }
                }
            },

        ],
        "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_pension.on('draw.dt', function() {
        var PageInfo = $('#tabla_pension').DataTable().page.info();
        t_pension.column(0, { page: 'current' }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_pension').on('click', '.editar', function() {
    var data = t_pension.row($(this).parents('tr')).data();

    if (t_pension.row(this).child.isShown()) {
        var data = t_pension.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_idcategoria").val(data.IdEPS);
    $("#txt_nombre_actual_categoria").val(data.categoria_nombre).trigger("change");
    $("#txt_nombre_nuevo_categoria").val(data.categoria_nombre);
    $("#cmb_estatus_editar").val(data.categoria_estatus).trigger("change");

})




/*desactivar y activar categoria*/
$('#tabla_pension').on('click', '.activar', function() {
        var data = t_pension.row($(this).parents('tr')).data();
        if (t_pension.row(this).child.isShown()) {
            var data = t_pension.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  la eps?',
            text: "Activacion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdEPS, 'ACTIVO');
            }
        })
    })
    // function activar usuario
$('#tabla_pension').on('click', '.desactivar', function() {
    var data = t_pension.row($(this).parents('tr')).data();
    if (t_pension.row(this).child.isShown()) {
        var data = t_pension.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar la eps?',
        text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.IdEPS, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(IdEPS, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controlador/configuracion/control_modificar_estatus_eps.php",
        type: 'POST',
        data: {
            IdEPS: IdEPS,
            estatus: estatus,
        }
    }).done(function(resp) {
       alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "EPS " + mensaje + " exitosamente",
                    "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_pension.ajax.reload();

                });
        }

    })
}



function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}


function Registrar_Pension() {
    var nit = $('#txt_nit').val();
    var nombre = $('#txt_nombre_pension').val();
    var ciudad = $('#txt_ciudad_pension').val();
    var direccion = $('#txt_direccion_pension').val();
    var telefono = $('#txt_tel_pension').val();
    var correo = $('#txt_correo_pension').val();

    if (nit.length == 0 || nombre.legth == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning');
    }
    $.ajax({
        url: '../controlador/configuracion/control_pension_registro.php',
        type: 'POST',
        data: {
            nit: nit,
            nombre: nombre,
            ciudad: ciudad,
            direccion: direccion,
            telefono: telefono,
            correo: correo,
        }
    }).done(function(resp) {
       alert(resp);
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Pension registrada exitosamente",
                        "success")
                    .then((value) => {
                        listar_eps();
                      //  LimpiarCampos();
                        t_pension.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Pension ya existe en el sistema, utilice otro', 'warning');
            }
        } else {
            return Swal.fire('Mensaje de error', 'Pension no insertada', 'warning');
        }
    })
}