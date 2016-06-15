package com.epss.service;

import com.epss.dao.WorkDao;
import com.epss.dao.WorkKindDao;
import com.epss.model.Work;
import com.epss.model.WorkKind;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("workService")
public class WorkServiceImpl implements WorkService{

    @Autowired
    WorkKindDao workKindDao;

    @Autowired
    WorkDao workDao;

    @Override
    public Work getWork(int id) {
        return workDao.getWork(id);
    }

    @Override
    public void addWork(Work work) {
        workDao.addWork(work);
    }

    @Override
    public String getWorkKind(int id) {
        return workKindDao.getKindOfWork(id);
    }
}
