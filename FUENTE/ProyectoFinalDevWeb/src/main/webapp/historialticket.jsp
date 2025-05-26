<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.HistorialTicket" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    HistorialTicket categoriaEditar = (HistorialTicket) request.getAttribute("historialticket");
    if (categoriaEditar != null) {
%>

<script>
    window.onload = function () {
        $('#modalEditarCategoria').modal('show');
    }
</script>

<!-- Modal Bootstrap para editar -->
<div class="modal fade" id="modalEditarCategoria" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="post" action="historialticket">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Actualizar Ticket</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= categoriaEditar.getId_historial()%>">
                    <div class="form-group">
                        <label>Ticket Id</label>
                        <input type="text" class="form-control" name="id_ticket" value="<%= categoriaEditar.getId_ticket()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Id Usuario</label>
                        <input type="text" class="form-control" name="id_usuario" value="<%= categoriaEditar.getId_usuario()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Comentario</label>
                        <input type="text" class="form-control" name="comentario" value="<%= categoriaEditar.getComentario()%>" required />
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<% } %>

<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Seguimiento de historial de Ticket's</h2>
                        <p>Seguimiento de ticket's abiertos 123digit@!</p>
                    </div>
                    <div class="table-responsive">



                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear nuevo Seguimiento Ticket.</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id Historial</th>
                                    <th>Id Ticket</th>
                                    <th>Id Usuario</th>
                                    <th>Comentario</th>
                                     <th>Fecha</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<HistorialTicket> lista = (List<HistorialTicket>) request.getAttribute("historialtickets");
                                    for (HistorialTicket c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getId_historial()%></td>
                                    <td><%= c.getId_ticket()%></td>
                                    <td><%= c.getId_usuario()%></td>
                                    <td><%= c.getComentario()%></td>
                                     <td><%= c.getFecha()%></td>
                                    <td>
                                        <a href="historialticket?accion=editar&id=<%= c.getId_historial()%>" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="historialticket?accion=eliminar&id=<%= c.getId_historial()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id Historial</th>
                            <th>Id Ticket</th>
                            <th>Id Usuario</th>
                            <th>Comentario</th>
                            <th>Fecha</th>
                            <th>Accion</th>
                            </tfoot>
                        </table>

                        <!-- SweetAlert Notificaciones -->
                        <%
                            String mensaje = (String) request.getAttribute("mensaje");
                            if (mensaje != null) {
                        %>
                        <script>
                            Swal.fire({
                                icon: 'success',
                                title: 'Operación Exitosa',
                                text: 'Historial Ticket <%= mensaje%> correctamente!'
                            });
                        </script>
                        <% }%>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalthree" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h2>Crear Nuevo Historial</h2><br>
                <form method="post" action="historialticket">
                    <div class="form-group">
                        <label>Ticket</label>
                        <!-- <input type="text" class="form-control" name="id_ticket" required /> -->
                        <select name="id_ticket" id="id_ticket"  class="form-control">
                            <option value="">Seleccione un Ticket:</option>
                            <c:forEach var="ticket" items="${tickets}">
                                <option value="${ticket.id_ticket}">${ticket.descripcion}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Id Usuario</label>
                        <!-- <input type="text" class="form-control" name="id_usuario"  required /> -->
                        <select name="id_usuario" id="id_usuario"  class="form-control">
                            <option value="">Seleccione Usuario:</option>
                            <c:forEach var="usuario" items="${usuarios}">
                                <option value="${usuario.id_usuario}">${usuario.correo_usuario}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Comentario</label>
                        <input type="text" class="form-control" name="comentario" required />
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</button>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"> <i class="fa fa-times-circle" aria-hidden="true"></i> Cerrar</button>
            </div>


        </div>
    </div>
</div>



<!-- Data Table area End-->
<!-- Start Footer area-->
<%@ include file="include/footer.jsp" %>