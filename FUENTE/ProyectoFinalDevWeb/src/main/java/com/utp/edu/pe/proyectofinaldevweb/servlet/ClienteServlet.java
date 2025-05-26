/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.ClienteDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.EmpresaDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.SistemaDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Cliente;
import com.utp.edu.pe.proyectofinaldevweb.model.Sistema;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author luis.azanero
 */
@WebServlet("/cliente")
public class ClienteServlet extends HttpServlet {

ClienteDAO dao = new ClienteDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Cliente cat = dao.obtenerPorId(id);
                request.setAttribute("cliente", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }
        
        //Extraccion de datos para listar valores en el select con el list de empresas
        EmpresaDAO empresaDAO = new EmpresaDAO();
        request.setAttribute("empresas", empresaDAO.listar());

        //Extraccion de datos para listar valores en el select con el list de sistemas
        SistemaDAO sistemaDAO = new SistemaDAO();
        request.setAttribute("sistemas", sistemaDAO.listar());

        request.setAttribute("clientes", dao.listar());
        request.getRequestDispatcher("cliente.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cliente c = new Cliente();
        c.setRuc(request.getParameter("ruc"));
        c.setNombre_empresa_cliente(request.getParameter("nombre_empresa_cliente"));
        c.setTipo_cliente(request.getParameter("tipo_cliente"));
        c.setId_empresa(Integer.parseInt(request.getParameter("id_empresa")));
        c.setId_sistema(Integer.parseInt(request.getParameter("id_sistema")));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            dao.insertar(c);
            request.setAttribute("mensaje", "insertado");
        } else {
            c.setId_cliente(Integer.parseInt(idStr));
            dao.actualizar(c);
            request.setAttribute("mensaje", "actualizado");
        }

        request.setAttribute("clientes", dao.listar());
        request.getRequestDispatcher("cliente.jsp").forward(request, response);
    }
}
