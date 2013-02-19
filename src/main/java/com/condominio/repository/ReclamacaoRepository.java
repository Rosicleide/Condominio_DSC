package com.condominio.repository;

import com.condominio.domain.Reclamacao;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Reclamacao.class)
public interface ReclamacaoRepository {
}
