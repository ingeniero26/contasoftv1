<?php 

 require '../../model/modelo_usuario.php';
 $MU = new Modelo_Usuario();
 $consulta = $MU->facturas_credito_vencidas();
 echo json_encode($consulta);



 ?>