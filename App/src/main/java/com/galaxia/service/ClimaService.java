package com.galaxia.service;

import java.io.Serializable;

import com.galaxia.model.ResponseClima;

public interface ClimaService extends Serializable {
	
	ResponseClima  getClimaDia(Long day);
	public Integer getPeriodosSequia();
	public Integer getPeriodosLluvia();
	public Integer getDiasOPtimos();
	public Integer getDisSinLluvia();
	public Long getDiaMaximoLluvia();

}
