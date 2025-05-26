/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.UsuarioDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Usuario;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author luis.azanero
 */
@WebServlet("/login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Parametros para el inicio de sesion en el sistema helpdesk 123digital
        String correoElectronico = request.getParameter("correoElectronico");
        String contrasena = request.getParameter("contrasena");

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        if (usuarioDAO.validarUsuario(correoElectronico, contrasena)) {
            // Si las credenciales son correctas, crear sesión y redirigir a la página principal
            HttpSession session = request.getSession(true);
            session.setAttribute("correoElectronico", correoElectronico);
            response.sendRedirect("dashboard.jsp"); // Redirige a la página principal
        } else {
            // Si las credenciales son incorrectas, mostrar mensaje de error en login.jsp
            request.setAttribute("mensaje", "El usuario y/o contraseña no son validos, si el error persiste favor de comunicarse con el centro de soporte del 123digit@l!. <br>Saludos Cordiales.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

}
