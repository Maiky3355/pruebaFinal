package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Carrito;
import util.ConexionDB;

public class CarritoDAO {
    public void agregarCarrito(Carrito carrito) {
        String sql = "INSERT INTO carrito (user_id, articulo_id, cantidad) VALUES (?, ?, ?)";
        //bloque try-with-resources
        //asegura que los recursos abiertos en su declaración (dentro de los paréntesis) se cierren automáticamente al final del bloque try 
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, carrito.getUser_id());
            pstmt.setInt(2, carrito.getArticulo_id());
            pstmt.setInt(3, carrito.getCantidad());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Carrito obtenerPorId(int id) {
        String sql = "SELECT * FROM oradores WHERE id_orador = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Carrito carrito = new Carrito();
                carrito.setUser_id(rs.getInt("user_id"));
                carrito.setArticulo_id(rs.getInt("articulo_id"));
                carrito.setCantidad(rs.getInt("cantidad"));
        
                return carrito;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Carrito> obtenerTodos() {
        List<Carrito> carritos = new ArrayList<>();
        String sql = "SELECT * FROM carrito";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Carrito carrito = new Carrito();
                 carrito.setUser_id(rs.getInt("user_id"));
                carrito.setArticulo_id(rs.getInt("articulo_id"));
                carrito.setCantidad(rs.getInt("cantidad"));
               
                carritos.add(carrito);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carritos;
    }

    public void actualizarCarrito(Carrito carrito) {
        String sql = "UPDATE carrito SET articulo_id = ?, cantidad = ? WHERE user_id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, carrito.getArticulo_id());
            pstmt.setInt(2, carrito.getCantidad());
           
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarCarrito(int id) {
        String sql = "DELETE FROM carrito WHERE user_id && articulo_id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
          