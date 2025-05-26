/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.CategoriaDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.ClienteDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.EmpleadoDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.TicketDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Ticket;
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
@WebServlet("/ticket")
public class TicketServlet extends HttpServlet {

  TicketDAO dao = new TicketDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Ticket cat = dao.obtenerPorId(id);
                request.setAttribute("ticket", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }

         //Extraccion de datos para llenar los select html
        
        ClienteDAO clienteDAO = new ClienteDAO();
        request.setAttribute("clientes", clienteDAO.listar());
        
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        request.setAttribute("categorias", categoriaDAO.listar());
        
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        request.setAttribute("empleados", empleadoDAO.listar());
        
        
        request.setAttribute("tickets", dao.listar());
        request.getRequestDispatcher("ticket.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ticket c = new Ticket();

        c.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
        c.setId_categoria(Integer.parseInt(request.getParameter("id_categoria")));
        c.setId_empleado_responsable(Integer.parseInt(request.getParameter("id_empleado_responsable")));
        c.setEstado(request.getParameter("estado"));
        c.setPrioridad(request.getParameter("prioridad"));
        c.setDescripcion(request.getParameter("descripcion"));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            dao.insertar(c);
            request.setAttribute("mensaje", "insertado");
        } else {
            c.setId_categoria(Integer.parseInt(idStr));
            dao.actualizar(c);
            request.setAttribute("mensaje", "actualizado");
        }

        request.setAttribute("tickets", dao.listar());
        request.getRequestDispatcher("ticket.jsp").forward(request, response);
    }
}
