<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.Usuario" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    Usuario categoriaEditar = (Usuario) request.getAttribute("usuario");
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
            <form method="post" action="usuario">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Actualizar Usuario</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= categoriaEditar.getId_usuario()%>">
                    <div class="form-group">
                        <label>Cliente Id</label>
                        <input type="text" class="form-control" name="id_cliente" value="<%= categoriaEditar.getId_cliente()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Empleado Id</label>
                        <input type="text" class="form-control" name="id_empleado" value="<%= categoriaEditar.getId_empleado()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Email Usuario</label>
                        <input type="text" class="form-control" name="correo_usuario" value="<%= categoriaEditar.getCorreo_usuario()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Password User</label>
                        <input type="text" class="form-control" name="contrasena_usuario" value="<%= categoriaEditar.getContrasena_usuario()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Tipo Usuario</label>
                        <input type="text" class="form-control" name="tipo_usuario" value="<%= categoriaEditar.getTipo_usuario()%>" required />
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
                                    <th>Id user</th>
                                    <th>Id Empleado</th>
                                    <th>Email User</th>
                                    <th>Password User</th>
                                    <th>Tipo User</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Usuario> lista = (List<Usuario>) request.getAttribute("usuarios");
                                    for (Usuario c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getId_usuario()%></td>
                                    <td><%= c.getId_empleado()%></td>
                                    <td><%= c.getCorreo_usuario()%></td>
                                    <td><%= c.getContrasena_usuario()%></td>
                                    <td><%= c.getTipo_usuario()%></td>
                                    <td>
                                        <a href="usuario?accion=editar&id=<%= c.getId_usuario()%>" class="btn btn-success" ><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="usuario?accion=eliminar&id=<%= c.getId_usuario()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id user</th>
                            <th>Id Empleado</th>
                            <th>Email User</th>
                            <th>Password User</th>
                            <th>Tipo User</th>
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
                                text: 'Usuario <%= mensaje%> correctamente!'
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
                <form method="post" action="usuario">
                    <div class="form-group">
                        <label>Empresa (Cliente)</label>
                      <!--  <input type="text" class="form-control" name="id_cliente" required /> -->
                        <select name="id_cliente" id="id_cliente"  class="form-control">
                            <option value="">Seleccione Cliente:</option>
                            <c:forEach var="cliente" items="${clientes}">
                                <option value="${cliente.id_cliente}">${cliente.nombre_empresa_cliente}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Empleado (Colaborador)</label>
                        <!-- <input type="text" class="form-control" name="id_empleado"required /> -->
                          <select name="id_empleado" id="id_empleado"  class="form-control">
                            <option value="">Seleccione Empleado:</option>
                            <c:forEach var="empleado" items="${empleados}">
                                <option value="${empleado.idEmpleado}">${empleado.nombreEmpleado}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Email User</label>
                        <input type="email" class="form-control" name="correo_usuario"required />
                    </div>
                    <div class="form-group">
                        <label>Password user</label>
                        <input type="text" class="form-control" name="contrasena_usuario"required />
                    </div>
                    <div class="form-group">
                        <label>Tipo Empleado (Rol)</label>
                        <select name="tipo_usuario" id="tipo_usuario" class="form-control" required >
                            <option value="">Seleccione Rol:</option>
                            <option value="Cliente">Cliente</option>
                            <option value="Empleado">Empleado</option>
                            <option value="Admin">Admin</option>
                        </select>
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