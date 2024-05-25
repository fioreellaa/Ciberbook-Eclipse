package com.ciberbook.autor;

public class Autor {
	private String codAutor;
	private String nomAutor;
	private String apeAutor;
	private String nacionalidad;
	
	public Autor(String codAutor, String nomAutor, String apeAutor, String nacionalidad) {
		super();
		this.codAutor = codAutor;
		this.nomAutor = nomAutor;
		this.apeAutor = apeAutor;
		this.nacionalidad = nacionalidad;
	}

	public Autor(String codAutor, String nomAutor, String apeAutor) {
		super();
		this.codAutor = codAutor;
		this.nomAutor = nomAutor;
		this.apeAutor = apeAutor;
	}


	public String getCodAutor() {
		return codAutor;
	}

	public void setCodAutor(String codAutor) {
		this.codAutor = codAutor;
	}

	public String getNomAutor() {
		return nomAutor;
	}

	public void setNomAutor(String nomAutor) {
		this.nomAutor = nomAutor;
	}

	public String getApeAutor() {
		return apeAutor;
	}

	public void setApeAutor(String apeAutor) {
		this.apeAutor = apeAutor;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	
}
