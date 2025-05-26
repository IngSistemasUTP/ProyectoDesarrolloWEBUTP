<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.Ticket" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    Ticket categoriaEditar = (Ticket) request.getAttribute("ticket");
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
            <form method="post" action="ticket">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Actualizar Ticket</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= categoriaEditar.getId_ticket()%>">
                    <div class="form-group">
                        <label>Id Cliente</label>
                        <input type="text" class="form-control" name="id_cliente" value="<%= categoriaEditar.getId_cliente()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Id Categoria</label>
                        <input type="text" class="form-control" name="id_categoria" value="<%= categoriaEditar.getId_categoria()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Id Empleado</label>
                        <input type="text" class="form-control" name="id_empleado_responsable" value="<%= categoriaEditar.getId_empleado_responsable()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input type="text" class="form-control" name="estado" value="<%= categoriaEditar.getEstado()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Prioridad</label>
                        <input type="text" class="form-control" name="prioridad" value="<%= categoriaEditar.getPrioridad()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Descripcion</label>
                        <input type="text" class="form-control" name="descripcion" value="<%= categoriaEditar.getDescripcion()%>" required />
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
                        <h2>Maestro de Usuarios</h2>
                        <p>Informacion de los clientes de la empresa 123digit@l!</p>
                    </div>
                    <div class="table-responsive">



                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear Nuevo Usuario</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id Ticket</th>
                                    <th>Id Cliente</th>
                                    <th>Id Categoria</th>
                                    <th>Id Empleado</th>
                                    <th>Estado</th>
                                    <th>Prioridad</th>
                                    <th>Descripcion</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Ticket> lista = (List<Ticket>) request.getAttribute("tickets");
                                    for (Ticket c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getId_ticket()%></td>
                                    <td><%= c.getId_cliente()%></td>
                                    <td><%= c.getId_categoria()%></td>
                                    <td><%= c.getId_empleado_responsable()%></td>
                                    <td><%= c.getEstado()%></td>
                                    <td><%= c.getPrioridad()%></td>
                                    <td><%= c.getDescripcion()%></td>
                                    <td>
                                        <a href="usuario?accion=editar&id=<%= c.getId_ticket()%>" class="btn btn-success" ><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="usuario?accion=eliminar&id=<%= c.getId_ticket()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id Ticket</th>
                            <th>Id Cliente</th>
                            <th>Id Categoria</th>
                            <th>Id Empleado</th>
                            <th>Estado</th>
                            <th>Prioridad</th>
                            <th>Descripcion</th>
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
                                text: 'Ticket <%= mensaje%> correctamente!'
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
                <h2>Crear Nuevo Usuario</h2><br>
                <form method="post" action="ticket">
                    <div class="form-group">
                        <label>Id Cliente</label>
                        <!-- <input type="text" class="form-control" name="id_cliente"  required /> -->
                        <select name="id_cliente" id="id_cliente"  class="form-control">
                            <option value="">Seleccione un Cliente:</option>
                            <c:forEach var="cliente" items="${clientes}">
                                <option value="${cliente.id_cliente}">${cliente.nombre_empresa_cliente}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Id Categoria</label>
                        <!-- <input type="text" class="form-control" name="id_categoria"  required /> -->
                        <select name="id_categoria" id="id_categoria"  class="form-control">
                            <option value="">Seleccione una Categoria:</option>
                            <c:forEach var="categoria" items="${categorias}">
                                <option value="${categoria.id_categoria}">${categoria.nombre_categoria}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Id Empleado</label>
                        <!-- <input type="text" class="form-control" name="id_empleado_responsable"  required /> -->
                        <select name="id_empleado_responsable" id="id_empleado_responsable"  class="form-control">
                            <option value="">Seleccione un Empleado:</option>
                            <c:forEach var="empleado" items="${empleados}">
                                <option value="${empleado.idEmpleado}">${empleado.nombreEmpleado}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                       <!-- <input type="text" class="form-control" name="estado"  required /> -->
                        <select class="form-control" name="estado" required>
                            <option value="">Seleccione Estado:</option>
                             <option value="Nuevo">Nuevo</option>
                            <option value="En Proceso">En Proceso</option>
                            <option value="Resuelto">Resuelto</option>
                            <option value="Cerrado">Cerrado</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Prioridad</label>
                       <!-- <input type="text" class="form-control" name="prioridad"  required /> -->
                               <select class="form-control" name="prioridad" required>
                            <option value="">Seleccione Prioridad:</option>
                            <option value="Alta">Alta</option>
                            <option value="Media">Media</option>
                            <option value="Baja">Baja</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Descripcion</label>
                        <input type="text" class="form-control" name="descripcion"  required />
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