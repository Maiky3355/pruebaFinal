   
package controlador;

import dao.CarritoDAO;
import modelo.Carrito;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//import java.sql.Date;

@WebServlet("/vistas/registroCarrito")
public class RegistroCarrito extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String id = request.getParameter("id");
        String usuario = request.getParameter("usuario");
        String cantidad = request.getParameter("cantidad");

        // Crear un objeto Orador con los datos
        Carrito carrito = new Carrito();
        carrito.setUser_id(Integer.parseInt(id));
        carrito.setArticulo_id(Integer.parseInt(usuario));
        carrito.setCantidad(Integer.parseInt(cantidad));

        // Obtener la fecha actual
        //java.util.Date fechaActual = new java.util.Date(); //es una forma de utilizar la clase sin necesitar una declaracion 'import'
        //carrito.setFechaAlta(new Date(fechaActual.getTime()));

        // Agregar el orador a la base de datos
        CarritoDAO carritoDAO = new CarritoDAO();
        carritoDAO.agregarCarrito(carrito);

        // Redireccionar a la página de visualización de oradores
        response.sendRedirect(request.getContextPath() + "/vistas/verCarrito.jsp");
 
    }
}
