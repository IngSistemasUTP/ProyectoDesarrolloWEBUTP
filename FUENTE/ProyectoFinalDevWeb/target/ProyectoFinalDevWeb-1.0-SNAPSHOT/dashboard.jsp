<%@ include file="include/header.jsp" %>
    <div class="notika-status-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                        <div class="website-traffic-ctn">
                            <h2><span class="counter">12344</span></h2>
                            <p>Total Clientes</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/public/img/customer-review.png" width="60" height="50" />
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                        <div class="website-traffic-ctn">
                            <h2><span class="counter">122020</span></h2>
                            <p>Total Ticket's Abiertos</p>
                        </div>
                       <img src="${pageContext.request.contextPath}/public/img/ticket-de-suporte.png" width="60" height="50" />
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30 dk-res-mg-t-30">
                        <div class="website-traffic-ctn">
                           <h2><span class="counter">122020</span></h2>
                            <p>Incidentes en el mes</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/public/img/alerta.png" width="60" height="50" />
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30 dk-res-mg-t-30">
                        <div class="website-traffic-ctn">
                            <h2><span class="counter">1,000</span></h2>
                            <p>Total Usuarios</p>
                        </div>
                     <img src="${pageContext.request.contextPath}/public/img/user-interface.png" width="60" height="50" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Status area-->
    <!-- Start Sale Statistic area-->
    <div class="sale-statistic-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="sale-statistic-inner notika-shadow mg-tb-30">
                        <div class="curved-inner-pro">
                            <div class="curved-ctn">
                                <h2>Vision 360 de los incidentes en el año actual</h2>
                                <p>Proximamente las informaciones estaran disponibles aqui.</p>
                            </div>
                        </div>
                        <div id="curved-line-chart" class="flot-chart-sts flot-chart"></div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
   
    <%@ include file="include/footer.jsp" %>