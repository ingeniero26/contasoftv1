var t_cxproveedor;
function listar_cuentas_x_cobrar(){

     t_cxproveedor = $("#tabla_cuentas").DataTable({
            "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
        "autoWidth": false,
      "ajax":{
        "method":"POST",
            "url":"../controlador/cuentas_x_proveedor/control_cuentas_proveedor_listar.php",
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"razon_social"},
            {"data":"proveedor"},
             {"data":"persona_nrodocumento"},
            
             {"data":"factura"},
             {"data":"compra_tipo_pago"},
             {"data":"compra_fecha"},
             {"data":"compra_total"},
            
            {"data":"compra_estatus",
            render: function (data, type, row ) {
                if(data=='POR_PAGAR'){
                    return "<span class='label label-danger'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-success'>"+data+"</span>";                 
                }
              }
            }, 

              {
                "data": "compra_estatus",
                render: function(data, type, row) {
                    if (data == 'POR_COBRAR') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button>";
                    } else {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
                    }
                }
            },
        
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
            $($(nRow).find("td")[2]).css('text-align', 'center' );

        },
        "language":idioma_espanol,
        select: true
    });
    t_cxproveedor.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_cuentas').DataTable().page.info();
        t_cxproveedor.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_cuentas').on('click','.editar',function(){
        var data = t_cxproveedor.row($(this).parents('tr')).data();

         if(t_cxproveedor.row(this).child.isShown()){
                var data = t_cxproveedor.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idcategoria").val(data.categoria_id);
        $("#txt_nombre_actual_categoria").val(data.categoria_nombre).trigger("change");
        $("#txt_nombre_nuevo_categoria").val(data.categoria_nombre);
       $("#cmb_estatus_editar").val(data.categoria_estatus).trigger("change");

    })




function listar_combo_compra() {
    $.ajax({
        url: "../controlador/cuentas_x_proveedor/control_combo_listar_compra.php",
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
       var no_cuota = $('#txt_cuota').val();
       var fecha_pago = $('#txt_fecha_pago').val();
        var valor_abono = $('#txt_valor').val();
      if(idcompra.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/cuentas_x_proveedor/control_registro_abonos_proveedor.php',
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
               // LimpiarCampos();
                    t_cxproveedor.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'error, no se completo el abono', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Abono no insertada','warning');
        }
      })
    }
