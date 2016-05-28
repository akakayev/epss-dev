package com.epss.dao;

import com.epss.model.Lector;
import org.springframework.stereotype.Repository;

/**
 * Created by Артём on 28.05.2016.
 */
@Repository("lectorDao")
public class LectorDaoImpl extends AbstractDao<Integer, Lector> implements LectorDao {

    @Override
    public void saveLector(Lector lector) {
        persist(lector);
    }
}
