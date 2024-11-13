<div class="row">
    <div class="col-md-12">
        <div class="ibox ibox-default">
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <title>Ajuste de Inventario</title>
                <script>
                    function ajustarInventario() {
                        const producto_id = document.getElementById("producto_id").value;
                        const cantidad = document.getElementById("cantidad").value;
                        const tipo_ajuste = document.getElementById("tipo_ajuste").value;
                        const usuario_id = document.getElementById("usuario_id").value;
                        const motivo = document.getElementById("motivo").value;

                        if (!producto_id || !cantidad || !tipo_ajuste || !usuario_id || !motivo) {
                            alert("Por favor, completa todos los campos.");
                            return;
                        }

                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "ajuste_inventario.php", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        xhr.onload = function() {
                            if (xhr.status === 200) {
                                const respuesta = JSON.parse(xhr.responseText);
                                alert(respuesta.message);
                            } else {
                                alert("Error en la solicitud.");
                            }
                        };

                        xhr.send("producto_id=" + producto_id + "&cantidad=" + cantidad + "&tipo_ajuste=" + tipo_ajuste + "&usuario_id=" + usuario_id + "&motivo=" + motivo);
                    }
                </script>
            </head>

            <body>
                <h2>Ajuste de Inventario</h2>
                <form onsubmit="event.preventDefault(); ajustarInventario();">
                    <label for="producto_id">ID del Producto:</label>
                    <input type="number" id="producto_id" name="producto_id" required><br><br>

                    <label for="cantidad">Cantidad:</label>
                    <input type="number" step="0.01" id="cantidad" name="cantidad" required><br><br>

                    <label for="tipo_ajuste">Tipo de Ajuste:</label>
                    <select id="tipo_ajuste" name="tipo_ajuste" required>
                        <option value="ENTRADA">Entrada</option>
                        <option value="SALIDA">Salida</option>
                    </select><br><br>

                    <label for="usuario_id">ID del Usuario:</label>
                    <input type="number" id="usuario_id" name="usuario_id" required><br><br>

                    <label for="motivo">Motivo del Ajuste:</label>
                    <textarea id="motivo" name="motivo" required></textarea><br><br>

                    <button type="submit">Ajustar Inventario</button>
                </form>
            </body>

            </html>
        </div>
    </div>
</div>