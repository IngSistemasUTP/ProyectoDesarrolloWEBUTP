/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.pe.proyectofinaldevweb.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author luis.azanero
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Usuario {

    private int id_usuario;
    private int id_cliente;
    private int id_empleado;
    private String correo_usuario;
    private String contrasena_usuario;
    private String tipo_usuario;
}
