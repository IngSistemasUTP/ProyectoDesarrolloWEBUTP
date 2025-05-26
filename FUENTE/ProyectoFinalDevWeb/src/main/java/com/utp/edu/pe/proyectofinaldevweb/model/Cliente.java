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
public class Cliente {

    private int id_cliente;
    private String ruc;
    private String nombre_empresa_cliente;
    private String tipo_cliente;
    private int id_empresa;
    private int id_sistema;

}
