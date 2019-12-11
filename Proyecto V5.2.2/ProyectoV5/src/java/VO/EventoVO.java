/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VO;

/**
 *
 * @author APRENDIZ
 */
public class EventoVO {
    private String idEvento;
    private String evenNombre;
    private String evenDesc;
    private String evenFecha;
    private String Hora_inicio;
    private String Hora_finalizacion;
    private String Lugar;
    private String Estado;
    private String Usuario;

      public EventoVO(String evenNombre, String evenDesc, String evenFecha, String Hora_inicio, String Hora_finalizacion, String Lugar, String Estado, String Usuario) {
        this.evenNombre = evenNombre;
        this.evenDesc = evenDesc;
        this.evenFecha = evenFecha;
        this.Hora_inicio = Hora_inicio;
        this.Hora_finalizacion = Hora_finalizacion;
        this.Lugar = Lugar;
        this.Estado = Estado;
        this.Usuario = Usuario;
    }

    public EventoVO() {
    }

    public EventoVO(String Lugar) {
        this.Lugar = Lugar;
    }

    
    public EventoVO(String idEvento, String evenNombre, String evenDesc, String evenFecha, String Hora_inicio, String Hora_finalizacion, String Lugar, String Estado, String Usuario) {
        this.idEvento = idEvento;
        this.evenNombre = evenNombre;
        this.evenDesc = evenDesc;
        this.evenFecha = evenFecha;
        this.Hora_inicio = Hora_inicio;
        this.Hora_finalizacion = Hora_finalizacion;
        this.Lugar = Lugar;
        this.Estado = Estado;
        this.Usuario = Usuario;
    }
        
    public String getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(String idEvento) {
        this.idEvento = idEvento;
    }
       
    public String getEvenNombre() {
        return evenNombre;
    }

    public void setEvenNombre(String evenNombre) {
        this.evenNombre = evenNombre;
    }

    public String getEvenDesc() {
        return evenDesc;
    }

    public void setEvenDesc(String evenDesc) {
        this.evenDesc = evenDesc;
    }

    public String getEvenFecha() {
        return evenFecha;
    }

    public void setEvenFecha(String evenFecha) {
        this.evenFecha = evenFecha;
    }

    public String getHora_inicio() {
        return Hora_inicio;
    }

    public void setHora_inicio(String Hora_inicio) {
        this.Hora_inicio = Hora_inicio;
    }

    public String getHora_finalizacion() {
        return Hora_finalizacion;
    }

    public void setHora_finalizacion(String Hora_finalizacion) {
        this.Hora_finalizacion = Hora_finalizacion;
    }

    public String getLugar() {
        return Lugar;
    }

    public void setLugar(String Lugar) {
        this.Lugar = Lugar;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }
      
}
