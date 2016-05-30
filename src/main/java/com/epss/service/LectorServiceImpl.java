package com.epss.service;

import com.epss.dao.LectorDao;
import com.epss.dto.LectorRegistrationDto;
import com.epss.exceptions.SuchUserExistsException;
import com.epss.model.Lector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("lectorService")
@Transactional
public class LectorServiceImpl implements LectorService{

    @Autowired
    private UserService userService;

    @Autowired
    private LectorDao lectorDao;

    @Autowired
    private UniversityService universityService;

    @Override
    public void saveLector(LectorRegistrationDto lectorRegistrationDto) throws SuchUserExistsException{
        String login=lectorRegistrationDto.getUser().getLogin();
        System.out.println(login);
        if(canAddLector(login)){
            userService.saveUser(lectorRegistrationDto.getUser());
            int userId=userService.findByLogin(login).getId();
            System.out.println(userId);
            Lector lector = new Lector(lectorRegistrationDto);
            lector.setUserId(userId);
            lectorDao.saveLector(lector);
        }
        else{
            throw new SuchUserExistsException();
        }
    }



    @Override
    public LectorRegistrationDto getLectorByLogin(String login) {
        Lector lector=lectorDao.getLectorByLogin(login);
        LectorRegistrationDto lectorRegistrationDto=new LectorRegistrationDto(lector,userService.findByLogin(login));
        lectorRegistrationDto.setDepartmentName(universityService.getDepartmentById(lector.getDepartmentId()).getName());
        return lectorRegistrationDto;
    }

    private boolean canAddLector(String login) {
        return userService.isLoginExists(login);
    }
}
