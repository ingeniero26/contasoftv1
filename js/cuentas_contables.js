var t_cuentas_contables;
function listar_cuentas_contables() {
  var idempresa = $("#txt_idempresa").val();
  t_cuentas_contables = $("#tabla_cuentas_contables").DataTable({
    ordering: false,
    pageLength: 10,
    destroy: true,
    async: false,
    responsive: true,
    autoWidth: false,
    ajax: {
      method: "POST",
      url: "../controlador/cuentas_contables/control_cuentas_contables_listar.php",
      data: {
        idempresa: idempresa,
      },
    },

    order: [[1, "asc"]],
    columns: [
      { defaultContent: "" },
      { data: "codigo" },
      { data: "concepto_nit" },
      { data: "nombre" },
      { data: "tipo" },
      { data: "usa_bancos" },
      { data: "usa_base" },
      { data: "usa_centros" },
      { data: "usa_nit" },
      { data: "usa_anticipo" },
      { data: "categoria" },
      { data: "clase" },
      { data: "nivel" },
      { data: "fregistro" },
   
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
        data: "estatus",
        render: function (data, type, row) {
          if (data == "ACTIVO") {
            return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' ><i class='fa fa-trash' disabled ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' disabled><i class='fa fa-check'></i></button>";
          } else {
            return "<button style='font-size:13px;' type='button' class='editar btn btn-primary'><i class='fa fa-edit'></i></button>&nbsp;&nbsp;&nbsp <button style='font-size:13px;' type='button' class='desactivar btn btn-danger' disabled ><i class='fa fa-trash'  ></i></button>&nbsp;&nbsp;&nbsp;&nbsp;<button style='font-size:13px;' type='button' class='activar btn btn-success' ><i class='fa fa-check'></i></button>";
          }
        },
      },
    ],
    fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
      $($(nRow).find("td")[2]).css("text-align", "center");
    },
    language: idioma_espanol,
    select: true,
  });
  t_cuentas_contables.on("draw.dt", function () {
    var PageInfo = $("#tabla_cuentas_contables").DataTable().page.info();
    t_cuentas_contables
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

// modificar datos del procedimiento
$("#tabla_cuentas_contables").on("click", ".editar", function () {
  var data = t_cuentas_contables.row($(this).parents("tr")).data();

  if (t_cuentas_contables.row(this).child.isShown()) {
    var data = t_cuentas_contables.row(this).data();
  }
  $("#modal_editar").modal({ backdrop: "static", keyboard: false });
  $("#modal_editar").modal("show");
  $("#txt_idcuenta").val(data.id);
  $("#txt_codigo_actual_editar").val(data.codigo)
  $("#txt_codigo_nuevo_editar").val(data.codigo)
  $("#txt_nit_cuenta_editar").val(data.concepto_nit);
  $("#txt_nombre_cuenta_editar").val(data.nombre);
  $("#txt_tipo_editar").val(data.tipo);
  $("#cmb_usa_banco_editar").val(data.usa_bancos).trigger("change");
  $("#cmb_usa_base_editar").val(data.usa_base).trigger("change");
  $("#cmb_usa_centro_editar").val(data.usa_centros).trigger("change");
  $("#cmb_usa_nit_editar").val(data.usa_nit).trigger("change");
  $("#cmb_usa_anticipo_editar").val(data.usa_anticipo).trigger("change");
  $("#txt_categoria_editar").val(data.categoria);
  $("#txt_clase_editar").val(data.clase);
  $("#txt_nivel_editar").val(data.nivel);
});

/*desactivar y activar categoria*/
$("#tabla_cuentas_contables").on("click", ".activar", function () {
  var data = t_cuentas_contables.row($(this).parents("tr")).data();
  if (t_cuentas_contables.row(this).child.isShown()) {
    var data = t_cuentas_contables.row(this).data();
  }
  Swal.fire({
    title: "Está seguro de activar  la cuenta contable?",
    text: "Activacion",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si",
  }).then((result) => {
    if (result.isConfirmed) {
      Modificar_Estatus(data.id, "ACTIVO");
    }
  });
});
// function activar usuario
$("#tabla_cuentas_contables").on("click", ".desactivar", function () {
  var data = t_cuentas_contables.row($(this).parents("tr")).data();
  if (t_cuentas_contables.row(this).child.isShown()) {
    var data = t_cuentas_contables.row(this).data();
  }
  Swal.fire({
    title: "Está seguro de desactivar la cuenta?",
    text: "Una vez desactivado podra activarla nuevamente",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si",
  }).then((result) => {
    if (result.isConfirmed) {
      Modificar_Estatus(data.id, "INACTIVO");
    }
  });
});

function Modificar_Estatus(id, estatus) {
  var mensaje = "";
  if (estatus == "INACTIVO") {
    mensaje = "desactivado";
  } else {
    mensaje = "activo";
  }
  $.ajax({
    url: "../controlador/cuentas_contables/control_modificar_estatus.php",
    type: "POST",
    data: {
      id: id,
      estatus: estatus,
    },
  }).done(function (resp) {
    alert(resp);
    if (resp > 0) {
      Swal.fire(
        "Mensaje  de confirmaciòn",
        "Cuenta " + mensaje + " exitosamente",
        "success"
      ).then((value) => {
        //LimpiarRegistro();
        t_cuentas_contables.ajax.reload();
      });
    }
  });
}

function AbrirModalRegistro() {
  $("#modal_registro").modal({ backdrop: "static", keyboard: false });
  $("#modal_registro").modal("show");
}

function Registrar_Cuenta() {
  var idempresa = $("#txt_idempresa").val();
  var cod_cuenta = $("#txt_codigo").val();
  var cuenta_nit = $("#txt_nit_cuenta").val();
  var nombre_cuenta = $("#txt_nombre_cuenta").val();
  var tipo_cuenta = $("#txt_tipo").val();
  var usa_banco = $("#cmb_usa_banco").val();
  var usa_base = $("#cmb_usa_base").val();
  var usa_centro = $("#cmb_usa_centro").val();
  var usa_nit = $("#cmb_usa_nit").val();
  var usa_anticipo = $("#cmb_usa_anticipo").val();
  var categoria = $("#txt_categoria").val();
  var clase = $("#txt_clase").val();
  var nivel = $("#txt_nivel").val();
  //var usa_deposito = $("#cmb_usa_deposito").val();
  
  if (cod_cuenta.length == 0) {
    return Swal.fire(
      "Mensaje de error",
      "Digite los campos estan vacios",
      "warning"
    );
  }
  $.ajax({
    url: "../controlador/cuentas_contables/control_cuentas_contables_registro.php",
    type: "POST",
    data: {
        idempresa: idempresa,
        cod_cuenta: cod_cuenta,
      cuenta_nit:cuenta_nit,
      nombre_cuenta:nombre_cuenta,
      tipo_cuenta:tipo_cuenta,
      usa_banco:usa_banco,
      usa_base:usa_base,
      usa_centro:usa_centro,
      usa_nit:usa_nit,
      usa_anticipo:usa_anticipo,
      categoria:categoria,
      clase:clase,
      nivel:nivel
    
    },
  }).done(function (resp) {
    if (resp > 0) {
      if (resp == 1) {
        $("#modal_registro").modal("hide");
        Swal.fire(
          "Mensaje  de confirmaciòn",
          "Cuenta registrada exitosamente",
          "success"
        ).then((value) => {
          listar_cuentas_contables();
          LimpiarCampos();
          t_cuentas_contables.ajax.reload();
        });
      } else {
        // LimpiarCampos();
        return Swal.fire(
          "Mensaje de error",
          "Cuenta ya existe en el sistema, utilice otro",
          "warning"
        );
      }
    } else {
      return Swal.fire("Mensaje de error", "Cuenta no insertada", "warning");
    }
  });
}

function Modificar_Categoria() {
  var id = $("#txt_idcategoria").val();
  var categoria_actual = $("#txt_nombre_actual_categoria").val();
  var categoria_nueva = $("#txt_nombre_nuevo_categoria").val();
  var estatus = $("#cmb_estatus").val();

  if (categoria_nueva.length == 0) {
    Swal.fire("Mensaje de error", "Debe digitar los campos vacios", "warning");
  }
  $.ajax({
    url: "../controlador/categoria/control_modificar_categoria.php",
    type: "POST",
    data: {
      id: id,
      categoria_actual: categoria_actual,
      categoria_nueva: categoria_nueva,
      estatus: estatus,
    },
  }).done(function (resp) {
    alert(resp);
    if (resp > 0) {
      if (resp == 1) {
        $("#modal_editar").modal("hide");
        Swal.fire(
          "Mensaje  de confirmaciòn",
          "Categoria editado exitosamente",
          "success"
        ).then((value) => {
          listar_categoria();
          LimpiarCampos();
          t_cuentas_contables.ajax.reload();
        });
      } else {
        LimpiarCampos();
        return Swal.fire(
          "Mensaje de error",
          "Categoria ya existe en el sistema, utilice otro",
          "warning"
        );
      }
    } else {
      return Swal.fire("Mensaje de error", "Categoria no editado", "warning");
    }
  });
}

function LimpiarCampos() {
  $("#txt_nombre_categoria").val("");
  $("#txt_nombre_nuevo_categoria").val("");
}
