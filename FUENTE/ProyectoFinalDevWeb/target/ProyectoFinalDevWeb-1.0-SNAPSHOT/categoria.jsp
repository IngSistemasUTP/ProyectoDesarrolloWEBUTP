<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.utp.edu.pe.proyectofinaldevweb.model.Categoria" %>
<%@ page import="java.util.List" %>

<!-- Modal Editar categoria -->
<%
    Categoria categoriaEditar = (Categoria) request.getAttribute("categoria");
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
            <form method="post" action="categoria">
                <div class="modal-header">
                    <h5 class="modal-title" id="editarModalLabel">Editar Categoría</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="<%= categoriaEditar.getId_categoria()%>">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" class="form-control" name="nombre" value="<%= categoriaEditar.getNombre_categoria()%>" required />
                    </div>
                    <div class="form-group">
                        <label>Descripción</label>
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
                        <h2>Maestro de Categorias de Reporte de Incidentes</h2>
                        <p>Categorias de reportes de incidentes y/o requerimientos.</p>
                    </div>
                    <div class="table-responsive">



                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear Nueva Categoria</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Categoria> lista = (List<Categoria>) request.getAttribute("categorias");
                                    for (Categoria c : lista) {
                                %>
                                <tr>
                                    <td><%= c.getId_categoria()%></td>
                                    <td><%= c.getNombre_categoria()%></td>
                                    <td><%= c.getDescripcion()%></td>
                                    <td>
                                        <a href="categoria?accion=editar&id=<%= c.getId_categoria()%>" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i>Editar</a>
                                        <a href="categoria?accion=eliminar&id=<%= c.getId_categoria()%>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id</th>
                            <th>Nombre</th>
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
                                text: 'Categoría <%= mensaje%> correctamente!'
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
                <h2>Crear Nueva Categoria</h2><br>
                <form method="post" action="categoria">
                    <label>Nombre de la Categoria:</label>
                    <input type="text" name="nombre"  class="form-control" placeholder="Nombre" required />
                    <label>Descripcion de la categoria:</label>
                    <input type="text" name="descripcion" class="form-control" placeholder="Descripción" required />
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