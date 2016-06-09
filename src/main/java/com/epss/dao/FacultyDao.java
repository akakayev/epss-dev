package com.epss.dao;


import com.epss.model.Faculty;
import com.epss.model.Institution;

import java.util.List;

public interface FacultyDao {

    public void addFaculty(Faculty institution);

    public Faculty getFacultyById(int id);

    public List<Faculty> getAllFaculties(int institutionId);
}
