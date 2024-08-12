<?php 
  include '../../modelo/modelo_pagos.php';

  $MCT = new Modelo_Gastos();
$idGasto = htmlspecialchars($_POST['idGasto'],ENT_QUOTES,'UTF-8');


$consulta =$MCT->Modificar_Estatus_Estado_Gasto($idGasto);
echo $consulta;





 ?>