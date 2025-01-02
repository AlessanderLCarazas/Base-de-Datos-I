/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author Princce
 */
public class empleado_edad {
    
    private int codigo_cliente;
    private String nombres_apellidos;
    private String email;
    private String validacion_email;

    
   
    
    public int getCodigo_cliente(){
        return codigo_cliente;
    }
    public void setCodigo_cliente(int codigo_cliente){
        this.codigo_cliente=codigo_cliente;
        
    }
    
    public String getNombres_apellidos(){
        return nombres_apellidos;
        
    }
    
    public void setNombres_apellidos(String nombres_apellidos){
        this.nombres_apellidos=nombres_apellidos;
    }
    
    public String getEmail(){
        return email;
        
    }
    public void setEmail(String email){
        this.email=email;
    }
    
    public String getValidacion_email(){
        return validacion_email;
        
    }
    
    public void setValidacion_email(String validacion_email){
        this.validacion_email=validacion_email;
    }
    
}
