package modelo;

public class informacion_paciente {
    private int codigo_cama;
    private int codigo_paciente;
    private String nombre;
    private String info;
    private int edad;
    
    public int getCodigo_cama()
    {
        return codigo_cama;
    }
    public void setCodigo_cama(int codigo_cama)
    {
        this.codigo_cama=codigo_cama;
    }
    
    public int getCodigo_paciente()
    {
        return codigo_paciente;
    }
    public void setCodigo_paciente(int codigo_paciente)
    {
        this.codigo_paciente=codigo_paciente;
    }
    
    public String getNombre()
    {
        return nombre;
    }
    public void setNombre(String nombre)
    {
        this.nombre=nombre;
    }
    
    public String getInfo()
    {
        return info;
    }
    public void setInfo(String info)
    {
        this.info=info;
    }
    
    public int getEdad()
    {
        return edad;
    }
    public void setEdad(int edad)
    {
        this.edad=edad;
    }
}
