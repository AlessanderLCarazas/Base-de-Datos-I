/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
import modelo.BDempleados;
import modelo.empleado_edad;

public class reporte_empleados_edad extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        HttpSession session = request.getSession();
        String usuario = session.getAttribute("usuario").toString();
        String clave = session.getAttribute("clave").toString();
        
        BDConexion conn = new BDConexion(usuario, clave);
        
        BDempleados clienteBD = new BDempleados();
        
        
        clienteBD.setConexion(conn);
        
        List<empleado_edad> lista = clienteBD.getClientes();
        
        conn.desconectar();
        request.setAttribute("empleados",lista);
        rd=request.getRequestDispatcher("/reporte_empleados_edad.jsp");
        rd.forward(request,response);
        
    }

}