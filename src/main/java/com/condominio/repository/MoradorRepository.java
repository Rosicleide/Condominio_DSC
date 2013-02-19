package com.condominio.repository;

import com.condominio.domain.Morador;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Morador.class)
public interface MoradorRepository {
}
