/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.InscripcionVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import util.ConexionDB;
import util.InterfaceCrud;

/**
 *
 * @author APRENDIZ
 */
public class InscripcionDAO extends ConexionDB implements InterfaceCrud {
   private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
     CallableStatement procs;
    
    private String IdIns ="";
    private String Descripcion ="";
    private String Horarios ="";
    private String id_Curso ="";
    private String Id_Datos ="";
    private String Estado="";
    private boolean operacion = true;
    private String num ="";
    private boolean val = true;

    public InscripcionDAO(InscripcionVO insVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
          
            IdIns = insVO.getInsId();
            Descripcion = insVO.getInsDescripcion();
            Horarios = insVO.getInsHorario();
            id_Curso = insVO.getInsID_Curso();
            Id_Datos = insVO.getInsID_datos();
            Estado = insVO.getEstado();
            
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    } 
    public InscripcionDAO() {
    }
    @Override
    public boolean agregarRegistro() {
        try {
            procs =conexion.prepareCall("call insertar_inscripcion (?,?,?,?);");
            procs.setString(1,Descripcion);
            procs.setString(2,Horarios);
            procs.setString(3,id_Curso);
            procs.setString(4,Id_Datos);
            procs.executeUpdate();
            operacion=true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
           /* puente.executeUpdate("update inscripcion set id_inscripcion = '"+IdIns+"', Descripcion = '"+Descripcion+"', Horario = '"+Horarios+"', id_curso = '"+id_Curso+"', id_datos = '"+Id_Datos+"'  where id_inscripcion = '"+IdIns+"' ");*/
            procs =conexion.prepareCall("call spModificarInscripcion (?,?,?,?,?);");
            procs.setString(1,IdIns);
            procs.setString(2,Descripcion);
            procs.setString(3,Horarios);
            procs.setString(4,id_Curso);
            procs.setString(5,Id_Datos);
            procs.executeUpdate();
            operacion=true;
        } catch (Exception e) {
            System.out.println("¡Error !"+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
         try {
            procs =conexion.prepareCall("call spCambiarEstadoInscrip (?,?);");
            procs.setString(1,IdIns);
            procs.setString(2, Descripcion);
            procs.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public ArrayList<InscripcionVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<InscripcionVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarInscripciones");
            while(rs.next()){
                IdIns = rs.getString(1);
                Descripcion = rs.getString(2);
                Horarios = rs.getString(3);
                id_Curso = rs.getString(4);
                Id_Datos = rs.getString(5);
                Estado = rs.getString(6);
                InscripcionVO inscVO = new InscripcionVO(IdIns,Descripcion,Horarios,id_Curso,Id_Datos, Estado);
                listar.add(inscVO);
            }
        }catch (Exception e){
            System.out.println("-------------------------Error al listar inscripción------------------------"+e);
        }
        return listar;
    }
    public ArrayList<InscripcionVO> listarUsuarios(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<InscripcionVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarNmUsers");
            while(rs.next()){
                IdIns = rs.getString(1) +" "+rs.getString(2);                   
                Id_Datos = rs.getString(3);
                InscripcionVO prestVO = new InscripcionVO(IdIns, Id_Datos);
                listar.add(prestVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamo-------------"+e);
        }
        return listar;
    }
    public ArrayList<InscripcionVO> listarCursos(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<InscripcionVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarNmCursos");
            while(rs.next()){
                IdIns = rs.getString(1);                   
                Id_Datos = rs.getString(2);
                InscripcionVO prestVO = new InscripcionVO(IdIns, Id_Datos);
                listar.add(prestVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamo-------------"+e);
        }
        return listar;
    }
    public ArrayList<InscripcionVO> consultarInscripcion(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<InscripcionVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultaEspInscripciones ('"+id+"')");
            while(rs.next()){
                IdIns = rs.getString(1);
                Descripcion = rs.getString(2);
                Horarios = rs.getString(3);
                id_Curso = rs.getString(4);
                Id_Datos = rs.getString(5);
                Estado = rs.getString(6);
                InscripcionVO inscVO = new InscripcionVO(IdIns,Descripcion,Horarios,id_Curso,Id_Datos, Estado);
                listar.add(inscVO);
            }
        }catch (Exception e){
            System.out.println("-------------------------Error al listar inscripción------------------------"+e);
        }
        return listar;
    }
    public ArrayList<InscripcionVO> consultarInscripcionUsu(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<InscripcionVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarInscripcionUsu ('"+id+"')");
            while(rs.next()){
                IdIns = rs.getString(1);
                Descripcion = rs.getString(2);
                Horarios = rs.getString(3);
                id_Curso = rs.getString(4);
                Id_Datos = rs.getString(5);
                Estado = rs.getString(6);
                InscripcionVO inscVO = new InscripcionVO(IdIns,Descripcion,Horarios,id_Curso,Id_Datos, Estado);
                listar.add(inscVO);
            }
        }catch (Exception e){
            System.out.println("-------------------------Error al listar inscripción------------------------"+e);
        }
        return listar;
    }
    public boolean validarInsc(){
        ConexionDB conexiondb = new ConexionDB();
        try{
        puente = conexiondb.obtenerConexion().createStatement();
        rs = puente.executeQuery("call spValidarInscripcion ('"+Id_Datos+"')");
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
            System.out.println("----------------Error al validad lugar -----"+e);
        }
        return val;
    }
}
