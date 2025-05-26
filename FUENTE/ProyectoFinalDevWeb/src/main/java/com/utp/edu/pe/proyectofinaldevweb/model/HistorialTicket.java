package com.utp.edu.pe.proyectofinaldevweb.model;

import java.sql.Date;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author luis.azanero
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistorialTicket {

    private int id_historial;
    private int id_ticket;
    private int id_usuario;
    private String comentario;
    private Timestamp fecha;
   
}
