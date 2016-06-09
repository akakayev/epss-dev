package com.epss.service;

import com.epss.dao.LectorDao;
import com.epss.dao.LectorDisciplineDao;
import com.epss.dto.LectorRegistrationDto;
import com.epss.exceptions.SuchUserExistsException;
import com.epss.model.Discipline;
import com.epss.model.Lector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Service("lectorService")
@Transactional
public class LectorServiceImpl implements LectorService{

    @Autowired
    private UserService userService;

    @Autowired
    private LectorDao lectorDao;

    @Autowired
    private UniversityService universityService;

    @Autowired
    private LectorDisciplineDao lectorDisciplineDao;
    @Autowired
    private DisciplineService disciplineService;

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

    @Override
    public List<Discipline> getDisciplineListForLector(int id) {
        List<Integer> ids=lectorDisciplineDao.getDisciplinesIdsForLector(id);
        if(ids.isEmpty()||ids==null)return Collections.emptyList();
        List<Discipline> disciplines=disciplineService.getDisciplinesWithIds(ids);
        return disciplines;
    }

    private boolean canAddLector(String login) {
        return userService.isLoginExists(login);
    }
}
