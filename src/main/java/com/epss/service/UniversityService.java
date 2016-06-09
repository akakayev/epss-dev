package com.epss.service;


import com.epss.model.Department;
import com.epss.model.Faculty;
import com.epss.model.Institution;

import java.util.List;

public interface UniversityService {

    public List<Department> getDepartmentsList();

    public Department getDepartmentById(int id);

    public List<Institution> getInstitutionsList();

    public List<Faculty> getFacultiesList(int institutionId);
}
