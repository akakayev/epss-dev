package com.epss.dao;

import com.epss.model.Work;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("workDao")
public class WorkDaoImpl extends AbstractDao<Integer, Work> implements WorkDao{
    @Override
    public Work getWork(int id) {
        return getByKey(id);
    }

    @Override
    public List<Work> getWorksForDiscipline(int id) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("disciplineId",id))
                .addOrder(Order.asc("id"));
        return (List<Work>) cr.list();
    }
}
