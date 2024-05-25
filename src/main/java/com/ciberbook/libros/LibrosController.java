package com.ciberbook.libros;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.ciberbook.autor.Autor;
import com.ciberbook.genero.Categoria;

@MultipartConfig
/**
 * Servlet implementation class LibrosController
 */

public class LibrosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String pathFile = "C:\\no borrar - fiorella\\ECLIPSE\\CIBERBOOK\\src\\main\\webapp\\img\\";
	private File upload = new File(pathFile);
	
	private LibrosDAO bookdao;
    
	public void init() throws ServletException {
		super.init();
		
		try {
			bookdao  = new LibrosDAO();
		}catch (Exception e) {
			throw new ServletException(e);
		}
		
	}
	
	private String guardarFile(Part part, File pathUpload) {
		String pathAbsolute = "";
		try {
			Path path = Paths.get(part.getSubmittedFileName());
			String filename = path.getFileName().toString();
			InputStream input = part.getInputStream();
			
			if(input != null) {
				File file = new File(pathUpload, filename);
				pathAbsolute = file.getAbsolutePath();
				Files.copy(input, file.toPath());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return pathAbsolute;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("command");
		
		if(cmd == null) cmd = "list";
		
		switch(cmd) {
		case "list":
			try {
				obtenerLibros(request, response);
			} catch (ServletException | IOException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "filtrar":
			try {
				filtrarBusqueda(request, response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		case "add":
			try {
				agregarLibro(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "cargar":
			try {
				cargar(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "update":
			try {
				actualizarLibro(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "delete":
			try {
				eliminarLibro(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		
		default :
			try {
				obtenerLibros(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void filtrarBusqueda(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int valor = Integer.parseInt(request.getParameter("searchby"));
		String cadena = request.getParameter("entrada");
		
		bookdao.filtrar(valor, cadena);
		
		List<Libros> bookiesById = bookdao.getLibrosById(cadena);
		
		request.setAttribute("LISTA_LIBROS_ID", bookiesById);

		RequestDispatcher dispatcher = request.getRequestDispatcher("Lista_libros.jsp");
		dispatcher.forward(request, response);
	}

	private void eliminarLibro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String idBook = request.getParameter("IdBook");
		
		bookdao.deleteBookie(idBook);
		request.setAttribute("msg", "Se eliminó el libro con id ");
		request.setAttribute("idd", idBook);
		obtenerLibros(request, response);
	}

	private void actualizarLibro(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
		String id = request.getParameter("book-id");
		String titulo = request.getParameter("book-tittle");
		String autor = request.getParameter("book-autor");
		String isbn = request.getParameter("book-isbn");
		int anio = Integer.parseInt(request.getParameter("book-year"));
		String genero = request.getParameter("book-category");
		double precio = Double.parseDouble(request.getParameter("book-price"));
		int stock = Integer.parseInt(request.getParameter("book-stock"));
		String descripcion = request.getParameter("book-description");
		String imagen = request.getParameter("book-image");
		
		
		/*
		Part part = request.getPart("book-image");
		
		if(part == null) {
			System.out.println("no imagen");
			return;
		}

		String image = guardarFile(part, upload);		*/
		
		Libros updtBook = new Libros(id, titulo, autor,descripcion, isbn, anio, genero, precio, stock, imagen);
		
		bookdao.updateLibro(updtBook);

		response.sendRedirect("LibrosController");
	}

	private void cargar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String idBook = request.getParameter("IdLibro");
		//String idGen = request.getParameter("idCategoria");

		Libros bookie  = bookdao.getLibro(idBook);
		
		request.setAttribute("bookupdate", bookie);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("update_libro.jsp");
		dispatcher.forward(request, response);
	}

	private void agregarLibro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//String id = request.getParameter("book-id");
		String titulo = request.getParameter("book-tittle");
		String autor = request.getParameter("book-autor");
		String isbn = request.getParameter("book-isbn");
		int anio = Integer.parseInt(request.getParameter("book-year"));
		String genero = request.getParameter("book-category");
		double precio = Double.parseDouble(request.getParameter("book-price"));
		int stock = Integer.parseInt(request.getParameter("book-stock"));
		String descripcion = request.getParameter("book-description");
		String imagen = request.getParameter("book-image");
		
		String imgg = null;

		if (imagen != null && !imagen.isEmpty()) {
		    Path ruta = Paths.get("src/main/webapp/img");
		    String rutaAdd = ruta.toFile().getAbsolutePath();

		   
		    imgg = Paths.get(imagen).getFileName().toString();

		    try {
		      
		        byte[] img = Files.readAllBytes(Paths.get(imagen));
		        Path rutaCompleta = Paths.get(rutaAdd, imgg);
		        Files.write(rutaCompleta, img);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		}

		Libros newBook = new Libros(titulo, autor, descripcion, isbn, anio, genero, precio, stock, imagen);
		bookdao.addLibro(newBook);
       
		
		response.sendRedirect("LibrosController");
	}

	
	private void obtenerLibros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<Libros> bookies = bookdao.getLibros();
		
		request.setAttribute("LISTA_LIBROS", bookies);

		RequestDispatcher dispatcher = request.getRequestDispatcher("Lista_libros.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("command");
		
	switch(cmd) {
	case "addAutor":
		try {
			agregarAutor(request, response);
		}catch (Exception e){
			e.printStackTrace();
		}
		break;
	case "addCate":
		agregarCategoria(request, response);
	}
	}

	private void agregarCategoria(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("CodC");
		String nomm = request.getParameter("NomC");
		
		Categoria newCate = new Categoria(id, nomm);
		
		bookdao.addCategoria(newCate);
	}

	private void agregarAutor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String cod = request.getParameter("CodA");
		String nom = request.getParameter("NomA");
		String ape = request.getParameter("ApeA");
		
		Autor newAutor = new Autor(cod, nom, ape);
		
		bookdao.addAautor(newAutor);
	}
}
