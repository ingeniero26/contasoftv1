<?php 
 include '../../modelo/modelo_empleados.php';

 $MEP = new Modelo_Empleado();
$consulta =$MEP->listar_combo_pension();
echo json_encode($consulta);




 ?>