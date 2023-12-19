
<%@page import="modelo.Usuario"%>
<%@page import="controlador.LoginServlet"%>
<%@page import="dao.ArticulosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Articulo"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>Articulos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../otros/style.css">
</head>


<img id="fondo" src="../img/logo.png">


<header>

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top" id="nav1">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Sublime Supplies</a>
            <!-- boton carrito -->
            <button id="listaInteres" type="button" class="btn btn-dark btn-sm">Ver carrito
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
            </button>
            <!-- total nav de carrito -->
            <div id="totalCarritoNavb" class="text-bg-dark">$ 0.00</div>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                <div class="offcanvas-header">
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close">
                    </button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link " aria-current="page" href="index.html">Inicio</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="tienda.html">Tienda</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link" href="contacto.html">Contacto</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                LISTAS DE PRECIOS
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark">
                                <li><a class="dropdown-item"
                                       href="https://docs.google.com/spreadsheets/d/1w_hsYMt6A3x2Ifzj4hEV-BUbPwA2RiMH/edit?usp=drive_link&ouid=101203030641581564462&rtpof=true&sd=true" target="_blank">Lista de insumos</a></li>
                                <li><a class="dropdown-item" href="https://drive.google.com/file/d/1XXb7YNY9to02aB-IX_B4SIPUElDXinAs/view?usp=drive_link"target="_blank">Catalogo maquinas</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item active" href="mobiliarios.html">Mobiliarios</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</nav>
</header>
<main>
    <div class="tarjetas">
        <div class="row">
            <div class="col">
                <section>
                    <b>
                        <h1>Sublime Supplies</h1>
                    </b>
                    <h4>Insumos para tatuadores</h4>
                    <br>
                    <h2>Mobiliarios</h2>
                    <!-- etiquetas del alert -->
                    <div id="alertAgrego" class="alert alert-success fade hide" role="alert">
                        <strong id="alertTit"></strong>
                        <div id="alertSuceso"></div>
                    </div>

            </div>

        </div>
        <!-- necesito agregar class display none -->
        <div class="offcanvas offcanvas-start hide text-bg-dark" tabindex="-1" id="offcanvasDark" aria-labelledby="offcanvasDarkLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasDarkLabel">Carrito de productos</h5>
                <div id="whats"></div>
                <button id="cerrarCanvas" type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvasDark" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="container">
                    <P id="precioTotal" style="text-align: start;">PRECIO TOTAL: $</P>
                    <div class="row">
                        <div class="col-3">
                            <div class="card">
                                <p>Cant.</p>
                                <div id="aca3">
                                    <p id="interes3"></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card">
                                <p>PRODUCTOS</p>
                                <div id="aca">
                                    <p id="interes" style="cursor: pointer">

                                    </p>
                                </div>

                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <p>PRECIOS</p>
                                <div id="aca2">
                                    <p id="interes2"></p>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p>Precione en el item para eliminarlo</p>
                            <br><br><br>
                            <p>PROXIMAMENTE API MERCADOPAGO Y DATABASE</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

</main>






    
        


               <%
    ArticulosDAO articulosDAO = new ArticulosDAO();
    List<Articulo> articulos = articulosDAO.obtenerTodos();

    if (articulos != null && !articulos.isEmpty()) {
        for (int i = 0; i < articulos.size(); i += 3) {
%>
<div class="tarjetas container">
    <div class="row justify-content-center esteSi">
        <% for (int j = i; j < i + 3 && j < articulos.size(); j++) {
            Articulo articulo = articulos.get(j);
        %>
        <div class="col-sm-6 col-md-6 col-lg-4">
            <div class="card-group tarjetas2">
                <div class="card">
                    <img class="card-img-top" src="<%= articulo.getImg()%>">
                    <div class="card-body">
                        <h5 class="card-title"><%= articulo.getDescripcion()%></h5>
                        <p class="card-text"><%= articulo.getMarca()%></p>
                        <p class="card-text"><small class="text-body-secondary">$<%= articulo.getVenta()%></small></p>
                        <div class="d-flex">
                            <!-- Formulario para actualizar -->
                            <form action="registroCarrito" method="post" class="mr-2">
                                <input type="hidden" name="accion" value="agregar">
                                <input type="hidden" name="id" value="<%= articulo.getArticulo()%>">
                                 <input type="hidden" name="desc" value="<%= articulo.getDescripcion()%>">
                                <input type="hidden" name="usuario" value="<%= session.getAttribute("usuario")%>">
                                <p>cantidad <input type="text" name="cantidad" value="1" style="width: 5vh">
                                <button type="submit" class="btn btn-dark inter">Agregar
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                    </svg>
                                </button></p>
                                     <input type="submit" id="btnEnviar" value="Enviar">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<% } %>
 
   
    <%
        }
    %>



    <a href="gestionArticulos.jsp" class="btn btn-success">Volver</a> 


    <footer>

        <div class="redes">

            <a id="w" href="https://wa.me/message/L5DVPFBSNYERD1" target="_blank"><img src="../img/w.png"
                                                                                       alt="WhatsApp"></a>
            <!-- 
            <a id="I" href="#i"><img src="../IMG/i.png" alt="Instagram"></a>
    
            <a id="F" href="#f"><img src="../IMG/f.png" alt="Facebook"></a> -->

        </div>

    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <!-- <script src="mejoradoconIA.js"></script> -->
    <script src="../otros/agrega.js"></script>






