// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.condominio.repository;

import com.condominio.domain.Morador;
import com.condominio.repository.MoradorRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect MoradorRepository_Roo_Jpa_Repository {
    
    declare parents: MoradorRepository extends JpaRepository<Morador, Long>;
    
    declare parents: MoradorRepository extends JpaSpecificationExecutor<Morador>;
    
    declare @type: MoradorRepository: @Repository;
    
}