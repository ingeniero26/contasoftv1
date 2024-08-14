<?php 
require '../../model/model_document_type.php';

$MPV = new Modelo_Document_Type();

$name = htmlspecialchars($_POST['name'],ENT_QUOTES,'UTF-8');
$abbreviation = htmlspecialchars($_POST['abbreviation'],ENT_QUOTES,'UTF-8');
$company_id = htmlspecialchars($_POST['company_id'],ENT_QUOTES,'UTF-8');
$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');


$consulta =$MPV->Add_Document_Type($name,$abbreviation,$idusuario,$company_id);
echo $consulta;





 ?>