/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.Date;

public class Articulo {
    
 private int articulo;
 private String descripcion;
 private String venta;
 private int inventario;
 private String categoria;
 private String marca;
 private String dolar;
 private String img;
    public Articulo() {
    }

    public Articulo(int articulo, String descripcion, String venta, int inventario, String categoria, String marca, String dolar, String img) {
        this.articulo = articulo;
        this.descripcion = descripcion;
        this.venta = venta;
        this.inventario = inventario;
        this.categoria = categoria;
        this.marca = marca;
        this.dolar = dolar;
        this.img= img;
    }

    public int getArticulo() {
        return articulo;
    }

    public void setArticulo(int articulo) {
        this.articulo = articulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getVenta() {
        return venta;
    }

    public void setVenta(String venta) {
        this.venta = venta;
    }

    public int getInventario() {
        return inventario;
    }

    public void setInventario(int inventario) {
        this.inventario = inventario;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getDolar() {
        return dolar;
    }

    public void setDolar(String dolar) {
        this.dolar = dolar;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
 
 
    
    
    
    
    
}
