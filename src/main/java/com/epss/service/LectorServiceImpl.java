package com.epss.service;

import com.epss.dao.LectorDao;
import com.epss.dto.LectorRegistrationDto;
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

    @Override
    public void saveLector(LectorRegistrationDto lectorRegistrationDto) {
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
    }

    @Override
    public LectorRegistrationDto getLectorByLogin(String login) {
        return new LectorRegistrationDto(lectorDao.getLectorByLogin(login),userService.findByLogin(login));
    }

    private boolean canAddLector(String login) {
        return userService.isLoginExists(login);
    }
}
