package com.ciberbook.editorial;

public class Editorial {
	private String idEditorial;
	private String nomEditorial;
	private String direccion;
	private String telefono;
	private String correo;
	private String nomContacto;
	
	public Editorial(String idEditorial, String nomEditorial, String direccion, String telefono, String correo,
			String nomContacto) {
		this.idEditorial = idEditorial;
		this.nomEditorial = nomEditorial;
		this.direccion = direccion;
		this.telefono = telefono;
		this.correo = correo;
		this.nomContacto = nomContacto;
	}

	public String getIdEditorial() {
		return idEditorial;
	}

	public void setIdEditorial(String idEditorial) {
		this.idEditorial = idEditorial;
	}

	public String getNomEditorial() {
		return nomEditorial;
	}

	public void setNomEditorial(String nomEditorial) {
		this.nomEditorial = nomEditorial;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
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

	public String getNomContacto() {
		return nomContacto;
	}

	public void setNomContacto(String nomContacto) {
		this.nomContacto = nomContacto;
	}
	
	
}
