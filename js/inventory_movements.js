
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
            $('#cmb_bodega_inventory').html(cadena);
           // $('#cmb_bodega_producto').html(cadena);
            // $('#cmb_programa_asig_editar').html(cadena);
        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_bodega_inventory').html(cadena);
           // $('#cmb_bodega_producto').html(cadena);
        }
    })
}
alert('ok');
var t_inventory;
function listar_inventory() {
    var id_bodega = document.getElementById('cmb_bodega_inventory').value;
    //var id_categoria = document.getElementById('cmb_categoria_producto').value;
    //  var idempresa = $("#txt_idempresa").val();
    t_inventory = $("#tb_productos").DataTable({
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
            "url": "../controller/inventory/control_listar_inventory.php",
            data: {
                id_bodega: id_bodega,
                // id_categoria: id_categoria,
                // idempresa: idempresa

            }
        },

        "order": [[1, 'asc']],
        "columns": [
            { "defaultContent": "" },
           
            { "data": "producto_nombre" },

            { "data": "movement_type" },
            { "data": "nombre_bodega" },
            { "data": "quantity" },

            { "data": "stock" },
            { "data": "description" },
            { "data": "movement_date" },


        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[1]).css('text-align', 'center');
            $($(nRow).find("td")[4]).css('text-align', 'center');
        },
        "language": idioma_espanol,
        select: true
    });
    t_inventory.on('draw.dt', function () {
        var PageInfo = $('#tb_productos').DataTable().page.info();
        t_inventory.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

