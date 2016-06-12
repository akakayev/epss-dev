package com.epss.controllers;

import com.epss.dto.AcademicPlanDto;
import com.epss.dto.RecordBookEntry;
import com.epss.service.AcademicService;
import com.epss.service.StudentService;
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
public class PerformanceController extends BasePageController{


    @Autowired
    private UserService userService;

    @Autowired
    private AcademicService academicService;

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = {"/student/recordBook"}, method = RequestMethod.GET)
    public String recordBookPage(ModelMap model) {
        return "/student/recordBook";
    }

    @RequestMapping(value = "/getRecordBook", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<Integer, List<RecordBookEntry>> getRecordBook() {
        int id = studentService.getStudentByRecordBook(studentService.getStudentByLogin(getPrincipal()).getRecordBookNumber()).getId();
        return academicService.getRecordBookForStudent(id);
    }

}
