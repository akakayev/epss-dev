package com.epss.dao;


import com.epss.model.Housing;

public interface HousingDao {

    public Housing getHousingById(int id);

    public Housing getHousingByAddress(String address);

    public void addHousing(Housing housing);
}
