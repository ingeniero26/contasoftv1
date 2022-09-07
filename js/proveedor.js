var t_proveedor;
function listar_proveedor(){
var idempresa =$("#txt_idempresa").val();
     t_proveedor = $("#tabla_proveedor").DataTable({
	     	"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
          dom: 'Bfrtip',
        buttons: [
        'excel', 'csv', 'pdf', 'print', 'copy',
        ],
      "ajax":{
        "method":"POST",
		    "url":"../controlador/proveedor/control_proveedor_listar.php",
            data:{
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"proveedor"},
            {"data":"persona_nrodocumento"},
            {"data":"persona_tipodocumento"},
            {"data":"proveedor_razon_social"},
            {"data":"proveedor_num_contacto"},
            {"data":"nombre_ciudad"},
            {"data":"persona_telefono"},
            {"data":"persona_direccion"},
            {"data":"persona_correo"},
           
              {
                "data": "proveedor_estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "proveedor_estatus",
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
	t_proveedor.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_proveedor').DataTable().page.info();
        t_proveedor.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

    function listar_combo_ciudad() {
        var idempresa =$("#txt_idempresa").val();
           $.ajax({
               url:"../controlador/ciudades/control_combo_ciudad_listar.php",
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
                   $('#cmb_ciudad_ingreso').html(cadena);
                 $('#cmb_ciudad_proveedor').html(cadena);
               //  $('#cmb_categoria_producto').html(cadena);
               } else {
                   cadena+="<option value=''> No Hay datos</option>";
                   $('#cmb_ciudad_ingreso').html(cadena);
                  $('#cmb_ciudad_proveedor').html(cadena);
                 //  $('#cmb_categoria_producto').html(cadena);
               }
            })
       }

    function  Registrar_Proveedor() {
        var nombre =$('#txt_nombre').val();
        var apepat =$('#txt_apepat').val();
        var apemat =$('#txt_apemat').val();
        var numero =$('#txt_numero').val();
        var tipo_doc =$('#cmb_tipodocumento').val();
        var sexo =$('#cmb_sexo').val();
        var telefono =$('#txt_telefono').val();
        var direccion =$('#txt_direccion').val();
        var correo =$('#txt_correo').val();
        var razon_social =$('#txt_razon_social').val();
         var num_contacto =$('#txt_numero_contacto').val();
        var idciudad =$("#cmb_ciudad_proveedor").val();
         var idempresa =$("#txt_idempresa").val();
      if(nombre.length ==0 || apepat.length == 0 || apemat.length ==0 ||numero.length ==0
      || tipo_doc.length ==0) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
      url:'../controlador/proveedor/controlador_registro_proveedor.php',
      type:'POST',
      data:{
        nombre:nombre,
        apepat:apepat,
        apemat:apemat,
        numero:numero,
        tipo_doc:tipo_doc,
        sexo:sexo,
        telefono:telefono,
        direccion:direccion,
        correo:correo,
        razon_social:razon_social,
        num_contacto:num_contacto,
        idciudad:idciudad,
        idempresa:idempresa
      }
       }).done(function(resp){
        if(resp > 0) {
            
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Proveedor registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_proveedor();
             //  limpiar_campos();
                    t_proveedor.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Proveedor no insertado','warning');
        }
    })
  }

   // desactivar usuario
    $('#tabla_proveedor').on('click', '.activar', function() {
        var data = t_proveedor.row($(this).parents('tr')).data();
        if (t_proveedor.row(this).child.isShown()) {
            var data = t_proveedor.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar el proveedor?',
            text: "Una vez desactivado el proveedor  podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.proveedor_id, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_proveedor').on('click', '.desactivar', function() {
        var data = t_proveedor.row($(this).parents('tr')).data();
        if (t_proveedor.row(this).child.isShown()) {
            var data = t_proveedor.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el proveedor?',
            text: "Una vez desactivado el proveedor no podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.proveedor_id, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(proveedor_id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/proveedor/control_modificar_estatus.php",
            type: 'POST',
            data: {
                proveedor_id: proveedor_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Cliente " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_proveedor.ajax.reload();

                    });
            }

        })
    }
