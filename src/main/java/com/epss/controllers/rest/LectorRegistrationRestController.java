package com.epss.controllers.rest;

import com.epss.controllers.RegistrationResponse;
import com.epss.controllers.Views;
import com.epss.dto.LectorRegistrationDto;
import com.epss.exceptions.SuchUserExistsException;
import com.epss.service.LectorService;
import com.fasterxml.jackson.annotation.JsonView;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LectorRegistrationRestController {

    @Autowired
    LectorService lectorService;

    @JsonView(Views.Public.class)
    @RequestMapping(value = "/regLector")
    public RegistrationResponse registerLector(@RequestBody LectorRegistrationDto lector) {
        RegistrationResponse result = new RegistrationResponse();
        try{
            lectorService.saveLector(lector);
        }catch (ConstraintViolationException e){
            result.setMessage("при регистрации пользователя произошла неизвестная ошибка");
            result.setSuccess(false);
            throw e;
        }
        catch (SuchUserExistsException ex){
            result.setMessage("преподаватель с таким логином уже есть");
            result.setSuccess(false);
            return result;
        }
        result.setMessage("преподаватель успешно зарегестрирован");
        result.setSuccess(true);
        return result;
    }
}
