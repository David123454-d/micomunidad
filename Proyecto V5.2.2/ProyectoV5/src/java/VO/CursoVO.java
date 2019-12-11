
package VO;

public class CursoVO {

    private String curNombre;
    private String curDesc;
    private String curCupos;
    private String curDuracion;
    private String curHorarios;
    private String curCostos;
    private String curCertificado;
    private String curInstitucion;
    private String curInstructor;
    private String curEstado;
    private String curLugar;
    private String curID;

    
    
    public CursoVO(String curNombre, String curDesc, String curCupos, String curDuracion, String curHorarios, String curCostos, String curCertificado, String curInstitucion, String curInstructor, String curLugar, String curEstado, String curID) {
        this.curNombre = curNombre;
        this.curDesc = curDesc;
        this.curCupos = curCupos;
        this.curDuracion = curDuracion;
        this.curHorarios = curHorarios;
        this.curCostos = curCostos;
        this.curCertificado = curCertificado;
        this.curInstitucion = curInstitucion;
        this.curInstructor = curInstructor;
        this.curLugar = curLugar;
        this.curEstado = curEstado;  
        this.curID = curID;
    }
    
    
    
    public CursoVO(String curNombre, String curDesc, String curCupos, String curDuracion, String curHorarios, String curCostos, String curCertificado, String curInstitucion, String curInstructor, String curLugar) {
        this.curNombre = curNombre;
        this.curDesc = curDesc;
        this.curCupos = curCupos;
        this.curDuracion = curDuracion;
        this.curHorarios = curHorarios;
        this.curCostos = curCostos;
        this.curCertificado = curCertificado;
        this.curInstitucion = curInstitucion;
        this.curInstructor = curInstructor;
        this.curLugar = curLugar;
    }

    public String getCurID() {
        return curID;
    }

    public void setCurID(String curID) {
        this.curID = curID;
    }
    
    public String getCurNombre() {
        return curNombre;
    }

    public void setCurNombre(String curNombre) {
        this.curNombre = curNombre;
    }

    public String getCurDesc() {
        return curDesc;
    }

    public void setCurDesc(String curDesc) {
        this.curDesc = curDesc;
    }

    public String getCurCupos() {
        return curCupos;
    }

    public void setCurCupos(String curCupos) {
        this.curCupos = curCupos;
    }

    public String getCurDuracion() {
        return curDuracion;
    }

    public void setCurDuracion(String curDuracion) {
        this.curDuracion = curDuracion;
    }

    public String getCurHorarios() {
        return curHorarios;
    }

    public void setCurHorarios(String curHorarios) {
        this.curHorarios = curHorarios;
    }

    public String getCurCostos() {
        return curCostos;
    }

    public void setCurCostos(String curCostos) {
        this.curCostos = curCostos;
    }

    public String getCurCertificado() {
        return curCertificado;
    }

    public void setCurCertificado(String curCertificado) {
        this.curCertificado = curCertificado;
    }

    public String getCurInstitucion() {
        return curInstitucion;
    }

    public void setCurInstitucion(String curInstitucion) {
        this.curInstitucion = curInstitucion;
    }

    public String getCurInstructor() {
        return curInstructor;
    }

    public void setCurInstructor(String curInstructor) {
        this.curInstructor = curInstructor;
    }

    public String getCurEstado() {
        return curEstado;
    }

    public void setCurEstado(String curEstado) {
        this.curEstado = curEstado;
    }

    public String getCurLugar() {
        return curLugar;
    }

    public void setCurLugar(String curLugar) {
        this.curLugar = curLugar;
    }


    
    public CursoVO() {
    }

    public CursoVO(String curNombre) {
        this.curNombre = curNombre;
    }
    
    
}
