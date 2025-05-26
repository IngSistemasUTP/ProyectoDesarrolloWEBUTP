<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.Empresa" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    Empresa categoriaEditar = (Empresa) request.getAttribute("empresa");
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
            <form method="post" action="empresa">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Actualizar Empresa</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= categoriaEditar.getId_empresa()%>">
                    <div class="form-group">
                        <label>RUC</label>
                        <input type="text" class="form-control" name="ruc" value="<%= categoriaEditar.getRuc()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Razon Social</label>
                        <input type="text" class="form-control" name="razon_social" value="<%= categoriaEditar.getRazonSocial()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Direccion</label>
                        <input type="text" class="form-control" name="direccion" value="<%= categoriaEditar.getDireccion()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" class="form-control" name="telefono" value="<%= categoriaEditar.getTelefono()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="correo" value="<%= categoriaEditar.getCorreo()%>" required />
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
                        <h2>Maestro de Empresas de Desarrollo de Software</h2>
                        <p>Informacion fiscal de 123digit@l! y subsidiarias.</p>
                    </div>
                    <div class="table-responsive">



                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear Nueva Empresa</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id</th>
                                    <th>Ruc</th>
                                    <th>Razon Social</th>
                                    <th>Direccion</th>
                                    <th>Telefono</th>
                                    <th>Correo</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Empresa> lista = (List<Empresa>) request.getAttribute("empresas");
                                    for (Empresa c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getId_empresa()%></td>
                                    <td><%= c.getRuc()%></td>
                                    <td><%= c.getRazonSocial()%></td>
                                    <td><%= c.getDireccion()%></td>
                                    <td><%= c.getTelefono()%></td>
                                    <td><%= c.getCorreo()%></td>
                                    <td>
                                        <a href="empresa?accion=editar&id=<%= c.getId_empresa()%>" class="btn btn-success" disabled><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="empresa?accion=eliminar&id=<%= c.getId_empresa()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id</th>
                            <th>Ruc</th>
                            <th>Razon Social</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Correo</th>
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
                                text: 'Empresa <%= mensaje%> correctamente!'
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
                <h2>Crear Nueva Empresa</h2><br>
                <form method="post" action="empresa">
                    <div class="form-group">
                        <label>RUC</label>
                        <input type="text" class="form-control" name="ruc"  required />
                    </div>
                    <div class="form-group">
                        <label>Razon Social</label>
                        <input type="text" class="form-control" name="razon_social"required />
                    </div>
                    <div class="form-group">
                        <label>Direccion</label>
                        <input type="text" class="form-control" name="direccion"  required />
                    </div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" class="form-control" name="telefono"  required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="correo"  required />
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