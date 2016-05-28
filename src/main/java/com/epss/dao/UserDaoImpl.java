package com.epss.dao;

import com.epss.model.Student;
import com.epss.model.User;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	public User findById(int id) {
		User user = getByKey(id);
//		if(user!=null){
//			Hibernate.initialize(user.getUserProfiles());
//		}
		return user;
	}

	public User findByLogin(String sso) {
		logger.info("SSO : {}", sso);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("login", sso));
		User user = (User)crit.uniqueResult();
//		if(user!=null){
//			Hibernate.initialize(user.getUserProfiles());
//		}
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<User> users = (List<User>) criteria.list();
		return users;
	}
	@Autowired
	private SessionFactory sessionFactory;

	public void save(Student student) {
		sessionFactory.getCurrentSession().persist(student);
//		persist(user);
	}

	public void deleteBySSO(String sso) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("ssoId", sso));
		User user = (User)crit.uniqueResult();
		delete(user);
	}

}
