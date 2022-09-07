<?php 
 include '../../modelo/modelo_deptos.php';

 $MEP = new Modelo_Deptos();
$descripcion = htmlspecialchars($_POST['descripcion'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Registrar_Deptos($descripcion);
echo $consulta;





 ?>