package com.epss.dao;


import com.epss.model.Discipline;
import com.epss.model.Lector;

import java.util.List;

public interface LectorDisciplineDao {

    public List<Integer> getLectorsIdsForDiscipline(int disciplineId);

    public List<Integer> getDisciplinesIdsForLector(int lectorId);
}
