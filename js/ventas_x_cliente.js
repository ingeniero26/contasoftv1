function listar_combo_cliente() {
    var idempresa =$("#txt_idempresa").val();
   $.ajax({
       url: "../controlador/ventas/control_combo_cliente_listar.php",
       type: 'POST',
       data:{
           idempresa:idempresa
       }
   }).done(function(resp) {
       //alert(resp);
       var data = JSON.parse(resp);
       //console.log(resp);
       var cadena ="<option value=''>Seleccione...</option>";
       if (data.length > 0) {
           for (var i = 0; i < data.length; i++) {
               cadena += "<option value='" + data[i][2] + "'>" +
                data[i][1] + "-" +data[i][0] +"</option>";
           }
           $('#cmb_venta_cliente').html(cadena);

       } else {
           cadena += "<option value=''> No Hay datos</option>";
           $('#cmb_venta_cliente').html(cadena);

       }
   })
}



var t_venta_x_cliente;
function listar_productos(){
 var id_cliente = document.getElementById('cmb_venta_cliente').value;
 var idempresa =$("#txt_idempresa").val();
     t_venta_x_cliente = $("#tabla_venta_x_cliente").DataTable({
	    "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/reportes/control_listar_ventas_x_clientes.php",
             data:{
                id_cliente:id_cliente,
                idempresa:idempresa
                
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"producto_codigo"},
            {"data":"producto_nombre"},
            {"data":"producto_presentacion"},
           
            {"data":"nombre_bodega"},

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
            {"data":"producto_foto",
            render: function (data, type, row ) {
            	 return '<img src="../'+data+'" class="img-circle" style="width:40px">';
            	}
        	}, 
            {"data":"producto_precioventa"},
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
	t_venta_x_cliente.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_venta_x_cliente').DataTable().page.info();
        t_venta_x_cliente.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}
