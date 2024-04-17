var t_productos;
function listar_productos(){
 var id_bodega = document.getElementById('cmb_bodega').value;
 var id_categoria = document.getElementById('cmb_categoria_producto').value;
 var idempresa =$("#txt_idempresa").val();
     t_productos = $("#tabla_productos").DataTable({
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
		    "url":"../controlador/productos/control_listar_productos.php",
             data:{
                id_bodega:id_bodega,
                id_categoria:id_categoria,
                idempresa:idempresa
                
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"producto_codigo"},
            {"data":"producto_nombre"},
           
            {"data":"producto_descripcion"},
            {"data":"producto_cod_barra"},
            
            {"data":"producto_presentacion"},
            {"data":"nombre_bodega"},
            {"data":"descripcion"},
            {"data":"tarifa"},
            {
                "data": "cant_minima",
                render: function(data, type, row) {
                    if (data == '1') {
                        return "<span class='label label-danger'>" + data + "</span>";
                    } else {
                        return "<span class='label label-success'>" + data + "</span>";
                    }
                }
            },

            {
                "data": "producto_stock",
                render: function(data, type, row) {
                    if (data == '0') {
                        return "<span class='label label-danger'>" + data + "</span>";
                    } else {
                        return "<span class='label label-success'>" + data + "</span>";
                    }
                }
            },
            {"data":"categoria_nombre"},
            {"data":"unidad_nombre"},
            {"data":"tipo_producto"},
            
            {"data":"compra"},
             {"data":"producto_precioventa"},
             {"data":"ganancia"},

            {"data":"producto_foto",

            render: function (data, type, row ) {
            	 return '<img src="../'+data+'" class="img-circle" style="width:40px">';
            	}
        	}, 
            
             {
                "data": "producto_estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "producto_estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button> &nbsp;<button style='font-size:13px;' type='button' class='btnAumentarStock btn btn-success'><i class='fas fa-plus-circle fs-5'></i></button>";
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
	t_productos.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_productos').DataTable().page.info();
        t_productos.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}


// modificar datos del procedimiento
    $('#tabla_productos').on('click','.editar',function(){
        var data = t_productos.row($(this).parents('tr')).data();

         if(t_productos.row(this).child.isShown()){
                var data = t_productos.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idproducto").val(data.producto_id);
        $("#txt_codigo_actual_editar").val(data.producto_codigo);
        $("#txt_codigo_nuevo_editar").val(data.producto_codigo);
        $("#txt_nombre_actual_editar").val(data.producto_nombre);
        $("#txt_nombre_nuevo_editar").val(data.producto_nombre);
        $("#txt_presentacion_producto_editar").val(data.producto_presentacion);
        $("#txt_serie_editar").val(data.producto_serie);
        $("#txt_cant_minima_editar").val(data.cant_minima);
        $("#cmb_categoria_editar").val(data.id_categoria).trigger("change");
        $("#cmb_unidad_editar").val(data.id_unidad).trigger("change");
        $("#cmb_tipo_editar").val(data.idTipoProducto).trigger("change");
        $("#txt_precio_compra_editar").val(data.compra);
        $("#txt_precio_venta_editar").val(data.producto_precioventa);
       

    });


     $('#tabla_productos tbody').on('click', '.btnAumentarStock', function() {

        operacion_stock = 1; //sumar stock
        accion = 3;

        $("#mdlGestionarStock").modal('show'); //MOSTRAR VENTANA MODAL

        $("#titulo_modal_stock").html('Aumentar Stock'); // CAMBIAR EL TITULO DE LA VENTANA MODAL
        $("#titulo_modal_label").html('Agregar al Stock'); // CAMBIAR EL TEXTO DEL LABEL DEL INPUT PARA INGRESO DE STOCK
        $("#iptStockSumar").attr("placeholder", "Ingrese cantidad a agregar al Stock"); //CAMBIAR EL PLACEHOLDER 

        //var data = table.row($(this).parents('tr')).data(); //OBTENER EL ARRAY CON LOS DATOS DE CADA COLUMNA DEL DATATABLE

       var data = t_productos.row($(this).parents('tr')).data();

         if(t_productos.row(this).child.isShown()){
                var data = t_productos.row(this).data();
            }



        $("#stock_codigoProducto").html(data.producto_codigo)    //CODIGO DEL PRODUCTO DEL DATATABLE
        $("#stock_Producto").html(data.producto_nombre)          //NOMBRE DEL PRODUCTO DEL DATATABLE
        $("#stock_Stock").html(data.producto_stock)             //STOCK ACTUAL DEL PRODUCTO DEL DATATABLE

        $("#stock_NuevoStock").html(parseFloat($("#stock_Stock").html()));

    })



 /* ======================================================================================
    EVENTO QUE LIMPIA EL INPUT DE INGRESO DE STOCK AL CERRAR LA VENTANA MODAL
    =========================================================================================*/
    $("#btnCancelarRegistroStock, #btnCerrarModalStock").on('click', function() {
        $("#iptStockSumar").val("")
    })

    /* ======================================================================================
    EVENTO AL DIGITAR LA CANTIDAD A AUMENTAR O DISMINUIR DEL STOCK
    =========================================================================================*/
    $("#iptStockSumar").keyup(function() {

        // console.log($("#iptStockSumar").val());

     

            if ($("#iptStockSumar").val() != "" && $("#iptStockSumar").val() > 0) {

                var stockActual = parseFloat($("#stock_Stock").html());
                var cantidadAgregar = parseFloat($("#iptStockSumar").val());

                $("#stock_NuevoStock").html(stockActual + cantidadAgregar);

            } else {

                Toast.fire({
                    icon: 'warning',
                    title: 'Ingrese un valor mayor a 0'
                });
                $("#iptStockSumar").val("")
                $("#stock_NuevoStock").html(parseFloat($("#stock_Stock").html()));

            }


            if ($("#iptStockSumar").val() != "" && $("#iptStockSumar").val() > 0) {

                var stockActual = parseFloat($("#stock_Stock").html());
                var cantidadAgregar = parseFloat($("#iptStockSumar").val());

                $("#stock_NuevoStock").html(stockActual - cantidadAgregar);

                if (parseInt($("#stock_NuevoStock").html()) < 0) {

                    Toast.fire({
                        icon: 'warning',
                        title: 'La cantidad a disminuir no puede ser mayor al stock actual (Nuevo stock < 0)'
                    });

                    $("#iptStockSumar").val("");
                    $("#iptStockSumar").focus();
                    $("#stock_NuevoStock").html(parseFloat($("#stock_Stock").html()));
                }
            } else {
                
                Toast.fire({
                    icon: 'warning',
                    title: 'Ingrese un valor mayor a 0'
                });
                
                $("#iptStockSumar").val("")                
                $("#stock_NuevoStock").html(parseFloat($("#stock_Stock").html()));
            }
        

    });


// desactivar usuario
    $('#tabla_productos').on('click', '.activar', function() {
        var data = t_productos.row($(this).parents('tr')).data();
        if (t_productos.row(this).child.isShown()) {
            var data = t_productos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar el producto?',
            text: "Una vez desactivado el producto  podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.producto_id, 'ACTIVO');
            }
        })
    })








 // function activar usuario
    $('#tabla_productos').on('click', '.desactivar', function() {
        var data = t_productos.row($(this).parents('tr')).data();
        if (t_productos.row(this).child.isShown()) {
            var data = t_productos.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el producto?',
            text: "Una vez desactivado el producto no podrá tener ingresos o ventas",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.producto_id, 'INACTIVO');
            }
        })
    })

    function Modificar_Estatus(producto_id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/productos/control_modificar_estatus.php",
            type: 'POST',
            data: {
                producto_id: producto_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Usuario " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_productos.ajax.reload();

                    });
            }

        })
    }




  function listar_combo_categoria() {
     var idempresa =$("#txt_idempresa").val();
        $.ajax({
            url:"../controlador/categoria/control_combo_categoria_listar.php",
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
                $('#cmb_categoria').html(cadena);
              $('#cmb_categoria_editar').html(cadena);
              $('#cmb_categoria_producto').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_categoria').html(cadena);
                $('#cmb_categoria_editar').html(cadena);
                $('#cmb_categoria_producto').html(cadena);
            }
         })
    }

    /*listar marcas*/
     function listar_combo_marcas() {
     var idempresa =$("#txt_idempresa").val();
        $.ajax({
            url:"../controlador/marcas/control_combo_marcas.php",
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
                $('#cmb_marca').html(cadena);
             // $('#cmb_categoria_editar').html(cadena);
             // $('#cmb_categoria_producto').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
               $('#cmb_marca').html(cadena);
              //  $('#cmb_categoria_editar').html(cadena);
               // $('#cmb_categoria_producto').html(cadena);
            }
         })
    }


    function listar_combo_unidad() {
    var idempresa =$("#txt_idempresa").val();
        $.ajax({
            url:"../controlador/unidad_medida/control_listar_combo_unidad.php",
             type:'POST',
             data:{
                idempresa:idempresa
             }
        }).done(function(resp){
        //  alert(resp);
            var data = JSON.parse(resp);
            //console.log(resp);
           var cadena ="<option value=''>Seleccione...</option>";
            if(data.length>0) {
                for (var i = 0; i < data.length; i++) {
                    cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
                }
                $('#cmb_unidad').html(cadena);
               $('#cmb_unidad_editar').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_unidad').html(cadena);
               $('#cmb_unidad_editar').html(cadena);
            }
         })
    }

    function listar_combo_tipo() {
    var idempresa =$("#txt_idempresa").val();
        $.ajax({
            url:"../controlador/productos/control_listar_combo_tipo.php",
             type:'POST',
             data:{
                idempresa:idempresa
             }
        }).done(function(resp){
        //  alert(resp);
            var data = JSON.parse(resp);
            //console.log(resp);
           var cadena ="<option value=''>Seleccione...</option>";
            if(data.length>0) {
                for (var i = 0; i < data.length; i++) {
                    cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
                }
                $('#cmb_tipo').html(cadena);
              $('#cmb_tipo_editar').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_tipo').html(cadena);
            $('#cmb_tipo_editar').html(cadena);
            }
         })
    }

    function listar_combo_iva() {
    var idempresa =$("#txt_idempresa").val();
        $.ajax({
            url:"../controlador/iva/control_iva_combo_productos.php",
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
                $('#cmb_iva_producto').html(cadena);
             // $('#cmb_tipo_editar').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_iva_producto').html(cadena);
           // $('#cmb_tipo_editar').html(cadena);
            }
         })
    }






  function Registrar_Producto() {
    var codigo = $('#txt_codigo').val();
    var nombre = $('#txt_nombre_producto').val();
    var descripcion = $('#txt_descripcion_producto').val();
    var cod_barra = $('#txt_cod_barra_producto').val();
    
    var presentacion =$('#txt_presentacion_producto').val();
    
    var idbodega = $('#cmb_bodega_producto').val();
    var cant_minima = $('#txt_cant_minima').val();
    var cant_inicial = $('#txt_cant_inicial').val();
    var idcategoria =$('#cmb_categoria').val();
    var idunidad =$('#cmb_unidad').val();
    var tipo_producto =$('#cmb_tipo').val();
    var id_marca =$('#cmb_marca').val();
    var id_iva =$('#cmb_iva_producto').val();

    var archivo = $('#imagen').val();
    var precio_compra=$('#txt_precio_compra').val();
    var precio_venta =$('#txt_precio_venta').val();
    var idempresa =$("#txt_idempresa").val();

    if(codigo.length==0 || nombre.length==0 
    || presentacion.length==0 ||
      idcategoria.length ==0 ||
     idunidad.length==0 || precio_venta.length ==0) { 
      return Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
      );
    }

    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+
    f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
   
    var formData = new FormData();
    var foto = $("#imagen")[0].files[0];
    formData.append('codigo',codigo);
    formData.append('nombre',nombre);
    formData.append('descripcion',descripcion);
    formData.append('cod_barra',cod_barra);
    
    
    formData.append('presentacion',presentacion);
    
    formData.append('idbodega',idbodega);
    formData.append('idcategoria',idcategoria);
    formData.append('cant_minima',cant_minima);
    formData.append('cant_inicial',cant_inicial);
    formData.append('idunidad',idunidad);
    formData.append('tipo_producto',tipo_producto);
    formData.append('id_marca',id_marca);
    formData.append('id_iva',id_iva);
    
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);
    formData.append('precio_compra',precio_compra);
    formData.append('precio_venta',precio_venta);
    formData.append('idempresa',idempresa);

   $.ajax({
      url:'../controlador/productos/controlador_registro_productos.php',
      type:'POST',
      data:formData,
      contentType:false,
      processData:false,
      success:function(resp) {
       //  alert(resp);
        if(resp != 0) {

          if(resp > 0) {
                   if(resp==1) {
                  $('#modal_registro').modal('hide');
                  Swal.fire("Mensaje  de confirmaciòn","Producto registrado exitosamente",
                      "success")
                  .then((value)=>{
                      listar_productos();
                LimpiarCampos();
                      t_productos.ajax.reload();
                  
                  });
              } else {
               //LimpiarCampos();
                  return Swal.fire('Mensaje de error', 'Producto ya existe en el sistema, utilice otro', 'warning'
                    );
              }
          }else {
              return Swal.fire('Mensaje de error','Producto no insertado','warning');
          }
        }
      
      }

    });
    return false;

  }


  function Modificar_Producto() {
    var id_producto = $('#txt_idproducto').val();
    var codigo_actual = $('#txt_codigo_actual_editar').val();
    var codigo_nuevo = $('#txt_codigo_nuevo_editar').val();
    var nombre_actual = $('#txt_nombre_actual_editar').val();
    var nombre_nuevo = $('#txt_nombre_nuevo_editar').val();
    var presentacion_editar =$('#txt_presentacion_producto_editar').val();
    var cant_minima =$('#txt_cant_minima_editar').val();
    var idcategoria =$('#cmb_categoria_editar').val();
    var idunidad =$('#cmb_unidad_editar').val();
    var idtipo_producto =$('#cmb_tipo_editar').val();
    var precio_compra =$('#txt_precio_compra_editar').val();
    var precio_venta =$('#txt_precio_venta_editar').val();
  
  
    if(codigo_nuevo.length==0
     || nombre_nuevo.length==0 
      || presentacion_editar.length ==0 
     || idcategoria.length ==0 
     ||  idunidad.length==0 
     || precio_venta.length ==0) { 
      return Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
      );
    }

$.ajax({
      url:'../controlador/productos/controlador_modificar_producto.php',
      type:'POST',
      data:{
        id_producto:id_producto,   codigo_actual:codigo_actual,
        codigo_nuevo:codigo_nuevo,  nombre_actual:nombre_actual,
        nombre_nuevo:nombre_nuevo,    presentacion_editar:presentacion_editar,
        cant_minima:cant_minima,     idcategoria:idcategoria,
        idunidad:idunidad,      idtipo_producto:idtipo_producto,
        precio_compra:precio_compra,     precio_venta:precio_venta
        
      }
    }).done(function(resp){
   //alert(resp);
      if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Producto editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_productos();
               // LimpiarCampos();
                    t_productos.ajax.reload();
                
                });
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Producto ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Producto no modificado','warning');
        }
    })
 


}

 


 function Editar_Foto_Producto() {

    var idproducto =$('#txt_idproducto').val();
    var archivo = $('#imagen_editar').val();
    var f = new Date();
    var extension = archivo.split('.').pop();
    var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+
    f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
 
    var formData = new FormData();
    var foto = $("#imagen_editar")[0].files[0];
    if(archivo.length==0) { 
        return Swal.fire('Mensaje de error','Debe seleccionar un archivo', 'warning'
        );
    }
    
    formData.append('idproducto',idproducto);
    formData.append('foto',foto);
    formData.append('nombrearchivo',nombrearchivo);

    $.ajax({
        url:'../controlador/productos/controlador_producto_editar_foto.php',
        type:'POST',
        data:formData,
        contentType:false,
        processData:false,
        success:function(resp){
            alert(resp);
            if(resp!=0){
               if(resp==1){
                t_productos.ajax.reload();
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Foto Actualizada exitosamente","success");  
                 } 
            }
        
        }

    });
    return false;
}




 function listar_combo_bodega() {
    var idempresa =$("#txt_idempresa").val();
        $.ajax({
            url:"../controlador/bodegas/control_combo_bodegas.php",
             type:'POST', 
             data:{
                idempresa:idempresa
             }
        }).done(function(resp){
         //alert(resp);
            var data = JSON.parse(resp);
            //console.log(resp);
          var cadena ="";
            if(data.length>0) {
                for (var i = 0; i < data.length; i++) {
                    cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
                }
                $('#cmb_bodega').html(cadena);
                $('#cmb_bodega_producto').html(cadena);
             // $('#cmb_programa_asig_editar').html(cadena);
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_bodega').html(cadena);
             $('#cmb_bodega_producto').html(cadena);
            }
         })
    }


     function LimpiarCampos() {
        $('#txt_codigo').val("");
        $('#txt_nombre_producto').val("");
        $('#txt_presentacion_producto').val("");
        $('#txt_cant_minima').val("");
        $('#txt_precio_venta').val("");

    }