var t_arl;

function listar_arl() {
    var idempresa =$("#txt_idempresa").val();
    t_arl = $('#tabla_arl').DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        ajax: {
            method: "POST",
            url: "../controlador/configuracion/control_listar_arl.php",
            data: {
                idempresa:idempresa
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "NitARL" },
            { "data": "NomARL" },
            { "data": "CiudadARL" },
            { "data": "DirARL" },
            { "data": "TelARL" },
            { "data": "EmailArl" },
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
        "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_arl.on('draw.dt', function() {
        var PageInfo = $('#tabla_arl').DataTable().page.info();
        t_arl.column(0, { page: 'current' }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_arl').on('click', '.editar', function() {
    var data = t_arl.row($(this).parents('tr')).data();

    if (t_arl.row(this).child.isShown()) {
        var data = t_arl.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_idarl").val(data.IdARL);
    $("#txt_nit_actual_nit").val(data.NitARL).trigger("change");
    $("#txt_nit_nuevo_nit").val(data.NitARL);
    $("#txt_nombre_arl_editar").val(data.NomARL);
    $("#txt_ciudad_arl_editar").val(data.CiudadARL);
    $("#txt_direccion_arl_editar").val(data.DirARL);
    $("#txt_tel_arl_editar").val(data.TelARL);
    $("#txt_correo_arl_editar").val(data.EmailArl);
   // $("#cmb_estatus_editar").val(data.categoria_estatus).trigger("change");

})




/*desactivar y activar arl*/
$('#tabla_arl').on('click', '.activar', function() {
        var data = t_arl.row($(this).parents('tr')).data();
        if (t_arl.row(this).child.isShown()) {
            var data = t_arl.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  la arl?',
            text: "Activacion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdARL, 'ACTIVO');
            }
        })
    })
    // function activar usuario
$('#tabla_arl').on('click', '.desactivar', function() {
    var data = t_arl.row($(this).parents('tr')).data();
    if (t_arl.row(this).child.isShown()) {
        var data = t_arl.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar la arl?',
        text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.IdARL, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(IdARL, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controlador/configuracion/control_modificar_estatus_arl.php",
        type: 'POST',
        data: {
            IdARL: IdARL,
            estatus: estatus,
        }
    }).done(function(resp) {
       alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "ARL " + mensaje + " exitosamente",
                    "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_arl.ajax.reload();

                });
        }

    })
}













function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}


function Registrar_Arl() {
    var nit = $('#txt_nit').val();
    var nombre = $('#txt_nombre_arl').val();
    var ciudad = $('#txt_ciudad_arl').val();
    var direccion = $('#txt_direccion_arl').val();
    var telefono = $('#txt_tel_arl').val();
    var correo = $('#txt_correo_arl').val();

    if (nit.length == 0 || nombre.legth == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning');
    }
    $.ajax({
        url: '../controlador/configuracion/control_arl_registro.php',
        type: 'POST',
        data: {
            nit: nit,
            nombre: nombre,
            ciudad: ciudad,
            direccion: direccion,
            telefono: telefono,
            correo: correo,
        }
    }).done(function(resp) {
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "ARL registrada exitosamente",
                        "success")
                    .then((value) => {
                        listar_arl();
                        LimpiarCampos();
                        t_arl.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'ARL ya existe en el sistema, utilice otro', 'warning');
            }
        } else {
            return Swal.fire('Mensaje de error', 'ARL no insertada', 'warning');
        }
    })
}



   function Modificar_Arl() {
      var id = $('#txt_idarl').val();
      var nit_actual = $('#txt_nit_actual_nit').val();
      var nit_nueva = $('#txt_nit_nuevo_nit').val();

      var nombre = $('#txt_nombre_arl_editar').val();
      var ciudad = $('#txt_ciudad_arl_editar').val();
      var direccion = $('#txt_direccion_arl_editar').val();
      var telefono = $('#txt_tel_arl_editar').val();
      var email = $('#txt_correo_arl_editar').val();
      

      if(nit_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/configuracion/control_modificar_arl.php',
        type:'POST',
        data:{
          id:id,
          nit_actual:nit_actual,
          nit_nueva:nit_nueva,
          nombre:nombre,
          ciudad:ciudad,
          direccion:direccion,
          telefono:telefono,
          email:email
        }
      }).done(function(resp){
        alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","ARL editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_arl();
                LimpiarCampos();
                    t_arl.ajax.reload();
                
                });
            } else {
             LimpiarCampos();
                return Swal.fire('Mensaje de error', 'ARL ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','ARL no editado','warning');
        }
      })
    }
