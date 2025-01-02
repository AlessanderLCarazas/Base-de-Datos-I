/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Princce
 */

public class BDempleados {
    private BDConexion conn;
    public void setConexion(BDConexion conn){
        this.conn=conn;
    }
    public BDConexion getConexion(){
        return this.conn;
    }
    public List<empleado_edad> getClientes(){
        try{
            String sql="CALL Validacion_email();";
            PreparedStatement preparedStatement =conn.getConexion().prepareStatement(sql);
            ResultSet rs=preparedStatement.executeQuery();
            List<empleado_edad>list =new LinkedList<>();
            empleado_edad empleadoEdad;
            while(rs.next()){
                empleadoEdad=new empleado_edad();
                empleadoEdad.setCodigo_cliente(rs.getInt("codigo_cliente"));
                empleadoEdad.setNombres_apellidos(rs.getString("Nombre y Apellidos"));
                empleadoEdad.setEmail(rs.getString("email"));
                empleadoEdad.setValidacion_email(rs.getString("Validacion Email"));
                list.add(empleadoEdad);
                
            }
            return list;
            
        
    } catch(SQLException e){
        System.out.println("Error: "+e.getMessage());
        return null;
}
        }
}


