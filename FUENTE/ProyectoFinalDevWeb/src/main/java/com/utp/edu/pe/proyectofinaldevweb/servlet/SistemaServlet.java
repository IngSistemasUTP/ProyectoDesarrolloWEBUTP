/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.SistemaDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Sistema;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author luis.azanero
 */
@WebServlet("/sistema")
public class SistemaServlet extends HttpServlet {

    SistemaDAO dao = new SistemaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("editar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Sistema sistema = dao.buscarPorId(id);
            request.setAttribute("sistemaEditar", sistema);
        } else if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            request.setAttribute("mensaje", "eliminado");
        }

        request.setAttribute("sistemas", dao.listar());
        request.getRequestDispatcher("sistema.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id_sistema");
        String nombre = request.getParameter("nombre_sistema");

        boolean ok;
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            ok = dao.actualizar(new Sistema(id, nombre));
            request.setAttribute("mensaje", ok ? "actualizado" : "error");
        } else {
            ok = dao.insertar(new Sistema(0, nombre));
            request.setAttribute("mensaje", ok ? "insertado" : "error");
        }

        doGet(request, response);
    }
   
}
