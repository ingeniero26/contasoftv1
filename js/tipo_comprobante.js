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
    $('#tabla_tipo_producto').on('click','.editar',function(){
        var data = t_tipo_comprobante.row($(this).parents('tr')).data();

         if(t_tipo_comprobante.row(this).child.isShown()){
                var data = t_tipo_comprobante.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idtipo_producto").val(data.id);
        $("#txt_tipo_producto_actual_editar").val(data.tipo_producto);
        $("#txt_tipo_producto_nuevo_editar").val(data.tipo_producto);
       $("#cmb_estatus_editar").val(data.estatus).trigger("change");

    })




/*desactivar y activar categoria*/ 
 $('#tabla_tipo_producto').on('click', '.activar', function() {
        var data = t_tipo_comprobante.row($(this).parents('tr')).data();
        if (t_tipo_comprobante.row(this).child.isShown()) {
            var data = t_tipo_comprobante.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  la categoria?',
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
    $('#tabla_tipo_producto').on('click', '.desactivar', function() {
        var data = t_tipo_comprobante.row($(this).parents('tr')).data();
        if (t_tipo_comprobante.row(this).child.isShown()) {
            var data = t_tipo_comprobante.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar tipo producto?',
            text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
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
            url: "../controlador/categoria/control_modificar_estatus.php",
            type: 'POST',
            data: {
                id: id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Categoria " + mensaje + " exitosamente",
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

    function Registrar_Tipo_Producto() {
      var tipo_producto = $('#txt_tipo_producto').val();
    var idempresa =$("#txt_idempresa").val();
      if(tipo_producto.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/tipo_producto/control_tipo_producto_registro.php',
        type:'POST',
        data:{
          tipo_producto:tipo_producto,
          idempresa:idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Tipo Producto registrada exitosamente",
                    "success")
                .then((value)=>{
                    listar_tipo_producto();
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


    function Modificar_Tipo_Producto() {
      var id = $('#txt_idtipo_producto').val();
      var tipo_actual = $('#txt_tipo_producto_actual_editar').val();
      var tipo_nueva = $('#txt_tipo_producto_nuevo_editar').val();
      var estatus =$("#cmb_estatus").val();

      if(tipo_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/tipo_producto/control_modificar_tipo_producto.php',
        type:'POST',
        data:{
          id:id,
          tipo_actual:tipo_actual,
          tipo_nueva:tipo_nueva,
          estatus:estatus
        }
      }).done(function(resp){
        alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Categoria editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_tipo_producto();
                LimpiarCampos();
                    t_tipo_comprobante.ajax.reload();
                
                });
            } else {
             LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Categoria ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Categoria no editado','warning');
        }
      })
    }


   
 function LimpiarCampos() {
    $('#txt_tipo_producto').val("");
     $('#txt_tipo_producto_nuevo_editar').val("");
 }