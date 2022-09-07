var t_pagos;

function listar_gastos() {
    var finicio = document.getElementById('txt_finicio').value;
    var ffin = document.getElementById('txt_ffin').value;
    var idempresa =$("#txt_idempresa").val();
 //   alert(finicio +" " +ffin);
 t_pagos = $("#tabla_listado_pagos").DataTable({
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
            "url": "../controlador/gastos/control_pagos.php",
            data: {
                finicio: finicio,
                ffin: ffin,
                idempresa:idempresa
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "descripcion" },
            { "data": "fecha_gasto" },
            { "data": "valor" },
            { "data": "recibo" },
            { "data": "caja" },
            { "data": "observaciones" },
           
           
            {
                "data": "estado",
                render: function(data, type, row) {
                    if (data == 'CANCELADA') {
                        return "<span class='label label-success m-r-5 m-b-5'>" + data + "</span>";
                    } else if (data == 'ANULADA') {
                        return "<span class='label label-danger m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='label label-warning m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },
            { "data": "usuario_nombre" },
           

            {
                "defaultContent": "<button style='font-size:13px;' type='button' class='imprimir btn btn-primary'><i class='fa fa-print'></i></button> &nbsp;<button style='font-size:13px;' type='button' class='eliminar btn btn-danger'><i class='fa fa-trash'></i></button>"
            }

        ],
        "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_pagos.on('draw.dt', function() {
        var PageInfo = $('#tabla_listado_pagos').DataTable().page.info();
        t_pagos.column(0, { page: 'current' }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}



$('#tabla_listado_pagos').on('click', '.eliminar', function() {
    var data = t_pagos.row($(this).parents('tr')).data();
    if (t_pagos.row(this).child.isShown()) {
        var data = t_pagos.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de eliminar el gasto?',
        text: "Eliminado",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.idGasto);
        }
    })
})


function Modificar_Estatus(idGasto,) {
  
    $.ajax({
        url: "../controlador/gastos/control_modificar_estado_pago.php",
        type: 'POST',
        data: {
            idGasto: idGasto
           
        }
    }).done(function(resp) {
       alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "Gasto ELIMINADO",
                    "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_pagos.ajax.reload();

                });
        }

    })
}


/*combo tipo pagos*/
function listar_combo_tipo_pagos() {
    var idempresa =$("#txt_idempresa").val();
    $.ajax({
        url: "../controlador/gastos/control_combo_tipo_pagos.php",
        type: 'POST', 
        data : {
            idempresa:idempresa
        }
    }).done(function(resp) {
      //  alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_tipo_pago').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_tipo_pago').html(cadena);

        }
    })
}

function listar_combo_bodega() {
    var idempresa =$("#txt_idempresa").val();
       $.ajax({
           url:"../controlador/bodegas/control_combo_bodegas.php",
            type:'POST',
            data:{
               idempresa:idempresa
            }
       }).done(function(resp){
       //alert(resp);
           var data = JSON.parse(resp);
           //console.log(resp);
           var cadena ="<option value=''>Seleccione...</option>";
           if(data.length>0) {
               for (var i = 0; i < data.length; i++) {
                   cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
               }
               $('#cmb_bodega').html(cadena);
             $('#cmb_bodega_ingreso').html(cadena);
           
           } else {
               cadena+="<option value=''> No Hay datos</option>";
               $('#cmb_bodega').html(cadena);
            $('#cmb_bodega_ingreso').html(cadena);
           }
        })
   }



   function Agregar_Pago() {
    var idtipo_gasto =$('#cmb_tipo_pago').val();
    var fecha_gasto =$('#txt_fecha_pago').val();
    var valor =$('#txt_valor').val();
    var recibo =$('#txt_recibo').val();
    var idcaja =$('#cmb_caja_ingreso').val();
    var observaciones =$('#txt_observaciones').val();
    var estado =$('#cmb_estado').val();
     var idempresa =$("#txt_idempresa").val();
     var idusuario =$("#txt_idprincipal").val();
  if(idtipo_gasto.length ==0 || fecha_gasto.length == 0 || valor.length ==0
     ||recibo.length ==0
  || idcaja.length ==0) {
  return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
  }
  $.ajax({
  url:'../controlador/gastos/controlador_registro_gastos.php',
  type:'POST',
  data:{
    idtipo_gasto:idtipo_gasto,
    fecha_gasto:fecha_gasto,
    valor:valor,
    recibo:recibo,
    idcaja:idcaja,
    observaciones:observaciones,
    estado:estado,
    idusuario:idusuario,
    idempresa:idempresa
  }
   }).done(function(resp){
    if(resp > 0) {
        
        if(resp==1) {
            $('#modal_registro').modal('hide');
            Swal.fire("Mensaje  de confirmaciòn","Gastos registrado exitosamente",
                "success")
            .then((value)=>{
                listar_gastos();
         //  limpiar_campos();
                t_pagos.ajax.reload();
            
            });
        } else {
           // LimpiarCampos();
            return Swal.fire('Mensaje de error', 'Gastos ya existe en el sistema, utilice otro', 'warning'
              );
        }
    }else {
        return Swal.fire('Mensaje de error','Gastos no insertado','warning');
    }
})
   }