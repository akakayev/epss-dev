package com.epss.dao;


import com.epss.model.Department;
import com.epss.model.Discipline;

import java.util.List;

public interface DisciplineDao {

    public List<Discipline> getDisciplinesListFordDepartment(int departmentId);

    List<Discipline> getDisciplinesWithIds(List<Integer> ids);
}
