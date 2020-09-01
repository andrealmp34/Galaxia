package com.galaxia;


import static org.junit.Assert.assertEquals;

import java.util.Collection;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.galaxia.manager.ClimaManager;
import com.galaxia.manager.ClimaManagerImpl;
import com.galaxia.model.Clima;
import com.galaxia.repository.ClimaRepositorio;
import com.galaxia.util.ClimaTipoEnum;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = ClimaManager.class)
@WebAppConfiguration
public class GalaxiaManagerTest {
	
	
	@Mock
	ClimaRepositorio climaRepositorio;
	Integer l_resultado=0;
	ClimaTipoEnum    tipoClima;
	Collection<Clima> listaClima;
	
	@Before
	public void initTest(){
		MockitoAnnotations.initMocks(this);
	}

	
	@Test
	public Clima   getClimaDia(Long dia) {
		
		ClimaManagerImpl climaMng = new ClimaManagerImpl();
		Clima l_clima = new Clima();
		Mockito.when(climaRepositorio.count()).thenReturn((long)0);
		Mockito.when(climaRepositorio.save(Mockito.any(Clima.class))).thenReturn(l_clima);
		l_clima = climaMng.getClimaDia(dia);
		Mockito.verify(climaRepositorio, Mockito.atLeast(1));
		assertEquals(Clima.class, l_clima);
		
		return l_clima;
	}
	
	@Test
	public Integer getPeriodosSequia() {
		
		ClimaManagerImpl climaMng = new ClimaManagerImpl();
		Collection<Clima> listaClima;
		Mockito.when(climaRepositorio.count()).thenReturn((long)0);
		listaClima =climaRepositorio.findByPrediccion(tipoClima.SEQUIA.type());
		l_resultado =listaClima.size();
		assertEquals(Integer.class, l_resultado);
		
		return l_resultado;
	}
	
	@Test
	public Integer getPeriodosLluvia()  {
		
		ClimaManagerImpl climaMng = new ClimaManagerImpl();
		Collection<Clima> listaClima;
		Mockito.when(climaRepositorio.count()).thenReturn((long)0);
		listaClima =climaRepositorio.findByPrediccion(tipoClima.SEQUIA.type());
		l_resultado =listaClima.size();
		assertEquals(Integer.class, l_resultado);
		
		return l_resultado;
	}
	
	@Test
	public Integer getDiasOPtimos() {
		
		ClimaManagerImpl climaMng = new ClimaManagerImpl();
		Collection<Clima> listaClima;
		Mockito.when(climaRepositorio.count()).thenReturn((long)0);
		listaClima =climaRepositorio.findByPrediccion(tipoClima.SEQUIA.type());
		l_resultado =listaClima.size();
		assertEquals(Integer.class, l_resultado);
		
		return l_resultado;
	}
	
	public Long getDiaMaximoLluvia() {
		
		Collection<Clima> listaClima =climaRepositorio.findByPrediccion(tipoClima.LLUVIA.type());
		Float l_perimetroMax = new Float(0.0);
		Long l_dia = new Long(0);
		for(Clima l_tmpClima:listaClima) {
		 	if(l_tmpClima.getPerimetro() > l_perimetroMax) {
		 		l_perimetroMax = l_tmpClima.getPerimetro() ;
		 		l_dia = l_tmpClima.getDia();
		 	}
		}

		
		return l_dia;
	}
	
}
