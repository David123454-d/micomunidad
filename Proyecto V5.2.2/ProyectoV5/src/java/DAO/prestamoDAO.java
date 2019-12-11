/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.prestamoVO;
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
public class prestamoDAO extends ConexionDB implements InterfaceCrud {
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
     CallableStatement procs;
    private String id_lugar ="" ;
    private String tiempo="";
    private String fecha="";
    private String descripcion="";
    private String usuario="";
    private String estado="";
    private String id_prestamo="";
    private String HSalida = "";
    
    
 private boolean operacion = true;

  public prestamoDAO(prestamoVO perVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            id_lugar = perVO.getId_lugar();
            tiempo = perVO.getTiempo();
            fecha = perVO.getFecha();
            descripcion = perVO.getDescripcion();
            usuario = perVO.getUsuario();
            estado = perVO.getEstado();
            id_prestamo = perVO.getId_prestamo();
            HSalida = perVO.getHSalida();
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    }
   public prestamoDAO() {
    }
    
  
    @Override
    public boolean agregarRegistro() {
       try {
            procs =conexion.prepareCall("call spInsertarPrestamo (?,?,?,?,?,?);");
            procs.setString(1,id_lugar);
            procs.setString(2,tiempo);
            procs.setString(3,HSalida);
            procs.setString(4,fecha);
            procs.setString(5,descripcion);
            procs.setString(6,usuario);
            procs.executeUpdate();   
                  operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString()+" "+usuario);
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            procs =conexion.prepareCall("call spModificarPrestamo (?,?,?,?,?,?,?,?);");
            procs.setString(1,id_prestamo);
            procs.setString(2,id_lugar);
            procs.setString(3,tiempo);
            procs.setString(4,HSalida);
            procs.setString(5,fecha);
            procs.setString(6,descripcion);
            procs.setString(7,usuario);
            procs.setString(8,estado);
             
            procs.executeUpdate();   
                  operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
           /* puente.executeUpdate("delete from curso where nombre='"+curNombre+"'");*/
           procs =conexion.prepareCall("call spEliminarPrestamo (?);");
           // procs.setString(1);
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
    public ArrayList<prestamoVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<prestamoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarPrestamo ");
            while(rs.next()){
                id_prestamo = rs.getString(1);
                id_lugar = rs.getString(2);                
                tiempo = rs.getString(3);
                HSalida = rs. getString(4);
                fecha = rs.getString(5);
                descripcion = rs.getString(6);
                usuario = rs.getString(7);
                estado = rs.getString(8);
                prestamoVO perVO = new prestamoVO(id_lugar,id_prestamo,tiempo, fecha, descripcion, usuario, estado,HSalida);
                listar.add(perVO);
            }
            System.out.println("-----------------prestamo estado-------------"+estado);    
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamo-------------"+e);
        }
        return listar;
    }
    public ArrayList<prestamoVO> listarLugares(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<prestamoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarNmLugares");
            while(rs.next()){
                id_lugar = rs.getString(1);                   
                prestamoVO prestVO = new prestamoVO(id_lugar);
                listar.add(prestVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamo-------------"+e);
        }
        return listar;
    }
    public ArrayList<prestamoVO> listarUsers(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<prestamoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarUsers");
            while(rs.next()){
                id_lugar = rs.getString(1)+" "+rs.getString(2);                   
                usuario = rs.getString(3);    
                prestamoVO prestVO = new prestamoVO(id_lugar, usuario);
                listar.add(prestVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamo-------------"+e);
        }
        return listar;
    }
        public ArrayList<prestamoVO> consultarPrestamo(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<prestamoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarEspPrestamo ('"+id+"')");
            while(rs.next()){
                id_prestamo = rs.getString(1);
                id_lugar = rs.getString(2);                
                tiempo = rs.getString(3);
                HSalida = rs.getString(4);
                fecha = rs.getString(5);
                descripcion = rs.getString(6);
                usuario = rs.getString(7);
                estado = rs.getString(8);
                prestamoVO perVO = new prestamoVO(id_prestamo, id_lugar,tiempo, fecha, descripcion, usuario, estado,HSalida);
                listar.add(perVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamos por id-------------"+e);
        }
        return listar;
    }
                public ArrayList<prestamoVO> consultarPrestamoUsu(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<prestamoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarEspUsu ('"+id+"')");
            while(rs.next()){
                id_prestamo = rs.getString(1);
                id_lugar = rs.getString(2);                
                tiempo = rs.getString(3);
                HSalida = rs.getString(4);
                fecha = rs.getString(5);
                descripcion = rs.getString(6);
                usuario = rs.getString(7);
                estado = rs.getString(8);
                prestamoVO perVO = new prestamoVO(id_prestamo, id_lugar,tiempo, fecha, descripcion, usuario, estado,HSalida);
                listar.add(perVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamos por usuario-------------"+e);
        }
        return listar;
    }
    public boolean actLugar(String id){        
        try{
        procs =conexion.prepareCall("call spModificarLugar (?);");
        procs.setString(1, id);
        procs.executeUpdate();   
        System.out.println("----------asdas--------"+id);
        operacion = true;
        } catch (Exception e) {
            System.out.println("---¡Error! ----"+e.toString());
            operacion = false;
        }
        return operacion;        
    }
    public boolean actLugarD(String id){        
        try{
        procs =conexion.prepareCall("call spModificarLugarD (?);");
        procs.setString(1, id);
        procs.executeUpdate();   
        System.out.println("----------asdas--------"+id);
        operacion = true;
        } catch (Exception e) {
            System.out.println("---¡Error! ----"+e.toString());
            operacion = false;
        }
        return operacion;        
    }
  /*  public String consultarID(String name){
        try {
            rs = puente.executeQuery("call spConsultaIDCurso ('"+name+"')");
            while (rs.next()) {                
                id=rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
        }
        return id;
    }*/
}
