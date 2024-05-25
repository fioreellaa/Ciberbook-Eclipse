package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/ciberbook?userTimezone=true&serverTimezone=UTC";
			String usr = "root";
			String pwd = "baobei";
			con = DriverManager.getConnection(url, usr, pwd);
			System.out.println("conexion ok");
		} catch (ClassNotFoundException ex) {
			System.out.println("Driver no encontrado.");
		} catch (SQLException ex) {
			System.out.println("Error con esta BD.");
		}

		return con;
	}
	
	public static void closeConnection(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Problemas al intentar cerrar la conexión.");
		}
	}
	
	public static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code" + ((SQLException) e).getErrorCode());
				System.err.println("Message" + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause" + t);
					t = t.getCause();
				}
			}
		}
	}
}
