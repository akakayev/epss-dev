package com.epss.dao;

import com.epss.model.Discipline;
import com.epss.model.Faculty;
import com.epss.model.Institution;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("facultyDao")
public class FacultyDaoImpl extends AbstractDao<Integer, Faculty> implements FacultyDao{


    @Override
    public void addFaculty(Faculty institution) {
        persist(institution);
    }

    @Override
    public Faculty getFacultyById(int id) {
        Faculty faculty= getByKey(id);
        return faculty;
    }

    @Override
    public List<Faculty> getAllFaculties(int institutionId) {
        Criteria cr = createEntityCriteria().add(Restrictions.eq("institutionId", institutionId))
                .addOrder(Order.asc("name"));
        return (List<Faculty>) cr.list();
    }
}
