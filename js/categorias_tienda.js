
function listarCategorias(){
    $.ajax({
        url:"controlador/categoria/ctrlCategorias.php",
        type:"POST",
        data:{accion:"listar"},
        success:function(response){
            $("#listCategorias").html(response);
        },
        error:function (err) {
            console.log("Eror: "+err);
        }
    });
}

function cargarProductosCategoria(idCategoria){
    $.ajax({
        url:"controlador/productos/ctrlProductos.php",
        type:"POST",
        data:{accion:"listarXcategoria",idCategoria:idCategoria},
        success:function(response){
            $("#marcoPrincipal").html(response);
        },
        error:function (err) {
            console.log("Eror: "+err);
        }
    });    
}