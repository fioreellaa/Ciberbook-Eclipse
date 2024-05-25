package com.ciberbook.libros;

public class Libros {
	private String id;
	private String titulo;
    private String autor;
    private String descripcion;
	private String isbn;
	private int anioPublicacion;
	private String genero;
	private double precio;
	private int stock;
    private String imagen;
    
	public Libros(String id, String titulo, String autor, String descripcion, String isbn, int anioPublicacion,
			String genero, double precio, int stock, String imagen) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.autor = autor;
		this.descripcion = descripcion;
		this.isbn = isbn;
		this.anioPublicacion = anioPublicacion;
		this.genero = genero;
		this.precio = precio;
		this.stock = stock;
		this.imagen = imagen;
	}

	public Libros(String id, String titulo, String autor, String isbn, String genero, double precio, int stock) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.autor = autor;
		this.isbn = isbn;
		this.genero = genero;
		this.precio = precio;
		this.stock = stock;
	}

	public Libros(String titulo, String autor, String descripcion, String isbn, int anioPublicacion, String genero,
			double precio, int stock, String imagen) {
		this.titulo = titulo;
		this.autor = autor;
		this.descripcion = descripcion;
		this.isbn = isbn;
		this.anioPublicacion = anioPublicacion;
		this.genero = genero;
		this.precio = precio;
		this.stock = stock;
		this.imagen = imagen;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getAnioPublicacion() {
		return anioPublicacion;
	}

	public void setAnioPublicacion(int anioPublicacion) {
		this.anioPublicacion = anioPublicacion;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
    
	
    
}
