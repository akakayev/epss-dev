package com.epss.controllers.rest;

import com.epss.controllers.AjaxResponseBody;
import com.epss.controllers.Views;
import com.epss.dto.StudentRegistrationDto;
import com.epss.service.StudentService;
import com.fasterxml.jackson.annotation.JsonView;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;


@RestController
public class StudentRegistrationRestController {


    @Autowired
    StudentService studentService;

    // @ResponseBody, not necessary, since class is annotated with @RestController
    // @RequestBody - Convert the json data into object (SearchCriteria) mapped by field name.
    // @JsonView(Views.Public.class) - Optional, limited the json data display to client.
    @JsonView(Views.Public.class)
    @RequestMapping(value = "/reg")
    public AjaxResponseBody getSearchResultViaAjax(@RequestBody StudentRegistrationDto student) {
        AjaxResponseBody result = new AjaxResponseBody();
        try{
            studentService.saveStudent(student);
        }catch (ConstraintViolationException e){
            result.setMsg("студент с таким номером зачетки или логином уже есть");
            throw e;
        }
        HashMap<Integer,String> univers=new HashMap<>();
        univers.put(1,"SevGU");
        univers.put(2,"КФУ");
        result.setUnivers(univers);
        result.setMsg("студен успешно зарегестрирован");
        return result;
    }

}
