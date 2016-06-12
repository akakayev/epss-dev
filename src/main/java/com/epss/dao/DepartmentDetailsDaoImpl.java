package com.epss.dao;

import com.epss.dto.FacultyDto;
import com.epss.model.DepartmentDetails;
import com.epss.model.Housing;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("departmentDetailsDao")
public class DepartmentDetailsDaoImpl extends AbstractDao<Integer, DepartmentDetails> implements DepartmentDetailsDao {
    @Override
    public DepartmentDetails getDetails(int id) {
        DepartmentDetails departmentDetails= getByKey(id);
        return departmentDetails;
    }

    @Override
    public DepartmentDetails getDetails(DepartmentDetails departmentDetails) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("description", departmentDetails.getDescription()))
                .add(Restrictions.eq("manager", departmentDetails.getManager()));
        DepartmentDetails departmentDetails1 = (DepartmentDetails)crit.uniqueResult();
        return departmentDetails1;
    }

    @Override
    public void addDetails(DepartmentDetails departmentDetails) {
        persist(departmentDetails);
    }
}
