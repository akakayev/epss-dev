package com.epss.dao;

import com.epss.model.AcademicPlan;
import com.epss.model.Discipline;
import com.epss.model.Group;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("academicPlanDao")
public class AcademicPlanDaoImpl extends AbstractDao<Integer, AcademicPlan> implements AcademicPlanDao{
    @Override
    public List<AcademicPlan> getPlanForDepartment(int id) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("id", id))
                .addOrder(Order.asc("id"));
        return (List<AcademicPlan>) cr.list();
    }

    @Override
    public List<AcademicPlan> getPlanForDepartmentInSemester(int id, int semester) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("id", id))
                .add(Restrictions.eq("semester", semester))
                .addOrder(Order.asc("id"));
        return (List<AcademicPlan>) cr.list();
    }
}
