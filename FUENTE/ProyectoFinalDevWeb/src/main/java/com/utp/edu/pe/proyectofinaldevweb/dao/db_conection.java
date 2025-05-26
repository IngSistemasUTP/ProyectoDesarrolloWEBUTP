/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author luis.azanero
 */
public class db_conection {

    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/db_digital";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "admin";
    private static Connection connection = null;

    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                // Registrar el driver de PostgreSQL
                Class.forName("org.postgresql.Driver");

                // Establecer la conexión con la base de datos
                connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Método para cerrar la conexión
    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
