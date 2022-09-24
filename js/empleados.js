var t_empleado;
function listar_empleados(){
    var idempresa =$("#txt_idempresa").val();
     t_empleado = $("#tabla_empleados").DataTable({
	     	"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/nomina/control_empleado_listar.php",
            data:{
                idempresa:idempresa
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"CCEmp"},
            {"data":"NomEmp"},
            {"data":"DirEmp"},
            {"data":"TelEmp"},
            {"data":"CelEmp"},
            {"data":"EmailEmp"},
            {"data":"fecha_nacimiento"},
            {"data":"NomARL"},
            {"data":"NomEPS"},
            {"data":"NomPension"},
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
	t_empleado.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_empleados').DataTable().page.info();
        t_empleado.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}


  // desactivar empleado
    $('#tabla_empleados').on('click', '.activar', function() {
        var data = t_empleado.row($(this).parents('tr')).data();
        if (t_empleado.row(this).child.isShown()) {
            var data = t_empleado.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar el empleado?',
            text: "Una vez activado podra ingresar",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdEmp, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_empleados').on('click', '.desactivar', function() {
        var data =t_empleado.row($(this).parents('tr')).data();
        if (t_empleado.row(this).child.isShown()) {
            var data = t_empleado.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el empleado?',
            text: "Una vez desactivado el empleado no podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdEmp, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(IdEmp, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/nomina/control_modificar_estatus.php",
            type: 'POST',
            data: {
                IdEmp: IdEmp,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Empleado " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_empleado.ajax.reload();

                    });
            }

        })
    }


function listar_combo_arl() {
    $.ajax({
        url: "../controlador/nomina/control_combo_arl_listar.php",
        type: 'POST'
    }).done(function(resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_arl').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_arl').html(cadena);

        }
    })
}

function listar_combo_eps() {
    $.ajax({
        url: "../controlador/nomina/control_combo_eps_listar.php",
        type: 'POST'
    }).done(function(resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_eps').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_eps').html(cadena);

        }
    })
}

function listar_combo_pension() {
    $.ajax({
        url: "../controlador/nomina/control_combo_pension_listar.php",
        type: 'POST'
    }).done(function(resp) {
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena = "";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cmb_pension').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_pension').html(cadena);

        }
    })
}


function listar_combo_rol() {
    $.ajax({
        url:"../controlador/usuario/controlador_combo_rol_listar.php",
         type:'POST'
    }).done(function(resp){
        //alert(resp);
        var data = JSON.parse(resp);
        //console.log(resp);
        var cadena ="";
        if(data.length>0) {
            for (var i = 0; i < data.length; i++) {
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
            }
            $('#cmb_rol').html(cadena);
            $('#cmb_rol_editar').html(cadena);
        } else {
            cadena+="<option value=''> No Hay datos</option>";
            $('#cmb_rol').html(cadena);
            $('#cmb_rol_editar').html(cadena);
        }
    })
}

function Registrar_Empleado() {
    var numero =$('#txt_numero').val();
    var nombre =$('#txt_nombre').val();
    var direccion =$('#txt_direccion').val();
    var telefono =$('#txt_telefono').val();
    var celular =$('#txt_cel').val();
    var correo =$('#txt_correo').val();
    var fnac =$('#txtfnac').val();
    var idarl =$('#cmb_arl').val();
    var ideps =$('#cmb_eps').val();
    var idpension =$('#cmb_pension').val();
     var usu = $("#txt_usu").val();
     var contra = $("#txt_contra").val();
     var rol = $("#cmb_rol").val();
    

    if(numero.length ==0 || nombre.length == 0 ) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
    }
    $.ajax({
      url:'../controlador/nomina/controlador_registro_empleado.php',
      type:'POST',
      data:{
        numero:numero,
        nombre:nombre,
        direccion:direccion,
        telefono:telefono,
        celular:celular,
        correo:correo,
        fnac:fnac,
        idarl:idarl,
        ideps:ideps,
        idpension:idpension,
        usu:usu,
        contra:contra,
        rol:rol
        
      }
    }).done(function(resp){
        alert(resp);
      if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Empleado registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_empleados();
               // LimpiarCampos();
                    t_empleado.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Empleado no insertado','warning');
        }
    })
}