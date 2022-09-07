<?php 

 require '../../modelo/modelo_usuario.php';
 $MU = new Modelo_Usuario();
 $consulta = $MU->productos_mas_vendidos();
 echo json_encode($consulta);



 ?>