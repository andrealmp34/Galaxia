package com.galaxia.model;

public class ResponseClima {
	private Long dia;
	private String clima;
	
	
	public ResponseClima(Long i, String clima) {
		super();
		this.dia = i;
		this.clima = clima;
	}
	/**
	 * @return the dia
	 */
	public Long getDia() {
		return dia;
	}
	/**
	 * @return the clima
	 */
	public String getClima() {
		return clima;
	}
	
	
}