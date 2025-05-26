/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.dao;

import com.utp.edu.pe.proyectofinaldevweb.model.HistorialTicket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author luis.azanero
 */
public class HistorialTicketDAO {

    db_conection db = new db_conection();

    public List<HistorialTicket> listar() {
        List<HistorialTicket> lista = new ArrayList<>();
        String sql = "SELECT * FROM historial_ticket";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new HistorialTicket(
                        rs.getInt("id_historial"),
                        rs.getInt("id_ticket"),
                        rs.getInt("id_usuario"),
                        rs.getString("comentario"),
                        rs.getTimestamp("fecha")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(HistorialTicket c) {
        String sql = "INSERT INTO historial_ticket (id_ticket, id_usuario, comentario) VALUES (?, ?, ?)";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, c.getId_ticket());
            ps.setInt(2, c.getId_usuario());
            ps.setString(3, c.getComentario());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizar(HistorialTicket c) {
        String sql = "UPDATE historial_ticket SET id_ticket=?, id_usuario=?, comentario=? WHERE id_historial=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, c.getId_ticket());
            ps.setInt(2, c.getId_usuario());
            ps.setString(3, c.getComentario());
            ps.setInt(4, c.getId_historial());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM historial_ticket WHERE id_historial=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public HistorialTicket obtenerPorId(int id) {
        String sql = "SELECT * FROM historial_ticket WHERE id_historial=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new HistorialTicket(
                            rs.getInt("id_historial"),
                            rs.getInt("id_ticket"),
                            rs.getInt("id_usuario"),
                            rs.getString("comentario"),
                            rs.getTimestamp("fecha")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
