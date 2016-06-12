package com.epss.dao;

import com.epss.model.SemesterResult;

import java.util.List;

public interface SemesterResultDao {

    public List<SemesterResult> getSemesterResultForStudent(int id);
}
