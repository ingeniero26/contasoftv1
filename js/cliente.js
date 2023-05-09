var t_cliente;
function listar_cliente(){
 var idempresa =$("#txt_idempresa").val();

     t_cliente = $("#tabla_cliente").DataTable({
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
        type:"POST",
		    url:"../controlador/cliente/control_cliente_listar.php",
            data:{
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"cliente"},
            {"data":"persona_nrodocumento"},
            {"data":"persona_tipodocumento"},
             {"data":"tipo_contribuyente"},
            {"data":"persona_sexo", 
            render: function (data, type, row ) {
                if(data=='MASCULINO'){
                    return "<i class='fa fa-male'></i>";                   
                }else{
                  return "<i class='fa fa-female'></i>";               
                }
              }
            },
            {"data":"nombre_ciudad"},
            {"data":"persona_telefono"},
            
            {"data":"persona_direccion"},
            
           {"data":"persona_correo"},
              {
                "data": "cliente_estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            
            {
                "data": "cliente_estatus",
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
	t_cliente.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_cliente').DataTable().page.info();
        t_cliente.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
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
               //  $('#cmb_categoria_editar').html(cadena);
               //  $('#cmb_categoria_producto').html(cadena);
               } else {
                   cadena+="<option value=''> No Hay datos</option>";
                   $('#cmb_ciudad_ingreso').html(cadena);
                 //  $('#cmb_categoria_editar').html(cadena);
                 //  $('#cmb_categoria_producto').html(cadena);
               }
            })
       }





    function  Registrar_Cliente() {
        var nombre =$('#txt_nombre').val();
        var apepat =$('#txt_apepat').val();
        var apemat =$('#txt_apemat').val();
        var numero =$('#txt_numero').val();
        var tipo_doc =$('#cmb_tipodocumento').val();
        var tipo_contribuyente =$('#cmb_tipo_contribuyente').val();
       // var sexo =$('#cmb_sexo').val();
        var telefono =$('#txt_telefono').val();
        var direccion =$('#txt_direccion').val();
        var correo =$('#txt_correo').val();
         var idciudad =$("#cmb_ciudad_ingreso").val();
        var idempresa =$("#txt_idempresa").val();
       
      if(nombre.length ==0 || apepat.length == 0 || apemat.length ==0 ||numero.length ==0
      || tipo_doc.length ==0) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
      url:'../controlador/cliente/controlador_registro_cliente.php',
      type:'POST',
      data:{
        nombre:nombre,
        apepat:apepat,
        apemat:apemat,
        numero:numero,
        tipo_doc:tipo_doc,
        tipo_contribuyente:tipo_contribuyente,
        //sexo:sexo,
        telefono:telefono,
        direccion:direccion,
        correo:correo,
         idciudad:idciudad,
        idempresa:idempresa
       
      }
       }).done(function(resp){
       // alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Cliente registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_cliente();
               limpiar_campos();
                    t_cliente.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Cliente no insertado','warning');
        }
    })
  }



 // desactivar usuario
    $('#tabla_cliente').on('click', '.activar', function() {
        var data = t_cliente.row($(this).parents('tr')).data();
        if (t_cliente.row(this).child.isShown()) {
            var data = t_cliente.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar el cliente?',
            text: "Una vez desactivado el cliente  podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.idcliente, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_cliente').on('click', '.desactivar', function() {
        var data = t_cliente.row($(this).parents('tr')).data();
        if (t_cliente.row(this).child.isShown()) {
            var data = t_cliente.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el cliente?',
            text: "Una vez desactivado el cliente no podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.idcliente, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(idcliente, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/cliente/control_modificar_estatus.php",
            type: 'POST',
            data: {
                idcliente: idcliente,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Cliente " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_cliente.ajax.reload();

                    });
            }

        })
    }


function limpiar_campos(){
        $('#txt_nombre').val();
        $('#txt_apepat').val();
        $('#txt_apemat').val();
        $('#txt_numero').val();
        $('#cmb_tipodocumento').val();
        $('#cmb_sexo').val();
        $('#txt_telefono').val();
        $('#txt_direccion').val();
}