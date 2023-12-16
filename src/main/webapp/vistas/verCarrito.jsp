

<%@page import="dao.CarritoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Carrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista en carrito</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        
        <div class="container mt-5">
            <h2>Lista en carrito</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Id producto</th>
                        <th>Descripcion</th>
                        <th>Cantidad</th>
              
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Crear una instancia de OradoresDAO para acceder a la base de datos
                        CarritoDAO carritoDAO = new CarritoDAO();

                        // Obtener la lista de oradores desde la base de datos
                        List<Carrito> carritos = carritoDAO.obtenerTodos();

                        if (carritos != null && !carritos.isEmpty()) {
                            // Iterar sobre la lista de oradores y mostrar sus datos en la tabla
                            for (Carrito carrito : carritos) {
                    %>
                    <tr>
                        <td><%= carrito.getUser_id()%></td>
                          <td><%= carrito.getArticulo_id()%></td>
                        <td><%= carrito.getArticulo()%></td>
                      
                        <td><%= carrito.getCantidad()%></td>
                 
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">No hay articulos registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <!-- Botón para volver al índice -->
            <a href="gestionArticulos.jsp" class="btn btn-success">Volver</a>   
        </div>
    </body>
</html>
