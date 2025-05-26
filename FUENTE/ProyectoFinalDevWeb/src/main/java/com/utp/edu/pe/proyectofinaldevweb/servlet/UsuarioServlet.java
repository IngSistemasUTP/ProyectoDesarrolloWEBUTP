/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.ClienteDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.EmpleadoDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.SistemaDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.UsuarioDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Usuario;
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
@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Usuario cat = dao.obtenerPorId(id);
                request.setAttribute("usuario", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }

        //Extraccion de clientes
        ClienteDAO clienteDAO = new ClienteDAO();
        request.setAttribute("clientes", clienteDAO.listar());

        //Extraccion de empleados
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        request.setAttribute("empleados", empleadoDAO.listar());

        request.setAttribute("usuarios", dao.listar());
        request.getRequestDispatcher("usuario.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario c = new Usuario();

        c.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
        c.setId_empleado(Integer.parseInt(request.getParameter("id_empleado")));
        c.setCorreo_usuario(request.getParameter("correo_usuario"));
        c.setContrasena_usuario(request.getParameter("contrasena_usuario"));
        c.setTipo_usuario(request.getParameter("tipo_usuario"));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            dao.insertar(c);
            request.setAttribute("mensaje", "insertado");
        } else {
            c.setId_usuario(Integer.parseInt(idStr));
            dao.actualizar(c);
            request.setAttribute("mensaje", "actualizado");
        }

        request.setAttribute("usuarios", dao.listar());
        request.getRequestDispatcher("usuario.jsp").forward(request, response);
    }
}
