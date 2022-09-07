var   t_cargos;

function Listar_Cargos(){
    t_cargos = $("#tabla_cargos").DataTable({
        "ordering":false,
        "paging": false,
        "searching": { "regex": true },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 100,
        "destroy":true,
        "async": false ,
        "processing": true,
        ajax:{
            url:"../controlador/cargos/control_listado_cargos.php",
            type:'POST'
        },
        "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"DescCargos"},
            {"data":"DescDpto"},
           
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

        "language":idioma_espanol,
        select: true
    });

        document.getElementById("tabla_cargos_filter").style.display="none";

          $('input.global_filter').on( 'keyup click', function () {
            filterGlobal();
        } );
        $('input.column_filter').on( 'keyup click', function () {
            filterColumn( $(this).parents('tr').attr('data-column') );
        });

        t_cargos.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_cargos').DataTable().page.info();
        t_cargos.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        });

    }

     function filterGlobal() {
        $('#tabla_cargos').DataTable().search(
        $('#global_filter').val(),
        ).draw();
    }
   function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
       
    }

 // modificar datos del procedimiento
    $('#tabla_cargos').on('click','.editar',function(){
        var data = t_cargos.row($(this).parents('tr')).data();

         if(t_cargos.row(this).child.isShown()){
                var data = t_cargos.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idcargos").val(data.IdCargos);
        $("#txt_descripcion_actual").val(data.DescCargos).trigger("change");
        $("#txt_descripcion_nueva").val(data.DescCargos);
       // $("#txt_abreviatura_unidad_editar").val(data.unidad_abreviatura);
       $("#cmb_depto_editar").val(data.IdDpto).trigger("change");

    })




  $('#tabla_cargos').on('click', '.activar', function() {
        var data = t_cargos.row($(this).parents('tr')).data();
        if (t_cargos.row(this).child.isShown()) {
            var data = t_cargos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar el cargo?',
            text: "Activacion",
            icon: 'success',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdCargos, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_cargos').on('click', '.desactivar', function() {
        var data = t_cargos.row($(this).parents('tr')).data();
        if (t_cargos.row(this).child.isShown()) {
            var data = t_cargos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el cargo?',
            text: "Una vez desactivado  no podrá verlo en el sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.IdCargos, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(IdCargos, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/cargos/control_modificar_estatus.php",
            type: 'POST',
            data: {
                IdCargos: IdCargos,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Cargo " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_cargos.ajax.reload();

                    });
            }

        })
    }













  function listar_combo_depto() {
    $.ajax({
        url: "../controlador/cargos/control_listar_combo_dpto.php",
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
            $('#cmb_depto').html(cadena);
              $('#cmb_depto_editar').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_depto').html(cadena);
             $('#cmb_depto_editar').html(cadena);

        }
    })
}



  function Registrar_Cargo() {
      var descripcion = $('#txt_descripcion').val();
      var depto =$('#cmb_depto').val();
      if(descripcion.length==0) {
        return   Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
        );
      }
      $.ajax({
        url:'../controlador/cargos/control_registro_cargos.php',
        type:'POST',
        data:{
          descripcion:descripcion,
          depto:depto
        }
      }).done(function(resp){
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Departamento registrado exitosamente",
                    "success")
                .then((value)=>{
                    Listar_Cargos();
               //LimpiarCampos();
                    t_cargos.ajax.reload();
                
                });
            } else {
            //    LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Departamento ya existe en el sistema, utilice otro', 'warning'
                );
            }
        }else {
            return Swal.fire('Mensaje de error','Departamento no insertado','warning');
        }
      })
    }
