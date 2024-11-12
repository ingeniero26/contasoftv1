<?php 
 include '../../model/modelo_iva.php';

 $MEP = new Modelo_Iva();
$codigo = htmlspecialchars($_POST['codigo'],ENT_QUOTES,'UTF-8');
$tarifa = htmlspecialchars($_POST['tarifa'],ENT_QUOTES,'UTF-8');
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
$idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');

$consulta =$MEP->Registrar_iva($codigo, $tarifa,$nombre,$idempresa);
echo $consulta;





 ?>