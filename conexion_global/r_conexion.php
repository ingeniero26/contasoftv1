<?php 
	
	$conexion = new mysqli('localhost','root','','sistema_pos_v2');
	if(mysqli_connect_errno()) {
		echo "conexion fallida",mysqli_connect_errno();
		exit();
	}


 ?>