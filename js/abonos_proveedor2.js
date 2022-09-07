var   t_abono_clientes;

function Listar_Abono_Proveedor(){
    t_abono_clientes = $("#tabla_abono_proveedor").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        ajax:{
            url:"../controlador/cuentas_proveedor/listado_abonos.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"proveedor_razon_social"},
            {"data":"compra_tipo_comprobante"},
            {"data":"nofactura"},
            {"data":"noCuota"},
            {"data":"fecha_pago"},
            {"data":"credito"},
            {"data":"totalAbonos"},
           
           {"data":"saldo"},

            

            {"defaultContent":
            "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-print'></i></button>"
            }
        ],

        "language":idioma_espanol,
        select: true
    });

        document.getElementById("tabla_abono_proveedor_filter").style.display="none";

          $('input.global_filter').on( 'keyup click', function () {
            filterGlobal();
        } );
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        });

        t_abono_clientes.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_abono_proveedor').DataTable().page.info();
        t_abono_clientes.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });

    }

     function filterGlobal() {
        $('#tabla_abono_proveedor').DataTable().search(
        $('#global_filter').val(),
        ).draw();
    }
   function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
       
    }
