var t_rol;
function listar_rol(){
var idempresa =$("#txt_idempresa").val();
     t_rol = $("#tabla_rol").DataTable({
	     	"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/rol/controlador_rol_listar.php",
            data:{
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"rol_nombre"},
            {"data":"rol_fregistro"},
            {"data":"rol_estatus",
            render: function (data, type, row ) {
                if(data=='ACTIVO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-danger'>"+data+"</span>";                 
                }
              }
            }, 

            {
                "data": "rol_estatus",
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
	t_rol.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_rol').DataTable().page.info();
        t_rol.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_rol').on('click','.editar',function(){
        var data = t_rol.row($(this).parents('tr')).data();

         if(t_rol.row(this).child.isShown()){
                var data = t_rol.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idrol").val(data.rol_id);
        $("#txt_nombre_rol_actual").val(data.rol_nombre).trigger("change");
        $("#txt_nombre_rol_nuevo").val(data.rol_nombre);
       $("#cmb_estatus_editar").val(data.rol_estatus).trigger("change");

    })



/*desactivar y activar categoria*/ 
 $('#tabla_rol').on('click', '.activar', function() {
        var data = t_rol.row($(this).parents('tr')).data();
        if (t_rol.row(this).child.isShown()) {
            var data = t_rol.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  el rol?',
            text: "Activacion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.rol_id, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_rol').on('click', '.desactivar', function() {
        var data = t_rol.row($(this).parents('tr')).data();
        if (t_rol.row(this).child.isShown()) {
            var data = t_rol.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el rol?',
            text: "Una vez desactivado el rol no podrá tener ingresos o ventas",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.rol_id, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(rol_id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/rol/control_modificar_estatus.php",
            type: 'POST',
            data: {
                rol_id: rol_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "ROL " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_rol.ajax.reload();

                    });
            }

        })
    }





  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }

    function Registrar_Rol() {
      var rol = $('#txt_nombre_rol').val();
      var idempresa =$("#txt_idempresa").val();
      if(rol.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/rol/controlador_registro_rol.php',
        type:'POST',
        data:{
          rol:rol,
          idempresa:idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Rol registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_rol();
               // LimpiarCampos();
                    t_rol.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Rol ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Rol no insertado','warning');
        }
      })
    }


    function Modificar_Rol() {
      var id = $('#txt_idrol').val();
      var rol_actual = $('#txt_nombre_rol_actual').val();
      var rol_nuevo = $('#txt_nombre_rol_nuevo').val();
      var estatus =$("#cmb_estatus_editar").val();

      if(rol_nuevo.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/rol/controlador_modificar_rol.php',
        type:'POST',
        data:{
          id:id,
          rol_actual:rol_actual,
          rol_nuevo:rol_nuevo,
          estatus:estatus
        }
      }).done(function(resp){
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Rol editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_rol();
               // LimpiarCampos();
                    table.ajax.reload();
                
                });
            } else {
              //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Rol ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Rol no editado','warning');
        }
      })
    }