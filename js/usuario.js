




function verificar_usuario(){
	var usuario = document.getElementById('txt_usu').value;
	var password =  document.getElementById('txt_con').value;
	if(usuario.length== 0 || password.length == 0) {
 		return	 Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
		);
	}
	$.ajax({
		url:"../controlador/usuario/cntlVerificarLogin.php",
		type:'POST',
		data:{
			usuario:usuario,
			password:password
		}

	}).done(function(resp){
		var data = JSON.parse(resp);
		if(resp == 0) {
			return	 Swal.fire( 'Mensaje de error',  'Usuario o clave no válidos', 'warning'
		);
		} else {
			if(data[0][5]==="ACTIVO"){
				$.ajax({
					url:'../controlador/usuario/cntrlCrearSesion.php',
					type:'POST',
					data:{
						idusuario:data[0][0],
						usuario:data[0][1],
						rol:data[0][6],
						idempresa:data[0][9]
					}
				}).done(function(resp){
					let timerInterval
						Swal.fire({
						  title: 'Bienvenido al sistema POS: '+usuario,
						  html: 'Usted será redireccionado en <b></b> milliseconds.',
						  timer: 2000,
						  timerProgressBar: true,
						  didOpen: () => {
						    Swal.showLoading()
						    timerInterval = setInterval(() => {
						      const content = Swal.getContent()
						      if (content) {
						        const b = content.querySelector('b')
						        if (b) {
						          b.textContent = Swal.getTimerLeft()
						        }
						      }
						    }, 100)
						  },
						  willClose: () => {
						    clearInterval(timerInterval)
						  }
						}).then((result) => {
						  /* Read more about handling dismissals below */
						  if (result.dismiss === Swal.DismissReason.timer) {
						    location.reload();
						 }
					})
				})
			
			} else {
					return Swal.fire(
			  'Error', 'Usuario está inactivo, comuniquese con el administrador del sistema(ingjerson2014@gmail.com)',
			  'warning'
			);
			}
		}
	})
}




var t_usuario;
function listar_usuario(){
var idempresa =$("#txt_idempresa").val();
     t_usuario = $("#tabla_usuario").DataTable({
	    "ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/usuario/controlador_usuario_listar.php",
		    data:{
		    	idempresa:idempresa
		    }
      },
      
      "order":[[1,'asc']],
        "columns":[
            {"defaultContent":""},
            {"data":"usuario_nombre"},
            {"data":"persona"},
            {"data":"rol_nombre"},
            {"data":"usuario_email"},
            {"data":"caja"},
            {"data":"usuario_imagen",
            render: function (data, type, row ) {
            	 return '<img src="../'+data+'" class="img-circle" style="width:28px">';
            	}
        	}, 
            {
                "data": "usuario_estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<span class='label label-success'>" + data + "</span>";
                    } else {
                        return "<span class='label label-danger'>" + data + "</span>";
                    }
                }
            },
            {
                "data": "usuario_estatus",
                render: function(data, type, row) {
                    if (data == 'ACTIVO') {
                        return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button> <button style='font-size:13px;' type='button' class='imprimir btn btn-primary'><i class='fa fa-print'></i></button>&nbsp;&nbsp;";
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
	t_usuario.on( 'draw.dt', function () {
        var PageInfo = $('#tabla_usuario').DataTable().page.info();
        t_usuario.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            } );
        } );
  
}

 // modificar datos del procedimiento
    $('#tabla_usuario').on('click','.editar',function(){
        var data = t_usuario.row($(this).parents('tr')).data();

         if(t_usuario.row(this).child.isShown()){
                var data = t_usuario.row(this).data();
            }
        $("#modal_editar").modal({backdrop:'static',keyboard:false})
        $("#modal_editar").modal('show');
        $("#txt_idusuario").val(data.usuario_id);
        $("#txt_usu_actual_editar").val(data.usuario_nombre);
        $("#txt_email_nuevo_editar").val(data.usuario_email);
        $("#cmb_rol_editar").val(data.rol_id).trigger("change");
        $("#cmb_persona_editar").val(data.persona_id).trigger("change");
        $("#cmb_estatus_editar").val(data.usuario_estatus).trigger("change");

    });


 // desactivar usuario
    $('#tabla_usuario').on('click', '.activar', function() {
        var data = t_usuario.row($(this).parents('tr')).data();
        if (t_usuario.row(this).child.isShown()) {
            var data = t_usuario.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de activar el usuario?',
            text: "Una vez desactivado el usuario  podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.usuario_id, 'ACTIVO');
            }
        })
    })
 // function activar usuario
    $('#tabla_usuario').on('click', '.desactivar', function() {
        var data = t_usuario.row($(this).parents('tr')).data();
        if (t_usuario.row(this).child.isShown()) {
            var data = t_usuario.row(this).data();
        }
        Swal.fire({
            title: 'Está seguro de desactivar el usuario?',
            text: "Una vez desactivado el usuario no podrá ingresar al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                Modificar_Estatus(data.usuario_id, 'INACTIVO');
            }
        })
    })

	function Modificar_Estatus(usuario_id, estatus) {
        var mensaje = "";
        if (estatus == 'INACTIVO') {
            mensaje = "desactivado";
        } else {
            mensaje = "activo";
        }
        $.ajax({
            url: "../controlador/usuario/control_modificar_estatus.php",
            type: 'POST',
            data: {
                usuario_id: usuario_id,
                estatus: estatus,
            }
        }).done(function(resp) {
           alert(resp);
            if (resp > 0) {
                Swal.fire("Mensaje  de confirmaciòn", "Usuario " + mensaje + " exitosamente",
                        "success")
                    .then((value) => {
                        //LimpiarRegistro();
                        t_usuario.ajax.reload();

                    });
            }

        })
    }





  function AbrirModalRegistro() {
        $("#modal_registro").modal({backdrop:'static',keyboard:false})
        $('#modal_registro').modal('show');
    }







function listar_persona_combo() {
	$.ajax({
		url:'../controlador/usuario/control_listar_persona_combo.php',
		type:'POST',
		}).done(function(resp){
		var data = JSON.parse(resp);
		//alert(resp);
		var cadena ="<option value=''>Seleccione...</option>";
		if(data.length > 0) {
			for (var i = 0; i < data.length; i++) {
				cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
			} 
			$('#cmb_persona').html(cadena);
			$('#cmb_persona_editar').html(cadena);
		} else {
			cadena+="<option value=''> No Hay datos</option>";
			$('#cmb_persona').html(cadena);
			$('#cmb_persona_editar').html(cadena);
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
		var cadena ="<option value=''>Seleccione...</option>";
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


function Registrar_Usuario() {

	var usuario = $('#txt_usu').val();
	var pass =$('#txt_pass').val();
	var email = $('#txt_email').val();
	var idrol =$('#cmb_rol').val();
	var archivo = $('#imagen').val();
	var idpersona =$('#cmb_persona').val();
	var idempresa =$("#txt_idempresa").val();
	if(usuario.length==0 || pass.length==0 || email.length==0|| idrol.length ==0 || idpersona.length==0) { 
		return Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
		);
	}
	var f = new Date();
	var extension = archivo.split('.').pop();
	var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+
	f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
 
	var formData = new FormData();
	var foto = $("#imagen")[0].files[0];
	formData.append('usuario',usuario);
	formData.append('pass',pass);
	formData.append('email',email);
	formData.append('idrol',idrol);
	formData.append('idpersona',idpersona);
	formData.append('idempresa',idempresa);
	formData.append('foto',foto);
	formData.append('nombrearchivo',nombrearchivo);

	$.ajax({
		url:'../controlador/usuario/controlador_registro_usuario.php',
		type:'POST',
		data:formData,
		contentType:false,
		processData:false,
		success:function(resp) {
			if(resp != 0) {
				if(resp > 0) {
                 if(resp==1) {
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Usuario registrado exitosamente",
                    "success")
                .then((value)=>{
                    listar_usuario();
               LimpiarCampos();
                    table.ajax.reload();
                
                });
            } else {
             LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Usuario ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Usuario no insertado','warning');
        }
			}
		
		}

	});
	return false;
}

function LimpiarCampos() {
	$("#txt_usu").val("");
	$("#txt_pass").val("");
	$("#txt_email").val("");
}



function TraerDatosUsuario() {
	var id =$("#txt_idprincipal").val();
	$.ajax({
		url:"../controlador/usuario/cntrltraerdatos_usuario.php",
		type:'POST',
		data:{
			id:id
		}
	}).done(function(resp){
		//alert(resp);
		var data = JSON.parse(resp);
		if(data.length > 0) {
			document.getElementById('usu_sidebar').innerHTML=data[0][1];
			document.getElementById('rol_sidebar').innerHTML=data[0][8];
			document.getElementById('img_sidebar1').innerHTML=data[0][7];
			
		}
	});
}



function TraerDatosWidgets() {
	TraerDatosGraficoVentasWidgets();
	TraerDatosGraficoComprasWidgets();
	let inicio = $("#txt_finicio_d").val();
	let fin = $("#txt_ffin_d").val();
	$.ajax({
		url:"../controlador/usuario/cntrltraerdatos_widget.php",
		type:'POST',
		data:{
			inicio:inicio,
			fin:fin
		}
	}).done(function(resp){
		//alert(resp);
		var data = JSON.parse(resp);
		let cadena ='';
		if(data.length > 0) {
			cadena+='<div class="col-lg-3 col-md-6">'+
                       '<div class="ibox bg-success color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">'+data[0][0]+'</h2>'+
                                '<div class="m-b-5">TOTAL VENTAS</div><i class="ti-shopping-cart widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '<div class="col-lg-3 col-md-6">'+
                        '<div class="ibox bg-info color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">'+data[0][1]+'</h2>'+
                                '<div class="m-b-5">TOTAL COMPRAS</div><i class="ti-bar-chart widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '<div class="col-lg-3 col-md-6">'+
                        '<div class="ibox bg-warning color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">'+data[0][2]+'</h2>'+
                                '<div class="m-b-5">VENTAS REALIZADAS</div><i class="fa fa-money widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '<div class="col-lg-3 col-md-6">'+
                        '<div class="ibox bg-danger color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">'+data[0][3]+'</h2>'+
                                '<div class="m-b-5">COMPRAS REALIZADAS</div><i class="ti-user widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>';
			document.getElementById('div_widget').innerHTML=cadena;
			
		}else {
			cadena+='<div class="col-lg-3 col-md-6">'+
                       '<div class="ibox bg-success color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">0</h2>'+
                                '<div class="m-b-5">TOTAL VENTAS</div><i class="ti-shopping-cart widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '<div class="col-lg-3 col-md-6">'+
                        '<div class="ibox bg-info color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">0</h2>'+
                                '<div class="m-b-5">TOTAL COMPRAS</div><i class="ti-bar-chart widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '<div class="col-lg-3 col-md-6">'+
                        '<div class="ibox bg-warning color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">0</h2>'+
                                '<div class="m-b-5">VENTAS REALIZADAS</div><i class="fa fa-money widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                    '<div class="col-lg-3 col-md-6">'+
                        '<div class="ibox bg-danger color-white widget-stat">'+
                            '<div class="ibox-body">'+
                                '<h2 class="m-b-5 font-strong">0</h2>'+
                                '<div class="m-b-5">COMPRAS REALIZADAS</div><i class="ti-user widget-stat-icon"></i>'+
                                '<div></div>'+
                            '</div>'+
                        '</div>'+
                    '</div>';
			document.getElementById('div_widget').innerHTML=cadena;
		}
	});
}

var myChartventa;

function TraerDatosGraficoVentasWidgets() {
	let inicio = $("#txt_finicio_d").val();
	let fin = $("#txt_ffin_d").val();
	$.ajax({
		url:"../controlador/usuario/cntrltraergrafico_ventas_widget.php",
		type:'POST',
		data:{
			inicio:inicio,
			fin:fin
		}
	}).done(function(resp){
		//alert(resp);
		var data = JSON.parse(resp);
		let cadena ='';
		if(data.length > 0) {
			let producto = new Array();
			let cantidad = new Array();
			let color = new Array();
			for (let index = 0; index < data.length; index++) {
				producto.push(data[index][0]);
				cantidad.push(data[index][1]);
				color.push(colorRGB());
			}
			var ctx = document.getElementById('myChartVentasTop5').getContext('2d');
			if(myChartventa) {
				myChartventa.reset();
				myChartventa.destroy();
			}
    myChartventa = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: producto,
        datasets: [{
            label: 'TOP 5 PRODUCTOS VENDIDOS',
          
             backgroundColor: [color],
            borderColor: [color],
              data: cantidad,
            borderWidth: 1
        }]
    },
      options: {
        scales: {
            x: {
                stacked: true
            },
            y: {
                stacked: true
            }
        }
    }
			});
		} else {
				var ctx = document.getElementById('myChartVentasTop5').getContext('2d');
        if(myChartventa) {
				myChartventa.reset();
				myChartventa.destroy();
			}
          myChartventa = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['NO HAY PRODUCTOS'],
        datasets: [{
            label: 'TOP 5 PRODUCTOS',
            data: [0],
           
            borderWidth: 1
        }]
    },
      options: {
      
    }
			});
		}
	});

	  
}

var myChartcompras;

function TraerDatosGraficoComprasWidgets() {
	let inicio = $("#txt_finicio_d").val();
	let fin = $("#txt_ffin_d").val();
	$.ajax({
		url:"../controlador/usuario/cntrltraergrafico_compras_widget.php",
		type:'POST',
		data:{
			inicio:inicio,
			fin:fin
		}
	}).done(function(resp){
		//alert(resp);
		var data = JSON.parse(resp);
		let cadena ='';
		if(data.length > 0) {
			let producto = new Array();
			let cantidad = new Array();
			let color = new Array();
			for (let index = 0; index < data.length; index++) {
				producto.push(data[index][0]);
				cantidad.push(data[index][1]);
				color.push(colorRGB());
			}
			var ctx = document.getElementById('myChartComprasTop5').getContext('2d');
			if(myChartcompras) {
				myChartcompras.reset();
				myChartcompras.destroy();
			}
    myChartcompras = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: producto,
        datasets: [{
            label: 'TOP 5 PRODUCTOS COMPRADOS',
          
             backgroundColor: [color],
            borderColor: [color],
              data: cantidad,
            borderWidth: 1
        }]
    },
      options: {
        scales: {
            x: {
                stacked: true
            },
            y: {
                stacked: true
            }
        }
    }
			});
		} else {
				var ctx = document.getElementById('myChartComprasTop5').getContext('2d');
        if(myChartcompras) {
				myChartcompras.reset();
				myChartcompras.destroy();
			}
          myChartcompras = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['NO HAY PRODUCTOS'],
        datasets: [{
            label: 'TOP 5 PRODUCTOS',
            data: [0],
           
            borderWidth: 1
        }]
    },
      options: {
      
    }
			});
		}
	});

	  
}








 function generarNumero(numero) {
 	return(Math.random()*numero).toFixed(0);
 }

 function colorRGB(){
 	var color ="("+generarNumero(255)+","+generarNumero(255)+","+generarNumero(255)+")";
 	return "rgb"+color;
 }


 function TraerDatosPerfil(){
    var id =$("#txt_idprincipal").val();
	$.ajax({
		url:"../controlador/usuario/cntrltraerdatos_usuario.php",
		type:'POST',
		data:{
			id:id
		}
	}).done(function(resp){
		//alert(resp);
		var data = JSON.parse(resp);
		if(data.length > 0) {
			document.getElementById('txt_image_profile').src='../'+data[0][7];
			document.getElementById('img_sidebar1').src='../'+data[0][7];
			document.getElementById('txt_persona_profile').innerHTML=data[0][10]+ ' '+ data[0][11];
			document.getElementById('txt_rol_profile').innerHTML=data[0][8];
			document.getElementById('txt_nombres_profile').value=data[0][10];
			document.getElementById('txt_apepat_profile').value=data[0][11];
			document.getElementById('txt_apemat_profile').value=data[0][12];
			document.getElementById('txt_nrodocumento_profile').value=data[0][13];
			$("cmb_tipodocumento_profile").val(data[0][14]).trigger('change');
			$("cmb_sexo_profile").val(data[0][15]).trigger('change');
			
			document.getElementById('txt_telefono_profile').value=data[0][16];
			document.getElementById('txt_direccion_profile').value=data[0][17];
			document.getElementById('txt_conactual_profile').value=data[0][2];
		}
	});
  }

function Modificar_Usuario() {
	var idusuario = $('#txt_idusuario').val();
	//var email_actual = $('#txt_email_actual_editar').val();
	var email_nuevo = $('#txt_email_nuevo_editar').val();
	var idrol =$('#cmb_rol_editar').val();
	var idpersona =$('#cmb_persona_editar').val();
	var estatus =$('#cmb_estatus_editar').val();
	if(email_nuevo.length==0 || idrol.length ==0 || idpersona.length==0) { 
		return Swal.fire( 'Mensaje de error',  'Digite los campos estan vacios', 'warning'
		);
	}
	
 
	  $.ajax({
        url:'../controlador/usuario/controlador_usuario_modificar.php',
        type:'POST',
        data:{
          idusuario:idusuario,
          email_nuevo:email_nuevo,
          idrol:idrol,
          idpersona:idpersona,
          estatus:estatus
        }
      }).done(function(resp){
      	alert (resp);
         if(resp > 0) {
            if(resp==1) {
                $('#modal_editar').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Usuario editado exitosamente",
                    "success")
                .then((value)=>{
                    listar_usuario();
               // LimpiarCampos();
                    t_usuario.ajax.reload();
                
                });
            } else {
              //  LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Usuario ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Usuario no editado','warning');
        }
      });
}



function Editar_Foto() {

	var idusuario =$('#txt_idusuario').val();
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
	
	formData.append('idusuario',idusuario);
	formData.append('foto',foto);
	formData.append('nombrearchivo',nombrearchivo);

	$.ajax({
		url:'../controlador/usuario/controlador_usuario_editar_foto.php',
		type:'POST',
		data:formData,
		contentType:false,
		processData:false,
		success:function(resp){
			alert(resp);
			if(resp!=0){
               if(resp==1){
               	t_usuario.ajax.reload();
                $('#modal_registro').modal('hide');
                Swal.fire("Mensaje  de confirmaciòn","Foto Actualizada exitosamente","success");  
           		 } 
			}
		
		}

	});
	return false;
}

function Editar_Foto_Profile() {

	var idusuario =$('#txt_idprincipal').val();
	var archivo = $('#imagen_profile').val();
	
	
	if( archivo.length==0) { 
		return Swal.fire('Mensaje de error','Debe seleccionar un archivo', 'warning'
		);
	}
	var f = new Date();
	var extension = archivo.split('.').pop();
	var nombrearchivo = "IMG"+f.getDate()+""+(f.getMonth()+1)+""+f.getFullYear()+""+
	f.getHours()+""+f.getMinutes()+""+f.getSeconds()+"."+extension;
	var formData = new FormData();
	var foto = $("#imagen_profile")[0].files[0];
	formData.append('idusuario',idusuario);
	formData.append('foto',foto);
	formData.append('nombrearchivo',nombrearchivo);

	$.ajax({
		url:'../controlador/usuario/controlador_usuario_editar_foto.php',
		type:'POST',
		data:formData,
		contentType:false,
		processData:false,
		success:function(resp){
			alert(resp);
			if(resp!=0){
               if(resp==1){
           		   TraerDatosPerfil();
           		   Swal.fire("Mensaje de confirmacion",'FOTO ACTUALIZAADA EXITOSAMENTE','success');
           		 } 
			}
		
		}

	});
	return false;
}


function Datos_Actualizar() {
	var idusuario =$('#txt_idprincipal').val();
	var nombre =$('#txt_nombres_profile').val();
	var apepat =$('#txt_apepat_profile').val();
	var apemat =$('#txt_apemat_profile').val();
	var nrodocumento =$('#txt_nrodocumento_profile').val();
	var tipo_documento =$('#cmb_tipodocumento_profile').val();
	// var sexo =$('#cmb_sexo_profile').val();
	var telefono =$('#txt_telefono_profile').val();
	var direccion =$('#txt_direccion_profile').val();

    if(nombre.length ==0 || apepat.length == 0 || apemat.length ==0 || nrodocumento.length ==0
      || tipo_documento.length ==0) {
      return Swal.fire('Mensaje de error','Debe digitar los campos vacios','warning');
    }
    $.ajax({
      url:'../controlador/usuario/controlador_actualizar_persona_profile.php',
      type:'POST',
      data:{
      	idusuario:idusuario,
        nombre:nombre,
        apepat:apepat,
        apemat:apemat,
        nrodocumento:nrodocumento,
        tipo_documento:tipo_documento,
      
        telefono:telefono,
        direccion:direccion
      }
    }).done(function(resp){
    	alert(resp);
      if(resp > 0) {
            if(resp==1) {
     
                Swal.fire("Mensaje  de confirmaciòn","Persona registrado exitosamente",
                    "success");
                TraerDatosPerfil();
                
            } else {
               // LimpiarCampos();
                return Swal.fire('Mensaje de error', 'Documento ya existe en el sistema, utilice otro', 'warning'
                  );
            }
        }else {
            return Swal.fire('Mensaje de error','Persona no insertado','warning');
        }
    })
}

function Editar_Contrasena() {
	var idusuario =$('#txt_idprincipal').val();
	var contrabd =$('#txt_conactual_profile').val();
	var contraescrita =$('#txt_conactual_escrita_profile').val();
	var contranu =$('#txt_connueva_profile').val();
	var contrare =$('#txt_repcontra_profile').val();

	if(contraescrita.length==0 ||contranu.length==0 || contrare.length ==0) {
		return Swal.fire( 'Mensaje de error','Debe digitar los campos vacios','warning');
	}

	if(contranu != contrare) {
		return Swal.fire( 'Mensaje de error','Las contraseñas no coinciden','warning');
	}
	$.ajax({
		url:'../controlador/usuario/control_cambiar_contrasena.php',
		type:'POST',
		data:{
			idusuario:idusuario,
			contrabd:contrabd,
			contraescrita:contraescrita,
			contranu:contranu,
		}
	}).done(function(resp){
		//alert(resp);
		if(resp >0) {
			if(resp == 1) {
			
				Swal.fire("Mensaje  de confirmaciòn","Contraseña modificada exitosamente",
					"success");
				LimpiarCamposContrar();
			
			} else {
				return Swal.fire( 'Mensaje de error','La clave actual no coincide con la de nuestra base de datos, verifique por favor☺','warning');
			}
		}else {
			return Swal.fire( 'Mensaje de error','No se pudo actualizar la contraseña','warning');
		}
	})
}


function LimpiarCamposContrar() {
	$('#txt_conactual_escrita_profile').val("");
	$('#txt_connueva_profile').val("");
	$('#txt_repcontra_profile').val("");
}






var t_productos_poco_stock;
function listar_productos_poco_stock(){

     t_productos_poco_stock = $("#tbl_productos_poco_stock").DataTable({
	     	"ordering":false,   
        "pageLength":10,
        "destroy":true,
        "async": false ,
        "responsive": true,
      	"autoWidth": false,
      "ajax":{
        "method":"POST",
		    "url":"../controlador/usuario/productos_poco_stock.php",
            data:{
                
            }
      },
      
     
        "columns":[
           
            {"data":"producto_codigo"},
         
             {"data":"producto_nombre"},
               {"data":"producto_stock"},
               {"data":"cant_minima"},
        
      ],
      "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
        	$($(nRow).find("td")[2]).css('text-align', 'center' );
          $($(nRow).find("td")[4]).css('text-align', 'center' );
        },
        "language":idioma_espanol,
        select: true
	});
	
}