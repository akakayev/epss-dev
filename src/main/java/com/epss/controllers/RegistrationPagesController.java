package com.epss.controllers;

import com.epss.service.LectorService;
import com.epss.service.StudentService;
import com.epss.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class RegistrationPagesController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private UniversityService universityService;

    @RequestMapping(value = { "/registrationStudent" }, method = RequestMethod.GET)
    public String registrationStudent(ModelMap model) {
        model.addAttribute("groups",studentService.getGroupList());
        return "/registrationStudent";
    }

    @RequestMapping(value = { "/registrationLector"}, method = RequestMethod.GET)
    public String registrationLector(ModelMap model) {
        model.addAttribute("departments",universityService.getDepartmentsList());
        return "registrationLector";
    }

    @RequestMapping(value = { "/registrationFaculty" }, method = RequestMethod.GET)
    public String registrationFaculty(ModelMap model) {
        return "/registrationFaculty";
    }

    @RequestMapping(value = { "/registrationUniversity" }, method = RequestMethod.GET)
    public String registrationUniversity(ModelMap model) {
        return "/registrationUniversity";
    }

    @RequestMapping(value = { "/registrationDepartment" }, method = RequestMethod.GET)
    public String registrationDepartment(ModelMap model) {
        return "/registrationDepartment";
    }
}
