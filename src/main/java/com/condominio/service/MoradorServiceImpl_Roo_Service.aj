// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.condominio.service;

import com.condominio.domain.Morador;
import com.condominio.repository.MoradorRepository;
import com.condominio.service.MoradorServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MoradorServiceImpl_Roo_Service {
    
    declare @type: MoradorServiceImpl: @Service;
    
    declare @type: MoradorServiceImpl: @Transactional;
    
    @Autowired
    MoradorRepository MoradorServiceImpl.moradorRepository;
    
    public long MoradorServiceImpl.countAllMoradors() {
        return moradorRepository.count();
    }
    
    public void MoradorServiceImpl.deleteMorador(Morador morador) {
        moradorRepository.delete(morador);
    }
    
    public Morador MoradorServiceImpl.findMorador(Long id) {
        return moradorRepository.findOne(id);
    }
    
    public List<Morador> MoradorServiceImpl.findAllMoradors() {
        return moradorRepository.findAll();
    }
    
    public List<Morador> MoradorServiceImpl.findMoradorEntries(int firstResult, int maxResults) {
        return moradorRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MoradorServiceImpl.saveMorador(Morador morador) {
        moradorRepository.save(morador);
    }
    
    public Morador MoradorServiceImpl.updateMorador(Morador morador) {
        return moradorRepository.save(morador);
    }
    
}