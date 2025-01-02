package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class BDpaciente {
    private BDConexion conn;
    
    public void setConexion(BDConexion conn){
        this.conn=conn;
    }
    public BDConexion getConexion(){
        return this.conn;
    }
    
    public List<informacion_paciente> getPacientes(){
        try{
            String sql = "CALL Emails_Pacientes();";
            PreparedStatement preparedStatement = conn.getConexion().prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            List<informacion_paciente> list = new LinkedList<>();
            informacion_paciente pacienteInfo;
            while(rs.next()){
                pacienteInfo = new informacion_paciente();
                pacienteInfo.setCodigo(rs.getInt("Codigo"));
                pacienteInfo.setNombre(rs.getString("Nombre_Paciente"));
                pacienteInfo.setCorreo(rs.getString("correo"));
                pacienteInfo.setEstado_email(rs.getString("Estado_email"));
                list.add(pacienteInfo);
            }
            return list;
        } catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
}
