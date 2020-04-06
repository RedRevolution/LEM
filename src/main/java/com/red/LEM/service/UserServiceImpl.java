package com.red.LEM.service;

import com.red.LEM.dao.UserDao;
import com.red.LEM.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User findUserByName(String username) {
        return userDao.findUserByName(username);
    }

    @Override
    public void addUser(String username, String password) {
        userDao.addUser(username, password);
    }
}
