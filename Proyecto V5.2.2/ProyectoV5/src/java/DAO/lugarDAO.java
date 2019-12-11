/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import VO.lugarVO;
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
public class lugarDAO extends ConexionDB implements InterfaceCrud{
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet rs = null;
    CallableStatement procs;
    
    private String idLugar = "";
    private String Nombre = "";
    private String Direccion = "";
    private String Estado = "";
    
    public lugarDAO(lugarVO lugVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            
            idLugar = lugVO.getIdLugar();
            Nombre = lugVO.getNombre();
            Direccion = lugVO.getDireccion();
            Estado = lugVO.getEstado();
            
        } catch (Exception e) {
            System.out.println("Error "+e.toString());
        }
    }

    public lugarDAO() {
    }
    
    
    
    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
    public ArrayList<lugarVO> listar(){
        ConexionDB conexiondb = new ConexionDB();
        ArrayList<lugarVO> listar = new ArrayList<>();
        try{
            puente = conexiondb.obtenerConexion().createStatement();
            rs = puente.executeQuery("call spConsultarLugares");
            while(rs.next()){
                idLugar = rs.getString(1);
                Nombre = rs.getString(2);
                Direccion = rs.getString(3);
                Estado = rs.getString(4);
                lugarVO lugVO = new lugarVO(idLugar, Nombre, Direccion, Estado);
                listar.add(lugVO);
            }
        }catch (Exception e){
            System.out.println("-----------------Error al listar lugar-------------"+e);
        }
        return listar;
    }
    
}
