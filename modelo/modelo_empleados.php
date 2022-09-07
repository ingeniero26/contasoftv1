<?php 

class Modelo_Empleado {

function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_empleado(){
		$sql = "SELECT    `empleados`.`IdEmp`    , `empleados`.`CCEmp`
    , `empleados`.`NomEmp`    , `empleados`.`DirEmp`
    , `empleados`.`TelEmp`    , `empleados`.`CelEmp`
    , `empleados`.`EmailEmp`    ,`empleados`.`fecha_nacimiento`
    , `empleados`.`IdARL`    , `arl`.`NomARL`
    , `empleados`.`IdEPS`    , `eps`.`NomEPS`
    , `empleados`.`IdPension`
    , `pension`.`NomPension`
    , `empleados`.`fregistro`
    , `empleados`.`estatus`
	FROM
    `empleados`
    INNER JOIN `arl` 
        ON (`empleados`.`IdARL` = `arl`.`IdARL`)
    INNER JOIN `eps` 
        ON (`empleados`.`IdEPS` = `eps`.`IdEPS`)
    INNER JOIN `pension` 
        ON (`empleados`.`IdPension` = `pension`.`IdPension`);";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function Modificar_Estatus_Empleado($IdEmp,$estatus) {
		$sql = "call SP_MODIFICAR_ESTATUS_CATEGORIA('$IdEmp','$estatus')";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
	}

	function listar_combo_arl() {
		$sql = "SELECT  `IdARL`, `NomARL` FROM arl
				WHERE arl.`estatus` ='ACTIVO'";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function listar_combo_eps() {
		$sql = "SELECT  `IdEPS`, `NomEPS` FROM eps
			WHERE eps.`estatus` ='ACTIVO'";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

	function listar_combo_pension() {
		$sql = "SELECT `IdPension`, `NomPension` FROM 
		pension
		WHERE `pension`.`estatus` = 'ACTIVO'";
				$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_array($consulta)) {
						$arreglo[] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}
	function RegistrarEmpleado($numero,$nombre,$direccion,
	$telefono,$celular,$correo,$fnac,$idarl,$ideps,$idpension, $usu,$contra,$rol) {
			$sql = "call  SP_REGISTRAR_EMPLEADO2('$numero','$nombre','$direccion','$telefono',
			'$celular' ,'$correo','$fnac','$idarl','$ideps','$idpension','$usu','$contra','$rol')";
			if($consulta = $this->conexion->conexion->query($sql)){
				if($row = mysqli_fetch_array($consulta)) {
					return	$id =trim($row[0]);
				}
				 $arreglo;
				$this->conexion->cerrar();
			}
		}

 }








 ?>