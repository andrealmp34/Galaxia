package com.galaxia.repository;

import java.util.Collection;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.galaxia.model.Clima;


@Repository
public interface ClimaRepositorio extends CrudRepository<Clima, Long> {
	
	Clima findByDia (Long dia);
	Collection<Clima> findByPrediccion( String climaTipo);

}
