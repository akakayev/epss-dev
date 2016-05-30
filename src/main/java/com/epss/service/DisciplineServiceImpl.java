package com.epss.service;


import com.epss.dao.DisciplineDao;
import com.epss.model.Discipline;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("disciplineService")
@Transactional
public class DisciplineServiceImpl implements DisciplineService{

    @Autowired
    private DisciplineDao disciplineDao;
    @Override
    public List<Discipline> getDisciplinesListForDepartment(int departmentId) {
        return disciplineDao.getDisciplinesListFordDepartment(departmentId);
    }
}
