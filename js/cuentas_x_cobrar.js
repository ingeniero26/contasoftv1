var   t_cuentas_x_cobrar;
alert("aqui");

function ListarCuenta_Cliente(){
     var idempresa =$("#txt_idempresa").val();
    t_cuentas_x_cobrar = $("#tabla_cuentas_cliente").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        ajax:{
            url:"../controlador/cuentas_clientes/cntrol_cuentas_clientes.php",
            type:'POST',
            data:{
                idempresa:idempresa
            }
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"factura_venta"},
            {"data":"cliente"},
            {"data":"persona_nrodocumento"},
            {"data":"tipo"},
            {"data":"credito"},
           
            
           
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

        document.getElementById("tabla_cuentas_cliente_filter").style.display="none";

          $('input.global_filter').on( 'keyup click', function () {
            filterGlobal();
        } );
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        });

        t_cuentas_x_cobrar.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_cuentas_cliente').DataTable().page.info();
        t_cuentas_x_cobrar.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });

    }

     function filterGlobal() {
        $('#tabla_cuentas_cliente').DataTable().search(
        $('#global_filter').val(),
        ).draw();
    }
   function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
       
    }


    function listar_combo_venta() {
    $.ajax({
        url: "../controlador/cuentas_clientes/control_listar_combo_venta.php",
        type: 'POST'
    }).done(function(resp) {
      //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_venta').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_venta').html(cadena);

        }
    })
}



 function Registrar_Abono_Cliente() {
       var idventa = $('#cmb_venta').val();
       var no_cuota = $('#txt_no_cuota').val();
        var no_comprobante = $('#txt_no_comprobante').val();
       var fecha_pago = $('#txt_fechaPago').val();
        var valor_abono = $('#txt_valor_abono').val();
      if(idventa.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/cuentas_clientes/control_registro_abonos_cliente.php',
        type:'POST',
        data:{
          idventa:idventa,
          no_cuota: no_cuota,
          no_comprobante:no_comprobante,
          fecha_pago:fecha_pago,
          valor_abono:valor_abono
        }
      }).done(function(resp){
        alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Abono registrada exitosamente",
                    "success")
                
                .then((value)=>{
                    ListarCuenta_Cliente();
              LimpiarCampos();
                    t_cuentas_x_cobrar.ajax.reload();
                
                });
            } else {
              LimpiarCampos();
                return Swal.fire('Mensaje de error', 'error, no se completo el abono', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Abono no insertada','warning');
        }
      })
    }

    function LimpiarCampos() {
        $('#txt_no_cuota').val("");
       $('#txt_fechaPago').val("");
       $('#txt_valor_abono').val("");
    }