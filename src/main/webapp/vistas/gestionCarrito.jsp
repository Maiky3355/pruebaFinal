
<%@page import="dao.CarritoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Carrito"%>
<%@page import="controlador.RegistroCarrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Oradores</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Gestión de Oradores</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>articulo</th>
                        <th>cantidad</th>
                    
                    </tr>
                </thead>
                <tbody>
                    <%
                       CarritoDAO carritoDAO = new CarritoDAO();
                        List<Carrito> carritos = carritoDAO.obtenerTodos();

                        if (carritos != null && !carritos.isEmpty()) {
                            for (Carrito carrito : carritos) {
                    %>
                    <tr>
                        <td><%= carrito.getUser_id()%></td>
                        <td><%= carrito.getArticulo_id()%></td>
                        <td><%= carrito.getCantidad()%></td>
                     
                        <td>
                            <div class="d-flex">
                                <!-- Formulario para actualizar -->
                                <form action="GestionCarritoServlet" method="post" class="mr-2">
                                    <input type="hidden" name="accion" value="actualizar">
                                    <input type="hidden" name="id" value="<%= carrito.getUser_id()%>">
                                    <button type="submit" class="btn btn-warning btn-block">Actualizar</button>
                                </form>

                                <!-- Formulario para eliminar -->
                                <form action="GestionCarritoServlet" method="post">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<%= carrito.getUser_id()%>">
                                    <button type="submit" class="btn btn-danger btn-block">Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6">No hay oradores registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <a href="../" class="btn btn-success">Volver</a>   
        </div>
    </body>
</html>



