
package controlador;

import dao.CarritoDAO;
import modelo.Carrito;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/vistas/GestionArticuloServlet")
public class GestionArticuloServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        CarritoDAO carritoDAO = new CarritoDAO();

        // Inicializar idOrador antes del switch para que esté disponible en todos los casos
        int idCarrito = Integer.parseInt(request.getParameter("id"));
 int idArticulo = Integer.parseInt(request.getParameter("idArticulo"));
 int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        switch (accion) {
            case "actualizar":
                Carrito carrito = carritoDAO.obtenerPorId(idCarrito, idArticulo);
                request.setAttribute("carrito", carrito); //Esto permite pasar datos del servlet a una vista (como un archivo JSP) o a otro servlet al que se redirige o se reenvía la solicitud
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                break;
            case "confirmarActualizacion":
                
                Carrito carritoActualizado = new Carrito();
                carritoActualizado.setUser_id(idCarrito);
                carritoActualizado.setArticulo_id(idArticulo);
                carritoActualizado.setCantidad(cantidad);
          
                carritoDAO.actualizarCarrito(carritoActualizado);
                response.sendRedirect("gestionCarrito.jsp");
                break;
            case "eliminar":
                carritoDAO.eliminarCarrito(idCarrito, idArticulo);
                response.sendRedirect("gestionCarrito.jsp");
                break;
            default:
                response.sendRedirect("gestionCarrito.jsp");
                break;
        }
    }
}

