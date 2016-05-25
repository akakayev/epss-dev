package com.epss.controller;

import com.epss.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class LectorController {
    @RequestMapping(value = { "/lector", "/lector/cabinet" }, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {

        return "lector/cabinet";
    }
}
