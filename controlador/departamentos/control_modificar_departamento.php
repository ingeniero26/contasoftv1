<?php 
 include '../../modelo/modelo_departamentos.php';

 $MCT = new Modelo_Deptos();
$id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
$departamento_actual = htmlspecialchars($_POST['departamento_actual'],ENT_QUOTES,'UTF-8');
$departamento_nueva = htmlspecialchars($_POST['departamento_nueva'],ENT_QUOTES,'UTF-8');
$estatus = htmlspecialchars($_POST['estatus'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->Modificar_Departamento($id,$departamento_actual,$departamento_nueva, $estatus);
echo $consulta;





 ?>