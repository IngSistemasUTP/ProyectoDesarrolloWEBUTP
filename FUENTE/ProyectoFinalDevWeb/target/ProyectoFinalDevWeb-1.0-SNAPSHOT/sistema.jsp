<%@ include file="include/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Gestión de Sitemas informaticos</h2>
                        <p>Lista de productos informaticos ofrecidos a los clientes naturales y juridicos.</p>
                    </div>
                    <div class="table-responsive">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalthree"><i class="fa fa-plus" aria-hidden="true"></i> Crear Nuevo Sistema</button>
                        <table id="data-table-basic" class="table table-striped">
                            <thead style="background-color: #33e9ff;color:#ffffff;">
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre Sitema</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="s" items="${sistemas}">
                                    <tr>
                                        <td>${s.id_sistema}</td>
                                        <td>${s.nombre_sistema}</td>
                                        <td>
                                            <a href="sistema?accion=editar&id=${s.id_sistema}" class="btn btn-success" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a> |
                                            <a href="sistema?accion=eliminar&id=${s.id_sistema}" class="btn btn-danger" ><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot style="background-color: #33e9ff;color:#ffffff;">
                            <th>Id</th>
                            <th>Nombre Sitema</th>
                            <th>Accion</th>
                            </tfoot>
                        </table>

                        <!-- SweetAlert -->
                        <c:if test="${mensaje == 'insertado'}">
                            <script>Swal.fire('¡Éxito!', 'Sistema registrado correctamente.', 'success');</script>
                        </c:if>
                        <c:if test="${mensaje == 'actualizado'}">
                            <script>Swal.fire('¡Actualizado!', 'Sistema actualizado correctamente.', 'success');</script>
                        </c:if>
                        <c:if test="${mensaje == 'eliminado'}">
                            <script>Swal.fire('¡Eliminado!', 'Sistema eliminado correctamente.', 'success');</script>
                        </c:if>
                        <c:if test="${mensaje == 'error'}">
                            <script>Swal.fire('¡Error!', 'Ocurrió un error en la operación.', 'error');</script>
                        </c:if>
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
                <h2>Crear Nuevo Sistema</h2><br>
                <form action="sistema" method="post">
                    <input type="hidden" name="id_sistema" value="${sistemaEditar.id_sistema}" />
                    <label>Nombre del Sistema:</label>
                    <input type="text" class="form-control"  name="nombre_sistema" value="${sistemaEditar.nombre_sistema}" placeholder="Ingrese el nombre del sistema" required />
                    <br><br>
                    <button type="submit"  class="btn btn-primary notika-btn-primary waves-effect">${sistemaEditar != null ? "Actualizar" : "Guardar"} <i class="fa fa-plus-circle" aria-hidden="true"></i></button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"> <i class="fa fa-times-circle" aria-hidden="true"></i> Cerrar</button>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty sistemaEditar}">
    <script>
        window.onload = function () {
            $('#modalEditarSistema').modal('show');
        }
    </script>
</c:if>

<div class="modal fade" id="modalEditarSistema" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Actualizar Sistema Central</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="sistema" method="post">
                    <input type="hidden" name="id_sistema" value="${sistemaEditar.id_sistema}" />
                    <label>Nombre del Sistema:</label>
                    <input type="text" class="form-control" name="nombre_sistema" value="${sistemaEditar.nombre_sistema}" required />
                    <br><br>
                    <button type="submit" class="btn btn-warning notika-btn-warning waves-effect">
                        Actualizar nombre del Sistema <i class="fa fa-refresh" aria-hidden="true"></i>
                    </button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">
                    <i class="fa fa-times-circle" aria-hidden="true"></i> Cerrar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Data Table area End-->
<!-- Start Footer area-->
<%@ include file="include/footer.jsp" %>