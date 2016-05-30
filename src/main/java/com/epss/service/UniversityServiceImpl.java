package com.epss.service;


import com.epss.dao.DepartmentDao;
import com.epss.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("universityService")
@Transactional
public class UniversityServiceImpl implements UniversityService{

    @Autowired
    private DepartmentDao departmentDao;

    @Override
    public List<Department> getDepartmentsList() {
        return departmentDao.getDepartmentsList();
    }

    @Override
    public Department getDepartmentById(int id) {
        return departmentDao.getDepartmentById(id);
    }
}
