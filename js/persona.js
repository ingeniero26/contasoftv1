var t_persona;
function listar_persona(){
 var idempresa =$("#txt_idempresa").val();
 var idtipo_tercero = document.getElementById('cmb_tipo_tercero_persona').value;
     t_persona = $("#tabla_persona").DataTable({
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
		    "url":"../controlador/persona/control_persona_listar.php",
             data:{
              
                idempresa:idempresa,
                idtipo_tercero:idtipo_tercero
                
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"tercero"},
            {"data":"tipo_contribuyente"},
            {"data":"persona_nrodocumento"},
            {"data":"persona_tipodocumento"},
            {"data":"tipo"},
            // {"data":"persona_sexo", 
            // render: function (data, type, row ) {
            //     if(data=='MASCULINO'){
            //         return "<i class='fa fa-male'></i>";                   
            //     }else{
            //       return "<i class='fa fa-female'></i>";               
            //     }
            //   }
            // },
            {"data":"persona_telefono"},
            {"data":"persona_direccion"},
           
           
            {"data":"persona_correo"},
            {"data":"persona_estatus",
            render: function (data, type, row ) {
                if(data=='ACTIVO'){
                    return "<span class='label label-success'>"+data+"</span>";                   
                }else{
                  return "<span class='label label-danger'>"+data+"</span>";                 
                }
              }
            }, 
            
            {
                "data": "persona_estatus",
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
	t_persona.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_persona').DataTable().page.info();
        t_persona.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_persona').on('click','.editar',function(){
        var data = t_persona.row($(this).parents('tr')).data();

         if(t_persona.row(this).child.isShown()){
                var data = t_persona.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idpersona").val(data.persona_id);
        $("#txt_nombre_editar").val(data.persona_nombre);
        $("#txt_apepat_editar").val(data.persona_apepat);
        $("#txt_apemat_editar").val(data.persona_apemat);
        $("#txt_numero_actual_editar").val(data.persona_nrodocumento);
        $("#txt_numero_nuevo_editar").val(data.persona_nrodocumento);
        $("#cmb_tipodocumento_editar").val(data.persona_tipodocumento).trigger("change");
        $("#cmb_sexo_editar").val(data.persona_sexo).trigger("change");
        $("#txt_telefono_editar").val(data.persona_telefono);
        $("#txt_direccion_editar").val(data.persona_direccion);
         $("#txt_correo_editar").val(data.persona_correo);
        $("#cmb_estatus_editar").val(data.persona_estatus).trigger("change");

    })



  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }


 $('#tabla_persona').on('click', '.activar', function() {
        var data = t_persona.row($(this).parents('tr')).data();
        if (t_persona.row(this).child.isShown()) {
            var data = t_persona.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar ?',
            text: "Una vez activado  podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.persona_id, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_persona').on('click', '.desactivar', function() {
        var data = t_persona.row($(this).parents('tr')).data();
        if (t_persona.row(this).child.isShown()) {
            var data = t_persona.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar ?',
            text: "Una vez desactivad no podrá verlo en el sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.persona_id, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(persona_id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/persona/control_modificar_estatus.php",
            type: 'POST',
            data: {
                persona_id: persona_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Persona " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_persona.ajax.reload();

                    });
            }

        })
    }
    function listar_combo_tipo_tercero_persona() {
        var idempresa =$("#txt_idempresa").val();
           $.ajax({
               url:"../controlador/proveedor/control_combo_tipo_tercero_persona.php",
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
                   $('#cmb_tipo_tercero_persona').html(cadena);
                 $('#cmb_tipo_tercero_registro').html(cadena);
               //  $('#cmb_categoria_producto').html(cadena);
               } else {
                   cadena+="<option value=''> No Hay datos</option>";
                   $('#cmb_tipo_tercero_persona').html(cadena);
                   $('#cmb_tipo_tercero_registro').html(cadena);
                 //  $('#cmb_categoria_producto').html(cadena);
               }
            })
       }

 function listar_combo_departamentos() {
    
        $.ajax({
            url:"../controlador/departamentos/control_combo_departamentos.php",
             type:'POST',
             
        }).done(function(resp){
       // alert(resp);
            var data = JSON.parse(resp);
            //console.log(resp);
           var cadena ="<option value=''>Seleccione...</option>";
            if(data.length>0) {
                for (var i = 0; i < data.length; i++) {
                    cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
                }
                $('#cmb_departamento').html(cadena);
            // $('#cmb_departamento_persona').html(cadena);
              //   var iddepartamento = $("#cmb_departamento_persona").val();
             //  listar_combo_ciudades(iddepartamento);
             //  alert('id depto' +iddepartamento);
             $('#cmb_departamento_registro').html(cadena);

            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_departamento').html(cadena);
             //  $('#cmb_departamento_persona').html(cadena);
             $('#cmb_departamento_registro').html(cadena);
            }
         })
    }


function  listar_combo_ciudades(iddepartamento) {
    
     $.ajax({
            url:"../controlador/ciudades/control_combo_ciudad.php",
             type:'POST',
             data:{
                iddepartamento:iddepartamento
             }
         }).done(function(resp){
       alert(resp);
            var data = JSON.parse(resp);
           
            var cadena ="";
            if(data.length>0) {
                for (var i = 0; i < data.length; i++) {
                    cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
                }
                $('#cmb_ciudad_persona').html(cadena);
               // $('#cmb_especialidad_editar').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_ciudad_persona').html(cadena);
              //  $('#cmb_especialidad_editar').html(cadena);
            }
         })
}




  function  Registrar_Persona() {
    var nombre =$('#txt_nombre').val();
    var apepat =$('#txt_apepat').val();
    var apemat =$('#txt_apemat').val();
    var tipo_cont =$('#cmb_tipo_contribuyente').val();
    var numero =$('#txt_numero').val();
    var tipo_doc =$('#cmb_tipodocumento').val();
    var sexo =$('#cmb_sexo').val();
    var telefono =$('#txt_telefono').val();
    var direccion =$('#txt_direccion').val();
    var correo =$('#txt_correo').val();
    var idempresa =$("#txt_idempresa").val();
    var id_tipo_tercero =$("#cmb_tipo_tercero_registro").val();

    if(nombre.length ==0 || apepat.length == 0 || apemat.length ==0 ||numero.length ==0
      || tipo_doc.length ==0) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
    }
    $.ajax({
      url:'../controlador/persona/controlador_registro_persona.php',
      type:'POST',
      data:{
        nombre:nombre,  apepat:apepat, apemat:apemat,tipo_cont:tipo_cont,
        numero:numero,
        tipo_doc:tipo_doc,  sexo:sexo, telefono:telefono,
         direccion:direccion,correo:correo,
        idempresa:idempresa,id_tipo_tercero:id_tipo_tercero
      }
    }).done(function(resp){
      if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Persona registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_persona();
               // LimpiarCampos();
               t_persona.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Persona no insertado','warning');
        }
    })
  }


  function Modificar_Persona() {
    var id_persona= $('#txt_idpersona').val();
    var nombre =$('#txt_nombre_editar').val();
    var apepat =$('#txt_apepat_editar').val();
    var apemat =$('#txt_apemat_editar').val();
    var numero_actual =$('#txt_numero_actual_editar').val();
    var numero_nuevo =$('#txt_numero_nuevo_editar').val();
    var tipo_doc =$('#cmb_tipodocumento_editar').val();

    var telefono =$('#txt_telefono_editar').val();
    var direccion =$('#txt_direccion_editar').val();
    var correo =$('#txt_correo_editar').val();
    var estatus =$('#cmb_estatus_editar').val();
     if(nombre.length ==0 || apepat.length == 0 || apemat.length ==0 || 
      numero_nuevo.length ==0    || tipo_doc.length ==0) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
    }
    $.ajax({
      url:'../controlador/persona/controlador_modificar_persona.php',
      type:'POST',
      data:{
        id_persona:id_persona,  nombre:nombre, apepat:apepat, apemat:apemat,
        numero_actual:numero_actual, numero_nuevo:numero_nuevo, tipo_doc:tipo_doc,
         telefono:telefono,  direccion:direccion, 
        correo:correo,  estatus:estatus
      }
    }).done(function(resp){
   
      if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Persona editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_persona();
               // LimpiarCampos();
               t_persona.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Persona no insertado','warning');
        }
    })
  }


 