
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
            <h2>Crear usuario</h2>
            <form action="GestionUsuarioServlet" method="post">
            
                <div class="form-group ">
                    <label>Nombre</label>
                    <input type="text" class="form-control" name="usuario" value="">
                      <label>Contraseña</label>
                    <input type="text" class="form-control" name="contraseña" value="">
                    
    
                        <label>Email</label>
                    <input type="text" class="form-control" name="email" value="">
                </div>    <label>Telefono</label>
                    <input type="text" class="form-control" name="telefono" value="">
                </div>
                </div>

                    
       <button type="submit" class="btn btn-primary ">Enviar</button>
       
       <br><!-- comment -->
       <br>
        <a href="login.jsp" class="btn btn-success">Volver</a>
               
            </form>
        </div>
    </body>
</html>

