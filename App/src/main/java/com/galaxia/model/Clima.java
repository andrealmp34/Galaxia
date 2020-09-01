package com.galaxia.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "clima")
public class Clima {
	
	private Long id;
	private Long dia;
	private String prediccion;
	private Float  perimetro;
	
	
	@Id
	@Column(name = "id", nullable = false)
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name = "dia", nullable = false)
    public Long getDia() {
    	return this.dia;
    }
    
    public void setDia(Long dia) {
    	 this.dia = dia;
    }
    
    @Column(name = "prediccion", nullable = false)
    public String getPrediccion() {
    	return this.prediccion;
    }
    
    public void setPrediccion(String prediccion) {
    	this.prediccion = prediccion;
    }
    
    @Column(name = "perimetro", nullable = false)
    public Float getPerimetro() {
    	return this.perimetro;
    }
    
    public void setPerimetro(Float perimetro) {
    	this.perimetro = perimetro;
    }


}
