package com.galaxia.manager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collection;

import org.apache.log4j.Logger;
import com.galaxia.manager.ClimaManager;
import com.galaxia.model.Clima;
import com.galaxia.repository.ClimaRepositorio;
import com.galaxia.util.ClimaTipoEnum;

@Component
public class ClimaManagerImpl implements ClimaManager{
	
	
	@Autowired
	private ClimaRepositorio climaRepositorio;
	private static final long serialVersionUID = -443631228566715847L;
	private static final Logger logger = Logger.getLogger(ClimaManagerImpl.class);
	private Integer l_resultado=0;
	private ClimaTipoEnum    tipoClima;
	private Collection<Clima> listaClima;
	
	@Override
	public Clima   getClimaDia(Long dia) {
		try {
		    return climaRepositorio.findByDia(dia);
		} catch(Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	
	@Override
	public Integer getPeriodosSequia() {
		try {
			
			listaClima =climaRepositorio.findByPrediccion(tipoClima.SEQUIA.type());
			l_resultado =listaClima.size();
			
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return l_resultado;
	}
	
	@Override
	public Integer getPeriodosLluvia() {
		try {
			listaClima =climaRepositorio.findByPrediccion(tipoClima.LLUVIA.type());
			l_resultado =listaClima.size();
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return l_resultado;
	}
	
	@Override
	public Integer getDiasOPtimos() {
		try {
			listaClima =climaRepositorio.findByPrediccion(tipoClima.OPTIMO.type());
			l_resultado =listaClima.size();
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return l_resultado;
	}
	
	
	@Override
	public Integer getDisSinLluvia() {
		try {
			listaClima =climaRepositorio.findByPrediccion(tipoClima.NOLLUVIA.type());
			l_resultado =listaClima.size();
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return l_resultado;
	}
	

	@Override
	public Long getDiaMaximoLluvia() {
		
		Float l_perimetroMax = new Float(0.0);
		Long l_dia = new Long(0);
		try {
             listaClima =climaRepositorio.findByPrediccion(tipoClima.LLUVIA.type());
			
			for(Clima l_tmpClima:listaClima) {
			 	if(l_tmpClima.getPerimetro() > l_perimetroMax) {
			 		l_perimetroMax = l_tmpClima.getPerimetro() ;
			 		l_dia = l_tmpClima.getDia();
			 	}
			}
			
			l_resultado =listaClima.size();
			
		} catch(Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return l_dia;
	}
}
