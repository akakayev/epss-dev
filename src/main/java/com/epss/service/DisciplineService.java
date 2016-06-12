package com.epss.service;


import com.epss.dto.WorkDto;
import com.epss.model.Discipline;
import com.epss.model.Work;

import java.util.List;

public interface DisciplineService {

    public List<Discipline> getDisciplinesListForDepartment(int departmentId);

    List<Discipline> getDisciplinesWithIds(Integer ... ids);

    List<WorkDto> getWorksForDiscipline(int disciplineId);
}
