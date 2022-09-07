var t_unidad_medida;
function listar_unidad_medida(){
var idempresa =$("#txt_idempresa").val();
     t_unidad_medida = $("#tabla_unidad").DataTable({
            "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
        "autoWidth": false,
      "ajax":{
        "method":"POST",
            "url":"../controlador/unidad_medida/control_unidad_listar.php",
            data:{
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"unidad_nombre"},
            {"data":"unidad_abreviatura"},
            {"data":"unidad_fregistro"},
            {"data":"unidad_estatus",
            render: function (data, type, row ) {
                if(data=='ACTIVO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-danger'>"+data+"</span>";                 
                }
              }
            }, 

            {
                "data": "unidad_estatus",
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
    t_unidad_medida.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_unidad').DataTable().page.info();
        t_unidad_medida.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_unidad').on('click','.editar',function(){
        var data = t_unidad_medida.row($(this).parents('tr')).data();

         if(t_unidad_medida.row(this).child.isShown()){
                var data = t_unidad_medida.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idunidad").val(data.unidad_id);
        $("#txt_nombre_actual_unidad").val(data.unidad_nombre).trigger("change");
        $("#txt_nombre_nuevo_unidad").val(data.unidad_nombre);
        $("#txt_abreviatura_unidad_editar").val(data.unidad_abreviatura);
       $("#cmb_estatus_editar").val(data.unidad_estatus).trigger("change");

    })




  $('#tabla_unidad').on('click', '.activar', function() {
        var data = t_unidad_medida.row($(this).parents('tr')).data();
        if (t_unidad_medida.row(this).child.isShown()) {
            var data = t_unidad_medida.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar la unidad?',
            text: "Una vez desactivado la unidad  podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.unidad_id, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_unidad').on('click', '.desactivar', function() {
        var data = t_unidad_medida.row($(this).parents('tr')).data();
        if (t_unidad_medida.row(this).child.isShown()) {
            var data = t_unidad_medida.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar la unidad?',
            text: "Una vez desactivada la unidad no podrá verla en el sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.unidad_id, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(unidad_id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/unidad_medida/control_modificar_estatus.php",
            type: 'POST',
            data: {
                unidad_id: unidad_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Bodega " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_unidad_medida.ajax.reload();

                    });
            }

        })
    }



  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }

    function Registrar_Unidad() {
      var unidad = $('#txt_nombre_unidad').val();
      var abreviatura =$('#txt_abreviatura_unidad').val();
      var idempresa =$("#txt_idempresa").val();
      if(unidad.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/unidad_medida/control_registro_unidad.php',
        type:'POST',
        data:{
          unidad:unidad,
          abreviatura:abreviatura,
          idempresa: idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Unidad de medida registrada exitosamente",
                    "success")
                .then((value)=>{
                    listar_unidad_medida();
               LimpiarCampos();
                    t_unidad_medida.ajax.reload();
                
                });
            } else {
                LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Unidad de medida ya existe en el sistema, utilice otro', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Unidad de medida no insertada','warning');
        }
      })
    }


  function LimpiarCampos() {
     $('#txt_nombre_unidad').val("");
  }

    function Modificar_Unidad() {
      var id = $('#txt_idunidad').val();
      var unidad_actual = $('#txt_nombre_actual_unidad').val();
      var unidad_nueva = $('#txt_nombre_nuevo_unidad').val();
      var abreviatura =$('#txt_abreviatura_unidad_editar').val();
      var estatus =$("#cmb_estatus").val();

      if(unidad_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/unidad_medida/control_modificar_unidad.php',
        type:'POST',
        data:{
          id:id,
          unidad_actual:unidad_actual,
          unidad_nueva:unidad_nueva,
          abreviatura:abreviatura,
          estatus:estatus
        }
      }).done(function(resp){
        //alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","UNIDAD editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_unidad_medida();
               // LimpiarCampos();
                    t_unidad_medida.ajax.reload();
                
                });
            } else {
              //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'UNIDAD ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Categoria no editado','warning');
        }
      })
    }