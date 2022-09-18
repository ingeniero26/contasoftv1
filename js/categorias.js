var t_categoria;
function listar_categoria() {
    var idempresa = $("#txt_idempresa").val();
    t_categoria = $("#tabla_categoria").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/categoria/control_categoria_listar.php",
            data: {
                idempresa: idempresa
            }
        },

        "order": [[1, 'asc']],
        "columns": [
            { "defaultContent": "" },
            { "data": "categoria_nombre" },
            { "data": "categoria_fregistro" },
            {
                "data": "categoria_estatus",
                render: function (data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },

            {
                "data": "categoria_estatus",
                render: function (data, type, row) {
                    if (data == 'ACTIVO') {
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
    t_categoria.on('draw.dt', function () {
        var PageInfo = $('#tabla_categoria').DataTable().page.info();
        t_categoria.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_categoria').on('click', '.editar', function () {
    var data = t_categoria.row($(this).parents('tr')).data();

    if (t_categoria.row(this).child.isShown()) {
        var data = t_categoria.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_idcategoria").val(data.categoria_id);
    $("#txt_nombre_actual_categoria").val(data.categoria_nombre).trigger("change");
    $("#txt_nombre_nuevo_categoria").val(data.categoria_nombre);
    $("#cmb_estatus_editar").val(data.categoria_estatus).trigger("change");

})




/*desactivar y activar categoria*/
$('#tabla_categoria').on('click', '.activar', function () {
    var data = t_categoria.row($(this).parents('tr')).data();
    if (t_categoria.row(this).child.isShown()) {
        var data = t_categoria.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de activar  la categoria?',
        text: "Activacion",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.categoria_id, 'ACTIVO');
        }
    })
})
// function activar usuario
$('#tabla_categoria').on('click', '.desactivar', function () {
    var data = t_categoria.row($(this).parents('tr')).data();
    if (t_categoria.row(this).child.isShown()) {
        var data = t_categoria.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar la categoria?',
        text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.categoria_id, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(categoria_id, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controlador/categoria/control_modificar_estatus.php",
        type: 'POST',
        data: {
            categoria_id: categoria_id,
            estatus: estatus,
        }
    }).done(function (resp) {
        alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "Categoria " + mensaje + " exitosamente",
                "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_categoria.ajax.reload();

                });
        }

    })
}


function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}

function Registrar_Categoria() {
    var categoria = $('#txt_nombre_categoria').val();
    var idempresa = $("#txt_idempresa").val();
    if (categoria.length == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning'
        );
    }
    $.ajax({
        url: '../controlador/categoria/control_categoria_registro.php',
        type: 'POST',
        data: {
            categoria: categoria,
            idempresa: idempresa
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Categoria registrada exitosamente",
                    "success")
                    .then((value) => {
                        listar_categoria();
                        LimpiarCampos();
                        t_categoria.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Categoria ya existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Categoria no insertada', 'warning');
        }
    })
}


function Modificar_Categoria() {
    var id = $('#txt_idcategoria').val();
    var categoria_actual = $('#txt_nombre_actual_categoria').val();
    var categoria_nueva = $('#txt_nombre_nuevo_categoria').val();
    var estatus = $("#cmb_estatus").val();

    if (categoria_nueva.length == 0) {
        Swal.fire('Mensaje de error', 'Debe digitar los campos vacios', 'warning');
    }
    $.ajax({
        url: '../controlador/categoria/control_modificar_categoria.php',
        type: 'POST',
        data: {
            id: id,
            categoria_actual: categoria_actual,
            categoria_nueva: categoria_nueva,
            estatus: estatus
        }
    }).done(function (resp) {
        alert(resp);
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Categoria editado exitosamente",
                    "success")
                    .then((value) => {
                        listar_categoria();
                        LimpiarCampos();
                        t_categoria.ajax.reload();

                    });
            } else {
                LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Categoria ya existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Categoria no editado', 'warning');
        }
    })
}



function LimpiarCampos() {
    $('#txt_nombre_categoria').val("");
    $('#txt_nombre_nuevo_categoria').val("");
}