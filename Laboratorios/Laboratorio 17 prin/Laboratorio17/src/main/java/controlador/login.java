/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.BDConexion;

public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario= request.getParameter("usuario");
        String clave= request.getParameter("clave");
        BDConexion conexion = new BDConexion(usuario, clave);
                
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        if(conexion.getConexion() != null){
            session.setAttribute("usuario", usuario);
            session.setAttribute("clave", clave);
            out.println("OK");
        } else{
            session.invalidate();
            out.println("Usuario y/o clave incorrectos!.");
        }
    }

}
