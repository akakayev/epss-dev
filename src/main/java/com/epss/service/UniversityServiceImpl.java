package com.epss.service;


import com.epss.dao.*;
import com.epss.dto.FacultyDto;
import com.epss.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
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

    @Autowired
    private DepartmentDetailsDao departmentDetailsDao;

    @Autowired
    private HousingDao housingDao;

    @Autowired
    private UserService userService;

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
        List<Faculty>  facultyList=facultyDao.getAllFaculties(institutionId);
        if(facultyList==null)return Collections.emptyList();
        return facultyList;
    }

    @Override
    public void addFaculty(FacultyDto facultyDto) {
        String address=facultyDto.getHousing().getAddress();
        Housing housing=new Housing();
        housing.setAddress(address);
        housing.setCoordinates(facultyDto.getHousing().getCoordinates());
        housingDao.addHousing(housing);
        DepartmentDetails departmentDetails= new DepartmentDetails();
        departmentDetails.setDescription(facultyDto.getDepartmentDetails().getDescription());
        departmentDetails.setHousingId(housingDao.getHousingByAddress(address).getId());
        departmentDetails.setManager(userService.findByLogin(facultyDto.getDepartmentDetails().getManager()).getId());
        departmentDetailsDao.addDetails(departmentDetails);
        Faculty faculty= new Faculty();
        faculty.setName(facultyDto.getName());
        faculty.setAbbreviation(facultyDto.getAbbreviation());
        faculty.setGradation(facultyDto.getGradation());
        faculty.setDetails_id(departmentDetailsDao.getDetails(departmentDetails).getId());
        faculty.setInstitutionId(userService.findByLogin(facultyDto.getDepartmentDetails().getManager()).getId());
        facultyDao.addFaculty(faculty);
    }
}
