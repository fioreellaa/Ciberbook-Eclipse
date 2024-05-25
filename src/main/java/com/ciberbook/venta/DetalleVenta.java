package com.ciberbook.venta;

import com.ciberbook.libros.Libros;

public class DetalleVenta {
	private String idDetalle;
	private Libros idlibro;
	private Venta idVenta;
	private int cantidad;
	private double subtotal;
	
	public DetalleVenta(String idDetalle, Libros idlibro, Venta idVenta, int cantidad, double subtotal) {
		this.idDetalle = idDetalle;
		this.idlibro = idlibro;
		this.idVenta = idVenta;
		this.cantidad = cantidad;
		this.subtotal = subtotal;
	}

	public String getIdDetalle() {
		return idDetalle;
	}

	public void setIdDetalle(String idDetalle) {
		this.idDetalle = idDetalle;
	}

	public Libros getIdlibro() {
		return idlibro;
	}

	public void setIdlibro(Libros idlibro) {
		this.idlibro = idlibro;
	}

	public Venta getIdVenta() {
		return idVenta;
	}

	public void setIdVenta(Venta idVenta) {
		this.idVenta = idVenta;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	
	
}
