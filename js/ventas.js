var t_ventas;

function listar_ventas() {
    var finicio = document.getElementById('txt_finicio').value;
    var ffin = document.getElementById('txt_ffin').value;
    var idempresa =$("#txt_idempresa").val();
    var idcaja =$("#cmb_caja").val();
 //   alert(finicio +" " +ffin);
    t_ventas = $("#tabla_ventas").DataTable({
        "ordering": false,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "autoWidth": false,
         dom: 'Bfrtip',
        buttons: [
        'excel', 'csv', 'pdf', 'print', 'copy',
        ],

        "ajax": {
            "method": "POST",
            "url": "../controlador/ventas/control_ventas_listar.php",
            data: {
                finicio: finicio,
                ffin: ffin,
                idempresa:idempresa,
                idcaja:idcaja
            }
        },

        "order": [
            [1, 'asc']
        ],
        "columns": [
            { "defaultContent": "" },
            { "data": "usuario_nombre" },
            { "data": "caja" },
            { "data": "cliente" },
            { "data": "nombre_bodega" },
            { "data": "venta_tipocomprobante" },
            { "data": "venta_serie" },
         
            { "data": "tipo_pago" },
            { "data": "venta_fecha" },
            { "data": "venta_total_dcto" },
            { "data": "venta_impuesto" },
            { "data": "venta_total" },
            { "data": "fecha_vencimiento" },
            {
                "data": "venta_estatus",
                render: function(data, type, row) {
                    if (data == 'REGISTRADA') {
                        return "<span class='label label-success m-r-5 m-b-5'>" + data + "</span>";
                    } else if (data == 'POR_PAGAR') {
                        return "<span class='label label-danger m-r-5 m-b-5'>" + data + "</span>";
                    } else {
                        return "<span class='label label-warning m-r-5 m-b-5'>" + data + "</span>";
                    }
                }
            },

            {
                "defaultContent": "<button style='font-size:13px;' type='button' class='imprimir btn btn-primary'><i class='fa fa-print'></i></button> &nbsp;<button style='font-size:13px;' type='button' class='anular btn btn-danger'><i class='fa fa-trash'></i></button>"
            }

        ],
        "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            $($(nRow).find("td")[2]).css('text-align', 'center');

        },
        "language": idioma_espanol,
        select: true
    });
    t_ventas.on('draw.dt', function() {
        var PageInfo = $('#tabla_ventas').DataTable().page.info();
        t_ventas.column(0, { page: 'current' }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });

}


// modificar datos del procedimiento
$('#tabla_ventas').on('click', '.imprimir', function() {
    var data = t_ventas.row($(this).parents('tr')).data();
    if (t_ventas.row(this).child.isShown()) {
        var data = t_ventas.row(this).data();
    }
     window.open("../mpdf/ticket.php?codigo="+
        parseInt(data.venta_id)+"#zoom=100","Reporte de Ventas","scrollbards=NO");
})

// anular venta 

$('#tabla_ventas').on('click', '.anular', function() {
    var data = t_ventas.row($(this).parents('tr')).data();
    if (t_ventas.row(this).child.isShown()) {
        var data = t_ventas.row(this).data();
    }
       Swal.fire({
              title: 'Deseas anular esta venta?',
              text: "Una vez anulado el registro, no se podra revertira la operación?",
              icon: 'success',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Anular Venta'
            }).then((result) => {
              if (result.value) {
             $.ajax({
                url: '../controlador/ventas/control_anular_registro.php',
                type: 'POST',
                data: {
                    idventa: data.venta_id
                }
            }).done(function(resp) {
             // alert(resp);
                if (resp > 0) {
                    Swal.fire("Mensaje de confirmaciòn","Venta anulada","success");
                    t_ventas.ajax.reload();
                } else {
                    Swal.fire("Mensaje de Error","No se completo la anulación","error");
                }
            })
        }
    })
})



function AbrirModalRegistro() {
    $("#modal_registro").modal({ backdrop: 'static', keyboard: false })
    $('#modal_registro').modal('show');
}



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
        var cadena ="";
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][2] + "'>" +
                 data[i][1] + "-" +data[i][0] +"</option>";
            }
            $('#cmb_cliente').html(cadena);

        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_cliente').html(cadena);

        }
    })
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
              $('#cmb_bodega_ingreso').html(cadena);
            
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_bodega').html(cadena);
             $('#cmb_bodega_ingreso').html(cadena);
            }
         })
    }

    function listar_combo_caja() {
     var idempresa =$("#txt_idempresa").val();
   //  var idusuario = $('#txt_idprincipal').val();
        $.ajax({
            url:"../controlador/ventas/control_combo_caja.php",
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
                $('#cmb_caja').html(cadena);
             $('#cmb_caja_venta').html(cadena);
             $('#cmb_caja_ingreso').html(cadena);
            
            } else {
                cadena+="<option value=''> No Hay datos</option>";
                $('#cmb_caja').html(cadena);
            $('#cmb_caja_venta').html(cadena);
            $('#cmb_caja_ingreso').html(cadena);
            }
         })
    }



var arreglo_stock = new Array();
var arreglo_precio = new Array();
var arreglo_precio2 = new Array();
var arreglo_img = new Array();

function listar_combo_producto() {
  //  alert('entra aki');
    var idempresa =$("#txt_idempresa").val();
    $.ajax({
        url: "../controlador/ingreso/control_combo_producto_listar.php",
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
                cadena += "<option value='" + data[i][0] + "'>"   + "-" 
                + data[i][5] +"-"  + data[i][1] + "</option>";
                arreglo_stock[data[i][0]]=data[i][2];
                arreglo_precio[data[i][0]]=data[i][3];
                arreglo_precio2[data[i][0]]=data[i][4];
                arreglo_img[data[i][0]]=data[i][5];
            }

            $('#cmb_producto').html(cadena);
            document.getElementById('txt_stock').value=data[0][2];
            document.getElementById('txt_precio').value=data[0][3];
             document.getElementById('txt_precio2').value=data[0][4];
             document.getElementById('txt_foto_producto').src='../'+data[0][5];


        } else {
            cadena += "<option value=''> No Hay datos</option>";
            $('#cmb_producto').html(cadena);

        }
    })
}


function Agregar_Producto_Detalle_Venta() {
    let idproducto = document.getElementById('cmb_producto').value;
    let producto = $("#cmb_producto option:selected").text();
    let cantidad = document.getElementById('txt_cantidad').value;
    let precio = document.getElementById('txt_precio').value;
    let impuesto = document.getElementById('txt_impuesto').value;
    let dcto = document.getElementById('txt_descto').value;
   let stock = document.getElementById('txt_stock').value;

    let tipo = document.getElementById('cmb_tipo_comprobante').value;
    if (tipo == "FACTURA") {
        if (impuesto.length == 0) {
            return Swal.fire("Mensaje de advertencia", "Debe digitar el valor del impuesto, antes de agregar", "warning");
        }


        if (impuesto > 1.00) {
            return Swal.fire("Mensaje de advertencia", "El % de IVA,  no se puede asignar", "warning");
        }
    }
   

    if(parseFloat(stock)< parseFloat(cantidad)) {
          return Swal.fire("Mensaje de advertencia", "El stock del producto es insufiente", "warning");
    }

     if( parseInt(cantidad) < 1) {
         return Swal.fire("Mensaje de advertencia", "La cantidad del producto debe ser mayor a 0", "warning");
    }


    if (impuesto > 1.00) {
        return Swal.fire("Mensaje de advertencia", "El % de IVA,  no se puede asignar", "warning");
    }

   

    let subtotal = precio * cantidad;
    let valordcto  = (subtotal *dcto)/100;
    let st2 = subtotal - valordcto;
     let valoriva  = (st2 *impuesto)
     let neto_total  = st2 + valoriva;

    if (cantidad.length == 0 || precio.length == 0) {
        return Swal.fire("Mensaje de advertencia", "Debe digitar precio y cantidad", "warning");
    }


    if (parseFloat(precio) < 1) {
        return Swal.fire("Mensaje de advertencia", "La cantidad debe ser mayor a cero", "warning");
    }


    if (parseFloat(precio) < 0) {
        return Swal.fire("Mensaje de advertencia", "El precio debe ser mayor a cero", "warning");
    }


    if (verificarid(idproducto)) {
        return Swal.fire("Mensaje de advertencia", "El producto ya fue asignado a la tabla", "warning");
    }




    let datos_agregar = "<tr>";
    datos_agregar += "<td for='id'>" + idproducto + "</td>";
    datos_agregar += "<td>" + producto + "</td>";
    datos_agregar += "<td>" + cantidad + "</td>";
    datos_agregar += "<td>" + precio + "</td>";
    datos_agregar += "<td>" + subtotal + "</td>";
    datos_agregar += "<td>" + valordcto + "</td>";
    datos_agregar += "<td>" + valoriva + "</td>";
    datos_agregar += "<td><button class='btn btn-danger' onclick='remove(this)'><i class='fa fa-trash'></i></button></td>";
    datos_agregar += "<td><button class='btn btn-success'><i class='fa fa-print'></i></button></td>";
    datos_agregar += "</tr>";
    $("#tb_detalle_venta").append(datos_agregar);
    SumarTotalneto();
}

function verificarid(id) {
    let idverificar = document.querySelectorAll('#tabla_ventas td[for="id"]');
    return [].filter.call(idverificar, td => td.textContent === id).length === 1;
}


function remove(t) {
    var td = t.parentNode;
    var tr = td.parentNode;
    var table = tr.parentNode;
    table.removeChild(tr);
    SumarTotalneto();
}

function SumarTotalneto() {
    let arreglo_total = new Array();
    let arreglo_tdcto = new Array();
    let arreglo_iva = new Array();
    let count = 0;
    let total = 0;
    let valoriva = 0;
    let subtotal = 0;
    let valordcto =0;
    let neto  =0;
    let impuesto = document.getElementById('txt_impuesto').value;
    let dcto = document.getElementById('txt_descto').value;
    $("#detalle_venta tbody#tb_detalle_venta tr").each(function() {
        arreglo_total.push($(this).find('td').eq(4).text());
        arreglo_tdcto.push($(this).find('td').eq(5).text());
        arreglo_iva.push($(this).find('td').eq(6).text());
        count++;
      
    })

    for (var i = 0; i < count; i++) {
        var suma = arreglo_total[i];
       var suma_desc = arreglo_tdcto[i];

       var suma_iva = arreglo_iva[i];
        subtotal = (parseFloat(subtotal) + parseFloat(suma)).toFixed(2);
        //  total =(parseFloat(total)+parseFloat(suma)).toFixed(2);
        valordcto = (parseFloat(valordcto) + parseFloat(suma_desc)).toFixed(2);
        valoriva = (parseFloat(valoriva) + parseFloat(suma_iva)).toFixed(2);
   // alert( valordcto);
        
    };
    total = parseFloat(subtotal - valordcto) + parseFloat(valoriva);
    
    let tipo = document.getElementById('cmb_tipo_comprobante').value;
    if (tipo == "FACTURA") {
        $("#lbl_subtotal").html("<b> Sub total: </b> $/." + subtotal);
        $("#lbl_decto").html("<b> Dcto:" + dcto * 100 + "% </b> $/." + valordcto);
        $("#lbl_impuesto").html("<b> IVA:" + impuesto * 100 + "% </b> $/." + valoriva );
        
        $("#lbl_totalneto").html("<b>Total: </b> $/." + total.toFixed(2));
    } else {
        $("#lbl_totalneto").html("<b>Total: </b> $/." + total.toFixed(2));
    }

    //  $("#lbl_subtotal").html("<b> Sub total: </b> $."+subtotal);
    // $("#lbl_impuesto").html("<b> IVA:"+impuesto* 100+"% </b> $."+impuestototal);
    //  $("#lbl_totalneto").html("<b>Total: </b> $."+total.toFixed(2));
}

function Registrar_Venta() {
    let count = 0;
    $("#detalle_venta tbody#tb_detalle_venta tr").each(function() {

        count++;
    })

    if (count == 0) {
        return Swal.fire("Mensaje de Error", "El detalle de la compra debe tener por lo menos un producto",
            "warning");
    }


    let idcliente = document.getElementById('cmb_cliente').value;
    let idbodega = document.getElementById('cmb_bodega_ingreso').value;
    let idusuario = document.getElementById('txt_idprincipal').value;
    
    let tipo_comprobante = document.getElementById('cmb_tipo_comprobante').value;
    let serie_comprobante = document.getElementById('txt_serie').value;
  //  let num_comprobante = document.getElementById('txt_no_comprobante').value;
    let tipo_pago = document.getElementById('cmb_tipo_pago').value;
    //let fecha_venta = document.getElementById('txt_fecha').value;
    let total = document.getElementById('lbl_totalneto').innerHTML.substr(18);
    let estado = document.getElementById('cmb_estado').value;
    let decto = document.getElementById('lbl_decto').innerHTML.substr(20);
    let fecha_vc = document.getElementById('txt_fecha_vc').value;
    var idempresa =$("#txt_idempresa").val();
    var idcaja =$("#cmb_caja_venta").val();

    let impuesto = "";
    let porcentaje = "";
    if (tipo_comprobante == "FACTURA") {
        decto = document.getElementById('lbl_decto').innerHTML.substr(22);
        impuesto = document.getElementById('lbl_impuesto').innerHTML.substr(20);
        porcentaje = document.getElementById('txt_impuesto').value;
    } else {
        impuesto = "";
        porcentaje = "";
    }
    $.ajax({
        url: '../controlador/ventas/control_venta_registro.php',
        type: 'POST',
        data: {
            idcliente: idcliente,
            idbodega:idbodega,
            idusuario: idusuario,
            tipo_comprobante: tipo_comprobante,
            serie_comprobante: serie_comprobante,
           
            tipo_pago: tipo_pago,
            impuesto: impuesto,
            total: total,
            estado: estado,
            porcentaje: porcentaje,
            decto:decto,
            fecha_vc:fecha_vc,
            idempresa:idempresa,
            idcaja:idcaja

        }
    }).done(function(resp) {
      //  alert(resp);
        if (resp > 0) {
            Registrar_Detalle_Venta(parseInt(resp));
        } else {
            Swal.fire("Mensaje de Error","Numero de factura ya existe","error");
        }
    })
}

function Registrar_Detalle_Venta(id){
    let count =0;
      let arreglo_producto = new Array();
      let arreglo_cantidad = new Array();
      let arreglo_precio = new Array();
      let arreglo_dcto = new Array();

       $("#detalle_venta tbody#tb_detalle_venta tr").each(function() {
        arreglo_producto.push($(this).find('td').eq(0).text());
        arreglo_cantidad.push($(this).find('td').eq(2).text());
        arreglo_precio.push($(this).find('td').eq(3).text());
        arreglo_dcto.push($(this).find('td').eq(5).text());
        count++;
    })

     if (count == 0) {
        return Swal.fire("Mensaje de Error", "El detalle de la venta debe tener por lo menos un producto",
            "warning");
    }

    let producto  = arreglo_producto.toString();
    let cantidad  = arreglo_cantidad.toString();
    let precio  = arreglo_precio.toString();
    let dcto  = arreglo_dcto.toString();

     $.ajax({
        url: '../controlador/ventas/control_venta_registro_detalle.php',
        type: 'POST',
        data: {
            id: id,
            producto: producto,
            cantidad: cantidad,
            precio: precio,
            dcto:dcto
           

        }
    }).done(function(resp) {
       // alert(resp);
        if (resp > 0) {
           Swal.fire({
              title: 'Datos de confirmaciòn?',
              text: "Venta registrada correctamente",
              icon: 'success',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Imprimir Reporte'
            }).then((result) => {
              if (result.value) {
                let tipo_comprobante = document.getElementById('cmb_tipo_comprobante').value;
                if(tipo_comprobante =="FACTURA") {
                    window.open("../mpdf/reporte_ventas.php?codigo="+parseInt(id)+"zoom=100","Reporte de Venta","scrollbards=NO");

                } else {
                    window.open("../mpdf/ticket.php?codigo="+parseInt(id)+"zoom=100","Reporte de Venta","scrollbards=NO");

                }

              $("#contenido_principal").load("../vista/ventas/vista_mantenimiento_ventas.php");
              } else {
                 $("#contenido_principal").load("../vista/ventas/vista_mantenimiento_ventas.php");
              }
            })
        } else {
            Swal.fire("Mensaje de Error","El registro no se completo","error");
        }
    })



}