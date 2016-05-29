package com.epss.dao;

import com.epss.model.Student;

/**
 * Created by Артём on 28.05.2016.
 */
public interface StudentDao {

    public void saveStudent(Student student);

    public Student getStudentByRecordBook(int number);

    public Student getStudentByLogin(String login);
}
