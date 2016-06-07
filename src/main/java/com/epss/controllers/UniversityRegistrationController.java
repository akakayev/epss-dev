package com.epss.controllers;

import com.epss.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class UniversityRegistrationController {

    @Autowired
    private StudentService studentService;
    @RequestMapping(value = { "/registrationUniversity" }, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        model.addAttribute("groups",studentService.getGroupList());
        return "/registrationUniversity";
    }
}

