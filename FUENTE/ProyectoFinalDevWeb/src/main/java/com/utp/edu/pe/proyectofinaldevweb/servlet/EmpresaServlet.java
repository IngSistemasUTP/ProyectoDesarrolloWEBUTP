package com.utp.edu.pe.proyectofinaldevweb.servlet;
import com.utp.edu.pe.proyectofinaldevweb.dao.EmpresaDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Empresa;
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
@WebServlet("/empresa")
public class EmpresaServlet extends HttpServlet {

    EmpresaDAO dao = new EmpresaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Empresa cat = dao.obtenerPorId(id);
                request.setAttribute("empresa", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }
 
        
        request.setAttribute("empresas", dao.listar());
        request.getRequestDispatcher("empresa.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Empresa c = new Empresa();
        c.setRuc(request.getParameter("ruc"));
        c.setRazonSocial(request.getParameter("razon_social"));
        c.setDireccion(request.getParameter("direccion"));
        c.setTelefono(request.getParameter("telefono"));
        c.setCorreo(request.getParameter("correo"));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            dao.insertar(c);
            request.setAttribute("mensaje", "insertado");
        } else {
            c.setId_empresa(Integer.parseInt(idStr));
            dao.actualizar(c);
            request.setAttribute("mensaje", "actualizado");
        }

        request.setAttribute("empresas", dao.listar());
        request.getRequestDispatcher("empresa.jsp").forward(request, response);
    }
}
