package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Articulo;
import util.ConexionDB;

public class ArticulosDAO {
 
    public Articulo obtenerPorId(int id) {
        String sql = "SELECT * FROM articulos WHERE Artículo = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            Articulo articulo = new Articulo();
                articulo.setArticulo(rs.getInt("Artículo"));
                articulo.setDescripcion(rs.getString("Descripción"));
                articulo.setVenta(rs.getString("Venta"));
                articulo.setInventario(rs.getInt("Inventario"));
                articulo.setCategoria(rs.getString("Categoria"));
                articulo.setMarca(rs.getString("Marca"));
                articulo.setDolar(rs.getString("DOLAR"));
                articulo.setImg(rs.getString("F18"));
                return articulo;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Articulo> obtenerTodos() {
        List<Articulo> articulos = new ArrayList<>();
        String sql = "SELECT * FROM articulos order by Categoria, Descripción";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Articulo articulo = new Articulo();
                articulo.setArticulo(rs.getInt("Artículo"));
                articulo.setDescripcion(rs.getString("Descripción"));
                articulo.setVenta(rs.getString("Venta"));
                articulo.setInventario(rs.getInt("Inventario"));
                articulo.setCategoria(rs.getString("Categoria"));
                articulo.setMarca(rs.getString("Marca"));
                articulo.setDolar(rs.getString("DOLAR"));
                articulo.setImg(rs.getString("F18"));
                articulos.add(articulo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articulos;
    }

    
}
          