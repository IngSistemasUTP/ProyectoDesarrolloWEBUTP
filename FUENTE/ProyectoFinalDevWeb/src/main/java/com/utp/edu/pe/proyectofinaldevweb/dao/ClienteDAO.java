/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.dao;

import com.utp.edu.pe.proyectofinaldevweb.model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

/**
 *
 * @author luis.azanero
 */
public class ClienteDAO {

    db_conection db = new db_conection();

    public List<Cliente> listar() {
        List<Cliente> lista = new ArrayList<>();
        String sql = "select id_cliente,ruc,nombre_empresa_cliente,tipo_cliente,id_empresa,id_sistema from cliente";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new Cliente(
                        rs.getInt("id_cliente"),
                        rs.getString("ruc"),
                        rs.getString("nombre_empresa_cliente"),
                        rs.getString("tipo_cliente"),
                        rs.getInt("id_empresa"),
                        rs.getInt("id_sistema")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(Cliente c) {
        String sql = "INSERT INTO cliente (ruc, nombre_empresa_cliente, tipo_cliente, id_empresa, id_sistema) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getRuc());
            ps.setString(2, c.getNombre_empresa_cliente());
            ps.setString(3, c.getTipo_cliente());
            ps.setInt(4, c.getId_empresa());
            ps.setInt(5, c.getId_sistema());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizar(Cliente c) {
        String sql = "UPDATE cliente SET ruc=?, nombre_empresa_cliente=?, tipo_cliente=?, id_empresa=?, id_sistema=? WHERE id_cliente=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getRuc());
            ps.setString(2, c.getNombre_empresa_cliente());
            ps.setString(3, c.getTipo_cliente());
            ps.setInt(4, c.getId_empresa());
            ps.setInt(5, c.getId_sistema());
            ps.setInt(6, c.getId_cliente());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM cliente WHERE id_cliente=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Cliente obtenerPorId(int id) {
        String sql = "select id_cliente, ruc, nombre_empresa_cliente, tipo_cliente, id_empresa, id_sistema from cliente where id_cliente = ?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Cliente(
                            rs.getInt("id_cliente"),
                            rs.getString("ruc"),
                            rs.getString("nombre_empresa_cliente"),
                            rs.getString("tipo_cliente"),
                            rs.getInt("id_empresa"),
                            rs.getInt("id_sistema")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
