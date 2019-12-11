/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.chatVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import util.ConexionDB;
import util.InterfaceCrud;

/**
 *
 * @author Camilo
 */
public class chatDAO extends ConexionDB implements InterfaceCrud{
    
    private Connection conexion = null;
    private Statement puente = null;
    private String Usuario = null;
    private String Fecha = null;
    private String Mensaje = null;
    private ResultSet rs = null;
    
    CallableStatement procs;
    
    private boolean operacion = true;

    public chatDAO(chatVO chatVO) {
        super();
        try{
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            Usuario = chatVO.getUsuario();
            Fecha = chatVO.getFecha();
            Mensaje = chatVO.getMensaje();
            
        }catch(Exception e){
            System.out.println("----------Error chat constructor----------"+e);
        }
    }

    public chatDAO() {
    }
    
    
    
    @Override
    public boolean agregarRegistro() {
        try{
            procs = conexion.prepareCall("call spInsertarChat (?,?,?)");
            procs.setString(1,Usuario);
            procs.setString(2,Fecha);
            procs.setString(3,Mensaje);
            operacion = true;
        }catch(Exception e){
            System.out.println("---------Error Registro Chat---------");
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean consultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
       
        public ArrayList<chatVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<chatVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarChat ");
            while(rs.next()){
                Usuario = rs.getString(1);
                Fecha = rs.getString(2);                
                Mensaje = rs.getString(3);

                chatVO ChatVO = new chatVO(Usuario,Fecha,Mensaje);
                listar.add(ChatVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar prestamo-------------"+e);
        }
        return listar;
    }
}
