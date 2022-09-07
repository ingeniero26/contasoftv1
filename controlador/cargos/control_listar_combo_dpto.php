<?php 
 include '../../modelo/modelo_cargos.php';

 $MEP = new Modelo_Cargos();
$consulta =$MEP->listar_combo_dpto();
echo json_encode($consulta);




 ?>