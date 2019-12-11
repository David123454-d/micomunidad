/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.EventoVO;
import VO.InformacionU_VO;
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
public class InformacionU_DAO extends ConexionDB implements InterfaceCrud{
 
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
    CallableStatement procs;
    private String Cedula ="";
    private String Nombres ="";
    private String Apellidos ="";
    private String Telefono ="";
    private String Celular ="";
    private String Direccion ="";
    private String Estado ="";
    private String Usuario ="";
     private String Rol ="";
    private String num ="";
    private boolean val = true;
    
    private boolean operacion = true;

    public InformacionU_DAO(InformacionU_VO infoU_VO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            Cedula = infoU_VO.getInfcedula();
            Nombres = infoU_VO.getInfnombres();
            Apellidos = infoU_VO.getInfapellidos();
            Telefono = infoU_VO.getInftelefono();
            Celular = infoU_VO.getInfcelular();
            Direccion = infoU_VO.getInfdireccion();
            Estado = infoU_VO.getInfestado();
            Usuario = infoU_VO.getInfusuario();
            Rol = infoU_VO.getInfrol();
            
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    }

    public InformacionU_DAO() {
    }
    
    @Override
    public boolean agregarRegistro() {
         try {
            procs =conexion.prepareCall("call insertar_info (?,?,?,?,?,?,?);");
            procs.setString(1,Cedula);
            procs.setString(2,Nombres);
            procs.setString(3,Apellidos);
            procs.setString(4,Telefono);
            procs.setString(5,Celular);
            procs.setString(6,Usuario);
            procs.setString(7,Direccion);
            procs.executeUpdate();
            operacion=true;System.out.println("dsfldfdjfdfjd");
        } catch (Exception e) {
            System.out.println("¡Error! "+e.toString()+" "+Usuario);
            operacion = false;
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
         try {
          /*  puente.executeUpdate("update informacion_usuario set Cedula = '"+Cedula+"', Nombres = '"+Nombres+"', Apellidos = '"+Apellidos+"', Telefono = '"+Telefono+"', Celular = '"+Celular+"',  Rol = '"+Rol+"' , Usuario = '"+Usuario+"' where Cedula = '"+Cedula+"' ");
            */
             
            procs =conexion.prepareCall("call spModificarInfU (?,?,?,?,?,?,?);");
            
            procs.setString(1,Nombres);
            procs.setString(2,Apellidos);
            procs.setString(3,Telefono);
            procs.setString(4,Celular);
            procs.setString(6,Direccion);
            procs.setString(7,Usuario);
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
            procs =conexion.prepareCall("call spElminarInfUsu (?);");
            
            procs.setString(1,Cedula);
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
    
        public ArrayList<InformacionU_VO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<InformacionU_VO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarInfU");
            while(rs.next()){
                Cedula = rs.getString(1);
                Nombres = rs.getString(2);
                Apellidos = rs.getString(3);
                Telefono = rs.getString(4);
                Celular = rs.getString(5);
                Direccion = rs.getString(6);
                Estado = rs.getString(7); 
                Usuario = rs.getString(8);
                InformacionU_VO iuVO = new InformacionU_VO(Cedula, Nombres, Apellidos, Telefono, Celular, Direccion, Estado, Usuario);
                listar.add(iuVO);
            }
        } catch (Exception e){
            System.out.println("--------------------------Error al listar info personal-----------------"+e);
        }
        return listar;
    }

        
        public ArrayList<InformacionU_VO> listarRol(String user){
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<InformacionU_VO> listarRol = new ArrayList<>();
        try{
            puente = conexionbd.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarRol('"+user+"')");
            while(rs.next()){
                Cedula = rs.getString(1);
                Nombres = rs.getString(2);
                Apellidos = rs.getString(3);
                Telefono = rs.getString(4);
                Celular = rs.getString(5);
                Direccion = rs.getString(6);
                Estado = rs.getString(7); 
                Usuario = rs.getString(8);
                Rol= rs.getString(9);
                InformacionU_VO iuVO = new InformacionU_VO(Cedula, Nombres, Apellidos, Telefono, Celular, Direccion, Estado, Usuario, Rol);
             listarRol.add(iuVO);
                System.out.println("--------------Se ha consultado el rol--------"+rs.getString(9));
                
            }
        }catch(Exception ex){
            System.out.println("----------Error al consultar rol------------"+ex);
        }
        return listarRol;
    }
    public boolean validarDatosU(String user){
        ConexionDB conexiondb = new ConexionDB();
        try{
        puente = conexiondb.obtenerConexion().createStatement();
        rs = puente.executeQuery("call spValidarDatosU ('"+user+"')");
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
            System.out.println("----------------Se ha encontrao un error al validad datos -----"+e+" "+num);
        }
        return val;
    }
        public ArrayList<InformacionU_VO> listarUsuario(String id){
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<InformacionU_VO> listarUsuario = new ArrayList<>();
        try{
            puente = conexionbd.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarNmUsuarios  ('"+id+"')");
            while(rs.next()){
             Nombres = rs.getString(1);
             Apellidos = rs.getString(2);
             InformacionU_VO iuVO = new InformacionU_VO(Nombres,Apellidos);
             listarUsuario.add(iuVO);
                System.out.println("--------------Se ha consultado el usuario--------"+rs.getString(1));
            }
        }catch(Exception ex){
            System.out.println("----------Error al consultar usuario------------"+ex);
        }
        return listarUsuario;
    }
}
