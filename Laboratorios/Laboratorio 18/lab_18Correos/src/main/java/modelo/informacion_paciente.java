package modelo;

public class informacion_paciente {
    private int codigo;
    private String nombre;
    private String correo;
    private String estado_email;
    
    public int getCodigo()
    {
        return codigo;
    }
    public void setCodigo(int codigo)
    {
        this.codigo=codigo;
    }

    public String getNombre()
    {
        return nombre;
    }
    public void setNombre(String nombre)
    {
        this.nombre=nombre;
    }
    
    public String getCorreo()
    {
        return correo;
    }
    public void setCorreo(String correo)
    {
        this.correo=correo;
    }
    
    public String getEstado_email()
    {
        return estado_email;
    }
    public void setEstado_email(String estado_email)
    {
        this.estado_email=estado_email;
    }
}
