<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.Empleado" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    Empleado empleadoEditar = (Empleado) request.getAttribute("empleado");
    if (empleadoEditar != null) {
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
            <form method="post" action="empleado">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Actualizar Empleado</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= empleadoEditar.getIdEmpleado()%>">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre_empleado" value="<%= empleadoEditar.getNombreEmpleado()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="correo_empleado" value="<%= empleadoEditar.getCorreoEmpleado()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Numero Telefono</label>
                        <input type="text" class="form-control" name="telefono_empleado" value="<%= empleadoEditar.getTelefonoEmpleado()%>" required />
                    </div>
                    <div class="form-group">
                        <label>#Puesto</label>
                        <input type="text" class="form-control" name="puesto" value="<%= empleadoEditar.getPuesto()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Empresa</label>
                        <input type="text" class="form-control" name="id_empresa" value="<%= empleadoEditar.getIdEmpresa()%>" required />
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
                        <h2>Maestro de Empleados</h2>
                        <p>Aqui se registra todos los colaboradores inscritos en el sistema de helpdesk.</p>
                    </div>
                    <div class="table-responsive">



                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear Nueva Empleado</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id</th>
                                    <th>Nombres</th>
                                    <th>Email</th>
                                    <th># Telefono</th>
                                    <th>Puesto</th>
                                    <th>Empresa</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Empleado> lista = (List<Empleado>) request.getAttribute("empleados");
                                    for (Empleado c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getIdEmpleado()%></td>
                                    <td><%= c.getNombreEmpleado()%></td>
                                    <td><%= c.getCorreoEmpleado()%></td>
                                    <td><%= c.getTelefonoEmpleado()%></td>
                                    <td><%= c.getPuesto()%></td>
                                    <td><%= c.getIdEmpresa()%></td>
                                    <td>
                                        <a href="empleado?accion=editar&id=<%= c.getIdEmpleado()%>" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="empleado?accion=eliminar&id=<%= c.getIdEmpleado()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id</th>
                            <th>Nombres</th>
                            <th>Email</th>
                            <th># Telefono</th>
                            <th>Puesto</th>
                            <th>Empresa</th>
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
                                text: 'Empleado <%= mensaje%> correctamente!'
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
                <h2>Registrar Nuevo Empleado</h2><br>
                <form method="post" action="empleado">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre_empleado" placeholder="Nombres completos"  required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="correo_empleado" placeholder="Email"   required />
                    </div>
                    <div class="form-group">
                        <label>Numero Telefono</label>
                        <input type="text" class="form-control" name="telefono_empleado"  placeholder="Nro. Telefono"   required />
                    </div>
                    <div class="form-group">
                        <label>#Puesto</label>
                        <select name="puesto" class="form-control"  required >
                            <option value="">Seleccionar</option>
                            <option value="Analista">Analista</option>
                            <option value="Desarrollador">Desarrollador</option>
                            <option value="CEO">CEO</option>
                            <option value="Coordinador">Coordinador</option>
                            <option value="Admin">Admin</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label>Empresa</label>
                        <!-- <input type="text" class="form-control" name="id_empresa" placeholder="Empresa"   required /> -->
                        <select name="id_empresa" id="id_empresa"  class="form-control">
                            <option value="">Seleccione una empresa</option>
                            <c:forEach var="empresa" items="${empresas}">
                                <option value="${empresa.id_empresa}">${empresa.razonSocial}</option>
                            </c:forEach>
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