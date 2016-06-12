package com.epss.controllers;

import com.epss.dto.AcademicPlanDto;
import com.epss.model.Faculty;
import com.epss.service.AcademicService;
import com.epss.service.DisciplineService;
import com.epss.service.ManualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class UnsortedPagesController extends BasePageController{

    @RequestMapping(value = { "/work" }, method = RequestMethod.GET)
    public String addWorkPage(ModelMap model) {
        return "/work";
    }

    @RequestMapping(value = { "/student/recordBook" }, method = RequestMethod.GET)
    public String recordBookPage(ModelMap model) {
        return "/student/recordBook";
    }

    @RequestMapping(value = { "/myWork" }, method = RequestMethod.GET)
    public String myWorksPage(ModelMap model) {
        return "/myWork";
    }

    @RequestMapping(value = { "/messages" }, method = RequestMethod.GET)
    public String messages(ModelMap model) {
        return "/messages";
    }

    @Autowired
    private ManualService manualService;
    @RequestMapping(value = { "/discipline" }, method = RequestMethod.GET)
    public String disciplinePage(ModelMap model) {
        model.addAttribute("manuals", manualService.getManualsForDiscipline(1));
        model.addAttribute("works", disciplineService.getWorksForDiscipline(1));
        return "/discipline";
    }

    @Autowired
    private DisciplineService disciplineService;

    @RequestMapping(value = {"/lector/disciplines-{department}", "/student/disciplines-{department}"}, method = RequestMethod.GET)
    public String openCabinet(@PathVariable String department, ModelMap model) {
        model.addAttribute("disciplines", disciplineService.getDisciplinesListForDepartment(Integer.valueOf(department)));
        return "disciplines";
    }

    @Autowired
    private AcademicService academicService;

    @RequestMapping(value = {"/lector/plan-{department}", "/student/plan-{department}"}, method = RequestMethod.GET)
    public String academicPlanPage(@PathVariable String department, ModelMap model) {
        model.addAttribute("department", department);
        return "academicPlan";
    }

    @RequestMapping(value = "/getPlan", method = RequestMethod.GET)
    public @ResponseBody
    Map<Integer, List<AcademicPlanDto>> getPlan(@RequestParam String id) {
        return academicService.getPlanForDepartment(Integer.parseInt(id));
    }
}
