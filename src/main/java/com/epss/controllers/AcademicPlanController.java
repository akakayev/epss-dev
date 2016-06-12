package com.epss.controllers;


import com.epss.dto.AcademicPlanDto;
import com.epss.service.AcademicService;
import com.epss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AcademicPlanController extends BasePageController{

    @Autowired
    private AcademicService academicService;

    @RequestMapping(value = {"/lector/plan", "/student/plan"}, method = RequestMethod.GET)
    public String academicPlanPage(ModelMap model) {
        return "academicPlan";
    }

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getPlan", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<Integer, List<AcademicPlanDto>> getPlan() {
        int id = userService.getUserDepartmentId(userService.findByLogin(getPrincipal()));
        return academicService.getPlanForDepartment(id);
    }
}
