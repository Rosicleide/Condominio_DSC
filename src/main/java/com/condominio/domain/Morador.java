package com.condominio.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson(deepSerialize = true)
public class Morador {

    @NotNull
    @Size(max = 50)
    private String nome;

    @NotNull
    @Size(min = 11)
    private String cpf;

    @NotNull
    private String dataNascimento;

    @NotNull
    @Column(unique = true)
    private String email;

    @NotNull
    private String numero_apartamento;
}
