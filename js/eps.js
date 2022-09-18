var t_eps;
/*SELECT
    `IdEPS`
    , `NitEPS`
    , `NomEPS`
    , `CiudadEPS`
    , `DirEPS`
    , `TelEPS`
    , `EmailEps`
    , `fregistro`
    , `estado`
FROM
    `eps`;*/

function listar_eps() {
    var idempresa =$("#txt_idempresa").val();
    t_eps = $("#tabla_eps").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
        "ajax": {
            "method": "POST",
            "url": "../controlador/configuracion/control_listar_eps.php",
            data : {
                idempresa : idempresa
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "NitEPS" },
            { "data": "NomEPS" },
            { "data": "CiudadEPS" },
            { "data": "DirEPS" },
            { "data": "TelEPS" },
            { "data": "EmailEps" },
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
    t_eps.on('draw.dt', function() {
        var PageInfo = $('#tabla_eps').DataTable().page.info();
        t_eps.column(0, { page: 'current' }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}

// modificar datos del procedimiento
$('#tabla_eps').on('click', '.editar', function() {
    var data = t_eps.row($(this).parents('tr')).data();

    if (t_eps.row(this).child.isShown()) {
        var data = t_eps.row(this).data();
    }
    $("#modal_editar").modal({ backdrop: 'static', keyboard: false })
    $("#modal_editar").modal('show');
    $("#txt_ideps").val(data.IdEPS);
    $("#txt_nit_actual").val(data.NitEPS).trigger("change");
    $("#txt_nit_nuevo").val(data.NitEPS);
    $("#txt_nombre_eps_editar").val(data.NomEPS);
    $("#txt_ciudad_eps_editar").val(data.CiudadEPS);
    $("#txt_direccion_eps_editar").val(data.DirEPS);
    $("#txt_tel_eps_editar").val(data.TelEPS);
    $("#txt_correo_eps_editar").val(data.EmailEps);

})




/*desactivar y activar categoria*/
$('#tabla_eps').on('click', '.activar', function() {
        var data = t_eps.row($(this).parents('tr')).data();
        if (t_eps.row(this).child.isShown()) {
            var data = t_eps.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar  la eps?',
            text: "Activacion",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdEPS, 'ACTIVO');
            }
        })
    })
    // function activar usuario
$('#tabla_eps').on('click', '.desactivar', function() {
    var data = t_eps.row($(this).parents('tr')).data();
    if (t_eps.row(this).child.isShown()) {
        var data = t_eps.row(this).data();
    }
    Swal.fire({
        title: 'Está seguro de desactivar la eps?',
        text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.isConfirmed) {
            Modificar_Estatus(data.IdEPS, 'INACTIVO');
        }
    })
})

function Modificar_Estatus(IdEPS, estatus) {
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivado";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        url: "../controlador/configuracion/control_modificar_estatus_eps.php",
        type: 'POST',
        data: {
            IdEPS: IdEPS,
            estatus: estatus,
        }
    }).done(function(resp) {
       alert(resp);
        if (resp > 0) {
            Swal.fire("Mensaje  de confirmaciòn", "EPS " + mensaje + " exitosamente",
                    "success")
                .then((value) => {
                    //LimpiarRegistro();
                    t_eps.ajax.reload();

                });
        }

    })
}



function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}


function Registrar_Eps() {
    var nit = $('#txt_nit').val();
    var nombre = $('#txt_nombre_eps').val();
    var ciudad = $('#txt_ciudad_eps').val();
    var direccion = $('#txt_direccion_eps').val();
    var telefono = $('#txt_tel_eps').val();
    var correo = $('#txt_correo_eps').val();

    if (nit.length == 0 || nombre.legth == 0) {
        return Swal.fire('Mensaje de error', 'Digite los campos estan vacios', 'warning');
    }
    $.ajax({
        url: '../controlador/configuracion/control_eps_registro.php',
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
      //  alert(resp);
        if (resp > 0) {
            if (resp == 1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn", "EPS registrada exitosamente",
                        "success")
                    .then((value) => {
                        listar_eps();
                      //  LimpiarCampos();
                        t_eps.ajax.reload();

                    });
            } else {
                // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'EPS ya existe en el sistema, utilice otro', 'warning');
            }
        } else {
            return Swal.fire('Mensaje de error', 'EPS no insertada', 'warning');
        }
    })
}


 function Modificar_Eps() {
      var id = $('#txt_ideps').val();
      var nit_actual = $('#txt_nit_actual').val();
      var nit_nueva = $('#txt_nit_nuevo').val();

      var nombre = $('#txt_nombre_eps_editar').val();
      var ciudad = $('#txt_ciudad_eps_editar').val();
      var direccion = $('#txt_direccion_eps_editar').val();
      var telefono = $('#txt_tel_eps_editar').val();
      var email = $('#txt_correo_eps_editar').val();
      

      if(nit_nueva.length == 0 ) {
        Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
        url:'../controlador/configuracion/control_modificar_eps.php',
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
       // alert(resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","EPS editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_eps();
               // LimpiarCampos();
                    t_eps.ajax.reload();
                
                });
            } else {
            // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'EPS ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','EPS no editado','warning');
        }
      })
    }
