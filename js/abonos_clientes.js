var   t_abono_clientes;

function Listar_Abono_Clientes(){
    t_abono_clientes = $("#tabla_abono_clientes").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        ajax:{
            url:"../controlador/cuentas_clientes/cntrl_listado_abonos.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"data":"defaultContent"},
            {"data":"comprobante"},
            {"data":"numero"},
            {"data":"idventa"},
            {"data":"cuotas"},
            
            {"data":"abonos"},
            {"data":"fechaPago"},
            {"data":"credito"},
           
           {"data":"saldo"},

             {
                "data": "venta_estatus",
                render: function(data, type, row) {
                    if (data == 'CANCELADA') {
                        return "<span class='label label-success m-r-5 m-b-5'>" + data + "</span>";
                    } else if (data == 'POR_PAGAR') {
                        return "<span class='label label-danger m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='label label-warning m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },

            {"defaultContent":
            "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>"
            }
        ],

        "language":idioma_espanol,
        select: true
    });

        document.getElementById("tabla_abono_clientes_filter").style.display="none";

          $('input.global_filter').on( 'keyup click', function () {
            filterGlobal();
        } );
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        });

        t_abono_clientes.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_abono_clientes').DataTable().page.info();
        t_abono_clientes.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });

    }

     function filterGlobal() {
        $('#tabla_abono_clientes').DataTable().search(
        $('#global_filter').val(),
        ).draw();
    }
   function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
       
    }


/*desactivar y activar categoria*/ 
 $('#tabla_abono_clientes').on('click', '.editar', function() {
        var data = t_abono_clientes.row($(this).parents('tr')).data();
        if (t_abono_clientes.row(this).child.isShown()) {
            var data = t_abono_clientes.row(this).data();
        }
        Swal.fire({
            title: 'Esta accion cambiara el estado de la venta?',
            text: "Activacion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.venta_id, 'CANCELADA');
            }
        })
    })
 // function activar usuario
  

    function Modificar_Estatus(venta_id, estatus) {
        var mensaje = "";
        if (estatus == 'POR_PAGAR') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/cuentas_clientes/control_modificar_estatus.php",
            type: 'POST',
            data: {
                venta_id: venta_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "VENTA " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_abono_clientes.ajax.reload();

                    });
            }

        })
    }