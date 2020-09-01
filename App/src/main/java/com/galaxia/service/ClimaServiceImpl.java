package com.galaxia.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.galaxia.manager.ClimaManagerImpl;
import com.galaxia.model.Clima;
import com.galaxia.model.ResponseClima;



@Component
public class ClimaServiceImpl  implements ClimaService{
	
	
	private static final long serialVersionUID = -443631228566715847L;
	@Autowired
	private ClimaManagerImpl clienteMng;


	@Override
	public ResponseClima getClimaDia(Long dia)  {
		Clima clima = clienteMng.getClimaDia(dia);
		ResponseClima responseClima = new ResponseClima(clima.getDia() ,clima.getPrediccion());
		return responseClima;
	}
	
	@Override
	public Integer getPeriodosSequia() {
			return clienteMng.getPeriodosSequia();
	}
	
	@Override
	public Integer getPeriodosLluvia() {
		return clienteMng.getPeriodosLluvia();
	}
	
	@Override
	public Integer getDiasOPtimos() {
		return clienteMng.getDiasOPtimos();
	}
	
	
	@Override
	public Integer getDisSinLluvia() {
		return clienteMng.getDisSinLluvia();
	}
	
	@Override
	public Long getDiaMaximoLluvia() {
		return clienteMng.getDiaMaximoLluvia();
	}

}
