var t_tipo_gastos;
function listar_tipo_gastos(){
var idempresa =$("#txt_idempresa").val();
     t_tipo_gastos = $("#tabla_tipo_gastos").DataTable({
        "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
        "autoWidth": false,
      "ajax":{
        "method":"POST",
            "url":"../controlador/gastos/tipo_gastos_listar.php",
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
    t_tipo_gastos.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_tipo_gastos').DataTable().page.info();
        t_tipo_gastos.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_tipo_gastos').on('click','.editar',function(){
        var data = t_tipo_gastos.row($(this).parents('tr')).data();

         if(t_tipo_gastos.row(this).child.isShown()){
                var data = t_tipo_gastos.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idtipo_pago").val(data.id);
      //  $("#txt_nombre_actual_categoria").val(data.descripcion).trigger("change");
        $("#txt_tipo_editar").val(data.descripcion);
      // $("#cmb_estatus_editar").val(data.categoria_estatus).trigger("change");

    })




/*desactivar y activar categoria*/ 
 $('#tabla_tipo_gastos').on('click', '.activar', function() {
        var data = t_tipo_gastos.row($(this).parents('tr')).data();
        if (t_tipo_gastos.row(this).child.isShown()) {
            var data = t_tipo_gastos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  el tipo pago?',
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
    $('#tabla_tipo_gastos').on('click', '.desactivar', function() {
        var data = t_tipo_gastos.row($(this).parents('tr')).data();
        if (t_tipo_gastos.row(this).child.isShown()) {
            var data = t_tipo_gastos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el tipo pago?',
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
            url:"../controlador/gastos/tipo_gastos_modificar_estatus.php",
            type: 'POST',
            data: {
                id: id,
                estatus: estatus,
            }
        }).done(function(resp) {
          // alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "tipo pago " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_tipo_gastos.ajax.reload();

                    });
            }

        })
    }













  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }

    function Registrar_Tipo_Pago() {
      var tipo_gasto = $('#txt_tipo').val();
    var idempresa =$("#txt_idempresa").val();
      if(tipo_gasto.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        "url":"../controlador/gastos/tipo_gastos_registro.php",
        type:'POST',
        data:{
            tipo_gasto:tipo_gasto,
          idempresa:idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Tipo Gasto registrada exitosamente",
                    "success")
                .then((value)=>{
                    listar_tipo_gastos();
               LimpiarCampos();
                    t_tipo_gastos.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Tipo Gasto ya existe en el sistema, utilice otro', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Tipo Gasto no insertada','warning');
        }
      })
    }


    function Modificar_Categoria() {
      var id = $('#txt_idcategoria').val();
      var categoria_actual = $('#txt_nombre_actual_categoria').val();
      var categoria_nueva = $('#txt_nombre_nuevo_categoria').val();
      var estatus =$("#cmb_estatus").val();

      if(categoria_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/categoria/control_modificar_categoria.php',
        type:'POST',
        data:{
          id:id,
          categoria_actual:categoria_actual,
          categoria_nueva:categoria_nueva,
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
                    listar_categoria();
                LimpiarCampos();
                    t_tipo_gastos.ajax.reload();
                
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
    $('#txt_nombre').val("");
     $('#txt_nombre_nuevo_categoria').val("");
 }