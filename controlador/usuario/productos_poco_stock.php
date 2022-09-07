<?php 

 require '../../modelo/modelo_usuario.php';
 $MU = new Modelo_Usuario();
 $consulta = $MU->productos_poco_stock();
 echo json_encode($consulta);



 ?>