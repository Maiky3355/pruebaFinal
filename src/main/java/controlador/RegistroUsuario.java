   
package controlador;

import dao.CarritoDAO;
import dao.UsuarioDAO;
import modelo.Carrito;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import modelo.Usuario2;
//import java.sql.Date;

@WebServlet("/vistas/registroCarrito")
public class RegistroUsuario extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String contraseña= request.getParameter("contraseña");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");

        // Crear un objeto Orador con los datos
        Usuario2 usuario2 = new Usuario2();
        usuario2.setUsuario(usuario);
        usuario2.setContraseña(contraseña);
        usuario2.setEmail(email);
        usuario2.setTelefono(Integer.parseInt(telefono));

        // Obtener la fecha actual
        //java.util.Date fechaActual = new java.util.Date(); //es una forma de utilizar la clase sin necesitar una declaracion 'import'
        //carrito.setFechaAlta(new Date(fechaActual.getTime()));

        // Agregar el orador a la base de datos
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.agregarCarrito(usuario2);

        // Redireccionar a la página de visualización de oradores
        response.sendRedirect(request.getContextPath() + "/vistas/gestionCarrito.jsp");
 
    }
}
