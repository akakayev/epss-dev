package com.epss.service;

import com.epss.dto.StudentRegistrationDto;
import com.epss.model.Group;
import com.epss.model.Student;

import java.util.List;

public interface StudentService {

    public void saveStudent(StudentRegistrationDto student);

    public List<Group> getGroupList();

    public StudentRegistrationDto getStudentByLogin(String login);
}
