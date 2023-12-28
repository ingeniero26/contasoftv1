
  function listar_combo_departamentos() {
    
        $.ajax({
            url:"../controlador/departamentos/control_combo_departamentos.php",
             type:'POST',
             
        }).done(function(resp){
        //alert(resp);
            var data = JSON.parse(resp);
            //console.log(resp);
           var cadena ="<option value=''>Seleccione...</option>";
            if(data.length>0) {
                for (var i = 0; i < data.length; i++) {
                    cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
                }
                $('#cmb_departamento').html(cadena);
             // $('#cmb_categoria_editar').html(cadena);
             $('#cmb_departamento_registro').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_departamento').html(cadena);
             //   $('#cmb_categoria_editar').html(cadena);
             $('#cmb_departamento_registro').html(cadena);
            }
         })
    }




    var t_ciudades;
function listar_ciudades(){
 var id_departamento = document.getElementById('cmb_departamento').value;
 
 
     t_ciudades = $("#tabla_ciudades").DataTable({
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
            "url":"../controlador/ciudades/control_listar_ciudades.php",
             data:{
                id_departamento:id_departamento
                
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"nombre_ciudad"},
            {"data":"nombre_depto"},
          

           
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
    t_ciudades.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_ciudades').DataTable().page.info();
        t_ciudades.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}


// modificar datos del procedimiento
    $('#tabla_ciudades').on('click','.editar',function(){
        var data = t_ciudades.row($(this).parents('tr')).data();

         if(t_ciudades.row(this).child.isShown()){
                var data = t_ciudades.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idciudad").val(data.id);
        $("#txt_ciudad_actual").val(data.nombre_ciudad);
        $("#txt_ciudad_nueva").val(data.nombre_ciudad);
       
        $("#cmb_departamento_editar").val(data.idDepto).trigger("change");
                     

    });





    function Registrar_Ciudades() {
        var ciudad =$('#txt_ciudad').val();
        var id_departamento =$('#cmb_departamento_registro').val();
        var idempresa =$("#txt_idempresa").val();
       
      if(ciudad.length ==0 || id_departamento.length == 0 ) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
      }
      $.ajax({
      url:'../controlador/ciudades/controlador_registro_ciudad.php',
      type:'POST',
      data:{
        ciudad:ciudad,
        id_departamento:id_departamento,
        idempresa:idempresa
      }
       }).done(function(resp){
       // alert(resp);
        if(resp > 0) {
            if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Ciudad registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_ciudades();
               limpiar_campos();
                    t_ciudades.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'CIUDAD ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Ciudad no insertado','warning');
        }
    })
    }