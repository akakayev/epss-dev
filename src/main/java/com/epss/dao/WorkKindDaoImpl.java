package com.epss.dao;

import com.epss.model.Group;
import com.epss.model.WorkKind;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("workKindDao")
public class WorkKindDaoImpl extends AbstractDao<Integer, WorkKind> implements WorkKindDao{
    @Override
    public String getKindOfWork(int id) {
        return getByKey(id).getName();
    }

    @Override
    public List<String> getAllKinds() {
        Criteria cr = createEntityCriteria()
                .setProjection(Projections.distinct(Projections.property("name")))
                .addOrder(Order.asc("name"));
        return (List<String>)cr.list();
    }
}
