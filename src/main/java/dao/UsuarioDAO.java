package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import modelo.Usuario2;
import util.ConexionDB;

public class UsuarioDAO {
    public void agregarUsuario(Usuario2 usuario2) {
        String sql = "INSERT INTO user (usuario, contraseña, email, telefono) VALUES (?, ?, ?, ?)";
        //bloque try-with-resources
        //asegura que los recursos abiertos en su declaración (dentro de los paréntesis) se cierren automáticamente al final del bloque try 
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
 
            pstmt.setString(1, usuario2.getUsuario());
            pstmt.setString(2, usuario2.getContraseña());
            pstmt.setString(3, usuario2.getEmail());
            pstmt.setInt(4, usuario2.getTelefono());
            pstmt.executeUpdate();
     
        } catch (SQLException e) {
            e.printStackTrace();
   e.getCause();
    
        }
     
    }
  
}      