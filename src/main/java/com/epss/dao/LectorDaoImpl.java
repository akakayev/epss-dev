package com.epss.dao;

import com.epss.model.Lector;
import com.epss.model.Student;
import com.epss.model.User;
import com.epss.service.UserService;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Артём on 28.05.2016.
 */
@Repository("lectorDao")
public class LectorDaoImpl extends AbstractDao<Integer, Lector> implements LectorDao {

    @Autowired
    private UserService userService;
    @Override
    public void saveLector(Lector lector) {
        persist(lector);
    }

    @Override
    public Lector getLectorByLogin(String login) {
        User user=userService.findByLogin(login);
        int userId=user.getId();
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("userId", userId));
        Lector student = (Lector)crit.uniqueResult();
        return student;
    }

    @Override
    public Lector getLectorById(int id) {
        return getByKey(id);
    }
}
