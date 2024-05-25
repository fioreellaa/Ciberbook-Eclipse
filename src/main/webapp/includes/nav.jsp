<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.ciberbook.libros.*, com.ciberbook.usuario.*" %>
	<% Usuario auth = (Usuario) request.getSession().getAttribute("auth"); 
		
    	if (auth != null) {
    		request.setAttribute("auth", auth);
		  }
    	%>
		<!-- header -->
  		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">
		    	<img alt="Ciberbook" src="img/logo.png" style="border-radius:50%; height: auto; width:60%">
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		   
		    
		      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 " >
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="UsuarioController?command=list">Home</a>
		        </li>
		        <%
		        UsuarioDAO udao = new UsuarioDAO();
		        String correoo = (String) request.getSession().getAttribute("correo");
			    String tipo = udao.getUsuarioTipo(correoo);
		        	
		        	if("ADMINISTRADOR".equals(tipo)) {
				%>
				<li class="nav-item">
		          <a class="nav-link active"  href="#">Gestion de ventas</a>
		        </li>
		        <%
		        	}
		        %>
		        <li class="nav-item">
		          <a class="nav-link active"  href="#">Gestion de Solicitudes</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">Pedidos</a>
		        </li>
		        <li class="nav-item dropdown" >
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-bs-auto-close="true" type="button" data-bs-toggle="dropdown"  aria-expanded="false">
		            Mantenimiento
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="LibrosController"><i class="fa-solid fa-book-blank" style="color: #ac7e3e;"></i> Libros</a></li>
		            <li><a class="dropdown-item" href="#">Categorias</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="#">Autor</a></li>
		          </ul>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="UsuarioController?command=logOut"><i class="fa-solid fa-right-from-bracket" style="color: #000000;"></i> Cerrar Sesion</a>
		        </li>
		      </ul>
		    
		    </div>
		  </div>
		</nav>
		
<script>
$('.dropdown-toggle').dropdown()

 $(document).on('click', function (e) {
    // Cerrar el menú si se hace clic fuera de él
    if (!$(e.target).closest('.dropdown').length) {
      $('.dropdown-menu').removeClass('show');
    }
  });

  // Evitar que se cierre el menú al hacer clic dentro de él
  $('.dropdown').on('click', function (e) {
    e.stopPropagation();
  });
</script>