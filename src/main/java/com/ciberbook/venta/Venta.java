package com.ciberbook.venta;

import java.util.Date;

public class Venta {
	private String idVenta;
	private Date fechaReg;
	private int cantTotal;
	private double montoTotal;
	
	public Venta(String idVenta, Date fechaReg, int cantTotal, double montoTotal) {
		this.idVenta = idVenta;
		this.fechaReg = fechaReg;
		this.cantTotal = cantTotal;
		this.montoTotal = montoTotal;
	}

	public String getIdVenta() {
		return idVenta;
	}

	public void setIdVenta(String idVenta) {
		this.idVenta = idVenta;
	}

	public Date getFechaReg() {
		return fechaReg;
	}

	public void setFechaReg(Date fechaReg) {
		this.fechaReg = fechaReg;
	}

	public int getCantTotal() {
		return cantTotal;
	}

	public void setCantTotal(int cantTotal) {
		this.cantTotal = cantTotal;
	}

	public double getMontoTotal() {
		return montoTotal;
	}

	public void setMontoTotal(double montoTotal) {
		this.montoTotal = montoTotal;
	}
	
	
}
