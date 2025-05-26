/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.HistorialTicketDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.TicketDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.UsuarioDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.HistorialTicket;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author luis.azanero
 */
@WebServlet("/historialticket")
public class HistorialTicketServlet extends HttpServlet {

    HistorialTicketDAO dao = new HistorialTicketDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                HistorialTicket cat = dao.obtenerPorId(id);
                request.setAttribute("historialticket", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }
        // Listar datos para el select html
        TicketDAO ticketDAO = new TicketDAO();
        request.setAttribute("tickets", ticketDAO.listar());
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        request.setAttribute("usuarios", usuarioDAO.listar());
        
        
        request.setAttribute("historialtickets", dao.listar());
        request.getRequestDispatcher("historialticket.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HistorialTicket c = new HistorialTicket();
  
        c.setId_ticket(Integer.parseInt(request.getParameter("id_ticket")));
        c.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        c.setComentario(request.getParameter("comentario"));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            dao.insertar(c);
            request.setAttribute("mensaje", "insertado");
        } else {
            c.setId_historial(Integer.parseInt(idStr));
            dao.actualizar(c);
            request.setAttribute("mensaje", "actualizado");
        }

        request.setAttribute("historialtickets", dao.listar());
        request.getRequestDispatcher("historialticket.jsp").forward(request, response);
    }
}
