/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author Camilo
 */
public class chatVO {
    private String Usuario="";
    private String Fecha="";
    private String Mensaje="";

    public chatVO(String Usuario, String Fecha, String Mensaje) {
        this.Usuario = Usuario;
        this.Fecha = Fecha;
        this.Mensaje = Mensaje;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getMensaje() {
        return Mensaje;
    }

    public void setMensaje(String Mensaje) {
        this.Mensaje = Mensaje;
    }
    
    
}
