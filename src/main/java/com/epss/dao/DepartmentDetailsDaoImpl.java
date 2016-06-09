package com.epss.dao;

import com.epss.model.DepartmentDetails;
import com.epss.model.Housing;
import org.springframework.stereotype.Repository;

@Repository("departmentDetailsDao")
public class DepartmentDetailsDaoImpl extends AbstractDao<Integer, DepartmentDetails> implements DepartmentDetailsDao {
    @Override
    public DepartmentDetails getDetails(int id) {
        DepartmentDetails departmentDetails= getByKey(id);
        return departmentDetails;
    }

    @Override
    public void addDetails(DepartmentDetails departmentDetails) {
        persist(departmentDetails);
    }
}
