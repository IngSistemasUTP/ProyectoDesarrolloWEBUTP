/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.dao;

import com.utp.edu.pe.proyectofinaldevweb.model.Ticket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author luis.azanero
 */
public class TicketDAO {

    db_conection db = new db_conection();

    public List<Ticket> listar() {
        List<Ticket> lista = new ArrayList<>();
        String sql = "select id_ticket, id_cliente, id_categoria, id_empleado_responsable, estado, prioridad, descripcion from ticket";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new Ticket(
                        rs.getInt("id_ticket"),
                        rs.getInt("id_cliente"),
                        rs.getInt("id_categoria"),
                        rs.getInt("id_empleado_responsable"),
                        rs.getString("estado"),
                        rs.getString("prioridad"),
                        rs.getString("descripcion")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(Ticket c) {
        String sql = "INSERT INTO ticket (id_cliente, id_categoria, id_empleado_responsable, estado, prioridad, descripcion) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, c.getId_cliente());
            ps.setInt(2, c.getId_categoria());
            ps.setInt(3, c.getId_empleado_responsable());
            ps.setString(4, c.getEstado());
            ps.setString(5, c.getPrioridad());
            ps.setString(6, c.getDescripcion());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizar(Ticket c) {
        String sql = "UPDATE ticket SET id_cliente=?, id_categoria=?, id_empleado_responsable=?, estado=?, prioridad=?, descripcion=? WHERE id_ticket=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, c.getId_cliente());
            ps.setInt(2, c.getId_categoria());
            ps.setInt(3, c.getId_empleado_responsable());
            ps.setString(4, c.getEstado());
            ps.setString(5, c.getPrioridad());
            ps.setString(6, c.getDescripcion());
            ps.setInt(7, c.getId_ticket());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM ticket WHERE id_ticket=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Ticket obtenerPorId(int id) {
        String sql = "SELECT * FROM ticket WHERE id_ticket = ?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Ticket(
                            rs.getInt("id_ticket"),
                            rs.getInt("id_cliente"),
                            rs.getInt("id_categoria"),
                            rs.getInt("id_empleado_responsable"),
                            rs.getString("estado"),
                            rs.getString("prioridad"),
                            rs.getString("descripcion")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
