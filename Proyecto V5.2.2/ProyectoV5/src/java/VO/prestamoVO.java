package VO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author APRENDIZ
 */
public class prestamoVO {
    
    private String id_lugar ;
    private String id_prestamo ;
    private String tiempo;
    private String fecha;
    private String descripcion;
    private String usuario;
    private String estado;
    private String HSalida;
    

    public prestamoVO(String id_lugar,String tiempo, String fecha, String descripcion, String usuario, String estado, String HSalida) {
        this.id_lugar = id_lugar;
        this.tiempo = tiempo;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.usuario = usuario;
        this.estado = estado;
        this.HSalida = HSalida;
    }

    public prestamoVO(String id_lugar, String id_prestamo, String tiempo, String fecha, String descripcion, String usuario, String estado, String HSalida) {
        this.id_lugar = id_lugar;
        this.id_prestamo = id_prestamo;
        this.tiempo = tiempo;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.usuario = usuario;
        this.estado = estado;
        this.HSalida = HSalida;
    }

    public prestamoVO(String id_lugar, String usuario) {
        this.id_lugar = id_lugar;
        this.usuario = usuario;
    }
    
    

    public String getHSalida() {
        return HSalida;
    }

    public void setHSalida(String HSalida) {
        this.HSalida = HSalida;
    }
    
   
    
    public String getId_prestamo() {
        return id_prestamo;
    }

    public void setId_prestamo(String id_prestamo) {
        this.id_prestamo = id_prestamo;
    }
    

    public String getId_lugar() {
        return id_lugar;
    }

    public void setId_lugar(String id_lugar) {
        this.id_lugar = id_lugar;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public prestamoVO() {
    }

    public prestamoVO(String id_lugar) {
        this.id_lugar = id_lugar;
    }   
}
