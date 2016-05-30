package com.epss.dao;

import com.epss.model.Department;
import com.epss.model.Discipline;
import com.epss.model.Group;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("disciplineDao")
public class DisciplineDaoImpl extends AbstractDao<Integer, Discipline> implements DisciplineDao{

    @Override
    public List<Discipline> getDisciplinesListFordDepartment(int departmentId) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("departmentId", departmentId))
                .addOrder(Order.asc("name"));
        return (List<Discipline>) cr.list();
    }

    @Override
    public List<Discipline> getDisciplinesWithIds(List<Integer> ids) {
        Criteria cr = createEntityCriteria().add(Restrictions.in("id",ids))
                .addOrder(Order.asc("name"));
        return (List<Discipline>) cr.list();
    }
}
