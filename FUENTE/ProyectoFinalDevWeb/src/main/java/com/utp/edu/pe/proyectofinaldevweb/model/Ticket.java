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
public class Ticket {

    private int id_ticket;
    private int id_cliente;
    private int id_categoria;
    private int id_empleado_responsable;
    private String estado;
    private String prioridad;
    private String descripcion;
}
