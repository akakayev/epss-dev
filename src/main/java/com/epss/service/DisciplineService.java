package com.epss.service;


import com.epss.model.Discipline;

import java.util.List;

public interface DisciplineService {

    public List<Discipline> getDisciplinesListForDepartment(int departmentId);

    List<Discipline> getDisciplinesWithIds(List<Integer> ids);
}
