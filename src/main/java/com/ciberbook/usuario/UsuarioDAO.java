package com.ciberbook.usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ciberbook.libros.Libros;

import util.MySQLConexion;

public class UsuarioDAO {

	public Usuario validarUsuario(String correo, String clave) {
		Usuario u = null;
		Connection con = null;	
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConnection(); 	
			
			String sql ="select * from tusuario where correo = ? and contrasena = ?";	 
			pst = con.prepareStatement(sql); 
			pst.setString(1, correo);	
			pst.setString(2, clave);
			
			rs = pst.executeQuery();	
			
			if (rs.next()) {
				
				int codigo = rs.getInt("IDUSUARIO"); 
				String mail = rs.getString("CORREO");
				String contra = rs.getString("CONTRASENA");
				String nombre = rs.getString("NOMBRE");	
				String apellido = rs.getString("APELLIDO");
				String telefono = rs.getString("TELEFONO");
				String tipo = rs.getString("TIPO");
				String dni = rs.getString("DNI");
				
				u = new Usuario(codigo, nombre, apellido, telefono, dni, mail, contra, tipo);
			}
		}catch(Exception e){
			System.out.println("Error al validar: " + e.getMessage());
		}finally {
			MySQLConexion.closeConnection(con);
		}
		return u;
	}

	public void addUsuario(Usuario newUsu) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = MySQLConexion.getConnection();
			String SQL = "insert into TUsuario (nombre, apellido, telefono, dni, correo, contrasena, tipo, estado) value (?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(SQL);
			
			ps.setString(1, newUsu.getNombre());
			ps.setString(2, newUsu.getApellido());
			ps.setString(3, newUsu.getTelefono());
			ps.setString(4, newUsu.getDni());
			ps.setString(5, newUsu.getCorreo());
			ps.setString(6, newUsu.getContrasena());
			ps.setString(7, newUsu.getTipo());
			ps.setString(8, newUsu.getEstado());
			
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public List<Usuario> getUsuarios() throws SQLException {
		List <Usuario> users = new ArrayList<>();
		
		Connection conn = null;
		Statement stt = null;
		ResultSet rs = null;
		
		conn = MySQLConexion.getConnection();
		
		String sql = "select idUsuario, nombre, apellido, dni, telefono, correo, tipo, estado from TUsuario";
		
		stt  = conn.createStatement();
		
		rs = stt.executeQuery(sql);
		
		while(rs.next()) {
			int id = rs.getInt("idUsuario");
			String nom = rs.getString("nombre");
			String ape = rs.getString("apellido");
			String dni = rs.getString("dni");
			String telef = rs.getString("telefono");
			String correo = rs.getString("correo");
			String tipo = rs.getString("tipo");
			String estado = rs.getString("estado");
			
			Usuario tempUser = new Usuario(id, nom, ape, telef, dni, correo, tipo, estado);
			users.add(tempUser);
		}
		return users;
	}

	public String getUsuarioTipo(String correo) {

		Usuario u = null;
		Connection con = null;	
		PreparedStatement pst = null;
		ResultSet rs = null;
		String tipoU = null;
		
		con = MySQLConexion.getConnection();
		
		String sql = "select * from TUSUARIO WHERE CORREO=?";
		try {
			pst = con.prepareStatement(sql); 
			pst.setString(1, correo);	
			
			
			rs = pst.executeQuery();	
			
			if (rs.next()) {
				
				int codigo = rs.getInt("IDUSUARIO"); 
				String mail = rs.getString("CORREO");
				String contra = rs.getString("CONTRASENA");
				String nombre = rs.getString("NOMBRE");	
				String apellido = rs.getString("APELLIDO");
				String telefono = rs.getString("TELEFONO");
				String tipo = rs.getString("TIPO");
				String dni = rs.getString("DNI");
				String estado = rs.getString("ESTADO");
				
				u = new Usuario(codigo, nombre, apellido, telefono, dni, mail, contra, tipo, estado);
				tipoU = tipo;
			}
		}catch(Exception e){
			System.out.println("Error al validar: " + e.getMessage());
			
		}finally {
			MySQLConexion.closeConnection(con);
		}
		return tipoU;
	}

}
