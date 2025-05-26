package com.utp.edu.pe.proyectofinaldevweb.servlet;

import com.utp.edu.pe.proyectofinaldevweb.dao.CategoriaDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.EmpleadoDAO;
import com.utp.edu.pe.proyectofinaldevweb.dao.EmpresaDAO;
import com.utp.edu.pe.proyectofinaldevweb.model.Categoria;
import com.utp.edu.pe.proyectofinaldevweb.model.Empleado;
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
@WebServlet("/empleado")
public class EmpleadoServlet extends HttpServlet {

    EmpleadoDAO dao = new EmpleadoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Empleado cat = dao.obtenerPorId(id);
                request.setAttribute("empleado", cat);
                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("mensaje", "eliminado");
                break;
        }

        //Extraccion de datos para listar valores en el select de empresa
        EmpresaDAO empresaDAO = new EmpresaDAO();
        request.setAttribute("empresas", empresaDAO.listar());

        request.setAttribute("empleados", dao.listar());
        request.getRequestDispatcher("empleado.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Empleado c = new Empleado();
        c.setNombreEmpleado(request.getParameter("nombre_empleado"));
        c.setCorreoEmpleado(request.getParameter("correo_empleado"));
        c.setTelefonoEmpleado(request.getParameter("telefono_empleado"));
        c.setPuesto(request.getParameter("puesto"));
        c.setIdEmpresa(Integer.parseInt(request.getParameter("id_empresa")));

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            dao.insertar(c);
            request.setAttribute("mensaje", "insertado");
        } else {
            c.setIdEmpleado(Integer.parseInt(idStr));
            dao.actualizar(c);
            request.setAttribute("mensaje", "actualizado");
        }

        request.setAttribute("empleados", dao.listar());
        request.getRequestDispatcher("empleado.jsp").forward(request, response);
    }
}
