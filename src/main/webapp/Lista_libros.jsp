<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.ciberbook.libros.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<%
		List<Libros> lisBooks=(List<Libros>) request.getAttribute("LISTA_LIBROS");
	%>
	<title>Libros</title>
	<link rel="stylesheet" href="css/user.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="o/favicon.ico" type="image/x-icon">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	</head>
	<body>
	
	<div class="">
		<!-- header -->
  		<%@ include file="includes/nav.jsp"%>
	    <!-- fin header -->
	   <!-- Contenido -->
	   <div class="contenedor" style="padding: 50px">
	   		<section>
	   			<div >
	   				<h4>Mantenimiento libros</h4>
	   				<form class="d-flex" style="margin: 20px 0; margin-right:50%" method="get" action="LibrosController">
	   				<input type="hidden" name="command" value="filtrar">
	   				 	<select class="form-control me-2" style="width: 25%" name="searchby">
	   				 		<option value="0" >BUSCAR POR</option>
	   				 		<option value="1">CODIGO</option>
	   				 		<option value="2">TITULO</option>
	   				 		<option value="3">AUTOR</option>
	   				 		<option value="4">ISBN</option>
	   				 		<option value="5">GENERO</option>
	   				 	</select>	
		        		<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="entrada">
		        		<button class="btn btn-outline-success me-2" type="submit">Search</button>
						<button class="btn btn-outline-warning" type="button" onclick="location.href='new_libro.jsp'">Nuevo</button>
		      		</form>  		
		      		
		      		<div class="alert alert-warning alert-dismissible fade show" role="alert">
					   ${msg} <strong>${idd}</strong> 
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"  
					    style="position: absolute; 
					     right: 10px; 
					     top: 5px; 
					     background-color: transparent;
					     border: none;
					     width: 100px;
					     font-size: 30px;">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
					
					<table class="table">
					  <thead>
					    <tr>
					      <th class="col-md-1" scope="col">Id</th>
					      <th class="col-md-2" scope="col">Título</th>
					      <th class="col-md-2" scope="col">Autor</th>
					      <th class="col-md-2" scope="col">ISBN</th>
					      <th class="col-md-1" scope="col">Genero</th>
					      <th class="col-md-1" scope="col">Precio</th>
					      <th class="col-md-1" scope="col">Stock</th>
					      <th class="col-md-1" scope="col"></th>
					      <th class="col-md-1" scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
					  	<% 
				        if (lisBooks != null && !lisBooks.isEmpty()) { 
				            for (Libros tempBooks : lisBooks) {
				        %>
				        <tr>
				            <th><%= tempBooks.getId() %></th>
				            <td><%= tempBooks.getTitulo() %></td>
				            <td><%= tempBooks.getAutor() %></td>
				            <td><%= tempBooks.getIsbn() %></td>
				            <td><%= tempBooks.getGenero() %></td>
				            <td><%= tempBooks.getPrecio() %></td>
				            <td><%= tempBooks.getStock() %></td>
				            <td><a class="btn btn-info" style="height:auto;" href="LibrosController?command=cargar&IdLibro=<%= tempBooks.getId()%>">Actualizar</a></td>
				            <td><a class="btn btn-danger" style="height:auto;" href="LibrosController?command=delete&IdBook=<%= tempBooks.getId()%>">Eliminar</a></td>
				        </tr>
				        <% 
				            } 
				        } else { 
				        %>
				        <tr>
				            <td colspan="9">No hay libros disponibles</td>
				        </tr>
				        <% } %>
					  </tbody>
					</table>   			
	   			</div>
	   		</section>
	  
	   		</div>
	   	</div>
	   
	   <!-- Fin contenido --> 
	</body>
</html>