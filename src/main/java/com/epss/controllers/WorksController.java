package com.epss.controllers;

import com.epss.dto.RecordBookEntry;
import com.epss.dto.RegistrationResponse;
import com.epss.model.Work;
import com.epss.service.DisciplineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class WorksController {

    @Autowired
    private DisciplineService disciplineService;

    @RequestMapping(value = {"/work"}, method = RequestMethod.GET)
    public String addWorkPage(ModelMap model) {
        return "/work";
    }


    @RequestMapping(value = {"/lector/addWork-{discipline}", "/student/addWork-{discipline}"}, method = RequestMethod.GET)
    public String openCabinet(@PathVariable String discipline, ModelMap model) {
        model.addAttribute("discipline", disciplineService.getDisciplinesWithIds(Integer.parseInt(discipline)).get(0));
        return "/lector/createWork";
    }

    @RequestMapping(value = "/lector/addWork", method = RequestMethod.GET)
    public
    @ResponseBody
    RegistrationResponse addWork(@RequestBody Work work) {
        return new RegistrationResponse();
    }
}
