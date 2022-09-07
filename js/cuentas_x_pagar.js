var   t_cuentas_x_pagar;

function ListarCuenta_Proveedor(){
    t_cuentas_x_pagar = $("#tabla_cuentas_proveedor").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        ajax:{
            url:"../controlador/cuentas_proveedor/cntrl_cuentas_proveedor.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"proveedor"},
            {"data":"contacto"},
            {"data":"documento"},
            {"data":"compra_tipo_comprobante"},
            {"data":"NoFactura"},
            {"data":"credito"},
            
           
             {
                "data": "compra_estatus",
                render: function(data, type, row) {
                    if (data == 'PAGADA') {
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

        document.getElementById("tabla_cuentas_proveedor_filter").style.display="none";

          $('input.global_filter').on( 'keyup click', function () {
            filterGlobal();
        } );
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        });

        t_cuentas_x_pagar.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_cuentas_proveedor').DataTable().page.info();
        t_cuentas_x_pagar.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });

    }

     function filterGlobal() {
        $('#tabla_cuentas_proveedor').DataTable().search(
        $('#global_filter').val(),
        ).draw();
    }
   function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
       
    }


    function listar_combo_compra() {
    $.ajax({
        url: "../controlador/cuentas_proveedor/control_combo_listar_compra.php",
        type: 'POST'
    }).done(function(resp) {
       // alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_compra').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_compra').html(cadena);

        }
    })
}



 function Registrar_Abono() {
       var idcompra = $('#cmb_compra').val();
       var no_cuota = $('#txt_no_cuota').val();
       var fecha_pago = $('#txt_fechaPago').val();
        var valor_abono = $('#txt_valor_abono').val();
      if(idcompra.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/cuentas_proveedor/control_registro_abonos_proveedor.php',
        type:'POST',
        data:{
          idcompra:idcompra,
          no_cuota: no_cuota,
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
                    listar_cuentas_x_cobrar();
              LimpiarCampos();
                    t_cxproveedor.ajax.reload();
                
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