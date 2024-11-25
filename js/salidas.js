var t_salidas;

function listar_salidas() {
    // var finicio = document.getElementById('txt_finicio').value;
    // var ffin = document.getElementById('txt_ffin').value;
    // var idempresa = $("#txt_idempresa").val();
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
            "url": "../controller/salidas/control_salidas_listar.php",
            data: {
                // finicio: finicio,
                // ffin: ffin,
                // idempresa: idempresa
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "fecha" },
            { "data": "nombre_usuario" },
            { "data": "nombre_bodega" },
            { "data": "tipo_salida" },
            { "data": "motivo" },
            { "data": "producto_codigo" },
            { "data": "nombre_producto" },
            { "data": "cantidad" },
            { "data": "precio_unitario" },
            { "data": "total" },
            // {
            //     "data": "estatus",
            //     render: function (data, type, row) {
            //         if (data == 'INGRESADA') {
            //             return "<span class='label label-success m-r-5 m-b-5'>" + data + "</span>";
            //         } else if (data == 'ANULADA') {
            //             return "<span class='label label-danger m-r-5 m-b-5'>" + data + "</span>";
            //         } else {
            //             return "<span class='label label-warning m-r-5 m-b-5'>" + data + "</span>";
            //         }
            //     }
            // },

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
                url: '../controller/ingreso/control_anular_registro.php',
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


function listar_combo_concepto() {
    var idempresa = $("#txt_idempresa").val();
    $.ajax({
        url: "../controller/concepto/control_combo_concepto.php",
        type: 'POST',
        data: {
            idempresa: idempresa
        }
    }).done(function (resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "<option value=''>Seleccione...</option>";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + " "
                    + data[i][1] + "</option>";
            }
            $('#cmb_concepto').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_concepto').html(cadena);

        }
    })
}
var arreglo_stock = new Array();
var arreglo_precio = new Array();
var arreglo_precio2 = new Array();
var arreglo_img = new Array();

function listar_combo_bodega() {
    var idempresa = $("#txt_idempresa").val();
    $.ajax({
        url: "../controller/bodegas/control_combo_bodegas.php",
        type: 'POST',
        data: {
            idempresa: idempresa
        }
    }).done(function (resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_bodega').html(cadena);
            $('#cmb_bodega_ingreso').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_bodega').html(cadena);
            $('#cmb_bodega_ingreso').html(cadena);
        }
    })
}


function listar_combo_producto() {
    //  alert('entra aki');
    var idempresa = $("#txt_idempresa").val();
    $.ajax({
        url: "../controller/ingreso/control_combo_producto_listar.php",
        type: 'POST',
        data: {
            idempresa: idempresa
        }
    }).done(function (resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "<option value=''>Seleccione...</option>";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + "-"
                    + data[i][5] + "-" + data[i][1] + "</option>";
                arreglo_stock[data[i][0]] = data[i][2];
                arreglo_precio[data[i][0]] = data[i][3];
                //arreglo_precio2[data[i][0]]=data[i][4];
                arreglo_img[data[i][0]] = data[i][4];
            }

            $('#cmb_producto').html(cadena);
            document.getElementById('txt_stock').value = data[0][2];
            document.getElementById('txt_precio').value = data[0][3];
            // document.getElementById('txt_precio2').value=data[0][4];
            document.getElementById('txt_foto_producto').src = '../' + data[0][4];


        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_producto').html(cadena);

        }
    })
}


var arreglo_stock = new Array();
var arreglo_precio = new Array();
var arreglo_precio2 = new Array();
var arreglo_img = new Array();

function Agregar_Producto_Detalle_Salida() {
    let idproducto = document.getElementById('cmb_producto').value;
    let producto = $("#cmb_producto option:selected").text();
    let cantidad = document.getElementById('txt_cantidad').value;
    let precio = document.getElementById('txt_precio').value;

    let subtotal = precio * cantidad;

    if (cantidad.length == 0 || precio.length == 0) {
        return Swal.fire("Mensaje de advertencia", "Debe digitar precio y cantidad", "warning");
    }

    if (parseFloat(cantidad) < 1) {
        return Swal.fire("Mensaje de advertencia", "La cantidad debe ser mayor a cero", "warning");
    }

    if (parseFloat(precio) < 0) {
        return Swal.fire("Mensaje de advertencia", "El precio debe ser mayor a cero", "warning");
    }

    if (verificarid(idproducto)) {
        return Swal.fire("Mensaje de advertencia", "El producto ya fue asignado a la tabla", "warning");
    }

    let datos_agregar = "<tr>";
    datos_agregar += "<td for='id'>" + idproducto + "</td>";
    datos_agregar += "<td>" + producto + "</td>";
    datos_agregar += "<td>" + cantidad + "</td>";
    datos_agregar += "<td>" + precio + "</td>";
    datos_agregar += "<td>" + subtotal + "</td>";
    datos_agregar += "<td><button class='btn btn-danger' onclick='remove(this)'><i class='fa fa-trash'></i></button></td>";
    datos_agregar += "</tr>";
    
    $("#tb_detalle_salida").append(datos_agregar);
    SumarTotalneto();
}

function verificarid(id) {
    let idverificar = document.querySelectorAll('#tb_detalle_salida td[for="id"]');
    return [].filter.call(idverificar, td => td.textContent === id).length === 1;
}

function remove(t) {
    var td = t.parentNode;
    var tr = td.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
    SumarTotalneto();
}

function SumarTotalneto() {
    let total = 0;
    $("#tb_detalle_salida tr").each(function () {
        total += parseFloat($(this).find('td').eq(4).text());
    });

    $("#lbl_totalneto").html("<b>Total: </b> $/." + total.toFixed(2));
}

function Registrar_Salida() {
    let count = 0;
    $("#tb_detalle_salida tr").each(function () {
        count++;
    });

    if (count == 0) {
        return Swal.fire("Mensaje de Error", "El detalle de la salida debe tener por lo menos un producto", "warning");
    }

    let fecha = document.getElementById('txt_fecha').value;
    let idbodega = document.getElementById('cmb_bodega').value;
    let idusuario = document.getElementById('txt_idprincipal').value;
    let tipo_salida = document.getElementById('cmb_tipo_salida').value;
    let motivo = document.getElementById('txt_motivo').value;
    let total = document.getElementById('lbl_totalneto').innerHTML.substr(18);

    $.ajax({
        url: '../controller/salidas/control_salida_registro.php',
        type: 'POST',
        data: {
            fecha: fecha,
            idbodega: idbodega,
            idusuario: idusuario,
            tipo_salida: tipo_salida,
            motivo: motivo,
            total: total
        }
    }).done(function (resp) {
        if (resp > 0) {
            Registrar_Detalle_Salida(parseInt(resp));
        } else {
            Swal.fire("Mensaje de Error", "Error al registrar la salida", "error");
        }
    });
}

function Registrar_Detalle_Salida(id_salida) {
    let arreglo_producto = [];
    let arreglo_cantidad = [];
    let arreglo_precio = [];

    $("#tb_detalle_salida tr").each(function () {
        arreglo_producto.push($(this).find('td').eq(0).text());
        arreglo_cantidad.push($(this).find('td').eq(2).text());
        arreglo_precio.push($(this).find('td').eq(3).text());
    });

    $.ajax({
        url: '../controller/salidas/control_detalle_salida_registro.php',
        type: 'POST',
        data: {
            id_salida: id_salida,
            producto: arreglo_producto.toString(),
            cantidad: arreglo_cantidad.toString(),
            precio: arreglo_precio.toString()
        }
    }).done(function (resp) {
        if (resp > 0) {
            Swal.fire("Mensaje de Confirmación", "Salida registrada correctamente", "success").then(() => {
                location.reload();
            });
        } else {
            Swal.fire("Mensaje de Error", "Error al registrar el detalle de la salida", "error");
        }
    });
}
