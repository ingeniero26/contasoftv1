<nav class="page-sidebar" id="sidebar">
            <div id="sidebar-collapse">
                <div class="admin-block d-flex">
                    <div>
                        <img  id="img_sidebar1" width="45px" />
                    </div>
                    <div class="admin-info">
                        <div class="font-strong"><label for="" id="usu_sidebar"></label></div><small id="rol_sidebar"></small>
                    </div>
                </div>
                <ul class="side-menu metismenu">
                    <li>
                        <a class="active" onclick="cargar_contenido('contenido_principal','index.php')"><i class="sidebar-item-icon fa fa-th-large"></i>
                            <span class="nav-label">Inicio</span>
                        </a>
                    </li>
                    
                    
                    <li class="heading">MODULOS</li>
                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Configuración</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                               <li>
                                <a href="javascript:cargar_contenido('contenido_principal','empresa/empresa.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> EMPRESA</span></a>
                                
                            </li>
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','configuracion/vista_arl.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> ARL</span></a>
                                
                            </li>
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','configuracion/vista_eps.php')">
                                <span class="nav-label"><i class="fa   fa-list-ol"></i> EPS</span></a>
                            </li>
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','configuracion/vista_pension.php')">
                                <span class="nav-label"><i class="fa   fa-list-ol"></i> PENSIÓN</span></a>
                            </li>

                               <li>
                            <a href="javascript:cargar_contenido('contenido_principal','nomina/vista_dptos.php')">
                                <span class="nav-label"><i class="fa   fa-list-ol"></i> Secciones</span></a>
                            </li>
                            
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','nomina/vista_cargos.php')">
                                <span class="nav-label"><i class="fa   fa-list-ol"></i> Cargos</span></a>
                            </li>
                            
                         
                            <!--<li>
                                <a href="javascript:cargar_contenido('contenido_principal','configuracion/vista_deptos.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Departamentos</span></a>
                                
                            </li>-->
                            
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','configuracion/vista_ciudades.php')">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Ciudades</span></a>
                            </li>
                            
                        </ul>
                    </li>
                    
                 <!--   <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Acceso</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                              
                            <li>
                                <a href="javascript:cargar_contenido('contenido_principal','rol/vista_rol_listar.php')">
                                    <span class="nav-label"><i class="fa  fa-align-justify"></i> Rol</span></a>
                                
                            </li>
                            <li>
                                <a href="javascript:cargar_contenido('contenido_principal','usuarios/vista_usuarios_listar.php')">
                                    <span class="nav-label"><i class="fa   fa-building-o"></i> Usuarios</span></a>
                                
                            </li>
                        </ul>
                    </li>-->
                    
                    <li>
                        <a href="javascript:cargar_contenido('contenido_principal','persona/vista_persona_listar.php')">
                            <span class="nav-label"><i class="fa   fa-building-o"></i> Terceros</span></a>
                        
                    </li>
                              
                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Inventario</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','bodegas/mantenimiento_bodegas.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Bodegas</span></a>
                                
                            </li>
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','medida/mantenimiento_unidad.php')">
                                <span class="nav-label"><i class="fa   fa-list-ol"></i> Unidad Medida</span></a>
                            </li>
                            
                            <li>
                                <a href="javascript:cargar_contenido('contenido_principal','categoria/vista_categoria_listar.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Categorias</span></a>
                                
                            </li>
                              <li>
                                <a href="javascript:cargar_contenido('contenido_principal','tipo_producto/vista_tipo_producto.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Tipo Producto</span></a>
                                
                            </li>

                            
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','productos/vista_mantenimiento_productos.php')">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Productos</span></a>
                            </li>


                           
                        </ul>
                    </li>
                    
                                             

                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Ingresos</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                              <li>
                        <a href="javascript:cargar_contenido('contenido_principal','proveedores/vista_mantenimiento_proveedores.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Proveedores</span></a>
                        </li>
                                                   <li>
                        <a href="javascript:cargar_contenido('contenido_principal','ingreso/vista_mantenimiento_ingreso.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Compras</span></a>
                        </li>
                            
                            <li>
                                <a href="javascript:cargar_contenido('contenido_principal','cuentas/cuentas_proveedores.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Cuentas x Pagar</span></a>
                                
                            </li>
                            
                         <!--   <li>
                            <a href="javascript:cargar_contenido('contenido_principal','cuentas/listado_abonos_proveedores.php')">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Abonos</span></a>
                            </li>
                           -->
                        </ul>
                    </li>
                    

          
                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Salidas</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                                  <li>
                        <a href="javascript:cargar_contenido('contenido_principal','clientes/vista_mantenimiento_clientes.php')">
                            <span class="nav-label"><i class="fa   fa-list-ul"></i> Clientes</span></a>
                        </li>
                         
                        <li>
                        <a href="javascript:cargar_contenido('contenido_principal','ventas/vista_mantenimiento_ventas.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Ventas</span></a>
                        </li>
                          <li>
                        <a href="javascript:cargar_contenido('contenido_principal','cuentas/cuentas_clientes.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Cuentas x Cobrar</span></a>
                        </li>
                         <li>
                        <a href="javascript:cargar_contenido('contenido_principal','cuentas/abono_clientes.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Abono Clientes</span></a>
                        </li>
                          <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/vista_pagos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Tipo Gastos</span></a>
                                
                            </li>
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Pagos</span></a>
                                
                            </li>

                          
                           
                        </ul>
                    </li>


                   <!--   <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Tesoreria</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                                  <li>
                        <a href="javascript:cargar_contenido('contenido_principal','concepto/vista_concepto_salida.php')">
                            <span class="nav-label"><i class="fa   fa-list-ul"></i> Conceptos</span></a>
                        </li>
                         
                        <li>
                        <a href="javascript:cargar_contenido('contenido_principal','salidas/mantenimiento_salidas.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Salida de Mercancía</span></a>
                        </li>
                          <li>
                        <a href="javascript:cargar_contenido('contenido_principal','cuentas/cuentas_clientes.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Ajustes</span></a>
                        </li>
                         <li>
                        <a href="javascript:cargar_contenido('contenido_principal','cuentas/abono_clientes.php')">
                            <span class="nav-label"><i class="fa   fa-list-ol"></i> Reportes</span></a>
                        </li>

                          
                           
                        </ul>
                    </li>-->

                    
                    
                   <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Nomina</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','nomina/vista_empleados.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Empleados</span></a>
                                
                            </li>
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','medida/mantenimiento_unidad.php')">
                                <span class="nav-label"><i class="fa   fa-list-ol"></i>Deducciones</span></a>
                            </li>
                            
                            <li>
                                <a href="javascript:cargar_contenido('contenido_principal','categoria/vista_categoria_listar.php')">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Prestaciones</span></a>
                                
                            </li>
                            
                            <li>
                            <a href="javascript:cargar_contenido('contenido_principal','productos/vista_mantenimiento_productos.php')">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Salarios</span></a>
                            </li>
                            
                        </ul>
                    </li>
                    

                    <!--   <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Contabilidad</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/vista_documentos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Documentos</span></a>
                                
                            </li>
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Plan de cuentas</span></a>
                                
                            </li>
                              <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Plan de cuentas NIFF</span></a>
                                
                            </li>
                               <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> IVA</span></a>
                                
                            </li>
                               <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Retefuente</span></a>
                                
                            </li>
                               <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Conceptos de comprobantes</span></a>
                                
                            </li>
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Conceptos de Ajustes de Inventario</span></a>
                                
                            </li>
                            <li>
                           
                        </ul>
                    </li>-->


                     <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Consultas</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="../mpdf/reporte_usuarios.php" target="_blank">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Usuarios</span></a>
                                
                            </li>
                             <li>
                            <a href="../mpdf/reporte_clientes.php" target="_blank">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Clientes</span></a>
                            </li>
                             <li>
                             <a href="../mpdf/reporte_proveedores.php" target="_blank">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Proveedores</span></a>
                            </li>
                            
                           
                            <li>
                           
                        </ul>
                    </li>

                    


                     <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Reportes</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="../mpdf/reporte_categorias.php" target="_blank">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Categorias</span></a>
                                
                            </li>
                             <li>
                            <a href="../mpdf/reporte_medida.php" target="_blank">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Medidas</span></a>
                            </li>
                             <li>
                            <a href="../mpdf/prueba_abonos_proveedor.php" target="_blank">
                                <span class="nav-label"><i class="fa   fa-th-list"></i> Abono Proveedores</span></a>
                            </li>
                             <li>
                            <a href="../mpdf/reporte_productos.php" target="_blank">
                                <span class="nav-label"><i class="fa   fa-th-list"></i>  Productos</span></a>
                            </li>
                          
                            
                           
                            <li>
                           
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Listados /Reportes</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','reportes/ventas_x_cliente.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Ventas x Clientes</span></a>
                                
                            </li>
                             <li>
                                <a href="javascript:cargar_contenido('contenido_principal','pagos/listado_gastos.php')" >
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> Pagos</span></a>
                                
                            </li>
                            <li>
                           
                        </ul>
                    </li>
                    
                  
                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Ayuda</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                             <li>
                                <a href="../form_copia.php" target="_blank">
                                    <span class="nav-label"><i class="fa   fa-outdent"></i> COPIA BD</span></a>
                                
                            </li>
                            
                           
                            <li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;"><i class="sidebar-item-icon fa fa-edit"></i>
                            <span class="nav-label">Contacto</span><i class="fa fa-angle-left arrow"></i></a>
                        <ul class="nav-2-level collapse">
                              
                            <li>
                                <a href="javascript:cargar_contenido('contenido_principal','soporte/soporte.php')">
                                    <span class="nav-label"><i class="fa  fa-align-justify"></i> Soporte</span></a>
                                
                            </li>
                           
                        </ul>
                    </li>
                   
                </ul>
            </div>
        </nav>