package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Carrito;
import modelo.Usuario2;
import util.ConexionDB;

public class UsuarioDAO {
    public void agregarCarrito(Usuario2 Usuario2) {
        String sql = "INSERT INTO user (usuario, contraseña, email, telefono) VALUES (?, ?, ?, ?)";
        //bloque try-with-resources
        //asegura que los recursos abiertos en su declaración (dentro de los paréntesis) se cierren automáticamente al final del bloque try 
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, Usuario2.getUsuario());
            pstmt.setString(2, Usuario2.getContraseña());
            pstmt.setString(3, Usuario2.getEmail());
            pstmt.setInt(4, Usuario2.getTelefono());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Carrito obtenerPorId(int id, int idArticulo) {
        String sql = "SELECT * FROM carrito WHERE user_id = ? && articulo_id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
               pstmt.setInt(2, idArticulo);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Carrito carrito = new Carrito();
                carrito.setUser_id(rs.getInt("user_id"));
                carrito.setArticulo(rs.getString("articulo"));
                carrito.setArticulo_id(rs.getInt("articulo_id"));
                carrito.setCantidad(rs.getInt("cantidad"));
        
                return carrito;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    

}
          