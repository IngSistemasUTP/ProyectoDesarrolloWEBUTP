package com.utp.edu.pe.proyectofinaldevweb.dao;

import com.utp.edu.pe.proyectofinaldevweb.model.Empresa;
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
public class EmpresaDAO {

    db_conection db = new db_conection();

    public List<Empresa> listar() {
        List<Empresa> lista = new ArrayList<>();
        String sql = "select id_empresa, ruc,razon_social, direccion, telefono, correo from empresa";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new Empresa(
                        rs.getInt("id_empresa"),
                        rs.getString("ruc"),
                        rs.getString("razon_social"),
                        rs.getString("direccion"),
                        rs.getString("telefono"),
                        rs.getString("correo")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(Empresa c) {
        String sql = "INSERT INTO empresa (ruc, razon_social, direccion, telefono, correo) VALUES (?,?,?,?,?)";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getRuc());
            ps.setString(2, c.getRazonSocial());
            ps.setString(3, c.getDireccion());
            ps.setString(4, c.getTelefono());
            ps.setString(5, c.getCorreo());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizar(Empresa c) {
        String sql = "UPDATE empresa SET ruc=?, razon_social=?, direccion=?, telefono=?, correo=? WHERE id_empresa=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getRuc());
            ps.setString(2, c.getRazonSocial());
            ps.setString(3, c.getDireccion());
            ps.setString(4, c.getTelefono());
            ps.setString(5, c.getCorreo());
            ps.setInt(6, c.getId_empresa());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "delete from empresa WHERE id_empresa=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Empresa obtenerPorId(int id) {
        String sql = "select id_empresa, ruc, razon_social, direccion, telefono,correo from empresa where id_empresa=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Empresa(
                            rs.getInt("id_empresa"),
                            rs.getString("ruc"),
                            rs.getString("razon_social"),
                            rs.getString("direccion"),
                            rs.getString("telefono"),
                            rs.getString("correo")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
