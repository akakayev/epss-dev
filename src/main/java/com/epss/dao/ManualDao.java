package com.epss.dao;

import com.epss.model.Manual;

import java.util.List;

public interface ManualDao {

    public List<Manual> getManualsListForDiscipline(int id);
}
