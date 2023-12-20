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
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container fluid container-md">
            <div class="row">
               <div class="col-12">
            <h2>Gestión de carrito</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
               
                        <th>Articulo</th>
                        <th>Cant</th>
                    
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
                                    <button type="submit" class="btn btn-danger btn-block" >Eliminar</button>
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
         
        </div>  </div>  </div>
    </body>
</html>



