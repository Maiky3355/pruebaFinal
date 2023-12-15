
<%@page import="modelo.Carrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Actualizar Carito</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Actualizar Carrito</h2>
            <form action="GestionArticuloServlet" method="post">
                <input type="hidden" name="accion" value="confirmarActualizacion">
                <input type="hidden" name="id" value="${carrito.idCarrito}">

                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="${carrito.id}" required>
                </div>

                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="${carrito.usuario}" required>
                </div>

                <div class="form-group">
                    <label for="tema">Tema:</label>
                    <input type="text" class="form-control" id="tema" name="tema" value="${carrito.cantidad}" required>
                </div>

                <button type="submit" class="btn btn-primary">Actualizar</button>
                <a href="gestionOradores.jsp" class="btn btn-success">Volver</a>

            </form>
        </div>
    </body>
</html>

