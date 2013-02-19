package com.condominio.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson(deepSerialize = true)
public class Reclamacao {

    @ManyToOne
    private Morador reclamante;

    @ManyToOne
    private Morador reclamado;

    @NotNull
    @Size(max = 1000)
    private String descricao;

    @ManyToOne
    private Morador morador;
}
