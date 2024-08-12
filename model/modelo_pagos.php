<?php   

class Modelo_Gastos  {
    function __construct()
	{
		require_once 'modelo_conexion.php';
		$this->conexion = new conexion();
		$this->conexion->conectar();
	}


	function listar_gastos($finicio,$ffin,$idempresa){
		$sql = "SELECT         `gastos`.`idGasto`
        , `gastos`.`idtipo_gasto`        , `tipo_gasto`.`descripcion`
        , `gastos`.`fecha_gasto`        , `gastos`.`valor`
        ,gastos.`recibo`        , `gastos`.`idcaja`
        , `caja`.`caja`        , `gastos`.`observaciones`
        , `gastos`.`fregistro`        , `gastos`.`estatus`
        , `gastos`.`idusuario`        , `usuario`.`usuario_nombre`
        , `gastos`.`idempresa`        , `gastos`.`estado`
    FROM        `gastos`
        INNER JOIN `tipo_gasto`    ON (`gastos`.`idtipo_gasto` = `tipo_gasto`.`id`)
        INNER JOIN `caja`        ON (`gastos`.`idcaja` = `caja`.`id`)
        INNER JOIN `usuario`       ON (`gastos`.`idusuario` = `usuario`.`usuario_id`)
            WHERE gastos.`fecha_gasto` BETWEEN '$finicio' AND '$ffin' 
             AND gastos.`idempresa` = '$idempresa'";
			$arreglo = array();
			if($consulta = $this->conexion->conexion->query($sql)){
				while($consulta_vu = mysqli_fetch_assoc($consulta)) {
						$arreglo["data"][] =$consulta_vu;
					
				}
				return $arreglo;
				$this->conexion->cerrar();
		}
	}

   function  listar_combo_tipo_pagos($idempresa) {
    $sql = "SELECT id, descripcion FROM tipo_gasto
    WHERE  tipo_gasto.`idempresa` = '$idempresa' AND tipo_gasto.`estatus` = 'ACTIVO'";
            $arreglo = array();
        if($consulta = $this->conexion->conexion->query($sql)){
            while($consulta_vu = mysqli_fetch_array($consulta)) {
                    $arreglo[] =$consulta_vu;
                
            }
            return $arreglo;
            $this->conexion->cerrar();
    }
   }

 function  Registrar_Gastos($idtipo_gasto,$fecha_gasto,$valor,
$recibo,$idcaja,$observaciones,$estado,$idusuario,$idempresa) {
    $sql = "INSERT INTO gastos(idtipo_gasto, fecha_gasto, valor,recibo,
    idcaja,observaciones,estado,idusuario,idempresa) 
    VALUES('$idtipo_gasto','$fecha_gasto','$valor','$recibo','$idcaja',
    '$observaciones','$estado','$idusuario','$idempresa')";
    if ($consulta = $this->conexion->conexion->query($sql)) {
        //$id_retornado = mysqli_insert_ind($this->conexion->conexion);
        return 1;
        
    }else{
        return 0;
    }
}

function Modificar_Estatus_Estado_Gasto($idGasto) {
    $sql = "DELETE FROM gastos where idGasto = '$idGasto'";
			if ($consulta = $this->conexion->conexion->query($sql)) {
				//$id_retornado = mysqli_insert_ind($this->conexion->conexion);
				return 1;
				
			}else{
				return 0;
			}
}
}