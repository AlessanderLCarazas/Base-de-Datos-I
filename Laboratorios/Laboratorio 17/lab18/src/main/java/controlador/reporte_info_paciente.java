package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.BDConexion;
import modelo.BDpaciente;
import modelo.informacion_paciente;

public class reporte_info_paciente extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        HttpSession session = request.getSession();
        String usuario = session.getAttribute("usuario").toString();
        String clave = session.getAttribute("clave").toString();
        BDConexion conn= new BDConexion(usuario, clave);
        BDpaciente pacienteBD = new BDpaciente();
        pacienteBD.setConexion(conn);
        List<informacion_paciente> lista = pacienteBD.getPacientes();
        conn.desconectar();
        request.setAttribute("pacientes", lista);
        rd = request.getRequestDispatcher("/reporte_infos_paciente.jsp");
        rd.forward(request, response);
    }
}
