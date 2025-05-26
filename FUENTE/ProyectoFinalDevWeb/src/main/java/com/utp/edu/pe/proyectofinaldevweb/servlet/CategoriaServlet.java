/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.CategoriaDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.SistemaDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Categoria;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
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
@WebServlet("/categoria")
public class CategoriaServlet extends HttpServlet {
 CategoriaDAO dao = new CategoriaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Categoria cat = dao.obtenerPorId(id);
                request.setAttribute("categoria", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }

        request.setAttribute("categorias", dao.listar());
        request.getRequestDispatcher("categoria.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Categoria c = new Categoria();
        c.setNombre_categoria(request.getParameter("nombre"));
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

        request.setAttribute("categorias", dao.listar());
        request.getRequestDispatcher("categoria.jsp").forward(request, response);
    }
}
