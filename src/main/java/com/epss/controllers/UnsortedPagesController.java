package com.epss.controllers;

import com.epss.dto.AcademicPlanDto;
import com.epss.service.AcademicService;
import com.epss.service.DisciplineService;
import com.epss.service.ManualService;
import com.epss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class UnsortedPagesController extends BasePageController {

    @RequestMapping(value = {"/myWork"}, method = RequestMethod.GET)
    public String myWorksPage(ModelMap model) {
        return "/myWork";
    }

    @RequestMapping(value = {"/messages"}, method = RequestMethod.GET)
    public String messages(ModelMap model) {
        return "/messages";
    }

    @RequestMapping(value = {"/student/addReport"}, method = RequestMethod.GET)
    public String addReport(ModelMap model) {
        return "/student/addReport";
    }

    @Autowired
    private ManualService manualService;

    @RequestMapping(value = {"/discipline-{id}"}, method = RequestMethod.GET)
    public String disciplinePage(@PathVariable String id, ModelMap model) {
        int disciplineId= Integer.parseInt(id);
        model.addAttribute("discipline", disciplineService.getDisciplinesWithIds(disciplineId).get(0));
        model.addAttribute("manuals", manualService.getManualsForDiscipline(disciplineId));
        model.addAttribute("works", disciplineService.getWorksForDiscipline(disciplineId));
        return "/discipline";
    }

    @Autowired
    private DisciplineService disciplineService;

    @RequestMapping(value = {"/lector/disciplines-{department}", "/student/disciplines-{department}"}, method = RequestMethod.GET)
    public String openCabinet(@PathVariable String department, ModelMap model) {
        model.addAttribute("disciplines", disciplineService.getDisciplinesListForDepartment(Integer.valueOf(department)));
        return "disciplines";
    }
}
