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
public class InscripcionVO {
    private String InsId;
    private String InsDescripcion;
    private String InsHorario;
    private String InsID_Curso;
    private String InsID_datos;
    private String Estado;

    public InscripcionVO(String InsId, String InsDescripcion, String InsHorario, String InsID_Curso, String InsID_datos) {
        this.InsId = InsId;
        this.InsDescripcion = InsDescripcion;
        this.InsHorario = InsHorario;
        this.InsID_Curso = InsID_Curso;
        this.InsID_datos = InsID_datos;
    }
    public InscripcionVO() {
    }
    public InscripcionVO(String InsId, String InsDescripcion, String InsHorario, String InsID_Curso, String InsID_datos, String Estado) {
        this.InsId = InsId;
        this.InsDescripcion = InsDescripcion;
        this.InsHorario = InsHorario;
        this.InsID_Curso = InsID_Curso;
        this.InsID_datos = InsID_datos;
        this.Estado = Estado;
    }

    public InscripcionVO(String InsId, String InsID_datos) {
        this.InsId = InsId;
        this.InsID_datos = InsID_datos;
    }


    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    

    public String getInsId() {
        return InsId;
    }

    public void setInsId(String InsId) {
        this.InsId = InsId;
    }

    public String getInsDescripcion() {
        return InsDescripcion;
    }

    public void setInsDescripcion(String InsDescripcion) {
        this.InsDescripcion = InsDescripcion;
    }

    public String getInsHorario() {
        return InsHorario;
    }

    public void setInsHorario(String InsHorario) {
        this.InsHorario = InsHorario;
    }

    public String getInsID_Curso() {
        return InsID_Curso;
    }

    public void setInsID_Curso(String InsID_Curso) {
        this.InsID_Curso = InsID_Curso;
    }

    public String getInsID_datos() {
        return InsID_datos;
    }

    public void setInsID_datos(String InsID_datos) {
        this.InsID_datos = InsID_datos;
    }
    
    
}
