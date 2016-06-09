package com.epss.dao;

import com.epss.model.Institution;

import java.util.List;

public interface InstitutionDao {

    public void addInstitution(Institution institution);

    public Institution getInstitutionById(int id);

    public List<Institution> getAllInstitutions();
}
