<?php
session_start();

if (!isset($_SESSION['S_IDUSUARIO'])) {
    header('location: ../Login/index.php');
}

?>



<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>SOFTCONT V2</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="../plantilla/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../plantilla/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../plantilla/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="../plantilla/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="../plantilla/assets/css/main.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../plugins/css/sweetalert2.min.css">
    <link rel="stylesheet" href="../plugins/css/datatables.min.css">
    <link rel="stylesheet" href="../plugins/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/css/responsive.dataTables.min.css">
    <link rel="stylesheet" href="../plugins/css/responsive.jqueryui.min.css">
    <link rel="stylesheet" href="../plantilla/assets/vendors/select2/css/select2.min.css">
    <!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">
    <div class="page-wrapper">
        <!-- START HEADER-->
        <header class="header">
            <div class="page-brand">
                <a class="link" href="index.php">
                    <span class="brand">CONTA
                        <span class="brand-tip">SOFT</span>
                    </span>
                    <span class="brand-mini">JD</span>
                </a>
            </div>
            <div class="flexbox flex-1">
                <!-- START TOP-LEFT TOOLBAR-->
                <ul class="nav navbar-toolbar">
                    <li>
                        <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                    </li>
                    <li>

                    </li>
                </ul>
                <!-- END TOP-LEFT TOOLBAR-->
                <!-- START TOP-RIGHT TOOLBAR-->
                <ul class="nav navbar-toolbar">

                    <li class="dropdown dropdown-user">
                        <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                            <img src="../plantilla/assets/img/admin-avatar.png" />
                            <span></span>Usuario<i class="fa fa-angle-down m-l-5"></i></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item"
                                onclick="cargar_contenido('contenido_principal','vista_profile.php')"><i
                                    class="fa fa-user"></i>Perfil</a>

                            <a class="dropdown-item" href="javascript:;"><i class="fa fa-support"></i>Soporte
                                Técnico</a>
                            <li class="dropdown-divider"></li>
                            <a class="dropdown-item" href="../controlador/usuario/cntrlCerrarSesion.php"><i
                                    class="fa fa-power-off"></i>Cerrar Sesión</a>
                        </ul>
                    </li>
                </ul>
                <!-- END TOP-RIGHT TOOLBAR-->
            </div>
        </header>
        <!-- END HEADER-->
        <!-- START SIDEBAR-->
        <?php
if ($_SESSION['S_ROL'] == '1') {
    include '../include/menu_principal.php';
} else if ($_SESSION['S_ROL'] == '4') {
    include '../include/menu_super.php';
} else {
    include '../include/menu_vendedor.php';
}

?>
        <!-- END SIDEBAR-->
        <div class="content-wrapper">
            <input type="text" value="<?php echo $_SESSION['S_IDUSUARIO']; ?>" id="txt_idprincipal" hidden>
            <input type="text" value="<?php echo $_SESSION['S_EMPRESA']; ?>" id="txt_idempresa" hidden>
            <!-- START PAGE CONTENT-->
            <div class="page-content fade-in-up">
                <div id="contenido_principal">
                    <div class="row">

                        <div class="col-5">
                            <label for=""><b>Fecha Inicio</b></label>
                            <input type="date" id="txt_finicio_d" class="form-control"><br>
                        </div>
                        <div class="col-5">
                            <label for=""><b>Fecha Fin</b></label>
                            <input type="date" id="txt_ffin_d" class="form-control"><br>
                        </div>
                        <div class="col-2">
                            <label for="">&nbsp;</label><br>
                            <button class="btn btn-success" style="width:100%" onclick="TraerDatosWidgets()"><i
                                    class="fa fa-search"></i>Buscar</button><br>
                        </div>

                    </div>
                    <div class="row" id="div_widget">

                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="ibox">
                                <canvas id="myChartVentasTop5"></canvas>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="ibox">
                                <canvas id="myChartComprasTop5"></canvas>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card card-info">
                                <div class="card-header">
                                    <h3 class="card-title">Los 10 productos mas vendidos</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div> <!-- ./ end card-tools -->
                                </div> <!-- ./ end card-header -->
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table" id="tbl_productos_mas_vendidos">
                                            <thead>
                                                <tr class="text-danger">
                                                    <th>Cod. producto</th>
                                                    <th>Producto</th>
                                                    <th>Cantidad</th>
                                                    <th>Ventas</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div> <!-- ./ end card-body -->
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card card-info">
                                <div class="card-header">
                                    <h3 class="card-title">Listado de productos con poco stock</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div> <!-- ./ end card-tools -->
                                </div> <!-- ./ end card-header -->
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table" id="tbl_productos_poco_stock">
                                            <thead>
                                                <tr class="text-danger">
                                                    <th>Cod. producto</th>
                                                    <th>Producto</th>
                                                    <th>Stock Actual</th>
                                                    <th>Mín. Stock</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div> <!-- ./ end card-body -->
                            </div>
                        </div>
                    </div>





                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
        <footer class="page-footer">
            <div class="font-13">2021 © <b>CONTASOFT</b> - Derecho reservados.</div>
            <a class="px-4" href="https://jsystemas-web.000webhostapp.com/" target="_blank">JKSYSTEMAS</a>
            <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
        </footer>
    </div>
    </div>
    <!-- BEGIN THEME CONFIG PANEL-->

    <!-- END THEME CONFIG PANEL-->
    <!-- BEGIN PAGA BACKDROPS-->
    <div class="sidenav-backdrop backdrop"></div>
    <div class="preloader-backdrop">
        <div class="page-preloader">Loading</div>
    </div>
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="../plantilla/assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="../plantilla/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="../plantilla/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../plantilla/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="../plantilla/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript">
    </script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="../plantilla/assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
    <script src="../plantilla/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
    <script src="../plantilla/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript">
    </script>
    <script src="../plantilla/assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="../plantilla/assets/js/app.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../plugins/js/sweetalert2.min.js"></script>
    <!-- PAGE LEVEL SCRIPTS
    <script src="../plantilla/assets/js/scripts/dashboard_1_demo.js" type="text/javascript"></script>-->
    <script type="text/javascript" src="../plugins/js/datatables.min.js"></script>
    <script type="text/javascript" src="../plugins/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="../plugins/js/responsive.bootstrap.min.js"></script>
    <script type="text/javascript" src="../plugins/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="../plugins/js/responsive.jqueryui.min.js"></script>
    <script type="text/javascript" src="../plantilla/assets/vendors/select2/js/select2.min.js"></script>
    <script type="text/javascript" src="../js/usuario.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>

    <script type="text/javascript">
    TraerDatosUsuario();
    listar_productos_poco_stock();

    function cargar_contenido(contenedor, contenido) {
        $('#' + contenedor).load(contenido);
    }
    var idioma_espanol = {
        select: {
            rows: "%d fila seleccionada"
        },
        "processing": "Procesando...",
        "lengthMenu": "Mostrar _MENU_ registros",
        "zeroRecords": "No se encontraron resultados",
        "emptyTable": "Ningún dato disponible en esta tabla",
        "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
        "infoFiltered": "(filtrado de un total de _MAX_ registros)",
        "search": "Buscar:",
        "infoThousands": ",",
        "loadingRecords": "Cargando...",
        "paginate": {
            "first": "Primero",
            "last": "Último",
            "next": "Siguiente",
            "previous": "Anterior"
        },
        "aria": {
            "sortAscending": ": Activar para ordenar la columna de manera ascendente",
            "sortDescending": ": Activar para ordenar la columna de manera descendente"
        },
        "buttons": {
            "copy": "Copiar",
            "colvis": "Visibilidad",
            "collection": "Colección",
            "colvisRestore": "Restaurar visibilidad",
            "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
            "copySuccess": {
                "1": "Copiada 1 fila al portapapeles",
                "_": "Copiadas %d fila al portapapeles"
            },
            "copyTitle": "Copiar al portapapeles",
            "csv": "CSV",
            "excel": "Excel",
            "pageLength": {
                "-1": "Mostrar todas las filas",
                "1": "Mostrar 1 fila",
                "_": "Mostrar %d filas"
            },
            "pdf": "PDF",
            "print": "Imprimir"
        },
        "autoFill": {
            "cancel": "Cancelar",
            "fill": "Rellene todas las celdas con <i>%d<\/i>",
            "fillHorizontal": "Rellenar celdas horizontalmente",
            "fillVertical": "Rellenar celdas verticalmentemente"
        },
        "decimal": ",",
        "searchBuilder": {
            "add": "Añadir condición",
            "button": {
                "0": "Constructor de búsqueda",
                "_": "Constructor de búsqueda (%d)"
            },
            "clearAll": "Borrar todo",
            "condition": "Condición",
            "conditions": {
                "date": {
                    "after": "Despues",
                    "before": "Antes",
                    "between": "Entre",
                    "empty": "Vacío",
                    "equals": "Igual a",
                    "notBetween": "No entre",
                    "notEmpty": "No Vacio",
                    "not": "Diferente de"
                },
                "number": {
                    "between": "Entre",
                    "empty": "Vacio",
                    "equals": "Igual a",
                    "gt": "Mayor a",
                    "gte": "Mayor o igual a",
                    "lt": "Menor que",
                    "lte": "Menor o igual que",
                    "notBetween": "No entre",
                    "notEmpty": "No vacío",
                    "not": "Diferente de"
                },
                "string": {
                    "contains": "Contiene",
                    "empty": "Vacío",
                    "endsWith": "Termina en",
                    "equals": "Igual a",
                    "notEmpty": "No Vacio",
                    "startsWith": "Empieza con",
                    "not": "Diferente de"
                },
                "array": {
                    "not": "Diferente de",
                    "equals": "Igual",
                    "empty": "Vacío",
                    "contains": "Contiene",
                    "notEmpty": "No Vacío",
                    "without": "Sin"
                }
            },
            "data": "Data",
            "deleteTitle": "Eliminar regla de filtrado",
            "leftTitle": "Criterios anulados",
            "logicAnd": "Y",
            "logicOr": "O",
            "rightTitle": "Criterios de sangría",
            "title": {
                "0": "Constructor de búsqueda",
                "_": "Constructor de búsqueda (%d)"
            },
            "value": "Valor"
        },
        "searchPanes": {
            "clearMessage": "Borrar todo",
            "collapse": {
                "0": "Paneles de búsqueda",
                "_": "Paneles de búsqueda (%d)"
            },
            "count": "{total}",
            "countFiltered": "{shown} ({total})",
            "emptyPanes": "Sin paneles de búsqueda",
            "loadMessage": "Cargando paneles de búsqueda",
            "title": "Filtros Activos - %d"
        },
        "select": {
            "1": "%d fila seleccionada",
            "_": "%d filas seleccionadas",
            "cells": {
                "1": "1 celda seleccionada",
                "_": "$d celdas seleccionadas"
            },
            "columns": {
                "1": "1 columna seleccionada",
                "_": "%d columnas seleccionadas"
            }
        },
        "thousands": ".",
        "datetime": {
            "previous": "Anterior",
            "next": "Proximo",
            "hours": "Horas",
            "minutes": "Minutos",
            "seconds": "Segundos",
            "unknown": "-",
            "amPm": [
                "am",
                "pm"
            ]
        },
        "editor": {
            "close": "Cerrar",
            "create": {
                "button": "Nuevo",
                "title": "Crear Nuevo Registro",
                "submit": "Crear"
            },
            "edit": {
                "button": "Editar",
                "title": "Editar Registro",
                "submit": "Actualizar"
            },
            "remove": {
                "button": "Eliminar",
                "title": "Eliminar Registro",
                "submit": "Eliminar",
                "confirm": {
                    "_": "¿Está seguro que desea eliminar %d filas?",
                    "1": "¿Está seguro que desea eliminar 1 fila?"
                }
            },
            "error": {
                "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
            },
            "multi": {
                "title": "Múltiples Valores",
                "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
                "restore": "Deshacer Cambios",
                "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
            }
        },
        "info": "Mostrando de _START_ a _END_ de _TOTAL_ entradas"

    }




    function sololetras(e) {
        key = e.keyCode || e.which;
        teclado = String.fromCharCode(key).toLowerCase();
        letras = "qwertyuiopasdfghjklñzxcvbnm ";
        especiales = "8-37-38-46-164";
        teclado_especial = false;
        for (var i in especiales) {
            if (key == especiales[i]) {
                teclado_especial = true;
                break;
            }
        }

        if (letras.indexOf(teclado) == -1 && !teclado_especial) {
            return false;
        }
    }


    function soloNumeros(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8) {
            return true;
        }
        // Patron de entrada, en este caso solo acepta numeros
        patron = /[0-9]/;
        tecla_final = String.fromCharCode(tecla);
        return patron.test(tecla_final);
    }

    function filterfloat(evt, input) {
        var key = window.Event ? evt.which : evt.keyCode;
        var chark = String.fromCharCode(key);
        var tempValue = input.value + chark;
        if (key >= 48 && key <= 57) {
            if (filter(tempValue) === false) {
                return false;
            } else {
                return true;
            }
        } else {
            if (key == 8 || key == 13 || key == 0) {
                return true;
            } else if (key == 46) {
                if (filter(tempValue) === false) {
                    return true;
                }
            } else {
                return false;
            }
        }
    }

    function filter(_val_) {
        var preg = /^([0-9]+\.?[0-9]{0,2})$/;
        if (preg.test(_val_) === true) {
            return true;
        } else {
            return false;
        }

    }

    $(document).ready(function() {

        $('.js-example-basic-single').select2();


        var f = new Date();
        var anio = f.getFullYear();
        var mes = f.getMonth() + 1;
        var d = f.getDate();
        if (d < 10) {
            d = '0' + d;
        }

        if (mes < 10) {
            mes = '0' + mes;
        }
        document.getElementById('txt_finicio_d').value = anio + "-" + mes + "-" + d;
        document.getElementById('txt_ffin_d').value = anio + "-" + mes + "-" + d;

        TraerDatosWidgets();

    });



    /*grafico*/
    </script>
</body>

</html>