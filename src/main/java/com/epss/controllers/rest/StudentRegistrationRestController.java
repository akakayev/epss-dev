package com.epss.controllers.rest;

import com.epss.dto.RegistrationResponse;
import com.epss.dto.Views;
import com.epss.dto.StudentRegistrationDto;
import com.epss.exceptions.SuchUserExistsException;
import com.epss.service.StudentService;
import com.fasterxml.jackson.annotation.JsonView;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class StudentRegistrationRestController {


    @Autowired
    StudentService studentService;

    // @ResponseBody, not necessary, since class is annotated with @RestController
    // @RequestBody - Convert the json data into object (SearchCriteria) mapped by field name.
    // @JsonView(Views.Public.class) - Optional, limited the json data display to client.
    @JsonView(Views.Public.class)
    @RequestMapping(value = "/reg")
    public RegistrationResponse getSearchResultViaAjax(@RequestBody StudentRegistrationDto student) {
        RegistrationResponse result = new RegistrationResponse();
        try{
            studentService.saveStudent(student);
        }catch (ConstraintViolationException e){
            result.setMessage("при регистрации пользователя произошла неизвестная ошибка");
            result.setSuccess(false);
            throw e;
        }
        catch (SuchUserExistsException ex){
            result.setMessage("студент с таким номером зачетки или логином уже есть");
            result.setSuccess(false);
            return result;
        }
        result.setMessage("студен успешно зарегестрирован");
        result.setSuccess(true);
        return result;
    }

}
