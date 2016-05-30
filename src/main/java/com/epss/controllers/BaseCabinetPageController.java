package com.epss.controllers;

import com.epss.model.User;
import com.epss.service.DisciplineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class BaseCabinetPageController {

    @Autowired
    private DisciplineService disciplineService;

    @RequestMapping(value = {"/lector/disciplines-{department}", "/student/disciplines-{department}"}, method = RequestMethod.GET)
    public String openCabinet(@PathVariable String department,ModelMap model) {

        System.out.println(disciplineService.getDisciplinesListForDepartment(Integer.valueOf(department)));
        model.addAttribute("disciplines", disciplineService.getDisciplinesListForDepartment(Integer.valueOf(department)));
        return "disciplines";
    }
}
