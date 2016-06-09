package com.epss.dao;


import com.epss.model.Housing;

public interface HousingDao {

    public Housing getHousingById(int id);

    public void addHousing(Housing housing);
}
