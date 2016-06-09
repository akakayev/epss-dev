package com.epss.service;


import com.epss.dao.DepartmentDao;
import com.epss.dao.FacultyDao;
import com.epss.dao.InstitutionDao;
import com.epss.model.Department;
import com.epss.model.Faculty;
import com.epss.model.Institution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("universityService")
@Transactional
public class UniversityServiceImpl implements UniversityService{

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private InstitutionDao institutionDao;

    @Autowired
    private FacultyDao facultyDao;

    @Override
    public List<Department> getDepartmentsList() {
        return departmentDao.getDepartmentsList();
    }

    @Override
    public Department getDepartmentById(int id) {
        return departmentDao.getDepartmentById(id);
    }

    @Override
    public List<Institution> getInstitutionsList() {
        return institutionDao.getAllInstitutions();
    }

    @Override
    public List<Faculty> getFacultiesList(int institutionId) {
        return facultyDao.getAllFaculties(institutionId);
    }
}
