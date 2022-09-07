var t_bodegas;
function listar_bodegas(){
var idempresa =$("#txt_idempresa").val();
     t_bodegas = $("#tabla_bodega").DataTable({
	     	"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/bodegas/control_bodega_listar.php",
            data:{
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_bodega"},
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
	t_bodegas.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_bodega').DataTable().page.info();
        t_bodegas.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}




// desactivar usuario
    $('#tabla_bodega').on('click', '.activar', function() {
        var data = t_bodegas.row($(this).parents('tr')).data();
        if (t_bodegas.row(this).child.isShown()) {
            var data = t_bodegas.row(this).data();
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
    $('#tabla_bodega').on('click', '.desactivar', function() {
        var data = t_bodegas.row($(this).parents('tr')).data();
        if (t_bodegas.row(this).child.isShown()) {
            var data = t_bodegas.row(this).data();
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
                        t_bodegas.ajax.reload();

                    });
            }

        })
    }


 function Registrar_Bodega() {
      var nombre_bodega = $('#txt_bodega').val();
      var idempresa =$("#txt_idempresa").val();
      if(nombre_bodega.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/bodegas/control_registro_bodega.php',
        type:'POST',
        data:{
          nombre_bodega:nombre_bodega,
          idempresa:idempresa
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Bodega registrada exitosamente",
                    "success")
                .then((value)=>{
                    listar_bodegas();
               // LimpiarCampos();
                    t_bodegas.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Bodega ya existe en el sistema, utilice otro', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Bodega no insertada','warning');
        }
      })
    }
