package com.epss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")

public class StudentRegistrationController {
    @RequestMapping(value = { "/registrationStudent" }, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {

        return "/registrationStudent";
    }
}
