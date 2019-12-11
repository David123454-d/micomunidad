/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.CursoVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionDB;
import util.InterfaceCrud;

/**
 *
 * 
 */
public class CursoDAO extends ConexionDB implements InterfaceCrud {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
    CallableStatement procs;
    private String curNombre ="";
    private String curDesc ="";
    private String curCupos ="";
    private String curDuracion ="";
    private String curHorarios ="";
    private String curCosto ="";
    private String curCertificado ="";
    private String curInstitucion ="";
    private String curInstructor ="";
    private String curLugar ="";
    private String curEstado ="";
    private String curID="";
    private boolean operacion = true;
    private boolean val=true;
    private String num="";
    
    /**
     * Constructor de la clase CursoDAO
     * @param curVO 
     */
    public CursoDAO(CursoVO curVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            curNombre = curVO.getCurNombre();
            curDesc = curVO.getCurDesc();
            curCupos = curVO.getCurCupos();
            curDuracion = curVO.getCurDuracion();
            curHorarios = curVO.getCurHorarios();
            curCosto = curVO.getCurCostos();
            curCertificado = curVO.getCurCertificado();
            curInstitucion = curVO.getCurInstitucion();
            curInstructor = curVO.getCurInstructor();
            curLugar = curVO.getCurLugar();
            curEstado = curVO.getCurEstado();
            
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    }

    public CursoDAO() {
    }
    
    /**
     *Actualizar registro CursoDAO
     * @param id
     * 
     */
    
    public boolean actualizaRegistro(String id) {
                try {
          /*  puente.executeUpdate("update curso set Nombre='"+curNombre+"',Descripcion='"+curDesc+"',"
                    + "Cupos='"+curCupos+"',Duracion='"+curDuracion+"',Horarios='"+curHorarios+"',Estado='"+curEstado+"' where Nombre='"+curNombre+"'");
            */
            if(curCosto.equals("0") || curCosto.equals("")){
                curCosto = "Gratis";
            }
            procs =conexion.prepareCall("call spModificarCur (?,?,?,?,?,?,?,?,?,?,?);");
           
            procs.setString(1,curNombre);
            procs.setString(2,curDesc);
            procs.setString(3,curCupos);
            procs.setString(4,curDuracion);
            procs.setString(5,curHorarios);
            procs.setString(6,curCosto);
            procs.setString(7,curCertificado);
            procs.setString(8,curInstitucion);
            procs.setString(9,curInstructor);
            procs.setString(10,curLugar);            
            procs.setString(11,id);    
            procs.executeUpdate();   
                  operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString()+"| ID | = "+curLugar);
            operacion = false;
        }
        return operacion;
    }
    
    @Override
    public boolean agregarRegistro() {
        try {
            if(curCosto.equals("0") || curCosto.equals("")){
                curCosto = "Gratis";
            }
            procs =conexion.prepareCall("call insertar_curso (?,?,?,?,?,?,?,?,?,?);");
            procs.setString(1,curNombre);
            procs.setString(2,curDesc);
            procs.setString(3,curCupos);
            procs.setString(4,curDuracion);
            procs.setString(5,curHorarios);
            procs.setString(6,curCosto);
            procs.setString(7,curCertificado);
            procs.setString(8,curInstitucion);
            procs.setString(9,curInstructor);
            procs.setString(10,curLugar);
            procs.executeUpdate();   
                  operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString()+"| LUGAR |"+curLugar);
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
                try {
          /*  puente.executeUpdate("update curso set Nombre='"+curNombre+"',Descripcion='"+curDesc+"',"
                    + "Cupos='"+curCupos+"',Duracion='"+curDuracion+"',Horarios='"+curHorarios+"',Estado='"+curEstado+"' where Nombre='"+curNombre+"'");
            */
            if(curCosto.equals("0") || curCosto.equals("")){
                curCosto = "Gratis";
            }
            procs =conexion.prepareCall("call spModificarCur (?,?,?,?,?,?,?,?,?,?,?);");
           
            procs.setString(1,curNombre);
            procs.setString(2,curDesc);
            procs.setString(3,curCupos);
            procs.setString(4,curDuracion);
            procs.setString(5,curHorarios);
            procs.setString(6,curCosto);
            procs.setString(7,curCertificado);
            procs.setString(8,curInstitucion);
            procs.setString(9,curInstructor);
            procs.setString(10,curLugar);            
            procs.setString(11,curID);    
            procs.executeUpdate();   
                  operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString()+"| ID | = "+curID);
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {        
        try {
           /* puente.executeUpdate("delete from curso where nombre='"+curNombre+"'");*/
           procs =conexion.prepareCall("call spModificarCur (?,?,?,?,?,?,?,?,?,?));");
           
            procs.setString(1,curNombre);
            procs.setString(2,curDesc);
            procs.setString(3,curCupos);
            procs.setString(4,curDuracion);
            procs.setString(5,curHorarios);
            procs.setString(6,curCosto);
            procs.setString(7,curCertificado);
            procs.setString(8,curInstitucion);
            procs.setString(9,curInstructor);
            procs.setString(10,curLugar);            
            
            procs.executeUpdate();   
                  operacion = true;
        }   catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<CursoVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<CursoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarCursos");
            while(rs.next()){
                curNombre = rs.getString(1);
                curDesc = rs.getString(2);
                curCupos = rs.getString(3);
                curDuracion = rs.getString(4);
                curHorarios = rs.getString(5);
                curCosto = rs.getString(6);
                curCertificado = rs.getString(7);
                curInstitucion = rs.getString(8);
                curInstructor = rs.getString(9);
                curLugar = rs.getString(10);                   
                curEstado = rs.getString(11);    
                curID = rs.getString(12);    
                CursoVO curVO = new CursoVO(curNombre, curDesc, curCupos, curDuracion, curHorarios, curCosto, curCertificado, curInstitucion, curInstructor, curLugar, curEstado, curID);
                listar.add(curVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar curso-------------"+e);
        }
        return listar;
    }
    public ArrayList<CursoVO> listarLugares(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<CursoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarNmLugares");
            while(rs.next()){
                curLugar = rs.getString(1);                   
                CursoVO curVO = new CursoVO(curLugar);
                listar.add(curVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar curso-------------"+e);
        }
        return listar;
    }
    public ArrayList<CursoVO> consultarCurso(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<CursoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarEspCurso ('"+id+"')");
            while(rs.next()){
                curNombre = rs.getString(1);
                curDesc = rs.getString(2);
                curCupos = rs.getString(3);
                curDuracion = rs.getString(4);
                curHorarios = rs.getString(5);
                curCosto = rs.getString(6);
                curCertificado = rs.getString(7);
                curInstitucion = rs.getString(8);
                curInstructor = rs.getString(9);
                curLugar = rs.getString(10);                   
                curEstado = rs.getString(11);    
                curID = rs.getString(12);    
                CursoVO curVO = new CursoVO(curNombre, curDesc, curCupos, curDuracion, curHorarios, curCosto, curCertificado, curInstitucion, curInstructor, curLugar, curEstado, curID);
                listar.add(curVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar curso-------------"+e);
        }
        return listar;
    }
    public boolean Eliminar(String id){
        try {
           /* puente.executeUpdate("delete from curso where nombre='"+curNombre+"'");*/
            procs =conexion.prepareCall("call spEliminarCurso (?);");
            procs.setString(1,id);                        
            
            procs.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
            operacion = false;
        }
        return operacion;
    }
    public boolean validarLugar(){
        ConexionDB conexiondb = new ConexionDB();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spValidarLugarCursos ('"+curLugar+"')");
            while(rs.next()){
                num = rs.getString(1);
            }

            if(num.equals("1")){
                val = false;
            }else{
                val = true;
            }
        }catch (Exception e){
            val = false;
            System.out.println("----------------Error al validad lugar Curso-----"+e);
        }
        return val;
    }
    public boolean validarCurso(){
        ConexionDB conexiondb = new ConexionDB();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spValidarCurso ('"+curNombre+"')");
            while(rs.next()){
                num = rs.getString(1);
            }

            if(num.equals("1")){
                val = false;
            }else{
                val = true;
            }
        }catch (Exception e){
            val = false;
            System.out.println("----------------Error al validad lugar Curso-----"+e);
        }
        return val;
    }
}
