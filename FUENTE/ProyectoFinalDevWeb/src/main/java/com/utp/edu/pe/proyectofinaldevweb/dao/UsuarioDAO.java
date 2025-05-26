
package com.utp.edu.pe.proyectofinaldevweb.dao;
import com.utp.edu.pe.proyectofinaldevweb.model.Usuario;
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
public class UsuarioDAO {

    db_conection db = new db_conection();

    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "select id_usuario, id_cliente, id_empleado, correo_usuario, contrasena_usuario, tipo_usuario from usuario";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getInt("id_cliente"),
                        rs.getInt("id_empleado"),
                        rs.getString("correo_usuario"),
                        rs.getString("contrasena_usuario"),
                        rs.getString("tipo_usuario")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void insertar(Usuario c) {
        String sql = "INSERT INTO usuario (id_cliente, id_empleado, correo_usuario, contrasena_usuario, tipo_usuario) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, c.getId_cliente());
            ps.setInt(2, c.getId_empleado());
            ps.setString(3, c.getCorreo_usuario());
            ps.setString(4, c.getContrasena_usuario());
            ps.setString(5, c.getTipo_usuario());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void actualizar(Usuario c) {
        String sql = "UPDATE usuario SET id_cliente=?, id_empleado=?, correo_usuario=?, contrasena_usuario=?, tipo_usuario=? WHERE id_usuario=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, c.getId_cliente());
            ps.setInt(2, c.getId_empleado());
            ps.setString(3, c.getCorreo_usuario());
            ps.setString(4, c.getContrasena_usuario());
            ps.setString(5, c.getTipo_usuario());
            ps.setInt(6, c.getId_usuario());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM usuario WHERE id_usuario=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Usuario obtenerPorId(int id) {
        String sql = "select id_usuario, id_cliente, id_empleado, correo_usuario, contrasena_usuario, tipo_usuario from usuario where id_usuario=?";
        try (Connection con = db.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Usuario(
                            rs.getInt("id_usuario"),
                            rs.getInt("id_cliente"),
                            rs.getInt("id_empleado"),
                            rs.getString("correo_usuario"),
                            rs.getString("contrasena_usuario"),
                            rs.getString("tipo_usuario")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Método para validar las credenciales del usuario
    public boolean validarUsuario(String correo, String contrasena) {
        boolean esValido = false;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Obtener la conexión desde la clase DatabaseConnection
            connection = db_conection.getConnection();

            // Consulta SQL para validar las credenciales del usuario
            String sql = "SELECT * FROM public.usuario WHERE correo_usuario = ? AND contrasena_usuario = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, correo);
            statement.setString(2, contrasena);

            resultSet = statement.executeQuery();

            // Si se encuentra un usuario con esas credenciales, es válido
            if (resultSet.next()) {
                esValido = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión a la base de datos de postgresql
            db_conection.closeConnection();
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return esValido;
    }
}
