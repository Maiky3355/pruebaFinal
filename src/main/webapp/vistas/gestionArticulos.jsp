
<%@page import="dao.ArticulosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Articulos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Gestión de Articulos</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Descripcion</th>
                        <th>Venta</th>
                        <th>Inventario</th>
                        <th>Categoria</th>
                        <th>Marca</th>
        
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArticulosDAO articulosDAO = new ArticulosDAO();
                        List<Articulo> articulos = articulosDAO.obtenerTodos();

                        if (articulos != null && !articulos.isEmpty()) {
                            for (Articulo articulo : articulos) {
                    %>
                    <tr>
                        <td><%= articulo.getArticulo()%></td>
                        <td><%= articulo.getDescripcion()%></td>
                        <td><%= articulo.getVenta()%></td>
                        <td><%= articulo.getInventario()%></td>
                        <td><%= articulo.getCategoria()%></td>
                        <td><%= articulo.getMarca()%></td> 
                  
                        <td>
                            <div class="d-flex">
                                <!-- Formulario para actualizar -->
                                <form action="GestionOradorServlet" method="post" class="mr-2">
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="<%= articulo.getArticulo()%>">
                                     <input type="hidden" name="id" value="<%= articulo.getArticulo()%>">
                                    
                                    <button type="submit" class="btn btn-warning btn-block">Agregar al carrito</button>
                                </form>

                                <!-- Formulario para eliminar -->
                                <form action="GestionOradorServlet" method="post">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<%= articulo.getArticulo()%>">
                                    <button type="submit" class="btn btn-danger btn-block">Otra opcion</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6">No hay Articulos para mostrar.</td>
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



