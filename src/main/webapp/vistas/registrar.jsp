
<%@page import="modelo.Usuario2"%>
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
            <form action="RegistroUsuario" method="post">
            
                <div class="form-group ">
                    <label>Nombre</label>
                    <input type="text" class="form-control" name="usuario" value=""required>
                      <label>Password</label>
                      <input type="text" class="form-control" name="contra" value=""required>
                     <label>Email</label>
                    <input type="text" class="form-control" name="email" value=""required>
                </div>    <label>Telefono</label>
                    <input type="text" class="form-control" name="telefono" value=""required>
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

