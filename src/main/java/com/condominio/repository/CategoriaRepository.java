package com.condominio.repository;

import com.condominio.domain.Categoria;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Categoria.class)
public interface CategoriaRepository {
}
