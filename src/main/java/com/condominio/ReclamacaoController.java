package com.condominio;

import com.condominio.domain.Reclamacao;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Reclamacao.class)
@Controller
@RequestMapping("/reclamacaos")
@RooWebScaffold(path = "reclamacaos", formBackingObject = Reclamacao.class)
public class ReclamacaoController {
}
