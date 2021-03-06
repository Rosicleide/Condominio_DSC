// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.condominio.domain;

import com.condominio.domain.CategoriaDataOnDemand;
import com.condominio.domain.CategoriaIntegrationTest;
import com.condominio.repository.CategoriaRepository;
import com.condominio.service.CategoriaService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CategoriaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CategoriaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CategoriaIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CategoriaIntegrationTest: @Transactional;
    
    @Autowired
    CategoriaDataOnDemand CategoriaIntegrationTest.dod;
    
    @Autowired
    CategoriaService CategoriaIntegrationTest.categoriaService;
    
    @Autowired
    CategoriaRepository CategoriaIntegrationTest.categoriaRepository;
    
    @Test
    public void CategoriaIntegrationTest.testCountAllCategorias() {
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", dod.getRandomCategoria());
        long count = categoriaService.countAllCategorias();
        Assert.assertTrue("Counter for 'Categoria' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CategoriaIntegrationTest.testFindCategoria() {
        Categoria obj = dod.getRandomCategoria();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to provide an identifier", id);
        obj = categoriaService.findCategoria(id);
        Assert.assertNotNull("Find method for 'Categoria' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Categoria' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CategoriaIntegrationTest.testFindAllCategorias() {
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", dod.getRandomCategoria());
        long count = categoriaService.countAllCategorias();
        Assert.assertTrue("Too expensive to perform a find all test for 'Categoria', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Categoria> result = categoriaService.findAllCategorias();
        Assert.assertNotNull("Find all method for 'Categoria' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Categoria' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CategoriaIntegrationTest.testFindCategoriaEntries() {
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", dod.getRandomCategoria());
        long count = categoriaService.countAllCategorias();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Categoria> result = categoriaService.findCategoriaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Categoria' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Categoria' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CategoriaIntegrationTest.testFlush() {
        Categoria obj = dod.getRandomCategoria();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to provide an identifier", id);
        obj = categoriaService.findCategoria(id);
        Assert.assertNotNull("Find method for 'Categoria' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCategoria(obj);
        Integer currentVersion = obj.getVersion();
        categoriaRepository.flush();
        Assert.assertTrue("Version for 'Categoria' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CategoriaIntegrationTest.testUpdateCategoriaUpdate() {
        Categoria obj = dod.getRandomCategoria();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to provide an identifier", id);
        obj = categoriaService.findCategoria(id);
        boolean modified =  dod.modifyCategoria(obj);
        Integer currentVersion = obj.getVersion();
        Categoria merged = categoriaService.updateCategoria(obj);
        categoriaRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Categoria' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CategoriaIntegrationTest.testSaveCategoria() {
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", dod.getRandomCategoria());
        Categoria obj = dod.getNewTransientCategoria(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Categoria' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Categoria' identifier to be null", obj.getId());
        categoriaService.saveCategoria(obj);
        categoriaRepository.flush();
        Assert.assertNotNull("Expected 'Categoria' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CategoriaIntegrationTest.testDeleteCategoria() {
        Categoria obj = dod.getRandomCategoria();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Categoria' failed to provide an identifier", id);
        obj = categoriaService.findCategoria(id);
        categoriaService.deleteCategoria(obj);
        categoriaRepository.flush();
        Assert.assertNull("Failed to remove 'Categoria' with identifier '" + id + "'", categoriaService.findCategoria(id));
    }
    
}
