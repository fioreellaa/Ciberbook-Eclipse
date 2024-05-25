package com.ciberbook.genero;

public class Categoria {
	private String idCate;
	private String nomCate;
	
	public Categoria(String idCate, String nomCate) {
		super();
		this.idCate = idCate;
		this.nomCate = nomCate;
	}

	public String getIdCate() {
		return idCate;
	}

	public void setIdCate(String idCate) {
		this.idCate = idCate;
	}

	public String getNomCate() {
		return nomCate;
	}

	public void setNomCate(String nomCate) {
		this.nomCate = nomCate;
	}
	
	
}
