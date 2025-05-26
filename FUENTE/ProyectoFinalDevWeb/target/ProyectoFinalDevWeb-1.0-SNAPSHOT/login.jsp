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
        <!-- font awesome CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font-awesome.min.css">
        <!-- owl.carousel CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/owl.transitions.css">
        <!-- animate CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/animate.css">
        <!-- normalize CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/normalize.css">
        <!-- mCustomScrollbar CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/scrollbar/jquery.mCustomScrollbar.min.css">
        <!-- wave CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/wave/waves.min.css">
        <!-- Notika icon CSS
                    ============================================ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/notika-custom-icon.css">
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

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

      
    </head>

    <body>
       
            <!--[if lt IE 8]>
                    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
                <![endif]-->
            <!-- Login Register area Start-->
            <div class="login-content">

                <!-- Login -->
                <div class="nk-block toggled" id="l-login">
                    <div class="nk-form">
                        <img src="${pageContext.request.contextPath}/public/img/java.png" width="100" height="100" />
                        <h4>Help Desk <strong>123Digit@l!</strong><br> Empresa de desarrollo de Software <h4>
                                <small><i>"Tu lo imaginas, nosostros lo desarrollamos"</i><small>
                                        <br><br>
                                        <form  action="/ProyectoFinalDevWeb/login" id="frmIniciarSesion" method="post">
                                            <div class="input-group">
                                                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
                                                <div class="nk-int-st">
                                                    <input type="email"  id="correoElectronico" name="correoElectronico"  class="form-control" placeholder="Username" required autofocus>
                                                </div>
                                            </div>
                                            <div class="input-group mg-t-15">
                                                <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-edit"></i></span>
                                                <div class="nk-int-st">
                                                    <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Password" required>
                                                </div>
                                            </div>
                                            <br>
                                            <a href="#" onclick="document.getElementById('frmIniciarSesion').submit();" class="btn btn-primary btn-user btn-block">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-sign-out-alt"></i>
                                                </span>
                                                <span class="text"> <i class="fa fa-sign-in" aria-hidden="true"></i> Iniciar Sesion</span>
                                            </a>
                                        </form>
                                        <%
                                            String mensaje = (String) request.getAttribute("mensaje");
                                            if (mensaje != null) {
                                        %>
                                        <script>
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops...',
                                                html: '<%= mensaje%>'
                                            });
                                        </script>
                                        <%
                                            }
                                        %>
                                        </div>

                                        </div>


                                        </div>
                                        <!-- Login Register area End-->
                                        <!-- jquery
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/vendor/jquery-1.12.4.min.js"></script>
                                        <!-- bootstrap JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/bootstrap.min.js"></script>
                                        <!-- wow JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/wow.min.js"></script>
                                        <!-- price-slider JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/jquery-price-slider.js"></script>
                                        <!-- owl.carousel JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/owl.carousel.min.js"></script>
                                        <!-- scrollUp JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/jquery.scrollUp.min.js"></script>
                                        <!-- meanmenu JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/meanmenu/jquery.meanmenu.js"></script>
                                        <!-- counterup JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/counterup/jquery.counterup.min.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/counterup/waypoints.min.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/counterup/counterup-active.js"></script>
                                        <!-- mCustomScrollbar JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
                                        <!-- sparkline JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/sparkline/jquery.sparkline.min.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/sparkline/sparkline-active.js"></script>
                                        <!-- flot JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/flot/jquery.flot.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/flot/jquery.flot.resize.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/flot/flot-active.js"></script>
                                        <!-- knob JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/knob/jquery.knob.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/knob/jquery.appear.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/knob/knob-active.js"></script>
                                        <!--  Chat JS
                                                    ============================================ -->
                                        <script src="js/chat/jquery.chat.js"></script>
                                        <!--  wave JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/wave/waves.min.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/wave/wave-active.js"></script>
                                        <!-- icheck JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/icheck/icheck.min.js"></script>
                                        <script src="${pageContext.request.contextPath}/public/js/icheck/icheck-active.js"></script>
                                        <!--  todo JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/todo/jquery.todo.js"></script>
                                        <!-- Login JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/login/login-action.js"></script>
                                        <!-- plugins JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/plugins.js"></script>
                                        <!-- main JS
                                                    ============================================ -->
                                        <script src="${pageContext.request.contextPath}/public/js/main.js"></script>

                                        <script src="${pageContext.request.contextPath}/public/particles/particles.min.js"></script>
                                                              
                                        </body>

                                        </html>

