package com.epss.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class WorksController {

    @RequestMapping(value = {"/work"}, method = RequestMethod.GET)
    public String addWorkPage(ModelMap model) {
        return "/work";
    }


    @RequestMapping(value = {"/lector/addWork-{discipline}", "/student/addWork-{discipline}"}, method = RequestMethod.GET)
    public String openCabinet(@PathVariable String discipline, ModelMap model) {

        return "/lector/createWork";
    }
}
