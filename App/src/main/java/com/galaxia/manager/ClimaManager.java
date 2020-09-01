package com.galaxia.manager;

import java.io.Serializable;
import com.galaxia.model.Clima;



public interface ClimaManager extends Serializable{
	
	
	public Clima   getClimaDia(Long day);
	public Integer getPeriodosSequia();
	public Integer getPeriodosLluvia();
	public Integer getDiasOPtimos();
	public Integer getDisSinLluvia();
	public Long getDiaMaximoLluvia();

}
