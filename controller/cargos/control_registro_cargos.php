<?php 
 include '../../modelo/modelo_cargos.php';

 $MEP = new Modelo_Cargos();
$descripcion = htmlspecialchars($_POST['descripcion'],ENT_QUOTES,'UTF-8');
$depto = htmlspecialchars($_POST['depto'],ENT_QUOTES,'UTF-8');


$consulta =$MEP->Registrar_Cargo($descripcion,$depto);
echo $consulta;





 ?>