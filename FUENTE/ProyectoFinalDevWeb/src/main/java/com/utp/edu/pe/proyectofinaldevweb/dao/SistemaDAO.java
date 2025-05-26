/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.dao;

import com.utp.edu.pe.proyectofinaldevweb.model.Sistema;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author luis.azanero
 */
public class SistemaDAO {

    public List<Sistema> listar() {
        List<Sistema> lista = new ArrayList<>();
        String sql = "SELECT id_sistema, nombre_sistema FROM sistema";
        try (Connection con = db_conection.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(new Sistema(rs.getInt("id_sistema"), rs.getString("nombre_sistema")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

   
    public boolean insertar(Sistema sistema) {
        String sql = "INSERT INTO sistema(nombre_sistema) VALUES (?)";
        try (Connection con = db_conection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, sistema.getNombre_sistema());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Sistema sistema) {
        String sql = "UPDATE sistema SET nombre_sistema=? WHERE id_sistema=?";
        try (Connection con = db_conection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, sistema.getNombre_sistema());
            ps.setInt(2, sistema.getId_sistema());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM sistema WHERE id_sistema=?";
        try (Connection con = db_conection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Sistema buscarPorId(int id) {
        String sql = "SELECT * FROM sistema WHERE id_sistema=?";
        try (Connection con = db_conection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Sistema(rs.getInt("id_sistema"), rs.getString("nombre_sistema"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
