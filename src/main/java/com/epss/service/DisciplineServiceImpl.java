package com.epss.service;


import com.epss.dao.DisciplineDao;
import com.epss.dao.WorkKindDao;
import com.epss.dto.WorkDto;
import com.epss.model.Discipline;
import com.epss.model.Work;
import com.epss.dao.WorkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Service("disciplineService")
@Transactional
public class DisciplineServiceImpl implements DisciplineService{

    @Autowired
    private DisciplineDao disciplineDao;

    @Autowired
    private WorkDao workDao;

    @Autowired
    private WorkKindDao workKindDao;

    @Override
    public List<Discipline> getDisciplinesListForDepartment(int departmentId) {
        return disciplineDao.getDisciplinesListFordDepartment(departmentId);
    }

    @Override
    public List<Discipline> getDisciplinesWithIds(List<Integer> ids) {
        return disciplineDao.getDisciplinesWithIds(ids);
    }

    @Override
    public List<WorkDto> getWorksForDiscipline(int disciplineId) {
        List<Work> works=workDao.getWorksForDiscipline(disciplineId);
        List<WorkDto> result= new LinkedList<WorkDto>();
        for (Work work:works) {
            result.add(new WorkDto(work, workKindDao.getKindOfWork(work.getWorkKindId())));
        }
        return result;
    }
}
