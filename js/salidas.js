var t_salidas;

function listar_salidas() {
    var finicio = document.getElementById('txt_finicio').value;
    var ffin = document.getElementById('txt_ffin').value;
    var idempresa = $("#txt_idempresa").val();
    //   alert(finicio +" " +ffin);
    t_salidas = $("#tabla_salidas").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        dom: 'Bfrtip',
        buttons: [
            'excel', 'csv', 'pdf', 'print', 'copy',
        ],
        "ajax": {
            "method": "POST",
            "url": "../controlador/salidas/control_salidas_listar.php",
            data: {
                finicio: finicio,
                ffin: ffin,
                idempresa: idempresa
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "fecha" },
            { "data": "usuario_nombre" },
            { "data": "descripcion" },
            { "data": "nombre_bodega" },
            { "data": "producto_codigo" },
            { "data": "producto_nombre" },
            { "data": "cantidad" },
            {
                "data": "estatus",
                render: function (data, type, row) {
                    if (data == 'INGRESADA') {
                        return "<span class='label label-success m-r-5 m-b-5'>" + data + "</span>";
                    } else if (data == 'ANULADA') {
                        return "<span class='label label-danger m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='label label-warning m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },

            {
                "defaultContent": "<button style='font-size:13px;' type='button' class='imprimir btn btn-primary'><i class='fa fa-print'></i></button> &nbsp;<button style='font-size:13px;' type='button' class='anular btn btn-danger'><i class='fa fa-trash'></i></button>"
            }

        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_salidas.on('draw.dt', function () {
        var PageInfo = $('#tabla_salidas').DataTable().page.info();
        t_salidas.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}


// modificar datos del procedimiento
$('#tabla_ingreso').on('click', '.imprimir', function () {
    var data = t_salidas.row($(this).parents('tr')).data();
    if (t_salidas.row(this).child.isShown()) {
        var data = t_ingreso.row(this).data();
    }
    window.open("../mpdf/reporte_compras.php?codigo=" +
        parseInt(data.compra_id) + "#zoom=100", "Reporte de Compra", "scrollbards=NO");
})

// anular compra 

$('#tabla_ingreso').on('click', '.anular', function () {
    var data = t_salidas.row($(this).parents('tr')).data();
    if (t_salidas.row(this).child.isShown()) {
        var data = t_ingreso.row(this).data();
    }
    Swal.fire({
        title: 'Deseas anular esta compra?',
        text: "Una vez anulado el registro, no se podra revertira la operación?",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Anular Ingreso'
    }).then((result) => {
        if (result.value) {
            $.ajax({
                url: '../controlador/ingreso/control_anular_registro.php',
                type: 'POST',
                data: {
                    idcompra: data.compra_id
                }
            }).done(function (resp) {
                //  alert(resp);
                if (resp > 0) {
                    Swal.fire("Mensaje de confirmaciòn", "Compra anulada", "success");
                    t_salidas.ajax.reload();
                } else {
                    Swal.fire("Mensaje de Error", "No se completo la anulación", "error");
                }
            })
        }
    })
})



function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}
