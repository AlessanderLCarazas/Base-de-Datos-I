package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BDConexion {
    
    String bd="gimnasio";
    String url="jdbc:mysql://localhost/" + bd;
    
    Connection conn = null;
    
    public BDConexion(String user, String password){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,password);
            if (conn != null){
                System.out.println("Login Correcto.");
            }
        } catch (ClassNotFoundException | SQLException e){
            System.out.println("Exception Conexion: " + e.getMessage());
        }
    }
    
    public Connection getConexion(){
        return conn;
    }
    
    public void desconectar(){
        System.out.println("OK");
        if (conn != null){
            try{
                conn.close();
            } catch (SQLException e){
                System.out.println(e);
            }
        }
    }
}
