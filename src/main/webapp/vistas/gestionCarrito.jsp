<%@page import="dao.CarritoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Carrito"%>
<%@page import="controlador.RegistroCarrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gestión de carrito</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Gestión de carrito</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
               
                        <th>Articulo</th>
                        <th>Cantidad</th>
                    
                    </tr>
                </thead>
                <tbody>
                  <%String usuario = String.valueOf(session.getAttribute("usuario"));
                   
                   if("null".equals(usuario)){
                       response.sendRedirect("login.jsp"); 
                       
                   }                    
                     %>
                    
                    <%
                       
                       CarritoDAO carritoDAO = new CarritoDAO();
                        List<Carrito> carritos = carritoDAO.obtenerTodos(Integer.parseInt(usuario)); //este cambie!

                        if (carritos != null && !carritos.isEmpty()) {
                            for (Carrito carrito : carritos) {
                    %>
                    <tr>
                      
                         <td><%= carrito.getArticulo()%></td>
                        <td><%= carrito.getCantidad()%></td>
                     
                        <td>
                            <div class="d-flex">
                                <!-- Formulario para actualizar -->
                                <form action="GestionArticuloServlet" method="post" class="mr-2">
                                    <input type="hidden" name="accion" value="actualizar">
                                    <input type="hidden" name="id" value="<%= carrito.getUser_id()%>">
                                        <input type="hidden" name="idArticulo" value="<%= carrito.getArticulo_id()%>">
                                       <input type="hidden" name="cantidad" value="<%= carrito.getCantidad()%>">
                                    <button type="submit" class="btn btn-warning btn-block">Actualizar</button>
                                </form>

                                <!-- Formulario para eliminar -->
                                <form action="GestionArticuloServlet" method="post">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<%= carrito.getUser_id()%>">
                                    <input type="hidden" name="idArticulo" value="<%= carrito.getArticulo_id()%>">
                                                       <input type="hidden" name="cantidad" value="<%= carrito.getCantidad()%>">
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
                        <td colspan="6">No hay articulos agregados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
         
        </div>
    </body>
</html>



