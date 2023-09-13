var t_tipo_comprobante;
function listar_tipo_comprobante(){
var idempresa =$("#txt_idempresa").val();
     t_tipo_comprobante = $("#tabla_tipo_comprobante").DataTable({
        "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
        "autoWidth": false,
      "ajax":{
        "method":"POST",
            "url":"../controlador/tipo_comprobante/control_tipo_comprobante_listar.php",
            data: {
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"abreviatura"},
            {"data":"descripcion"},
            {"data":"fregistro"},
            {"data":"estatus",
            render: function (data, type, row ) {
                if(data=='ACTIVO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-danger'>"+data+"</span>";                 
                }
              }
            }, 

              {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
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
    t_tipo_comprobante.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_tipo_comprobante').DataTable().page.info();
        t_tipo_comprobante.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_tipo_comprobante').on('click','.editar',function(){
        var data = t_tipo_comprobante.row($(this).parents('tr')).data();

         if(t_tipo_comprobante.row(this).child.isShown()){
                var data = t_tipo_comprobante.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idtipo_comprobante").val(data.id);
        $("#txt_abreviatura_editar").val(data.abreviatura);
        $("#txt_abreviatura_editar").val(data.abreviatura);
        $("#txt_descripcion_editar").val(data.descripcion);
       $("#cmb_estatus_editar").val(data.estatus).trigger("change");

    })




/*desactivar y activar categoria*/ 
 $('#tabla_tipo_comprobante').on('click', '.activar', function() {
        var data = t_tipo_comprobante.row($(this).parents('tr')).data();
        if (t_tipo_comprobante.row(this).child.isShown()) {
            var data = t_tipo_comprobante.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  tipo comprobante?',
            text: "Activacion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.id, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_tipo_comprobante').on('click', '.desactivar', function() {
        var data = t_tipo_comprobante.row($(this).parents('tr')).data();
        if (t_tipo_comprobante.row(this).child.isShown()) {
            var data = t_tipo_comprobante.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar tipo comprobante?',
            text: "Una vez desactivado esto afectará modulos del sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.id, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/tipo_comprobante/control_modificar_estatus.php",
            type: 'POST',
            data: {
                id: id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Tipo Comprobante " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_tipo_comprobante.ajax.reload();

                    });
            }

        })
    }






  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }

    function Registrar_Comprobante() {
      var abreviatura = $('#txt_abreviatura').val();
      var descripcion = $('#txt_descripcion').val();
      var idempresa =$("#txt_idempresa").val();
      if(abreviatura.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/tipo_comprobante/control_tipo_comprobante_registro.php',
        type:'POST',
        data:{
            abreviatura:abreviatura,
            descripcion:descripcion,
           idempresa:idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Tipo Comprobante registrada exitosamente",
                    "success")
                .then((value)=>{
                    listar_tipo_comprobante();
               LimpiarCampos();
                    t_tipo_comprobante.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Tipo Producto ya existe en el sistema, utilice otro', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Tipo Producto no insertada','warning');
        }
      })
    }


    function Modificar_Comprobante() {
      var id = $('#txt_idtipo_comprobante').val();
      var tipo_actual = $('#txt_abreviatura_actual_editar').val();
      var tipo_nueva = $('#txt_abreviatura_nuevo_editar').val();
      var descripcion = $('#txt_descripcion_editar').val();
      var estatus =$("#cmb_estatus").val();

      if(tipo_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/tipo_comprobante/control_modificar_tipo_comprobante.php',
        type:'POST',
        data:{
          id:id,
          tipo_actual:tipo_actual,
          tipo_nueva:tipo_nueva,
          descripcion:descripcion
        }
      }).done(function(resp){
        alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Comprobante editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_tipo_comprobante();
                LimpiarCampos();
                    t_tipo_comprobante.ajax.reload();
                
                });
            } else {
             LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Comprobante ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Comprobante no editado','warning');
        }
      })
    }


   
 function LimpiarCampos() {
    $('#txt_tipo_producto').val("");
     $('#txt_tipo_producto_nuevo_editar').val("");
 }