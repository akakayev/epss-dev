package com.epss.service;


import com.epss.model.Department;

import java.util.List;

public interface UniversityService {

    public List<Department> getDepartmentsList();

    public Department getDepartmentById(int id);
}
