<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.ciberbook.libros.*, com.ciberbook.usuario.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<%
		List<Usuario> lisUsers=(List<Usuario>) request.getAttribute("LISTA_USUARIOS");
	%>
	<title>Home</title>
	<link rel="stylesheet" href="css/user.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="o/favicon.ico" type="image/x-icon">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">

	</style>
	</head>
	<body>
	
		<!-- header -->
  		<%@ include file="includes/nav.jsp"%>
	    <!-- fin header -->
	    
				 <!-- Contenido -->
				   <div class="contenedor" style="padding: 50px">
				   		<section>
				   			<div >
				   				<h4>Mantenimiento Usuario</h4>
				   				<form class="d-flex" style="margin: 20px 0; margin-right:50%">
				   				
					        		<input class="form-control me-2" id="searchie" type="search" placeholder="Search" aria-label="Search">
					        		<button class="btn btn-outline-success me-2" id="btnSearch" >Search</button>
					      		</form>  		
								<table class="table tabla">
								  <thead>
								    <tr>
								      <th class="col-md-1" scope="col">Id</th>
								      <th class="col-md-1" scope="col">Nombre</th>
								      <th class="col-md-1" scope="col">Apellido</th>
								      <th class="col-md-1" scope="col">DNI</th>
								      <th class="col-md-1" scope="col">Telefono</th>
								      <th class="col-md-2" scope="col">Correo</th>
								      <th class="col-md-2" scope="col">Tipo</th>
								      <th class="col-md-2" scope="col">Estado</th>
								      <th class="col-md-1" scope="col"></th>
								      <th class="col-md-1" scope="col"></th>
								      <th class="col-md-2" scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								  	<% 
							        if (lisUsers != null && ! lisUsers.isEmpty()) { 
							            for (Usuario tempUsers : lisUsers) {
							        %>
							        <tr>
							            <th class="user" ><%= tempUsers.getIdUsuario() %></th>
							            <td class="user" ><%= tempUsers.getNombre() %></td>
							            <td class="user" ><%= tempUsers.getApellido() %></td>
							            <td class="user" ><%= tempUsers.getDni() %></td>
							            <td class="user" ><%= tempUsers.getTelefono() %></td>
							            <td class="user" ><%= tempUsers.getCorreo() %></td>
							            <td class="user" ><%= tempUsers.getTipo() %></td>
							            <td class="user" ><%= tempUsers.getEstado() %></td>
							            <td><a class="btn btn-info" style="height:auto;" href="#">Actualizar</a></td>
							            <td><a class="btn btn-danger" style="height:auto;" href="#">Eliminar</a></td>
							            <td></td>
							        </tr>
							        <% 
							            } 
							        } else { 
							        %>
							        <tr>
							            <td colspan="9">No hay usuarios disponibles</td>
							        </tr>
							        <% } %>
								  </tbody>
								</table>   			
				   			</div>
				   		</section>
				  
				   		</div>
		   	
		   
		   <!-- Fin contenido --> 
				 
	
	    
	   <script src="js/search.js"></script>
	   
	</body>
</html>
