package com.epss.controllers;

import com.epss.model.Faculty;
import com.epss.model.Institution;
import com.epss.service.StudentService;
import com.epss.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
        List<Institution> institutionList=universityService.getInstitutionsList();
        model.addAttribute("universities", institutionList);
        model.addAttribute("faculties", universityService.getFacultiesList(institutionList.get(0).getId()));
        model.addAttribute("departments",universityService.getDepartmentsList());
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
        model.addAttribute("universities", universityService.getInstitutionsList());
        return "/registrationFaculty";
    }

    @RequestMapping(value = { "/registrationUniversity" }, method = RequestMethod.GET)
    public String registrationUniversity(ModelMap model) {
        return "/registrationUniversity";
    }

    @RequestMapping(value = { "/registrationDepartment" }, method = RequestMethod.GET)
    public String registrationDepartment(ModelMap model) {
        List<Institution> institutionList=universityService.getInstitutionsList();
        model.addAttribute("universities", institutionList);
        model.addAttribute("faculties", universityService.getFacultiesList(institutionList.get(0).getId()));
        return "/registrationDepartment";
    }

    @RequestMapping(value = "/getFacultyList", method = RequestMethod.GET)
    public @ResponseBody
    List<Faculty> getCharNum(@RequestParam String id) {
        List<Faculty> facultyList =universityService.getFacultiesList(Integer.parseInt(id));
        return facultyList;
    }
}
