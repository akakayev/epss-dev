package com.epss.dao;


import com.epss.model.User;

import java.util.List;


public interface UserDao {

	User findById(int id);
	
	User findByLogin(String login);
	
	void save(User user);
	
	void deleteBySSO(String sso);
	
	List<User> findAllUsers();

}

