<?php 

 class Modelo_Usuario {
 	private $conexion;


	function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}

	function VerificarUsuario($usuario,$password) {
		$sql = "call SP_VERIFICAR_USUARIO('$usuario')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				if(password_verify($password, $consulta_vu['usuario_password'])){
					$arreglo[] =$consulta_vu;
				}
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

	function listar_usuario($idempresa) {
		$sql = "SELECT
    `usuario`.`usuario_id`    , `usuario`.`usuario_nombre`
    , `usuario`.`usuario_email`    , `usuario`.`usuario_estatus`
    , `usuario`.`usuario_imagen`    , `usuario`.`rol_id`
    , `usuario`.`persona_id`    , `rol`.`rol_nombre`,
    CONCAT_WS(' ', `persona`.`persona_nombre` , `persona`.`persona_apepat`, `persona`.`persona_apemat`) AS persona
    , `persona`.`persona_nombre`    , `persona`.`persona_apepat`
    , `persona`.`persona_apemat`, `usuario`.`idempresa`,
    usuario.`idcaja`, caja.`caja`
    FROM
    `usuario`
    LEFT JOIN `persona`         ON (`usuario`.`persona_id` = `persona`.`persona_id`)
    INNER JOIN `rol`         ON (`usuario`.`rol_id` = `rol`.`rol_id`)
        INNER JOIN empresa ON `usuario`.`idempresa` = empresa.`ID`
        INNER JOIN caja ON usuario.`idcaja` = caja.`id` 
         where usuario.`idempresa` = '$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function listar_combo_persona(){
		$sql = "call SP_LISTAR_COMBO_PERSONA()";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function listar_combo_rol() {
		$sql = "call SP_LISTAR_COMBO_ROL()";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Registrar_Usuario($usuario,$pass,$email,$idrol,$ruta,$idpersona,$idempresa) {
		$sql = "call  SP_REGISTRAR_USUARIO('$usuario','$pass','$email','$idrol','$ruta',
		'$idpersona','$idempresa')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
			}
		}

 	function Modificar_Usuario($idusuario,$email_nuevo, $idrol, $idpersona,
 		$estatus) {
 		$sql = "call  SP_MODIFICAR_USUARIO('$idusuario','$email_nuevo',
 		'$idrol','$idpersona','$estatus')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Foto($idusuario,$ruta) {
		$sql = "call  SP_MODIFICAR_FOTO_USUARIO('$idusuario','$ruta')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
			}
		}


	function TraerDatosUsuario($id) {
		$sql = "call SP_TRAER_DATOS_USUARIO('$id')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				$arreglo[]=$consulta_vu;
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

function TraerDatosWidgets($inicio,$fin) {
		$sql = "call TraerDatosWidgets('$inicio','$fin')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				$arreglo[]=$consulta_vu;
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

	function TraerDatosGraficoVentasWidgets($inicio,$fin) {
		$sql = "call TraerDatosGraficoWidgets('$inicio','$fin')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				$arreglo[]=$consulta_vu;
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}

		function TraerDatosGraficoComprasWidgets($inicio,$fin) {
		$sql = "call TraerDatosGrafico_Compras_Widgets('$inicio','$fin')";
		$arreglo = array();
		if($consulta = $this->conexion->conexion->query($sql)){
			while($consulta_vu = mysqli_fetch_array($consulta)) {
				$arreglo[]=$consulta_vu;
			}
			return $arreglo;
			$this->conexion->cerrar();
		}
	}



	

	function Actualizar_Datos_Profile($idusuario,$nombre,$apepat,$apemat,$nrodocumento,$tipo_documento,$telefono,$direccion) {
		$sql = "call  SP_ACTUALIZAR_DATOS_PERSONA('$idusuario','$nombre','$apepat','$apemat','$nrodocumento','$tipo_documento','$telefono','$direccion')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Contrasena_Usuario($idusuario,$contranu) {
		$sql = "call SP_MODIFICAR_CONTRASENA_USUARIO('$idusuario','$contranu')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
		}
	}



	function Modificar_Estatus_Usuario($usuario_id,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_USUARIO('$usuario_id','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}


	function productos_poco_stock() {
		$sql = "SELECT p.`producto_codigo`,
		p.`producto_nombre`, 
		p.`producto_stock`,p.`cant_minima`
		FROM producto p 
		WHERE p.producto_stock <= p.cant_minima
		ORDER BY p.producto_stock ASC;";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	
 }




 ?>