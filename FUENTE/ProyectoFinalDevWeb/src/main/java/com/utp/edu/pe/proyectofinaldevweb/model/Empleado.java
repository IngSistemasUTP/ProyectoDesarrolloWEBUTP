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
public class Empleado {

    private int idEmpleado;
    private String nombreEmpleado;
    private String correoEmpleado;
    private String telefonoEmpleado;
    private String puesto;
    private int idEmpresa;
}
