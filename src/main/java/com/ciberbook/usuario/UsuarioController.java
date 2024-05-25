package com.ciberbook.usuario;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.ciberbook.libros.Libros;

/**
 * Servlet implementation class UsuarioController
 */
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UsuarioDAO udao;
    
	public void init() throws ServletException {
		super.init();
		
		try {
			udao  = new UsuarioDAO();
		}catch (Exception e) {
			throw new ServletException(e);
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("command");
		
		if(cmd == null) {
			cmd = "login";
		}
		
		switch(cmd) {
		case "logOut":
			logOutUsuario(request, response);
			break;
		case "list":
			try {
				obtenerUsuarios(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		case "login":
			response.sendRedirect("login.jsp");
			break;
		}
	}



	private void obtenerUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		if (request.getSession().getAttribute("auth") != null) {
		    String correoo = (String) request.getSession().getAttribute("correo");
		    String tipo = udao.getUsuarioTipo(correoo);

		    if ("ADMINISTRADOR".equals(tipo)) {
		        List<Usuario> users = udao.getUsuarios();
		        request.setAttribute("LISTA_USUARIOS", users);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
		        dispatcher.forward(request, response);
		    } else {
		    	request.setAttribute("TIPO_USUARIO", tipo);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio.jsp");
	            dispatcher.forward(request, response);
		    }

		    System.out.println("Hola " + tipo);
		}

	}

	private void logOutUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getSession().getAttribute("auth") != null) {
			request.getSession().removeAttribute("auth");
		} 

		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("command");
		
		if(cmd == null) {
			cmd = "login";
		}
		
		switch(cmd) {
		case "loginUsuario":
			logUsuario(request, response);
			break;
		case "registerUsuario":
			regUsuario(request, response);
			break;
		case "login":
			response.sendRedirect("login.jsp");
			break;
		}
	}

	private void regUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String nom = request.getParameter("nombre");
		String ape = request.getParameter("apellido");
		String dni = request.getParameter("dni");
		String telefono = request.getParameter("telefono");
		String correo = request.getParameter("correo");
		String clave = request.getParameter("contrasena");
		String tipo = "USER";
		String estado = "ACTIVO";
		
		Usuario newUsu =  new Usuario(nom, ape, telefono, dni, correo, clave, tipo, estado);

		udao.addUsuario(newUsu);
		
		response.sendRedirect("Home.jsp");
	}

	private void logUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String correo = request.getParameter("correo");
		String clave = request.getParameter("contrasena");
		
		Usuario u = udao.validarUsuario(correo, clave);
		
		if (u != null) {
			request.getSession().setAttribute("auth", u);
			request.getSession().setAttribute("correo", u.getCorreo());
			response.sendRedirect("UsuarioController?command=list");
			
			String correoo = (String) request.getSession().getAttribute("correo");
			System.out.println("Usuario con correo " + correoo + " inició sesión");
		} else {
			request.setAttribute("msg", "Usuario o clave incorrecto");
			try {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	}

}
