


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>COPIA BD</title>
	 <link href="plantilla/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container">
	<h1 class="text-center" style="margin-top:30px;">RESPALDO BD</h1>
	<hr>
	<div class="row justify-content-center">
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body">
					<h3>Credenciales de la base de datos</h3>
					<br>
					<form method="POST" action="backup.php">
					    <div class="form-group row">
					     	<label for="server" class="col-sm-3 col-form-label">Servidor</label>
					      	<div class="col-sm-9">
					        	<input type="text" class="form-control" id="server" name="server" placeholder="Ejemplo: 'localhost'" required>
					      	</div>
					    </div>
					    <div class="form-group row">
					      	<label for="username" class="col-sm-3 col-form-label">Usuario</label>
					      	<div class="col-sm-9">
					        	<input type="text" class="form-control" id="username" name="username" placeholder="Ejemplo: 'root'" required>
					      	</div>
					    </div>
					    <div class="form-group row">
					      	<label for="password" class="col-sm-3 col-form-label">Contraseña</label>
					      	<div class="col-sm-9">
					        	<input type="text" class="form-control" id="password" name="password" placeholder="db password">
					      	</div>
					    </div>
					    <div class="form-group row">
					      	<label for="dbname" class="col-sm-3 col-form-label">Base de datos</label>
					      	<div class="col-sm-9">
					        	<input type="text" class="form-control" id="dbname" name="dbname" placeholder="Nombre de la base de datos a respaldar" required>
					      	</div>
					    </div>
					    <button type="submit" class="btn btn-primary" name="backup">Respaldo</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>