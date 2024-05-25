package com.ciberbook.usuario;

public class Usuario {
	private int idUsuario;
	private String nombre;
	private String apellido;
	private String telefono;
	private String dni;
	private String correo;
	private String contrasena;
	private String tipo;
	private String estado;
	
	public Usuario(int idUsuario, String nombre, String apellido, String telefono, String dni, String correo, String contrasena, 
			String tipo, String estado) {
		
		this.idUsuario = idUsuario;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.dni = dni;
		this.correo = correo;
		this.contrasena = contrasena;
		this.tipo = tipo;
		this.estado = estado;
	}
	
	public Usuario(String nombre, String apellido, String telefono, String dni, String correo, String contrasena,
			String tipo, String estado) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.dni = dni;
		this.correo = correo;
		this.contrasena = contrasena;
		this.tipo = tipo;
		this.estado = estado;
	}

	
	public Usuario(int idUsuario, String nombre, String apellido, String telefono, String dni, String correo,
			String tipo, String estado) {
		super();
		this.idUsuario = idUsuario;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.dni = dni;
		this.correo = correo;
		this.tipo = tipo;
		this.estado = estado;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
