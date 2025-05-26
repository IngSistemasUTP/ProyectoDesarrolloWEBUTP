<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.Cliente" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    Cliente categoriaEditar = (Cliente) request.getAttribute("cliente");
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
            <form method="post" action="cliente">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Actualizar Cliente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= categoriaEditar.getId_cliente()%>">
                    <div class="form-group">
                        <label>RUC</label>
                        <input type="text" class="form-control" name="ruc" value="<%= categoriaEditar.getRuc()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Razon Social</label>
                        <input type="text" class="form-control" name="nombre_empresa_cliente" value="<%= categoriaEditar.getNombre_empresa_cliente()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Tipo de Cliente</label>
                        <input type="text" class="form-control" name="tipo_cliente" value="<%= categoriaEditar.getTipo_cliente()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Empresa</label>
                        <input type="text" class="form-control" name="id_empresa" value="<%= categoriaEditar.getId_empresa()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Sistema</label>
                        <input type="text" class="form-control" name="id_sistema" value="<%= categoriaEditar.getId_sistema()%>" required />
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
                        <h2>Maestro de Clientes</h2>
                        <p>Informacion de los clientes de la empresa 123digit@l!</p>
                    </div>
                    <div class="table-responsive">



                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear Nuevo Cliente</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id</th>
                                    <th>Nro. Documento</th>
                                    <th>Nombre Comercial</th>
                                    <th>Tipo Cliente</th>
                                    <th>Empresa</th>
                                    <th>Sistema</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Cliente> lista = (List<Cliente>) request.getAttribute("clientes");
                                    for (Cliente c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getId_cliente()%></td>
                                    <td><%= c.getRuc()%></td>
                                    <td><%= c.getNombre_empresa_cliente()%></td>
                                    <td><%= c.getTipo_cliente()%></td>
                                    <td><%= c.getId_empresa()%></td>
                                    <td><%= c.getId_sistema()%></td>
                                    <td>
                                        <a href="cliente?accion=editar&id=<%= c.getId_cliente()%>" class="btn btn-success" ><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="cliente?accion=eliminar&id=<%= c.getId_cliente()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id</th>
                            <th>Nro. Documento</th>
                            <th>Nombre Comercial</th>
                            <th>Tipo Cliente</th>
                            <th>Empresa</th>
                            <th>Sistema</th>
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
                                text: 'Cliente <%= mensaje%> correctamente!'
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
                <h2>Crear Nuevo Cliente</h2><br>
                <form method="post" action="cliente">
                    <div class="form-group">
                        <label>Nro. Documento</label>
                        <input type="text" class="form-control" name="ruc" required />
                    </div>
                    <div class="form-group">
                        <label>Nombre Comercial</label>
                        <input type="text" class="form-control" name="nombre_empresa_cliente"required />
                    </div>
                    <div class="form-group">
                        <label>Tipo Cliente</label>
                        <!--  <input type="text" class="form-control" name="tipo_cliente"  required />-->
                        <select name="tipo_cliente" id="tipo_cliente" class="form-control" required>
                            <option value="">Seleccione Tipo de Cliente:</option>
                            <option value="Persona Juridica">Persona Juridica</option>
                            <option value="Persona Natural">Persona Natural</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Empresa</label>
                        <!--   <input type="text" class="form-control" name="id_empresa"  required /> -->
                        <select name="id_empresa" id="id_empresa"  class="form-control">
                            <option value="">Seleccione una empresa</option>
                            <c:forEach var="empresa" items="${empresas}">
                                <option value="${empresa.id_empresa}">${empresa.razonSocial}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Sistema</label>
                        <!-- <input type="text" class="form-control" name="id_sistema"  required /> -->
                        <select name="id_sistema" id="id_sistema"  class="form-control">
                            <option value="">Seleccione un Sistema</option>
                            <c:forEach var="sistema" items="${sistemas}">
                                <option value="${sistema.id_sistema}">${sistema.nombre_sistema}</option>
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