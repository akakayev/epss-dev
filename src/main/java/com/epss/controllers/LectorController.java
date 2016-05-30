package com.epss.controllers;

import com.epss.service.LectorService;
import com.epss.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class LectorController {

    @Autowired
    private UniversityService universityService;

    @Autowired
    private LectorService lectorService;

    @RequestMapping(value = { "/registrationLector"}, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        model.addAttribute("departments",universityService.getDepartmentsList());
        return "registrationLector";
    }
    @RequestMapping(value = { "/lector", "/lector/cabinet" }, method = RequestMethod.GET)
    public String lector(ModelMap model) {

        System.out.println(lectorService.getDisciplineListForLector(lectorService.getLectorByLogin(getPrincipal()).getId()));
        model.addAttribute("disciplines",lectorService.getDisciplineListForLector(lectorService.getLectorByLogin(getPrincipal()).getId()));
        model.addAttribute("lector",lectorService.getLectorByLogin(getPrincipal()));
        return "lector/cabinet";
    }

    public String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
