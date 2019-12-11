/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.EventoVO;
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
public class EventoDAO extends ConexionDB implements InterfaceCrud {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
    CallableStatement procs;
    private String evenNombre ="";
    private String evenDesc ="";
    private String evenFecha ="";
    private String Hora_inicio ="";
    private String Hora_finalizacion ="";
    private String Lugar ="";
    private String Estado ="";
    private String Usuario ="";
    private boolean operacion = true;
    private String idEvento="";
    private String num ="";
    private boolean val = true;

      public EventoDAO(EventoVO evenVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            evenNombre = evenVO.getEvenNombre();
            evenDesc = evenVO.getEvenDesc();
            evenFecha = evenVO.getEvenFecha();
            Hora_inicio = evenVO.getHora_inicio();
            Hora_finalizacion = evenVO.getHora_finalizacion();
            Lugar = evenVO.getLugar();
            Estado = evenVO.getEstado();
            Usuario = evenVO.getUsuario();
            idEvento = evenVO.getIdEvento();
            
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    }
   public EventoDAO() {
    }
    
    @Override
    public boolean agregarRegistro() {
        try {
            procs =conexion.prepareCall("call insertar_evento (?,?,?,?,?,?,?,?);");
            procs.setString(1,evenNombre);
            procs.setString(2,evenDesc);
            procs.setString(3,evenFecha);
            procs.setString(4,Hora_inicio);
            procs.setString(5,Hora_finalizacion);
            procs.setString(6,Lugar);
            procs.setString(7,Estado);
            procs.setString(8,Usuario);
            procs.executeUpdate();   
                  operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString());
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            procs =conexion.prepareCall("call spModificarEven (?,?,?,?,?,?,?,?);");
            procs.setString(1,idEvento);
            procs.setString(2,evenNombre);
            procs.setString(3,evenDesc);
            procs.setString(4,evenFecha);
            procs.setString(5,Hora_inicio);
            procs.setString(6,Hora_finalizacion);
            procs.setString(7,Lugar);
            procs.setString(8,Estado);
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
           procs =conexion.prepareCall("call spEliminarEvento (?);");
            procs.setString(1,evenNombre);
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
   public ArrayList<EventoVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<EventoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarEvento ");
            while(rs.next()){
                idEvento = rs.getString(1);
                evenNombre = rs.getString(2);
                evenDesc = rs.getString(3);
                evenFecha = rs.getString(4);
                Hora_inicio = rs.getString(5);
                Hora_finalizacion = rs.getString(6);
                Lugar = rs.getString(7);
                Estado = rs.getString(8);
                Usuario = rs.getString(9);
                EventoVO evenVO = new EventoVO(idEvento, evenNombre, evenDesc, evenFecha, Hora_inicio, Hora_finalizacion, Lugar, Estado, Usuario);
                listar.add(evenVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar Evento-------------"+e);
        }
        return listar;
    }    
   
       public ArrayList<EventoVO> consultarEvento(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<EventoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarEspEvento ('"+id+"')");
            while(rs.next()){
                idEvento = rs.getString(1);
                evenNombre = rs.getString(2);
                evenDesc = rs.getString(3);
                evenFecha = rs.getString(4);
                Hora_inicio = rs.getString(5);
                Hora_finalizacion = rs.getString(6);
                Lugar = rs.getString(7);
                Estado = rs.getString(8);
                Usuario = rs.getString(9);
                EventoVO evenVO = new EventoVO(idEvento, evenNombre, evenDesc, evenFecha, Hora_inicio, Hora_finalizacion, Lugar, Estado, Usuario);
                listar.add(evenVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar Evento por id-------------"+e);
        }
        return listar;
    }
    public ArrayList<EventoVO> listarLugares(){
    ConexionDB conexiondb = new ConexionDB();
    ArrayList<EventoVO> listar = new ArrayList<>();
    try{
        puente = conexiondb.obtenerConexion().createStatement();
        rs = puente.executeQuery("call spConsultarNmLugares");
        while(rs.next()){
            Lugar = rs.getString(1);                   
            EventoVO evenVO = new EventoVO(Lugar);
            listar.add(evenVO);
        }
    }catch (Exception e){
        System.out.println("-----------------Error al listar lugar-------------"+e);
    }
        return listar;
    }
       
       public ArrayList<EventoVO> consultarLugarId(String id){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<EventoVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarLgPorId  ('"+id+"')");
            while(rs.next()){
                Lugar = rs.getString(1);
                EventoVO evenVO = new EventoVO(Lugar);
                listar.add(evenVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar Lugar por id-------------"+e);
        }
        return listar;
    }
    public boolean validarEventos(){
     ConexionDB conexiondb = new ConexionDB();
     try{
         puente = conexiondb.obtenerConexion().createStatement();
         rs = puente.executeQuery("call spValidar2Eventos ('"+Usuario+"')");
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
    public boolean validarLugar(){
        ConexionDB conexiondb = new ConexionDB();
        try{
        puente = conexiondb.obtenerConexion().createStatement();
        rs = puente.executeQuery("call spValidarLugarD ('"+Lugar+"')");
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
    
}
