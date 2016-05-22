package com.epss.service;


import com.epss.dao.UserDao;
import com.epss.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao dao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User findById(int id) {
        return dao.findById(id);
    }

    public User findByLogin(String sso) {
        User user = dao.findByLogin(sso);
        return user;
    }

    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        dao.save(user);
    }

    /*
     * Since the method is running with Transaction, No need to call hibernate update explicitly.
     * Just fetch the entity from db and update it with proper values within transaction.
     * It will be updated in db once transaction ends.
     */
    public void updateUser(User user) {
        User entity = dao.findById(user.getId());
        if(entity!=null){
            entity.setLogin(user.getLogin());
            if(!user.getPassword().equals(entity.getPassword())){
                entity.setPassword(passwordEncoder.encode(user.getPassword()));
            }
            entity.setFirstName(user.getFirstName());
            entity.setLastName(user.getLastName());
            entity.setPrimaryRole(user.getPrimaryRole());
        }
    }

    @Override
    public void deleteUserByLogin(String login) {
        dao.deleteBySSO(login);
    }

    public List<User> findAllUsers() {
        return dao.findAllUsers();
    }

    @Override
    public boolean isUserLoginUnique(Integer id, String sso) {
        User user = findByLogin(sso);
        return ( user == null || ((id != null) && (user.getId() == id)));
    }
}
