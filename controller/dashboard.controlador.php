<?php

class DashboardControlador
{

    static public function ctrGetDatosDashboard()
    {

        $datos = DashboardModelo::mdlGetDatosDashboard();

        return $datos;
    }
    static public function ctrGetVentasMesActual(){

        $ventasMesActual = DashboardModelo::mdlGetVentasMesActual();

        return $ventasMesActual;
    }

    
}
