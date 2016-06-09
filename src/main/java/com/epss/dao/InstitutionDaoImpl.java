package com.epss.dao;

import com.epss.model.DepartmentDetails;
import com.epss.model.Group;
import com.epss.model.Institution;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("institutionDao")
public class InstitutionDaoImpl extends AbstractDao<Integer, Institution> implements InstitutionDao{
    @Override
    public void addInstitution(Institution institution) {
        persist(institution);
    }

    @Override
    public Institution getInstitutionById(int id) {
        Institution institution= getByKey(id);
        return institution;
    }

    @Override
    public List<Institution> getAllInstitutions() {
        Criteria cr = createEntityCriteria()
                .addOrder(Order.asc("fullName"));
        return (List<Institution>)cr.list();
    }
}
