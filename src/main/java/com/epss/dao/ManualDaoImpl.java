package com.epss.dao;

import com.epss.model.Manual;
import com.epss.model.Work;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("manualDao")
public class ManualDaoImpl extends AbstractDao<Integer, Manual> implements ManualDao{


    @Override
    public List<Manual> getManualsListForDiscipline(int id) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("discipline",id))
                .addOrder(Order.asc("id"));
        return (List<Manual>) cr.list();
    }
}
