// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.condominio;

import com.condominio.MoradorController;
import com.condominio.domain.Morador;
import com.condominio.service.MoradorService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MoradorController_Roo_Controller {
    
    @Autowired
    MoradorService MoradorController.moradorService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MoradorController.create(@Valid Morador morador, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, morador);
            return "moradors/create";
        }
        uiModel.asMap().clear();
        moradorService.saveMorador(morador);
        return "redirect:/moradors/" + encodeUrlPathSegment(morador.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MoradorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Morador());
        return "moradors/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MoradorController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("morador", moradorService.findMorador(id));
        uiModel.addAttribute("itemId", id);
        return "moradors/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MoradorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("moradors", moradorService.findMoradorEntries(firstResult, sizeNo));
            float nrOfPages = (float) moradorService.countAllMoradors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("moradors", moradorService.findAllMoradors());
        }
        return "moradors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MoradorController.update(@Valid Morador morador, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, morador);
            return "moradors/update";
        }
        uiModel.asMap().clear();
        moradorService.updateMorador(morador);
        return "redirect:/moradors/" + encodeUrlPathSegment(morador.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MoradorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, moradorService.findMorador(id));
        return "moradors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MoradorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Morador morador = moradorService.findMorador(id);
        moradorService.deleteMorador(morador);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/moradors";
    }
    
    void MoradorController.populateEditForm(Model uiModel, Morador morador) {
        uiModel.addAttribute("morador", morador);
    }
    
    String MoradorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
