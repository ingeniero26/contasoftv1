var t_centro_costos;
function listar_centro_costos() {
  var idempresa = $("#txt_idempresa").val();
  t_centro_costos = $("#tabla_centro_contros").DataTable({
    ordering: false,
    pageLength: 10,
    destroy: true,
    async: false,
    responsive: true,
    autoWidth: false,
    ajax: {
      method: "POST",
      url: "../controlador/centro_costos/control_centro_costos_listar.php",
      data: {
        idempresa: idempresa,
      },
    },

    order: [[1, "asc"]],
    columns: [
      { defaultContent: "" },
      { data: "codigo" },
      { data: "nombre" },
  
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
  t_centro_costos.on("draw.dt", function () {
    var PageInfo = $("#tabla_centro_contros").DataTable().page.info();
    t_centro_costos
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

// modificar datos del procedimiento
$("#tabla_centro_contros").on("click", ".editar", function () {
  var data = t_centro_costos.row($(this).parents("tr")).data();

  if (t_centro_costos.row(this).child.isShown()) {
    var data = t_centro_costos.row(this).data();
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
$("#tabla_centro_contros").on("click", ".activar", function () {
  var data = t_centro_costos.row($(this).parents("tr")).data();
  if (t_centro_costos.row(this).child.isShown()) {
    var data = t_centro_costos.row(this).data();
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
$("#tabla_centro_contros").on("click", ".desactivar", function () {
  var data = t_centro_costos.row($(this).parents("tr")).data();
  if (t_centro_costos.row(this).child.isShown()) {
    var data = t_centro_costos.row(this).data();
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

function Modificar_Cuenta() {
  var id = $("#txt_idcuenta").val();
  var codigo_actual = $("#txt_codigo_actual_editar").val();
  var codigo_nuevo = $("#txt_codigo_nuevo_editar").val();
  var nit_cuenta = $("#txt_nit_cuenta_editar").val();
  var cuenta_nombre = $("#txt_nombre_cuenta_editar").val();
  var cuenta_tipo = $("#txt_tipo_editar").val();
  var cuenta_banco = $("#cmb_usa_banco_editar").val();
  var cuenta_base = $("#cmb_usa_base_editar").val();
  var cuenta_centro = $("#cmb_usa_centro_editar").val();
  var cta_nit = $("#cmb_usa_nit_editar").val();
  var anticipo_cuenta = $("#cmb_usa_anticipo_editar").val();
  var categoria_cuenta = $("#txt_categoria_editar").val();
  var clase_cuenta = $("#txt_clase_editar").val();
  var nivel_cuenta = $("#txt_nivel_editar").val();

  if (codigo_nuevo.length == 0) {
    Swal.fire("Mensaje de error", "Debe digitar los campos vacios", "warning");
  }
  $.ajax({
    url: "../controlador/cuentas_contables/control_cuentas_modificar.php",
    type: "POST",
    data: {
      id: id,
      codigo_actual: codigo_actual,
      codigo_nuevo: codigo_nuevo,
      nit_cuenta: nit_cuenta,
      cuenta_nombre:cuenta_nombre,
      cuenta_tipo:cuenta_tipo,
      cuenta_banco:cuenta_banco,
      cuenta_base:cuenta_base,
      cuenta_centro:cuenta_centro,
      cta_nit:cta_nit,
      anticipo_cuenta:anticipo_cuenta,
      categoria_cuenta:categoria_cuenta,
      clase_cuenta:clase_cuenta,
      nivel_cuenta:nivel_cuenta
    },
  }).done(function (resp) {
    alert(resp);
    if (resp > 0) {
      if (resp == 1) {
        $("#modal_editar").modal("hide");
        Swal.fire(
          "Mensaje  de confirmaciòn",
          "Cuenta editado exitosamente",
          "success"
        ).then((value) => {
          listar_cuentas_contables();
          LimpiarCampos();
          t_cuentas_contables.ajax.reload();
        });
      } else {
        LimpiarCampos();
        return Swal.fire(
          "Mensaje de error",
          "Cuenta ya existe en el sistema, utilice otro",
          "warning"
        );
      }
    } else {
      return Swal.fire("Mensaje de error", "Cuenta no editado", "warning");
    }
  });
}

function LimpiarCampos() {
  $("#txt_codigo").val("");
  $("#txt_nombre_nuevo_categoria").val("");
  $("#txt_nit_cuenta").val("");
   $("#txt_nombre_cuenta").val("");
   $("#txt_tipo").val("");
   $("#cmb_usa_banco").val("");
   $("#cmb_usa_base").val("");
   $("#cmb_usa_centro").val("");
   $("#cmb_usa_nit").val("");
   $("#cmb_usa_anticipo").val("");
   $("#txt_categoria").val("");
   $("#txt_clase").val("");
   $("#txt_nivel").val("");
}
