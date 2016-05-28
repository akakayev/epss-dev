package com.epss.service;


import com.epss.model.Student;
import com.epss.model.User;

import java.util.List;

public interface UserService {

    User findById(int id);

    User findByLogin(String login);

    void saveUser(Student user);

    void updateUser(User user);

    void deleteUserByLogin(String login);

    List<User> findAllUsers();

    boolean isUserLoginUnique(Integer id, String sso);
}
