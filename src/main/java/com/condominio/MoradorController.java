package com.condominio;

import com.condominio.domain.Morador;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Morador.class)
@Controller
@RequestMapping("/moradors")
@RooWebScaffold(path = "moradors", formBackingObject = Morador.class)
public class MoradorController {
}
