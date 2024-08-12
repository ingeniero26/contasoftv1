<?php 
 include '../../modelo/modelo_empleados.php';

 $MEP = new Modelo_Empleado();
$IdEmp = htmlspecialchars($_POST['IdEmp'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Modificar_Estatus_Empleado($IdEmp,$estatus);
echo $consulta;





 ?>