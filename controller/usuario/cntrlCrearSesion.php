<?php 


$IDUSUARIO = $_POST['idusuario'];
$USER = $_POST['usuario'];
$ROL = $_POST['rol'];
$IDEMPRESA = $_POST['idempresa'];



session_start();
$_SESSION['S_IDUSUARIO']=$IDUSUARIO;
$_SESSION['S_USUARIO']=$USER;
$_SESSION['S_ROL']=$ROL;
$_SESSION['S_EMPRESA']=$IDEMPRESA;


 ?>
