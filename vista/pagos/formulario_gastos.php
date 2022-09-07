<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <div class="ibox-head">
                <div class="ibox-title">REGISTRO DE GASTOS DE LA EMPRESA </div>
                <div class="ibox-tools">
                  <h1>DATOS DEL CLIENTE</h1>
                </div>
            </div>
            <div class="ibox-body">
            	<div class="row">
            	   <div class="col-4">
                       <label for=""><b>Tipo Pago</b> </label>
                        <select class="js-example-basic-single" 
                        name="state" style="width: 100%;" id="cmb_tipo_pago"> 
                       
                         </select> <br> 
                    </div>
                    <div class="col-3">
                        <label for=""><b>Fecha Pago </b></label>
                        <input type="date" class="form-control" id="txt_fecha_pago">
                    </div>
                    <div class="col-3">
                        <label for=""><b>Valor</b></label>
                        <input type="number" class="form-control" id="txt_valor"
                         value="" >
                    </div>
                    <div class="col-3">
                        <label for=""><b>Recibo</b></label>
                        <input type="text" class="form-control" id="txt_recibo"
                         >
                    </div>


                    <div class="col-4">
                       <label for=""><b>Caja</b> </label>
                        <select class="js-example-basic-single" 
                        name="state" style="width: 100%;" id="cmb_caja_ingreso"> 
                       
                         </select> <br> <br>
                    </div>
                    <div class="col-3">
                        <label for=""><b>Observaciones</b></label>
                        <input type="text" class="form-control"
                         id="txt_observaciones" >
                    </div>
                   
                  
                    
                       
                     <div class="col-3">
                       <label for=""><b>Estado</b> </label>
                        <select class="js-example-basic-single" name="state"
                        style="width: 100%;" id="cmb_estado"> 
                        <option value="ENTREGADA">ENTREGADA</option>
                       <option value="CANCELADA">CANCELADA</option>
                        
                        <option value="ANULADA">ANULADA</option>
                        
                       
                         </select> <br> <br>
                    </div>
                 
                     
                     

                    
                    
                    <div class="col-2">
                        <label>&nbsp;</label><br>
                        <button class="btn btn-success" onclick="Agregar_Pago()"><i class="fa fa-plus"></i>Agregar</button>
                    </div>
          
                       
            	</div> 
            	 	
               
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../js/ventas.js"></script>
<script>
$(document).ready(function() {

   
  $('.js-example-basic-single').select2();

 ///listar_combo_cliente();
// listar_combo_producto();
 listar_combo_bodega();
 listar_combo_tipo_pagos();
 listar_combo_caja();

 
});

$('#cmb_producto').on('select2:select', function (e) {
  let id = document.getElementById('cmb_producto').value;
  //alert(arreglo_stock[id] + " -" +arreglo_precio[id]);
   document.getElementById('txt_stock').value=arreglo_stock[id];
  document.getElementById('txt_precio').value=arreglo_precio[id];
  document.getElementById('txt_foto_producto').src='../'+arreglo_img[id];

});

$('#cmb_tipo_comprobante').on('select2:select', function (e) {
  let tipo = document.getElementById('cmb_tipo_comprobante').value;
  if(tipo=="FACTURA") {
    document.getElementById('txt_impuesto').disabled=false;
  } else {
    document.getElementById('txt_impuesto').disabled=true;
  }
});




</script>