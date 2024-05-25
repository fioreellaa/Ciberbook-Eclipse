<%@page import="util.MySQLConexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.ciberbook.libros.*" %>
<%@ page import="java.sql.*, util.*"  %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">

	<title>Libro | Nuevo</title>
	<link rel="stylesheet" href="css/user.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	
	<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="o/favicon.ico" type="image/x-icon">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	
	<style>
		.img-preview {
		  width: 200px;
		}
	</style>
	</head>
	<body>
	
	
		<!-- header -->
  		<%@ include file="includes/nav.jsp"%>
	    <!-- fin header -->
	   <!-- Contenido -->
	   <div class="contenedor row" style="padding: 5% 10%; margin:0;">
	   		<h3>Nuevo libro</h3><br><br>
	   		<section class="col-md-9" >
	   			<form class="new-book " id="new-book" method="GET" action="LibrosController">
				<input type="hidden" name="command" value="add">
	   			
	   			<div class="col-md-9">		

					<label class="form-label col-md-2" for="book-id">Id</label>	
					<input class="form-text col-md-4" type="text" name="book-id" id="book-id" readonly >
					
					<br>
					
					<label class="form-label col-md-2" for="book-tittle">Titulo del libro</label>	
					<input class="form-text col-md-4" type="text" name="book-tittle" id="book-tittle"  required>
					
					<br>
					
					<div class="row">
				    	<label class="form-label col-md-2" for="book-autor">Autor</label>
					    <div class="col-md-6">
					        <select class="form-select"  name="book-autor" required>
					            <% Connection con = MySQLConexion.getConnection();
					               String sql = "CALL LISTAR_AUTORES";
					               PreparedStatement ps = con.prepareStatement(sql);
					               ResultSet rs = ps.executeQuery();
					               while(rs.next()) { %>
					               <option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
					               <% } %>
					        </select>
					    </div>
						<div class="col-md-4">
						   <button class="btn btn-outline-info" style="height:100%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAutor">
  									Nuevo
							</button>
						   <button class="btn btn-outline-secondary" style="height:100%" type="button" onclick="recargar()">Actualizar</button>
						</div>
					</div>
					<br>
					
					<label class="form-label col-md-2" for="book-isbn">ISBN</label>	
					<input class="form-text col-md-4" type="text" name="book-isbn" id="book-isbn"  required>
					
					<br>
					
					<label class="form-label col-md-2" for="book-year">Año</label>	
					<input class="form-text col-md-4" type="text" name="book-year" id="book-year">
					
					<br>
					
					<div class="row">
						<label class="form-label col-md-2">Categoría</label>
						<div class="col-md-6">
							<select class="form-select" name="book-category" required>
							<% 
								String sql2 = "CALL LISTAR_CATEGORIAS";
								PreparedStatement ps2 = con.prepareStatement(sql2);
								ResultSet rs2 = ps2.executeQuery();
								
		                		while(rs2.next()){ 
							%>
								<option value="<%= rs2.getString(1) %>"><%= rs2.getString(2) %></option>
							<% } %>
							</select>
						</div>	
						<div class="col-md-4">
							<button class="btn btn-outline-info" style="height:100%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCategoria">
	  							Nuevo
							</button>
							<button class="btn btn-outline-secondary" style="height:100%" type="button" onclick="recargar()" >Actualizar</button>
						</div>
					</div>
					
					<br>
				
					<label class="form-label col-md-2" for="book-price">Precio</label>
					<input class="form-text col-md-4" type="number" name="book-price" id="book-price" min="0" step="0.01" required>
				
					<br>
				
					<label class="form-label col-md-2" for="book-stock">Cantidad</label>
					<input class="form-text col-md-4" type="number" name="book-stock" id="book-stock" min="0"  required>
				
					<br>
				
					<label class="form-label col-md-2" for="book-image">Seleccione la portada</label>
					<input class="col-md-5"
						   type="file" 
						   id="book-image"
						   name="book-imgeage[]"
						   accept="image/png, image/jpeg"
						   multiple
						   onchange="previewImages(event)">
	
					<br>
				
					<label class="form-label col-md-2" for="book-description">Descripción</label>	
					<textarea class="form-text col-md-7" rows="10" name="book-description" id="book-description" required></textarea>
				
					<br>
				</div>
	   			<div class="col-md-2">
	   				<input class="btn btn-outline-success me-2" type="submit" name="grabar" id="grabar" value="Grabar">
					<input class="btn btn-outline-danger me-2" type="reset" name="borrar" id="borrar" value="Reestablecer">
	   			</div>
	   			
	  			</form>	
	  			<!-- Modal Autor-->	
				<div class="modal fade" id="modalAutor" tabindex="-1" aria-labelledby="modalAutoor" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="autorModal">Autor</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
					    <div class="modal-body">
					    <!--   <form id="formModal" action="LibrosController" method="get">
					    <input type="hidden" name="command" value="addAutor">
					        -->
					   	<label class="form-label col-md-4" for="book-aautor-id">Id Autor</label>	
						<input class="form-text col-md-4" type="text" name="book-aautor-id" id="book-aautor-id" required>
											
						<br>
												
						<label class="form-label col-md-4" for="book-aautor-name">Nombre</label>	
						<input class="form-text col-md-4" type="text" name="book-aautor-name" id="book-aautor-name">
							
						<br>
									
						<label class="form-label col-md-4" for="book-aautor-lastname">Apellido</label>	
						<input class="form-text col-md-4" type="text" name="book-aautor-lastname" id="book-aautor-lastname">
												
						<br>
						<div class="modal-footer">
						<!-- Enviar mediante JavaScript -->
						<button class="btn btn-outline-info" type="button" onclick="enviarFormularioModal()">Enviar</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
											
				<!--  </form> -->
					</div>
				</div>
			</div>
			</div>
				<!-- Fin modal -->
				
				<!-- Modal Categoria-->	
				<div class="modal fade" id="modalCategoria" tabindex="-1" aria-labelledby="modalCategoria" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="autorModal">Género</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      	</div>
					    	<div class="modal-body">
					    
							   	<label class="form-label col-md-4" for="book-cate-id">Id Genero</label>	
								<input class="form-text col-md-4" type="text" name="book-cate-id" id="book-cate-id" required>
													
								<br>
														
								<label class="form-label col-md-4" for="book-cate-name">Nombre</label>	
								<input class="form-text col-md-4" type="text" name="book-cate-name" id="book-cate-name">
									
								<br>
											
													
								<br>
								<div class="modal-footer">
								<!-- Enviar mediante JavaScript -->
								<button class="btn btn-outline-info" type="button" onclick="enviarFormularioModal2()">Enviar</button>
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
							</div>
							</div>
						</div>
					</div>
					</div>
				<!-- Fin modal -->
	  		</section>
	  		<aside class="col-md-3">
	  			<center>
	  			<button class="btn btn-outline-warning me-2" onclick="location.href='LibrosController'">Listado</button>
	  			<br> <br>	
	  				<h4>Aquí se mostrará la vista previa de la portada</h4>
	  				<div style="text-aling:center;" class="preview-container" id="preview-container" style=" display:flex;"></div>
	  			</center>
	  		</aside>
	   		</div>
	   	
	   
	   <!-- Fin contenido --> 
	</body>

<script src="js/libro.js"></script>
<script> 
function previewImages(event) {
	  let input = event.target;
	  let previewContainer = document.getElementById('preview-container');
	  previewContainer.innerHTML = ''; 

	  if (input.files && input.files.length > 0) {
	    for (let i = 0; i < input.files.length; i++) {
	      let reader = new FileReader();
	      let img = document.createElement('img');
	      img.className = 'img-preview';

	      reader.onload = (function(image) {
	        return function(e) {
	          image.src = e.target.result;
	        };
	      })(img);

	      reader.readAsDataURL(input.files[i]);
	      previewContainer.appendChild(img);
	    }
	  }
	}
	</script>
</html>