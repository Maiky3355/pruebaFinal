/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author BGGRIS
 */
public class Carrito {
    private int user_id;
    private int articulo_id;
    private int cantidad;

    public Carrito() {
    }

    public Carrito(int user_id, int articulo_id, int cantidad) {
        this.user_id = user_id;
        this.articulo_id = articulo_id;
        this.cantidad = cantidad;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getArticulo_id() {
        return articulo_id;
    }

    public void setArticulo_id(int articulo_id) {
        this.articulo_id = articulo_id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
 
}
