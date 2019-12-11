/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.UsuarioVO;
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
public class UsuarioDAO extends ConexionDB implements InterfaceCrud {
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
    CallableStatement procs;
    private String Usuario ="";
    private String Contraseña ="";
    private String Estado ="";
    private String num ="";
    
    private boolean operacion = true;

    public UsuarioDAO(UsuarioVO usuVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            Usuario = usuVO.getUsuario();
            Contraseña = usuVO.getContraseña();
            Estado = usuVO.getEstado();
            
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    }

    public UsuarioDAO() {
    }

    @Override
    public boolean agregarRegistro() {
         try {
            procs =conexion.prepareCall("call inser_usuario (?,?);");
            procs.setString(1,Usuario);
            procs.setString(2,Contraseña);
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
           /* puente.executeUpdate("update usuario set contraseña = '"+Contraseña+"' where usuario='"+Usuario+"';");*/
            procs =conexion.prepareCall("call spModificarUsu (?,?,?);");
            procs.setString(1,Usuario);
            procs.setString(2,Contraseña);
            procs.setString(3,Estado);
            procs.executeUpdate(); 
             operacion = true;
        } catch (Exception e) {
            System.out.println("¡Error !"+e.toString());
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            procs =conexion.prepareCall("call ELIMINAR_USUARIO (?);");
            procs.setString(1,Usuario);
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
    public boolean validarAcceso(){
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            rs = puente.executeQuery("SELECT * FROM usu WHERE usuario = '"+Usuario+"' and contraseña = '"+Contraseña+"'");
            if (rs.next()) {
                operacion = true;
            }else{
                operacion = false;
            }
            this.cerrarConexion();
        } catch (Exception e) {
            System.out.println("Error "+e.toString());            
        }
        return operacion;
    }
    public ArrayList<UsuarioVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<UsuarioVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarUsuario");
            while(rs.next()){
                Usuario = rs.getString(1);
                Contraseña = rs.getString(2);
                Estado = rs.getString(3);
                UsuarioVO curVO = new UsuarioVO(Usuario, Contraseña, Estado);
                listar.add(curVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar curso-------------"+e);
        }
        return listar;
    }
    public String solicitarPass(String user){
        ConexionDB conexiondb = new ConexionDB();
        try{
        puente = conexiondb.obtenerConexion().createStatement();
        rs = puente.executeQuery("call spSolicitarPass ('"+user+"')");
        while(rs.next()){
            num = rs.getString(1);
        }
        
        }catch (Exception e){            
            System.out.println("----------------Error al validad lugar -----"+e);
        }
        return num;
    }
}
