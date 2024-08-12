<?php 
 include '../../modelo/modelo_empleados.php';

 $MEP = new Modelo_Empleado();
$consulta =$MEP->listar_combo_arl();
echo json_encode($consulta);




 ?>