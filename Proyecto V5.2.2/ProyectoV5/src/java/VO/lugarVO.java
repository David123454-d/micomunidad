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
public class lugarVO {
    
    private String idLugar;
    private String Nombre;
    private String Direccion;
    private String Estado;

    public String getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(String idLugar) {
        this.idLugar = idLugar;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public lugarVO(String idLugar, String Nombre, String Direccion, String Estado) {
        this.idLugar = idLugar;
        this.Nombre = Nombre;
        this.Direccion = Direccion;
        this.Estado = Estado;
    }

    public lugarVO() {
    }
    
    
    
}
