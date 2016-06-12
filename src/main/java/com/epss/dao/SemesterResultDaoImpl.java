package com.epss.dao;

import com.epss.model.AcademicPlan;
import com.epss.model.SemesterResult;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("semesterResult")
public class SemesterResultDaoImpl extends AbstractDao<Integer, SemesterResult> implements SemesterResultDao{
    @Override
    public List<SemesterResult> getSemesterResultForStudent(int id) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("studentId", id))
                .addOrder(Order.asc("id"));
        return (List<SemesterResult>) cr.list();
    }
}
