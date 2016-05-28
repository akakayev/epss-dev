package com.epss.controllers.rest;

import com.epss.controllers.AjaxResponseBody;
import com.epss.controllers.Views;
import com.epss.dto.LectorRegistrationDto;
import com.epss.service.LectorService;
import com.fasterxml.jackson.annotation.JsonView;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class LectorRegistrationRestController {

    @Autowired
    LectorService lectorService;

    @JsonView(Views.Public.class)
    @RequestMapping(value = "/regLector")
    public AjaxResponseBody registerLector(@RequestBody LectorRegistrationDto lector) {
        AjaxResponseBody result = new AjaxResponseBody();
        try{
            lectorService.saveLector(lector);
        }catch (ConstraintViolationException e){
            result.setMsg("преподаватель с таким логином уже есть");
            throw e;
        }
        HashMap<Integer,String> univers=new HashMap<>();
        univers.put(1,"SevGU");
        univers.put(2,"КФУ");
        result.setUnivers(univers);
        result.setMsg("преподаватель успешно зарегестрирован");
        return result;
    }
}
