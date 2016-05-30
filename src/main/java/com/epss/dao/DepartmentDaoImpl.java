package com.epss.dao;


import com.epss.model.Department;
import com.epss.model.Group;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("departmentDao")
public class DepartmentDaoImpl extends AbstractDao<Integer,Department> implements DepartmentDao{
    @Override
    public List<Department> getDepartmentsList() {
        Criteria cr = createEntityCriteria()
                .addOrder(Order.asc("name"));
        return (List<Department>)cr.list();
    }

    @Override
    public Department getDepartmentById(int id) {
        return (Department)getByKey(id);
    }
}
