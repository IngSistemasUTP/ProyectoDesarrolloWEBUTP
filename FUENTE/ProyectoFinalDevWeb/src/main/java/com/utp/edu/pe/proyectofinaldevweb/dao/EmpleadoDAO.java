/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.dao;

import com.utp.edu.pe.proyectofinaldevweb.model.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author luis.azanero
 */
public class EmpleadoDAO {

      public List<Empleado> listar() {
        List<Empleado> lista = new ArrayList<>();
        try (Connection con = db_conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM empleado");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado();
                e.setIdEmpleado(rs.getInt("id_empleado"));
                e.setNombreEmpleado(rs.getString("nombre_empleado"));
                e.setCorreoEmpleado(rs.getString("correo_empleado"));
                e.setTelefonoEmpleado(rs.getString("telefono_empleado"));
                e.setPuesto(rs.getString("puesto"));
                e.setIdEmpresa(rs.getInt("id_empresa"));
                lista.add(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(Empleado e) {
        String sql = "INSERT INTO empleado(nombre_empleado, correo_empleado, telefono_empleado, puesto, id_empresa) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = db_conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombreEmpleado());
            ps.setString(2, e.getCorreoEmpleado());
            ps.setString(3, e.getTelefonoEmpleado());
            ps.setString(4, e.getPuesto());
            ps.setInt(5, e.getIdEmpresa());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void actualizar(Empleado e) {
        String sql = "UPDATE empleado SET nombre_empleado=?, correo_empleado=?, telefono_empleado=?, puesto=?, id_empresa=? WHERE id_empleado=?";
        try (Connection con = db_conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombreEmpleado());
            ps.setString(2, e.getCorreoEmpleado());
            ps.setString(3, e.getTelefonoEmpleado());
            ps.setString(4, e.getPuesto());
            ps.setInt(5, e.getIdEmpresa());
            ps.setInt(6, e.getIdEmpleado());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM empleado WHERE id_empleado=?";
        try (Connection con = db_conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Empleado obtenerPorId(int id) {
        Empleado e = new Empleado();
        try (Connection con = db_conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM empleado WHERE id_empleado=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setIdEmpleado(rs.getInt("id_empleado"));
                e.setNombreEmpleado(rs.getString("nombre_empleado"));
                e.setCorreoEmpleado(rs.getString("correo_empleado"));
                e.setTelefonoEmpleado(rs.getString("telefono_empleado"));
                e.setPuesto(rs.getString("puesto"));
                e.setIdEmpresa(rs.getInt("id_empresa"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
}
