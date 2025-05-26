<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>123Digit@l! | Empresa de Software</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- favicon
                    ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/public/img/java.png">
        <!-- Google Fonts
                    ============================================ -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
        <!-- Bootstrap CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap.min.css">
        <!-- Bootstrap CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font-awesome.min.css">
        <!-- owl.carousel CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/owl.transitions.css">
        <!-- meanmenu CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/meanmenu/meanmenu.min.css">
        <!-- animate CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/animate.css">
        <!-- normalize CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/normalize.css">
        <!-- mCustomScrollbar CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/scrollbar/jquery.mCustomScrollbar.min.css">
        <!-- jvectormap CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/jvectormap/jquery-jvectormap-2.0.3.css">
        <!-- notika icon CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/notika-custom-icon.css">
        <!-- wave CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/wave/waves.min.css">
        <!-- main CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
        <!-- style CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/style.css">
        <!-- responsive CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/responsive.css">
        <!-- modernizr JS
                    ============================================ -->
        <script src="${pageContext.request.contextPath}/public/js/vendor/modernizr-2.8.3.min.js"></script>

        <!-- Data Table JS
                ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/jquery.dataTables.min.css">
        <!-- libreria de mensajeria de sweet alert
                  ============================================ -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Charts JS
               ============================================ -->
        <script src="${pageContext.request.contextPath}/public/js/charts/Chart.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/charts/bar-chart.js"></script>


    </head>

    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- Start Header Top Area -->
        <div class="header-top-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="logo-area">
                            <a href="#"><img src="${pageContext.request.contextPath}/public/img/suporte-online.png" alt="" /></a>
                            <strong>Welcome:</strong> ${correoElectronico} | <strong>Fecha y hora Actual:</strong>  <%= (new java.util.Date()).toLocaleString()%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Header Top Area -->
        <!-- Mobile Menu start -->
        <div class="mobile-menu-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="mobile-menu">
                            <nav id="dropdown">
                                <ul class="mobile-menu-nav">
                                    <li><a data-toggle="collapse" data-target="#Charts" href="#">Dashboard</a>
                                        <ul class="collapse dropdown-header-top">
                                            <li><a href="dashboard.jsp">Dashboard</a></li>

                                        </ul>
                                    </li>


                                    <li><a data-toggle="collapse" data-target="#demolibra" href="#">Estadistica</a>
                                        <ul id="demolibra" class="collapse dropdown-header-top">
                                            <li><a href="dashboard_general.jsp">Dashboard General</a></li>
                                        </ul>
                                    </li>
                                    <li><a data-toggle="collapse" data-target="#demodepart" href="#">Reportes</a>
                                        <ul id="demodepart" class="collapse dropdown-header-top">
                                            <li><a href="report_user.jsp">Reporte de Usuarios</a></li>
                                        </ul>
                                    </li>
                                    <li><a data-toggle="collapse" data-target="#demo" href="#">Mantenimiento</a>
                                        <ul id="demo" class="collapse dropdown-header-top">
                                            <li><a href="sistema">Crear Sistema</a></li>
                                            <li><a href="empleado">Crear Colaborador</a>
                                            </li>
                                            <li><a href="categoria">Crear Categoria</a>
                                            </li>
                                            <li><a href="empresa">Crear Empresa</a>
                                            </li>
                                            <li><a href="cliente">Crear Cliente</a>
                                            </li>
                                            <li><a href="usuario">Crear Usuario</a>
                                            </li>
                                            <li><a href="ticket">Crear Ticket</a>
                                            </li>
                                             <li><a href="historialticket">Crear Historial Ticket</a>
                                    </li>
                                        </ul>
                                    </li>

                                    <li><a data-toggle="collapse" data-target="#Pagemob" href="#">Cerrar Sesion</a>
                                        <ul id="Pagemob" class="collapse dropdown-header-top">

                                            <li><a href="logout">Cerrar Sesion</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Mobile Menu end -->
        <!-- Main Menu area start-->
        <div class="main-menu-area mg-tb-40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                            <li class="active"><a data-toggle="tab" href="#Home"><i class="notika-icon notika-house"></i> Home</a>
                            </li>

                            <li><a data-toggle="tab" href="#Charts"><i class="notika-icon notika-bar-chart"></i>Estadisticas</a>
                            </li>
                            <li><a data-toggle="tab" href="#Tables"><i class="notika-icon notika-windows"></i>Reportes</a>
                            </li>
                            <li><a data-toggle="tab" href="#Forms"><i class="notika-icon notika-form"></i>Mantenimiento</a>
                            </li>
                            <li><a data-toggle="tab" href="#Page"><i class="notika-icon notika-support"></i>Salir</a>
                            </li>
                        </ul>
                        <div class="tab-content custom-menu-content">
                            <div id="Home" class="tab-pane in active notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="dashboard.jsp">Dashboard</a>
                                    </li>
                                </ul>
                            </div>

                            <div id="Charts" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="dashboard_general.jsp">Dashboard General</a>
                                    </li>
                                </ul>
                            </div>
                            <div id="Tables" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="report_user.jsp">Reporte de Usuarios</a>
                                    </li>
                                </ul>
                            </div>
                            <div id="Forms" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="sistema">Crear Sistema</a>
                                    </li>
                                    <li><a href="empleado">Crear Colaborador</a>
                                    </li>
                                    <li><a href="categoria">Crear Categoria</a> </li>
                                    <li><a href="empresa">Crear Empresa</a>
                                    </li>
                                    <li><a href="cliente">Crear Cliente</a>
                                    </li>
                                    <li><a href="usuario">Crear Usuario</a>
                                    </li>
                                    <li><a href="ticket">Crear Ticket</a>
                                    </li>
                                    <li><a href="historialticket">Crear Historial Ticket</a>
                                    </li>
                                </ul>
                            </div>

                            <div id="Page" class="tab-pane notika-tab-menu-bg animated flipInX">
                                <ul class="notika-main-menu-dropdown">
                                    <li><a href="logout">Cerrar Sesion</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Menu area End-->