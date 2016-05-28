package com.epss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import com.epss.model.Student;
import com.epss.service.UserService;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;


@RestController
public class LectorRegistrationController {

    @Autowired
    UserService userService;

    // @ResponseBody, not necessary, since class is annotated with @RestController
    // @RequestBody - Convert the json data into object (SearchCriteria) mapped by field name.
    // @JsonView(Views.Public.class) - Optional, limited the json data display to client.
    @JsonView(Views.Public.class)
    @RequestMapping(value = "/reg")
    public AjaxResponseBody getSearchResultViaAjax(@RequestBody Student student) {
        AjaxResponseBody result = new AjaxResponseBody();
        System.out.println(student.getId());
        try{
            userService.saveUser(student);
        }catch (ConstraintViolationException e){
            result.setMsg("студент с таким номером зачетки или логином уже есть");
            return result;
        }
        HashMap<Integer,String> univers=new HashMap<>();
        univers.put(1,"SevGU");
        univers.put(2,"КФУ");
        result.setUnivers(univers);
        result.setMsg("студен успешно зарегестрирован");
        return result;
    }

}
