var t_quotes;

function listar_quotes() {
    var finicio = document.getElementById('txt_finicio').value;
    var ffin = document.getElementById('txt_ffin').value;
    var idempresa =$("#txt_idempresa").val();
    var idcaja =$("#cmb_caja").val();
 //   alert(finicio +" " +ffin);
    t_ventas = $("#tb_quote").DataTable({
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
            "url": "../controlador/quotes/control_quotes_list.php",
            data: {
                finicio: finicio,
                 ffin: ffin
                // idempresa:idempresa,
                // idcaja:idcaja
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "cliente" },
            { "data": "nombre_bodega" },
            { "data": "fecha_quote" }, 
            { "data": "quote_no" },       
            { "data": "tipo" },
            
          
            { "data": "fecha_vencimiento" },
            { "data": "impuesto" },
            { "data": "total" },
            { "data": "porcentaje" },
            { "data": "total_dcto" },
            {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'REGISTRADA') {
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
        "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_quotes.on('draw.dt', function() {
        var PageInfo = $('#tb_quote').DataTable().page.info();
        t_quotes.column(0, { page: 'current' }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}
