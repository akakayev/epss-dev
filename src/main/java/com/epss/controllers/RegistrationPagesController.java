package com.epss.controllers;

import com.epss.dto.RegistrationResponse;
import com.epss.service.LectorService;
import com.epss.service.StudentService;
import com.epss.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
        model.addAttribute("universiries", universityService.getInstitutionsList());
        return "/registrationFaculty";
    }

    @RequestMapping(value = { "/registrationUniversity" }, method = RequestMethod.GET)
    public String registrationUniversity(ModelMap model) {
        return "/registrationUniversity";
    }

    @RequestMapping(value = { "/registrationDepartment" }, method = RequestMethod.GET)
    public String registrationDepartment(ModelMap model) {
        model.addAttribute("universiries", universityService.getInstitutionsList());
        return "/registrationDepartment";
    }

    @RequestMapping(value = "/getFacultyList", method = RequestMethod.GET)
    public @ResponseBody
    String getCharNum(@RequestParam String id) {

        RegistrationResponse result = new RegistrationResponse();

        if (id != null) {
            result.setSuccess(true);
            result.setMessage("success");
        }

        return "hui"+id;
    }
}
