package com.epss.service;

import com.epss.dto.StudentRegistrationDto;
import com.epss.model.Student;

public interface StudentService {

    public void saveStudent(StudentRegistrationDto student);
}
