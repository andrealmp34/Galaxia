package com.galaxia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.galaxia.service.ClimaService;
import com.galaxia.exception.BusinessException;
import com.galaxia.model.ResponseClima;



@RestController
public class ClimaController {
	
	
	@Autowired(required = true)
	private ClimaService climaServices;
	
	
	@RequestMapping("/periodos")
	Integer getPeriods(@RequestParam(value="tipo", required=true) String type) throws BusinessException{
		if(type != null && !type.isEmpty()) {
			switch (type.toLowerCase()) {
	        case "sequia":
	            return climaServices.getPeriodosSequia();
	        case "lluvia":
	        	return climaServices.getPeriodosLluvia();
	        case "nollueve":
	        	return climaServices.getDisSinLluvia();
	        case "optimo":
	        	return climaServices.getDiasOPtimos();
			}
		}
		throw BusinessException.init(BusinessException.PERIODS);
	}

	
	@RequestMapping("/clima")
	ResponseClima getClima(@RequestParam(value="dia", required=true) Long day) throws BusinessException{
		if(day==null || day<0 || day>3650 ){
			throw BusinessException.init(BusinessException.WEATHER);
		}
		return climaServices.getClimaDia(day);
	}
	
	@RequestMapping("/DiaMaxLluvia")
	Long getDiaMaxLluvia() throws BusinessException{		
		return climaServices.getDiaMaximoLluvia();
	}

}
