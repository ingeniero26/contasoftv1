var t_deptos;
function list_document_type() {
    var idempresa = $("#txt_idempresa").val();
    t_deptos = $("#tb_document_type").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controller/setting/control_list_document_type.php",
            data: {
                idempresa: idempresa
            }
        },

        "order": [[1, 'asc']],
        "columns": [
            { "defaultContent": "" },
            { "data": "name" },
            { "data": "abbreviation" },
            { "data": "usuario_nombre" },

            { "data": "created_at" },
            {
                "data": "status",
                render: function (data, type, row) {
                    if (data == '1') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },

            {
                "data": "status",
                render: function (data, type, row) {
                    if (data == '1') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button>";
                    } else {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
                    }
                }
            },

        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_deptos.on('draw.dt', function () {
        var PageInfo = $('#tb_document_type').DataTable().page.info();
        t_deptos.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_deptos').on('click', '.editar', function () {
    var data = t_deptos.row($(this).parents('tr')).data();

    if (t_deptos.row(this).child.isShown()) {
        var data = t_deptos.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_iddepto").val(data.IdDpto);
    $("#txt_desc_actual_editar").val(data.DescDpto).trigger("change");
    $("#txt_nuevo_editar").val(data.DescDpto);


})




$('#tabla_deptos').on('click', '.activar', function () {
    var data = t_deptos.row($(this).parents('tr')).data();
    if (t_deptos.row(this).child.isShown()) {
        var data = t_deptos.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de activar el Departamento?',
        text: "Activacion",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.IdDpto, 'ACTIVO');
        }
    })
})
// function activar usuario
$('#tabla_deptos').on('click', '.desactivar', function () {
    var data = t_deptos.row($(this).parents('tr')).data();
    if (t_deptos.row(this).child.isShown()) {
        var data = t_deptos.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar el Departamento?',
        text: "Una vez desactivada el Departamento no podrá verlo en el sistema",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.IdDpto, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(IdDpto, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controlador/deptos/control_modificar_estatus.php",
        type: 'POST',
        data: {
            IdDpto: IdDpto,
            estatus: estatus,
        }
    }).done(function (resp) {
        alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "Departamento " + mensaje + " exitosamente",
                "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_deptos.ajax.reload();

                });
        }

    })
}



function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}

function RegisterDocumentType() {
    var name = $('#txt_name').val();
    var abbreviation = $('#txt_abreviation').val();
    var company_id = $("#txt_idempresa").val();
    var idusuario = document.getElementById('txt_idprincipal').value;
  

    if (name.length == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning'
        );
    }
    $.ajax({
        url: '../controller/setting/add_document_type.php',
        type: 'POST',
        data: {
            name: name,
            abbreviation:abbreviation,
            company_id:company_id,
            idusuario:idusuario
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", " Registrado exitosamente",
                    "success")
                    .then((value) => {
                        list_document_type();
                        LimpiarCampos();
                        t_deptos.ajax.reload();

                    });
            } else {
                LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Documento no insertado', 'warning');
        }
    })
}


function LimpiarCampos() {
    $('#txt_desc').val("");
}

function Modificar_Depto() {
    var id = $('#txt_iddepto').val();
    var desc_actual = $('#txt_desc_actual_editar').val();
    var desc_nueva = $('#txt_nuevo_editar').val();


    if (desc_nueva.length == 0) {
        Swal.fire('Mensaje de error', 'Debe digitar los campos vacios', 'warning');
    }
    $.ajax({
        url: '../controlador/deptos/control_modificar_deptos.php',
        type: 'POST',
        data: {
            id: id,
            desc_actual: desc_actual,
            desc_nueva: desc_nueva

        }
    }).done(function (resp) {
        //alert(resp);
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Departamento editado exitosamente",
                    "success")
                    .then((value) => {
                        listar_deptos();
                        // LimpiarCampos();
                        t_deptos.ajax.reload();

                    });
            } else {
                //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Departamento ya existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Departamento no editado', 'warning');
        }
    })
}