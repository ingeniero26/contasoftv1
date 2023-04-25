<?php 


class Modelo_Cliente {
	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_cliente($idempresa){
		$sql = " SELECT     `persona`.`persona_id`
		,   CONCAT_WS(' ', `persona`.`persona_nombre`    , `persona`.`persona_apepat`    , `persona`.`persona_apemat`) AS cliente    , `persona`.`persona_nrodocumento`
		, `persona`.`persona_tipodocumento`,persona.tipo_contribuyente , `persona`.`persona_sexo`
		, `persona`.`persona_telefono`    ,cliente.`idciudad`, ciudades.`nombre_ciudad`, `persona`.persona_direccion,persona.persona_correo
		, `cliente`.`cliente_fregistro`
		, `cliente`.`cliente_estatus`    , `cliente`.`idcliente`
		, cliente.`idempresa`
		FROM
		`cliente`
		INNER JOIN `persona`     ON (`cliente`.`persona_id` = `persona`.`persona_id`)
			INNER JOIN empresa        ON cliente.`idempresa` = empresa.`ID`
			INNER JOIN ciudades ON cliente.`idciudad` = ciudades.`id`
        WHERE cliente.`idempresa` = '$idempresa';";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Cliente($nombre,$apepat,$apemat,$numero,$tipo_doc,$tipo_contribuyente,$telefono,$direccion,
    $correo,$idciudad,$idempresa) {
		$sql = "call  SP_REGISTRAR_CLIENTE2('$nombre','$apepat','$apemat','$numero','$tipo_doc','$tipo_contribuyente', '$telefono','$direccion','$correo','$idciudad','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}



	

	function Modificar_Estatus_Cliente($idcliente,$estatus){
		$sql = "call SP_MODIFICAR_ESTATUS_CLIENTE('$idcliente','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}
}







 ?>