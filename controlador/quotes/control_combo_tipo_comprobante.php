<?php 
require '../../modelo/modelo_quotes.php';

$MCT = new Modelo_Quotes();
 $idempresa = htmlspecialchars($_POST['idempresa'],ENT_QUOTES,'UTF-8');
 //$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');
$consulta =$MCT->listar_combo_tipo_comprobante($idempresa);
echo json_encode($consulta);




 ?>