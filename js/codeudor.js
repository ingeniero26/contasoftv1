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


var t_codeudor;
function listar_codeudor(){
 var id_cliente = document.getElementById('cmb_cliente').value;
//  var idempresa =$("#txt_idempresa").val();
t_codeudor = $("#tabla_codeudor").DataTable({
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
		    "url":"../controlador/codeudor/control_listar_codeudor.php",
             data:{
                id_cliente:id_cliente
                // id_categoria:id_categoria,
                // idempresa:idempresa
                
            }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"codeudor"},
            {"data":"documento"},
            {"data":"tipo_doc"},     
            {"data":"direccion"},
            {"data":"telefono"},
            {"data":"celular"},
            {"data":"correo"},
            {"data":"nombre_ref1"},
             {"data":"nombre_ref2"},
             {"data":"tel_ref1"},
             {"data":"tel_ref2"},
             {"data":"dir_ref1"},
             {"data":"dir_ref2"},
             {"data":"estatus"}
        
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[1]).css('text-align', 'center' );
            $($(nRow).find("td")[4]).css('text-align', 'center' );
        },
        "language":idioma_espanol,
        select: true
	});
	t_codeudor.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_codeudor').DataTable().page.info();
        t_codeudor.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

/*funcion para registrar el codeudor*/
function Registrar_Codeudor() {

}