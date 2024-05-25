package com.ciberbook.libros;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.ciberbook.autor.Autor;
import com.ciberbook.genero.Categoria;

import util.MySQLConexion;


public class LibrosDAO {

	public List<Libros> getLibros() throws SQLException {
		List <Libros> books = new ArrayList<>();
		
		Connection conn = null;
		Statement stt = null;
		ResultSet rs = null;
		
		conn = MySQLConexion.getConnection();
		
		String sql = "select L.id, L.titulo, CONCAT(a.apellido,', ', a.nombre) as AUTOR, L.partnumber, c.nomGenero, L.precio , L.stock from TLibro L "
				+ "inner join tautor a on a.codAutor = L.autor "
				+ "inner join tgenero c on c.codGenero = L.genero order by id";
		
		stt  = conn.createStatement();
		
		rs = stt.executeQuery(sql);
		
		while(rs.next()) {
			String id = rs.getString("ID");
			String titulo = rs.getString("TITULO");
			String autor = rs.getString("AUTOR");
			String isbn = rs.getString("PARTNUMBER");
			String genero = rs.getString("NOMGENERO");
			double precio = rs.getDouble("PRECIO");
			int stock = rs.getInt("STOCK");
			
			Libros tempBook = new Libros(id, titulo, autor, isbn, genero, precio, stock);
			books.add(tempBook);
		}
		return books;
	}
	
	public String obtenerIdLibro() {
		String idNext = null;
		Connection conn = null;
		Statement stt = null;
		ResultSet rs = null;
		
		try {
			conn = MySQLConexion.getConnection();
			String sql = "SELECT Id  FROM TLibro order by Id desc limit 1";
			stt = conn.createStatement();
	        rs = stt.executeQuery(sql);

	        if (rs.next()) {
	            int lastId = Integer.parseInt(rs.getString("Id"));
	            idNext = String.valueOf(lastId + 1);
	        } else {
	            idNext = "1000001";
	        }
	    } catch (SQLException e) {
	        MySQLConexion.printSQLException(e);
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stt != null) stt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            MySQLConexion.printSQLException(e);
	        }
	    }
		return idNext;
	}

	public void addLibro(Libros newBook) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = MySQLConexion.getConnection();
			String sql = "insert into TLibro (id, titulo, autor, partnumber, anioPublicacion ,genero, precio,stock, descripcion, imagen) value (?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, obtenerIdLibro());
			ps.setString(2, newBook.getTitulo());
			ps.setString(3, newBook.getAutor());
			ps.setString(4, newBook.getIsbn());
			ps.setInt(5, newBook.getAnioPublicacion());
			ps.setString(6, newBook.getGenero());
			ps.setDouble(7, newBook.getPrecio());
			ps.setInt(8, newBook.getStock());
			ps.setString(9, newBook.getDescripcion());
			ps.setString(10, newBook.getImagen());
			
			// Ejecutar
			ps.execute();

		} catch (SQLException e) {
			MySQLConexion.printSQLException(e);
		} finally {
			MySQLConexion.closeConnection(conn);
			if (ps != null)
				try { ps.close(); } catch (SQLException e) { MySQLConexion.printSQLException(e); }
		}
	}

	public Libros getLibro(String idBook) throws Exception {
		Libros book = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String id = idBook;
		try {
			conn = MySQLConexion.getConnection();
			String sql = "SELECT * FROM TLIBRO WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String idB = rs.getString("ID");
				String titulo = rs.getString("TITULO");
				String autor = rs.getString("AUTOR");
				String isbn = rs.getString("PARTNUMBER");
				int anio = rs.getInt("ANIOPUBLICACION");
				String genero = rs.getString("GENERO");
				double precio = rs.getDouble("PRECIO");
				int stock = rs.getInt("STOCK");
				String descripcion = rs.getString("DESCRIPCION");
				String imagen = rs.getString("IMAGEN");
				
				book = new Libros( idB, titulo, autor, descripcion, isbn, anio, genero, precio, stock, imagen);
			} else {
				throw new Exception("No se encontró el producto con código" + id);
			}

		} catch (SQLException e) {
			MySQLConexion.printSQLException(e);
		}
		return book;
	}
	
	

	public void updateLibro(Libros updtBook) throws SQLException {
		Connection conn =  null;
		PreparedStatement ps = null;
		
		conn = MySQLConexion.getConnection();
	 
		String sql = "UPDATE TLIBRO SET TITULO=?, AUTOR=?, PARTNUMBER=?, ANIOPUBLICACION=?, GENERO=?, PRECIO=?, STOCK=?, DESCRIPCION=?, IMAGEN=? WHERE ID=?";
	  
	  	ps = conn.prepareStatement(sql);
	  	
	  	try {
	  		ps.setString(10, updtBook.getId());
	  		ps.setString(1, updtBook.getTitulo());
			ps.setString(2, updtBook.getAutor());
			ps.setString(3, updtBook.getIsbn());
			ps.setInt(4, updtBook.getAnioPublicacion());
			ps.setString(5, updtBook.getGenero());
			ps.setDouble(6, updtBook.getPrecio());
			ps.setInt(7, updtBook.getStock());
			ps.setString(8, updtBook.getDescripcion());
			ps.setString(9,updtBook.getImagen());
			
	  	}catch(Exception e) {
	  		e.printStackTrace();
	  	}
		
	 	ps.execute();
	}

	public void addAautor(Autor newAutor) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = MySQLConexion.getConnection();
			String sql = "insert into TAutor (codAutor, nombre, apellido) value (?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, newAutor.getCodAutor());
			ps.setString(2, newAutor.getNomAutor());
			ps.setString(3, newAutor.getApeAutor());
			
			// Ejecutar
			ps.execute();

		} catch (SQLException e) {
			MySQLConexion.printSQLException(e);
		} finally {
			MySQLConexion.closeConnection(conn);
			if (ps != null)
				try { ps.close(); } catch (SQLException e) { MySQLConexion.printSQLException(e); }
		}
	}

	public void addCategoria(Categoria newCate) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = MySQLConexion.getConnection();
			String sql = "insert into TGenero (codGenero, nomGenero) value (?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, newCate.getIdCate());
			ps.setString(2, newCate.getNomCate());
			
			// Ejecutar
			ps.execute();

		} catch (SQLException e) {
			MySQLConexion.printSQLException(e);
		} finally {
			MySQLConexion.closeConnection(conn);
			if (ps != null)
				try { ps.close(); } catch (SQLException e) { MySQLConexion.printSQLException(e); }
		}
	}

	public void filtrar(int valor, String cadena) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		
		conn = MySQLConexion.getConnection();
		
		switch(valor) {
		case 0:	sql = "call buscar_por_id(?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, cadena);
				ps.execute();
				ps.close();
				break;
		}
		
	}

	public List<Libros> getLibrosById(String id) throws SQLException {
		List <Libros> books = new ArrayList<>();
		
		Connection conn = null;
	
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn = MySQLConexion.getConnection();
		
		String sql = "select L.id, L.titulo, CONCAT(a.apellido,', ', a.nombre) as AUTOR, L.partnumber, c.nomGenero, L.precio , L.stock from TLibro L "
				+ "inner join tautor a on a.codAutor = L.autor "
				+ "inner join tgenero c on c.codGenero = L.genero where id=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			String idd = rs.getString("ID");
			String titulo = rs.getString("TITULO");
			String autor = rs.getString("AUTOR");
			String isbn = rs.getString("PARTNUMBER");
			String genero = rs.getString("NOMGENERO");
			double precio = rs.getDouble("PRECIO");
			int stock = rs.getInt("STOCK");
		
			Libros tempBook = new Libros(idd, titulo, autor, isbn, genero, precio, stock);
			books.add(tempBook);
		}
		return books;
	}

	public void deleteBookie(String idBook) throws SQLException {
		Connection miConexion =  null;
		PreparedStatement miStatement = null;
		
		miConexion = MySQLConexion.getConnection();
		try {
			String sql = "DELETE FROM TLIBRO WHERE ID=?";
			
			miStatement = miConexion.prepareStatement(sql);
			miStatement.setString(1, idBook);
			
			miStatement.execute();
			System.out.println("Se eliminó el libro con id "+idBook);
		}catch(SQLException eq) {
			System.out.println("No se pudo eliminar el libro con id "+idBook);
		}
	}

}
