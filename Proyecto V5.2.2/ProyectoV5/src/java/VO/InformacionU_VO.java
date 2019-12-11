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
public class InformacionU_VO {
    private String infcedula;
    private String infnombres;
    private String infapellidos;
    private String inftelefono;
    private String infcelular;
    private String infdireccion;
    private String infestado;
    private String infusuario;
    private String infrol;

    public InformacionU_VO(String infcedula, String infnombres, String infapellidos, String inftelefono, String infcelular, String infdireccion, String infestado, String infusuario, String infrol) {
        this.infcedula = infcedula;
        this.infnombres = infnombres;
        this.infapellidos = infapellidos;
        this.inftelefono = inftelefono;
        this.infcelular = infcelular;
        this.infdireccion = infdireccion;
        this.infestado = infestado;
        this.infusuario = infusuario;
        this.infrol = infrol;
    }

    public InformacionU_VO(String infcedula, String infnombres, String infapellidos, String inftelefono, String infcelular, String infdireccion, String infestado, String infusuario) {
        this.infcedula = infcedula;
        this.infnombres = infnombres;
        this.infapellidos = infapellidos;
        this.inftelefono = inftelefono;
        this.infcelular = infcelular;
        this.infdireccion = infdireccion;
        this.infestado = infestado;
        this.infusuario = infusuario;
    }

    

    public String getInfrol() {
        return infrol;
    }

    public void setInfrol(String infrol) {
        this.infrol = infrol;
    }

   

    public InformacionU_VO(String infcedula, String infnombres, String infapellidos, String inftelefono, String infcelular, String infdireccion, String infusuario) {
        this.infcedula = infcedula;
        this.infnombres = infnombres;
        this.infapellidos = infapellidos;
        this.inftelefono = inftelefono;
        this.infcelular = infcelular;
        this.infdireccion = infdireccion;
        this.infusuario = infusuario;
    }

       
    public InformacionU_VO() {
    }


    public InformacionU_VO(String infnombres, String infapellidos) {
        this.infnombres = infnombres;
        this.infapellidos = infapellidos;
    }

    
    

    
    public String getInfcedula() {
        return infcedula;
    }

    public void setInfcedula(String infcedula) {
        this.infcedula = infcedula;
    }

    public String getInfnombres() {
        return infnombres;
    }

    public void setInfnombres(String infnombres) {
        this.infnombres = infnombres;
    }

    public String getInfapellidos() {
        return infapellidos;
    }

    public void setInfapellidos(String infapellidos) {
        this.infapellidos = infapellidos;
    }

    public String getInftelefono() {
        return inftelefono;
    }

    public void setInftelefono(String inftelefono) {
        this.inftelefono = inftelefono;
    }

    public String getInfcelular() {
        return infcelular;
    }

    public void setInfcelular(String infcelular) {
        this.infcelular = infcelular;
    }

     public String getInfestado() {
        return infestado;
    }

    public String getInfdireccion() {
        return infdireccion;
    }

    public void setInfdireccion(String infdireccion) {
        this.infdireccion = infdireccion;
    }
 

    public String getInfusuario() {
        return infusuario;
    }

    public void setInfusuario(String infusuario) {
        this.infusuario = infusuario;
    }
    
    
    
}
