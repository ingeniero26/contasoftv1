var t_departamentos;
function listar_departamentos(){

     t_departamentos = $("#tabla_deptos").DataTable({
	     	"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/departamentos/control_departamentos_listar.php",
           
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_depto"},
            {"data":"fregistro"},
           
           
              {
                "data": "estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
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
        	$($(nRow).find("td")[1]).css('text-align', 'center' );
          $($(nRow).find("td")[4]).css('text-align', 'center' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_departamentos.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_deptos').DataTable().page.info();
        t_departamentos.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}
 // modificar datos del procedimiento
    $('#tabla_deptos').on('click','.editar',function(){
        var data = t_departamentos.row($(this).parents('tr')).data();

         if(t_departamentos.row(this).child.isShown()){
                var data = t_departamentos.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_iddepartamento").val(data.id);
        $("#txt_nombre_actual").val(data.nombre_depto).trigger("change");
        $("#txt_nombre_nuevo").val(data.nombre_depto);
       $("#cmb_estatus").val(data.estatus).trigger("change");

    })



// desactivar usuario
    $('#tabla_deptos').on('click', '.activar', function() {
        var data = t_departamentos.row($(this).parents('tr')).data();
        if (t_departamentos.row(this).child.isShown()) {
            var data = t_departamentos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar la bodega?',
            text: "Una vez desactivado la bodega  podrá ingresar al sistema",
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
    $('#tabla_deptos').on('click', '.desactivar', function() {
        var data = t_departamentos.row($(this).parents('tr')).data();
        if (t_departamentos.row(this).child.isShown()) {
            var data = t_departamentos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar la bodega?',
            text: "Una vez desactivado la bodega no podrá ingresar al sistema",
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
            url: "../controlador/bodegas/control_modificar_estatus.php",
            type: 'POST',
            data: {
                id: id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Bodega " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_departamentos.ajax.reload();

                    });
            }

        })
    }


 function Registrar_Departamento() {
      var nombre_departamento = $('#txt_nombre').val();
      if(nombre_departamento.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/departamentos/control_registro_departamentos.php',
        type:'POST',
        data:{
            nombre_departamento:nombre_departamento
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Departamento registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_departamentos();
               // LimpiarCampos();
                    t_departamentos.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Departamento ya existe en el sistema, utilice otro', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Departamento no insertada','warning');
        }
      })
    }


function Modificar_Departamento(){
    var id = $('#txt_iddepartamento').val();
      var departamento_actual = $('#txt_nombre_actual').val();
      var departamento_nueva = $('#txt_nombre_nuevo').val();
      var estatus =$("#cmb_estatus").val();

      if(departamento_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/departamentos/control_modificar_departamento.php',
        type:'POST',
        data:{
          id:id,
          departamento_actual:departamento_actual,
          departamento_nueva:departamento_nueva,
          estatus:estatus
        }
      }).done(function(resp){
        alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Departamento editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_departamentos();
                LimpiarCampos();
                    t_categoria.ajax.reload();
                
                });
            } else {
             LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Departamento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Departamento no editado','warning');
        }
      })
}