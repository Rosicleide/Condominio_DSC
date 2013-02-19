package com.condominio;

import com.condominio.domain.Categoria;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Categoria.class)
@Controller
@RequestMapping("/categorias")
@RooWebScaffold(path = "categorias", formBackingObject = Categoria.class)
public class CategoriaController {
}
