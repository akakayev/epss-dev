package com.epss.dao;


import com.epss.model.Work;

import java.util.List;

public interface WorkDao {

    public Work getWork(int id);

    public List<Work> getWorksForDiscipline(int id);
}
