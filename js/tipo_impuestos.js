var t_tipo_impuestos;
function listar_tipo_impuestos() {
    var idempresa = $("#txt_idempresa").val();
    t_tipo_impuestos = $("#tabla_impuestos").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/tipo_impuestos/control_listar_impuestos.php",
            data: {
                idempresa: idempresa
            }
        },

        "order": [[1, 'asc']],
        "columns": [
            { "defaultContent": "" },
            { "data": "codigo" },
            { "data": "tarifa" },
            { "data": "nombre" },
            { "data": "tipo_impuesto" },
            {
                "data": "estado",
                render: function (data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            { "data": "fregistro" },
            {
                "data": "estado",
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
    t_tipo_impuestos.on('draw.dt', function () {
        var PageInfo = $('#tabla_impuestos').DataTable().page.info();
        t_tipo_impuestos.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_impuestos').on('click', '.editar', function () {
    var data = t_tipo_impuestos.row($(this).parents('tr')).data();

    if (t_tipo_impuestos.row(this).child.isShown()) {
        var data = t_tipo_impuestos.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_idimpuesto").val(data.id);
    $("#txt_codigo_actual_editar").val(data.codigo);
    $("#txt_codigo_nuevo_editar").val(data.codigo);
    $("#txt_tarifa_editar").val(data.tarifa);
    $("#txt_descripcion_editar").val(data.nombre);
    
    $("#cmb_tipo_iva_producto_editar").val(data.idTipoImpuesto).trigger("change");

})




/*desactivar y activar categoria*/
$('#tabla_impuestos').on('click', '.activar', function () {
    var data = t_tipo_impuestos.row($(this).parents('tr')).data();
    if (t_tipo_impuestos.row(this).child.isShown()) {
        var data = t_tipo_impuestos.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de activar  el impuesto?',
        text: "Activacion",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.id, 'ACTIVO');
        }
    })
})
// function activar usuario
$('#tabla_impuestos').on('click', '.desactivar', function () {
    var data = t_tipo_impuestos.row($(this).parents('tr')).data();
    if (t_tipo_impuestos.row(this).child.isShown()) {
        var data = t_tipo_impuestos.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar el impuesto?',
        text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.id, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(id, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controlador/tipo_impuestos/control_modificar_estatus_impuesto.php",
        type: 'POST',
        data: {
            id: id,
            estatus: estatus,
        }
    }).done(function (resp) {
       // alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "Impuesto " + mensaje + " exitosamente",
                "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_tipo_impuestos.ajax.reload();

                });
        }

    })
}


function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}

function listar_combo_tipo_iva() {
    var idempresa =$("#txt_idempresa").val();
    $.ajax({
        url: "../controlador/tipo_impuestos/control_combo_tipo_iva.php",
        type: 'POST',
        data:{
                idempresa:idempresa
        }
    }).done(function(resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_tipo_iva_producto').html(cadena);
            $('#cmb_tipo_iva_producto_editar').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_tipo_iva_producto').html(cadena);
            $('#cmb_tipo_iva_producto_editar').html(cadena);

        }
    })
}

function Registrar_Tipo_Impuesto() {
    var codigo = $('#txt_codigo').val();
    var tarifa = $('#txt_tarifa').val();
    var nombre = $('#txt_descripcion').val();
     var id_tipo_iva = $('#cmb_tipo_iva_producto').val();
    var idempresa = $("#txt_idempresa").val();
    if (codigo.length == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning'
        );
    }
    $.ajax({
        url: '../controlador/tipo_impuestos/control_tipo_impuesto_registro.php',
        type: 'POST',
        data: {
            codigo: codigo,
            tarifa:tarifa,
            nombre:nombre,
            id_tipo_iva:id_tipo_iva,
            idempresa: idempresa
        }
    }).done(function (resp) {
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Impuesto registrada exitosamente",
                    "success")
                    .then((value) => {
                        listar_tipo_impuestos();
                        LimpiarCampos();
                        t_tipo_impuestos.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Impuesto ya existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Impuesto no insertada', 'warning');
        }
    })
}


function Modificar_Tipo_Iva() {
    var id = $('#txt_idimpuesto').val();
    var codigo_actual = $('#txt_codigo_actual_editar').val();
    var codigo_nuevo = $('#txt_codigo_nuevo_editar').val();
    var tarifa = $('#txt_tarifa_editar').val();
    var nombre = $('#txt_descripcion_editar').val();
    var idTipoImpuesto = $("#cmb_tipo_iva_producto_editar").val();

    if (codigo_nuevo.length == 0) {
        Swal.fire('Mensaje de error', 'Debe digitar los campos vacios', 'warning');
    }
    $.ajax({
        url: '../controlador/tipo_impuestos/control_modificar_iva.php',
        type: 'POST',
        data: {
            id: id,
            codigo_actual: codigo_actual,
            codigo_nuevo: codigo_nuevo,
            tarifa: tarifa,
            nombre:nombre,
            idTipoImpuesto:idTipoImpuesto
        }
    }).done(function (resp) {
        alert(resp);
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "Impuesto editado exitosamente",
                    "success")
                    .then((value) => {
                        listar_tipo_impuestos();
                        LimpiarCampos();
                        t_tipo_impuestos.ajax.reload();

                    });
            } else {
                LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Impuesto ya existe en el sistema, utilice otro', 'warning'
                );
            }
        } else {
            return Swal.fire('Mensaje de error', 'Impuesto no editado', 'warning');
        }
    })
}



function LimpiarCampos() {
    $('#txt_nombre_categoria').val("");
    $('#txt_nombre_nuevo_categoria').val("");
}