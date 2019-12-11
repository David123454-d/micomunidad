
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionDB {
    
    private String driver, urlDB, db, userDB, passwordDB;
    private Connection conexion;
    
    public ConexionDB(){
        
        driver = "com.mysql.jdbc.Driver";
        db = "socialred";
        userDB = "root";
        passwordDB = "";
        urlDB = "jdbc:mysql://localhost:3306/"+db;
        
        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlDB, userDB, passwordDB);
            System.out.println("nisu");
        } catch (Exception e) {
            System.out.println("Error = "+e.toString());
        }
    }
    public Connection obtenerConexion(){
        return conexion;
    }
    public Connection cerrarConexion() throws SQLException{
        conexion.close();
        conexion = null;
        return conexion;
    }
    public static void main(String[] args) {
        new ConexionDB();
    }
}
