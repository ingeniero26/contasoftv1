<?php 

 require '../../model/modelo_productos.php';
 $MU = new Modelo_Productos();
 $consulta = $MU->valor_inventario();
 echo json_encode($consulta);



 ?>