package com.epss.dao;

import com.epss.model.Group;
import com.epss.model.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("groupDao")
public class GroupDaoImpl extends AbstractDao<Integer,Group> implements GroupDao {

    @Override
    public List<Group> getGroupList() {
        Criteria cr = createEntityCriteria()
                .addOrder(Order.asc("groupName"));
        return (List<Group>)cr.list();
    }

    @Override
    public Group getGroupById(int id) {
        return (Group)getByKey(id);
    }
}
