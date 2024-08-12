<?php 
include '../../modelo/modelo_deptos.php';

 $MEP = new Modelo_Deptos();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$desc_actual = htmlspecialchars($_POST['desc_actual'],ENT_QUOTES,'UTF-8');
$desc_nueva = htmlspecialchars($_POST['desc_nueva'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Modificar_Depto($id,$desc_actual,$desc_nueva);
echo $consulta;





 ?>