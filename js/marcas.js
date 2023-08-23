var t_marcas;
function listar_marcas(){
var idempresa =$("#txt_idempresa").val();
     t_marcas = $("#tabla_marca").DataTable({
        "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
        "autoWidth": false,
      "ajax":{
        "method":"POST",
            "url":"../controlador/marcas/control_marcas_listar.php",
            data: {
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
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
    t_marcas.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_marca').DataTable().page.info();
        t_marcas.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_marca').on('click','.editar',function(){
        var data = t_marcas.row($(this).parents('tr')).data();

         if(t_marcas.row(this).child.isShown()){
                var data = t_marcas.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idmarca").val(data.id);
        $("#txt_nombre_actual_marca").val(data.descripcion);
        $("#txt_nombre_nuevo_marca").val(data.descripcion);
       $("#cmb_estatus").val(data.estatus).trigger("change");

    })




/*desactivar y activar categoria*/ 
 $('#tabla_marca').on('click', '.activar', function() {
        var data = t_marcas.row($(this).parents('tr')).data();
        if (t_marcas.row(this).child.isShown()) {
            var data = t_marcas.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  la marca?',
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
    $('#tabla_marca').on('click', '.desactivar', function() {
        var data = t_marcas.row($(this).parents('tr')).data();
        if (t_marcas.row(this).child.isShown()) {
            var data = t_marcas.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar la marca?',
            text: "Una vez desactivada el producto no podrá tener ingresos o ventas",
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
            url: "../controlador/marcas/control_modificar_estatus_marcas.php",
            type: 'POST',
            data: {
                id: id,
                estatus: estatus,
            }
        }).done(function(resp) {
          // alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Marca " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_marcas.ajax.reload();

                    });
            }

        })
    }

  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }

    function Registrar_Marca() {
      var descripcion = $('#txt_marca').val();
    var idempresa =$("#txt_idempresa").val();
      if(descripcion.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/marcas/control_marcas_registro.php',
        type:'POST',
        data:{
          descripcion:descripcion,
          idempresa:idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Marcas Producto registrada exitosamente",
                    "success")
                .then((value)=>{
                    listar_marcas();
               LimpiarCampos();
                    t_marcas.ajax.reload();
                
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


    function Modificar_Marca() {
      var id = $('#txt_idmarca').val();
      var desc_actual = $('#txt_nombre_actual_marca').val();
      var desc_nueva = $('#txt_nombre_nuevo_marca').val();
      var estatus =$("#cmb_estatus").val();

      if(desc_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/marcas/control_modificar_marca_producto.php',
        type:'POST',
        data:{
          id:id,
          desc_actual:desc_actual,
          desc_nueva:desc_nueva,
          estatus:estatus
        }
      }).done(function(resp){
        //alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Marca editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_marcas();
                LimpiarCampos();
                t_marcas.ajax.reload();
                
                });
            } else {
             LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Marca ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Marca no editada','warning');
        }
      })
    }


   
 function LimpiarCampos() {
    $('#txt_marca').val("");
     $('#txt_nombre_nuevo_marca').val("");
 }