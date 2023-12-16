
<%@page import="modelo.Carrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Actualizar Carrito</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
 
        <div class="container mt-5">
            <h2>Actualizar Carrito</h2>
            <form action="GestionArticuloServlet" method="post">
                <input type="hidden" name="accion" value="confirmarActualizacion">
                <input type="hidden" name="id" value="${carrito.user_id}">
                <input type="hidden" name="idArticulo" value="${carrito.articulo_id}">
              

                <div class="form-group">
                    <label>Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" value="${carrito.cantidad}">
                </div>

                <button type="submit" class="btn btn-primary">Actualizar</button>
                <a href="gestionArticulos.jsp" class="btn btn-success">Volver</a>

            </form>
        </div>
    </body>
</html>

