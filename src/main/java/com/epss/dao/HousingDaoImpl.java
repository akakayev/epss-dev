package com.epss.dao;

import com.epss.model.Housing;
import com.epss.model.User;
import org.springframework.stereotype.Repository;

@Repository("housingDao")
public class HousingDaoImpl extends AbstractDao<Integer, Housing> implements HousingDao{

    @Override
    public Housing getHousingById(int id) {
        Housing housing = getByKey(id);
        return housing;
    }

    @Override
    public void addHousing(Housing housing) {
        persist(housing);
    }
}
