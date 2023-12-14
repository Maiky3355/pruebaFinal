
<%@page import="modelo.Usuario"%>
<%@page import="controlador.LoginServlet"%>
<%@page import="dao.ArticulosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Articulos</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="otros/style.css">
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
                
                
                
                
                
                
                
                
           
                    <%
                        ArticulosDAO articulosDAO = new ArticulosDAO();
                        List<Articulo> articulos = articulosDAO.obtenerTodos();

                       
                        
                        if (articulos != null && !articulos.isEmpty()) {
                            for (Articulo articulo : articulos) {
                        
                    %>
          
                    
                    
                    
        

        <template id="contTemplate2">
            <div class="col-sm-6 col-md-6  col-lg-4">
                <div class="card-group tarjetas2 ">
                    <div class="card ">
                        <img class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">"<%= articulo.getDescripcion()%>"</h5>
                            <p class="card-text">"<%= articulo.getMarca()%>"</p>
                            <p class="card-text"><small class="text-body-secondary">"<%= articulo.getVenta()%>"</small>
                                <br>
                                <button type="button" class="btn btn-dark inter">Agregar<svg
                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-cart" viewBox="0 0 16 16">
                                        <path
                                            d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                    </svg></button>




                            </p>
                        </div>
                    </div>


        </template>
                     <tbody>    
                           
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
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
                                <form action="GestionArticuloServlet" method="post" class="mr-2">
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="<%= articulo.getArticulo()%>">
                                    <input type="hidden" name="usuario" value="<%= session.getAttribute("usuario")%>">
                                    <p>cantidad <input type="text" name="cantidad" value="1" style="width: 5vh"></p>
                                    <button type="submit" class="btn btn-warning btn-block">Agregar al carrito</button>
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



